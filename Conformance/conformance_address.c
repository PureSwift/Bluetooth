/*
 * Differential conformance driver for the `bluetooth.c` symbols.
 *
 * These are exported by the reference `libbluetooth.so.3`, so this
 * program links directly against it.
 *
 * Compiled twice — once against the reference libbluetooth, once
 * against ours — and the two outputs diffed by `compare.sh`.
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include <bluetooth/bluetooth.h>
#include <bluetooth/uuid.h>

static const char *addresses[] = {
	"00:1A:7D:DA:71:13", "00:00:00:00:00:00", "FF:FF:FF:FF:FF:FF",
	"00:1a:7d:da:71:13", "AA:BB:CC:DD:EE:FF", "01:23:45:67:89:AB",
	/* rejects */
	"00:1A:7D:DA:71:1", "00:1A:7D:DA:71:133", "00-1A-7D-DA-71-13",
	"00:1A:7D:DA:71:1G", "", "zzzzzzzzzzzzzzzzz", NULL
};

static void dump_addresses(void)
{
	char str[64];

	for (int i = 0; addresses[i]; i++) {
		const char *input = addresses[i];
		bdaddr_t ba;
		char *heap;

		printf("bachk(\"%s\") = %d\n", input, bachk(input));

		memset(&ba, 0xAA, sizeof(ba));
		printf("str2ba(\"%s\") = %d -> %02x%02x%02x%02x%02x%02x\n",
			input, str2ba(input, &ba),
			ba.b[0], ba.b[1], ba.b[2], ba.b[3], ba.b[4], ba.b[5]);

		memset(str, 0x7F, sizeof(str));
		printf("  ba2str = %d \"%s\"\n", ba2str(&ba, str), str);

		memset(str, 0x7F, sizeof(str));
		printf("  ba2strlc = %d \"%s\"\n", ba2strlc(&ba, str), str);

		memset(str, 0x7F, sizeof(str));
		printf("  ba2oui = %d \"%s\"\n", ba2oui(&ba, str), str);

		heap = batostr(&ba);
		printf("  batostr = \"%s\"\n", heap ? heap : "(null)");
		bt_free(heap);

		bdaddr_t swapped;
		baswap(&swapped, &ba);
		printf("  baswap -> %02x%02x%02x%02x%02x%02x\n",
			swapped.b[0], swapped.b[1], swapped.b[2],
			swapped.b[3], swapped.b[4], swapped.b[5]);

		bdaddr_t *allocated = strtoba(input);
		if (allocated) {
			printf("  strtoba -> %02x%02x%02x%02x%02x%02x\n",
				allocated->b[0], allocated->b[1], allocated->b[2],
				allocated->b[3], allocated->b[4], allocated->b[5]);
			bt_free(allocated);
		} else {
			printf("  strtoba -> (null)\n");
		}
	}

	/* bachk(NULL) */
	printf("bachk(NULL) = %d\n", bachk(NULL));
}

static void dump_errors(void)
{
	for (int code = 0; code <= 0x40; code++)
		printf("bt_error(0x%02x) = %d\n", code, bt_error((uint16_t) code));
	printf("bt_error(0xffff) = %d\n", bt_error(0xffff));
}

static void dump_compids(void)
{
	static const int ids[] = {
		-1, 0, 1, 2, 76, 117, 1000, 2392, 2393, 65534, 65535, 65536, 999999
	};

	for (size_t i = 0; i < sizeof(ids) / sizeof(*ids); i++)
		printf("bt_compidtostr(%d) = \"%s\"\n", ids[i], bt_compidtostr(ids[i]));
}

static void dump_alloc(void)
{
	void *p = bt_malloc(32);
	printf("bt_malloc(32) != NULL = %d\n", p != NULL);
	bt_free(p);

	uint8_t *z = bt_malloc0(32);
	int zeroed = 1;
	for (int i = 0; i < 32; i++)
		zeroed &= (z[i] == 0);
	printf("bt_malloc0(32) zeroed = %d\n", zeroed);
	bt_free(z);

	bt_free(NULL);
	printf("bt_free(NULL) ok\n");
}

static void dump_printf(void)
{
	char buffer[64];

	memset(buffer, 0x7F, sizeof(buffer));
	printf("basprintf = %d \"%s\"\n",
		basprintf(buffer, "%s/%d/%04x", "x", 42, 0x180d), buffer);

	memset(buffer, 0x7F, sizeof(buffer));
	printf("basnprintf(8) = %d \"%s\"\n",
		basnprintf(buffer, 8, "%s/%d/%04x", "x", 42, 0x180d), buffer);

	printf("baprintf = %d\n", baprintf("printed %d\n", 7));
	printf("bafprintf = %d\n", bafprintf(stdout, "fprinted %d\n", 8));
}

int main(void)
{
	dump_addresses();
	dump_errors();
	dump_compids();
	dump_alloc();
	dump_printf();
	return 0;
}
