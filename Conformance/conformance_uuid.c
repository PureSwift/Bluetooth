/*
 * Differential conformance driver for the `bt_uuid_*` family.
 *
 * The reference `libbluetooth.so.3` does NOT export these — upstream
 * keeps them in `libbluetooth-internal.a` only. The reference build
 * therefore compiles the upstream UUID source directly; point BLUEZ_SOURCE at
 * an extracted BlueZ source tree (see compare.sh).
 *
 * Compiled twice — once against the reference libbluetooth, once
 * against ours — and the two outputs diffed by `compare.sh`.
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include <bluetooth/bluetooth.h>
#include <bluetooth/uuid.h>

static const char *uuids[] = {
	"180d", "0x180d", "0000180d", "0x0000180d",
	"0000180d-0000-1000-8000-00805f9b34fb",
	"0000180D-0000-1000-8000-00805F9B34FB",
	"60f14fe2-f972-11e5-b84f-23e070d5a8c7",
	"ffff", "0000", "ffffffff",
	/* rejects */
	"nonsense", "18", "180", "180dd", "", "----", NULL
};

static void print_uuid(const char *label, const bt_uuid_t *uuid)
{
	char str[MAX_LEN_UUID_STR];
	int rc;

	memset(str, 0x7F, sizeof(str));
	rc = bt_uuid_to_string(uuid, str, sizeof(str));
	printf("  %s type=%d len=%d to_string=%d \"%s\"\n",
		label, (int) uuid->type, bt_uuid_len(uuid), rc, str);
}

static void dump_uuids(void)
{
	for (int i = 0; uuids[i]; i++) {
		const char *input = uuids[i];
		bt_uuid_t uuid;
		int rc;

		memset(&uuid, 0, sizeof(uuid));
		rc = bt_string_to_uuid(&uuid, input);
		printf("bt_string_to_uuid(\"%s\") = %d\n", input, rc);
		if (rc == 0) {
			print_uuid("parsed", &uuid);

			bt_uuid_t u128;
			memset(&u128, 0, sizeof(u128));
			bt_uuid_to_uuid128(&uuid, &u128);
			printf("  to_uuid128 =");
			for (int j = 0; j < 16; j++)
				printf(" %02x", ((const uint8_t *) &u128.value.u128)[j]);
			printf("\n");

			uint8_t le[16];
			memset(le, 0, sizeof(le));
			printf("  to_le = %d:", bt_uuid_to_le(&uuid, le));
			for (int j = 0; j < 16; j++)
				printf(" %02x", le[j]);
			printf("\n");

			printf("  uuid16_cmp(0x180d) = %d\n", bt_uuid16_cmp(&uuid, 0x180d));
		}
	}

	printf("bt_string_to_uuid(NULL) = %d\n", bt_string_to_uuid(NULL, NULL));

	/* truncating bt_uuid_to_string */
	bt_uuid_t uuid;
	bt_uuid16_create(&uuid, 0x180d);
	for (size_t n = 0; n <= 10; n++) {
		char str[64];
		memset(str, 0x7F, sizeof(str));
		int rc = bt_uuid_to_string(&uuid, str, n);
		str[63] = '\0';
		printf("to_string(n=%zu) = %d \"%s\"\n", n, rc, n ? str : "(untouched)");
	}

	/* NULL / unspec */
	{
		char str[64];
		bt_uuid_t unspec;
		memset(&unspec, 0, sizeof(unspec));
		memset(str, 0x7F, sizeof(str));
		printf("to_string(unspec) = %d \"%s\"\n",
			bt_uuid_to_string(&unspec, str, sizeof(str)), str);
		memset(str, 0x7F, sizeof(str));
		printf("to_string(NULL) = %d \"%s\"\n",
			bt_uuid_to_string(NULL, str, sizeof(str)), str);
		printf("uuid16_cmp(NULL) = %d\n", bt_uuid16_cmp(NULL, 0x180d));
		printf("to_le(unspec) = %d\n", bt_uuid_to_le(&unspec, str));
	}

	/* create + compare matrix */
	for (uint32_t value = 0; value < 4; value++) {
		bt_uuid_t u16, u32, u128;
		uint128_t raw;

		printf("create16(%u) = %d\n", value, bt_uuid16_create(&u16, (uint16_t) value));
		printf("create32(%u) = %d\n", value, bt_uuid32_create(&u32, value));
		bt_uuid_to_uuid128(&u32, &u128);
		memcpy(&raw, &u128.value.u128, sizeof(raw));
		printf("create128 = %d\n", bt_uuid128_create(&u128, raw));

		print_uuid("u16", &u16);
		print_uuid("u32", &u32);
		print_uuid("u128", &u128);

		printf("  cmp(16,32) = %d\n", bt_uuid_cmp(&u16, &u32));
		printf("  cmp(32,128) = %d\n", bt_uuid_cmp(&u32, &u128));
		printf("  cmp(16,128) = %d\n", bt_uuid_cmp(&u16, &u128));
	}

	/* bt_uuid_strcmp over all pairs of valid inputs */
	for (int i = 0; uuids[i]; i++)
		for (int j = 0; uuids[j]; j++)
			printf("strcmp(\"%s\",\"%s\") = %d\n", uuids[i], uuids[j],
				bt_uuid_strcmp(uuids[i], uuids[j]));
}

int main(void)
{
	dump_uuids();
	return 0;
}
