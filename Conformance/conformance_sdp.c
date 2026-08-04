/*
 * Differential conformance driver for the 75 pure `sdp_*` symbols
 * (the data model, PDU codec, and attribute accessors implemented in
 * BluetoothSDP).
 *
 * Unlike bt_uuid_*, the system libbluetooth.so.3 exports these
 * directly (verified against scripts/symbols.txt in BluetoothLinux),
 * so this driver links against it as-is — no BlueZ source tree needed.
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include <bluetooth/bluetooth.h>
#include <bluetooth/sdp.h>
#include <bluetooth/sdp_lib.h>

static void dump_hex(const char *label, const uint8_t *data, int size)
{
	int i;
	printf("%s (%d bytes):", label, size);
	for (i = 0; i < size; i++)
		printf(" %02x", data[i]);
	printf("\n");
}

static void dump_uuid_strings(void)
{
	static const uint16_t uuid16s[] = {
		0x1101, 0x1105, 0x110d, 0x110b, 0x180d, 0x1800, 0xffff, 0x0000
	};
	static const uint32_t uuid32s[] = { 0x00001101, 0x12345678, 0 };
	static const uint8_t uuid128_bytes[16] = {
		0x00, 0x00, 0x18, 0x0d, 0x00, 0x00, 0x10, 0x00,
		0x80, 0x00, 0x00, 0x80, 0x5f, 0x9b, 0x34, 0xfb
	};
	size_t i;
	char str[64];
	uuid_t u;

	for (i = 0; i < sizeof(uuid16s) / sizeof(*uuid16s); i++) {
		sdp_uuid16_create(&u, uuid16s[i]);
		sdp_uuid2strn(&u, str, sizeof(str));
		printf("uuid2strn(16, 0x%04x) = \"%s\"\n", uuid16s[i], str);
		sdp_proto_uuid2strn(&u, str, sizeof(str));
		printf("proto_uuid2strn(16, 0x%04x) = \"%s\"\n", uuid16s[i], str);
		sdp_svclass_uuid2strn(&u, str, sizeof(str));
		printf("svclass_uuid2strn(16, 0x%04x) = \"%s\"\n", uuid16s[i], str);
		sdp_profile_uuid2strn(&u, str, sizeof(str));
		printf("profile_uuid2strn(16, 0x%04x) = \"%s\"\n", uuid16s[i], str);
	}

	for (i = 0; i < sizeof(uuid32s) / sizeof(*uuid32s); i++) {
		sdp_uuid32_create(&u, uuid32s[i]);
		sdp_uuid2strn(&u, str, sizeof(str));
		printf("uuid2strn(32, 0x%08x) = \"%s\"\n", uuid32s[i], str);
	}

	sdp_uuid128_create(&u, uuid128_bytes);
	sdp_uuid2strn(&u, str, sizeof(str));
	printf("uuid2strn(128) = \"%s\"\n", str);

	/* NULL handling */
	sdp_uuid2strn(NULL, str, sizeof(str));
	printf("uuid2strn(NULL) = \"%s\"\n", str);

	/* truncation */
	{
		size_t n;
		sdp_uuid16_create(&u, 0x1101);
		for (n = 0; n <= 6; n++) {
			memset(str, 0x7f, sizeof(str));
			sdp_uuid2strn(&u, str, n);
			str[sizeof(str) - 1] = '\0';
			printf("uuid2strn(n=%zu) = \"%s\"\n", n, n ? str : "(untouched)");
		}
	}
}

static void dump_uuid_conversions(void)
{
	uuid_t u16, u32, u128, *converted;
	uint8_t base128[16] = {
		0x00, 0x00, 0x11, 0x01, 0x00, 0x00, 0x10, 0x00,
		0x80, 0x00, 0x00, 0x80, 0x5f, 0x9b, 0x34, 0xfb
	};
	uint8_t nonbase128[16] = {
		0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
		0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10
	};

	sdp_uuid16_create(&u16, 0x1101);
	converted = sdp_uuid_to_uuid128(&u16);
	dump_hex("uuid16_to_uuid128", (uint8_t *) &converted->value.uuid128, 16);
	bt_free(converted);

	sdp_uuid32_create(&u32, 0x00001101);
	converted = sdp_uuid_to_uuid128(&u32);
	dump_hex("uuid32_to_uuid128", (uint8_t *) &converted->value.uuid128, 16);
	bt_free(converted);

	sdp_uuid128_create(&u128, base128);
	printf("uuid128_to_uuid(base) = %d type=%d value=0x%x\n",
		sdp_uuid128_to_uuid(&u128), u128.type, u128.value.uuid16);

	sdp_uuid128_create(&u128, nonbase128);
	printf("uuid128_to_uuid(nonbase) = %d type=%d\n",
		sdp_uuid128_to_uuid(&u128), u128.type);

	sdp_uuid16_create(&u16, 0x0100);
	printf("uuid_to_proto(16) = %d\n", sdp_uuid_to_proto(&u16));

	{
		uuid_t a, b;
		sdp_uuid16_create(&a, 0x1101);
		sdp_uuid32_create(&b, 0x00001101);
		printf("uuid_cmp(16==32) = %d\n", sdp_uuid_cmp(&a, &b));
		sdp_uuid16_create(&b, 0x1102);
		printf("uuid_cmp(16!=16) = %d\n", sdp_uuid_cmp(&a, &b));
		printf("uuid16_cmp(equal) = %d\n", sdp_uuid16_cmp(&a, &a));
		printf("uuid16_cmp(differ) = %d\n", sdp_uuid16_cmp(&a, &b));
	}
}

/*
 * Builds a moderately complex service record — service class,
 * protocol descriptor list (L2CAP + RFCOMM), profile descriptor,
 * language attribute, service name/description/provider, supported
 * features — encodes it, dumps the wire bytes, then decodes those
 * bytes back and dumps every accessor's view of the result.
 */
static void record_round_trip(void)
{
	sdp_record_t *rec = sdp_record_alloc();
	uuid_t svclass, l2cap_uuid, rfcomm_uuid, profile_uuid;
	sdp_list_t *svclass_list = NULL;
	uint8_t channel_number = 1;
	sdp_profile_desc_t profile;
	sdp_list_t *profile_list = NULL;
	sdp_buf_t buf;
	sdp_record_t *decoded;
	int scanned;

	sdp_uuid16_create(&svclass, 0x1101); /* Serial Port */
	svclass_list = sdp_list_append(NULL, &svclass);
	sdp_set_service_classes(rec, svclass_list);

	/*
	 * The protocol descriptor list is built directly via
	 * sdp_seq_alloc/sdp_attr_add rather than sdp_set_access_protos:
	 * that convenience setter's access_proto_to_dataseq helper
	 * reinterprets an sdp_data_t* as a uuid_t* to read a UUID
	 * element's value (see the note in Attributes.swift), which does
	 * not actually land on the value bytes — it reads uninitialized
	 * inter-field padding instead, so the reference's output for any
	 * record built that way is not just wrong but not even
	 * deterministic across runs. Building the same wire shape by hand
	 * exercises the getter and the codec without going through that
	 * broken path.
	 */
	sdp_uuid16_create(&l2cap_uuid, L2CAP_UUID);
	sdp_uuid16_create(&rfcomm_uuid, RFCOMM_UUID);
	{
		uint8_t uuid_dtd = SDP_UUID16;
		uint8_t uint8_dtd = SDP_UINT8;
		void *l2cap_dtds[1] = { &uuid_dtd };
		void *l2cap_values[1] = { &l2cap_uuid.value.uuid16 };
		sdp_data_t *l2cap_seq = sdp_seq_alloc(l2cap_dtds, l2cap_values, 1);

		void *rfcomm_dtds[2] = { &uuid_dtd, &uint8_dtd };
		void *rfcomm_values[2] = { &rfcomm_uuid.value.uuid16, &channel_number };
		sdp_data_t *rfcomm_seq = sdp_seq_alloc(rfcomm_dtds, rfcomm_values, 2);

		void *stack_dtds[2] = { &l2cap_seq->dtd, &rfcomm_seq->dtd };
		void *stack_values[2] = { l2cap_seq, rfcomm_seq };
		sdp_data_t *proto_stack = sdp_seq_alloc(stack_dtds, stack_values, 2);

		sdp_attr_add(rec, SDP_ATTR_PROTO_DESC_LIST, proto_stack);
	}

	sdp_uuid16_create(&profile_uuid, 0x1101);
	profile.uuid = profile_uuid;
	profile.version = 0x0102;
	profile_list = sdp_list_append(NULL, &profile);
	sdp_set_profile_descs(rec, profile_list);

	sdp_set_info_attr(rec, "Serial Port", "PureSwift", "A test service");
	sdp_add_lang_attr(rec);

	memset(&buf, 0, sizeof(buf));
	printf("gen_record_pdu = %d\n", sdp_gen_record_pdu(rec, &buf));
	dump_hex("record pdu", buf.data, buf.data_size);

	decoded = sdp_extract_pdu(buf.data, buf.data_size, &scanned);
	printf("extract_pdu scanned = %d (of %d)\n", scanned, buf.data_size);

	{
		uuid_t got;
		memset(&got, 0, sizeof(got));
		char strvalue[128];
		sdp_list_t *access = NULL, *profiles = NULL;
		sdp_list_t *p;

		printf("get_service_id = %d\n", sdp_get_service_id(decoded, &got));

		memset(strvalue, 0, sizeof(strvalue));
		printf("get_string_attr(name) = %d \"%s\"\n",
			sdp_get_string_attr(decoded, SDP_ATTR_SVCNAME_PRIMARY, strvalue, sizeof(strvalue)),
			strvalue);

		printf("get_access_protos = %d\n", sdp_get_access_protos(decoded, &access));
		for (p = access; p; p = p->next) {
			sdp_list_t *inner = p->data;
			sdp_list_t *q;
			printf("  alt:\n");
			for (q = inner; q; q = q->next) {
				sdp_data_t *seq = q->data;
				sdp_data_t *d;
				printf("    proto seq:");
				for (d = seq; d; d = d->next) {
					if (SDP_IS_UUID(d->dtd))
						printf(" uuid=0x%x", sdp_uuid_to_proto(&d->val.uuid));
					else if (d->dtd == SDP_UINT8)
						printf(" u8=%u", d->val.uint8);
				}
				printf("\n");
			}
		}

		printf("get_profile_descs = %d\n", sdp_get_profile_descs(decoded, &profiles));
		for (p = profiles; p; p = p->next) {
			sdp_profile_desc_t *pd = p->data;
			printf("  profile uuid=0x%x version=0x%04x\n", pd->uuid.value.uuid16, pd->version);
		}

		printf("get_access_protos = %d\n", sdp_get_access_protos(decoded, &access));
		printf("get_profile_descs = %d\n", sdp_get_profile_descs(decoded, &profiles));

		sdp_record_print(decoded);
	}

	free(buf.data);
	sdp_record_free(rec);
	sdp_record_free(decoded);
}

int main(void)
{
	dump_uuid_strings();
	dump_uuid_conversions();
	record_round_trip();
	return 0;
}
