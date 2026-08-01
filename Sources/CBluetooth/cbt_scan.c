//
//  cbt_scan.c
//  Bluetooth
//
//  `sscanf` trampolines for the Swift UUID parser. The reference parser's
//  accepted-input contract (`bt_string_to_uuid`) is
//  defined by C stdlib scanning behavior — whitespace skipping, `0x`
//  prefixes, field widths — so rather than emulate `sscanf` in Swift,
//  the scans themselves stay in C.
//

#include <stdio.h>
#include <string.h>
#include <stdint.h>

#include "cbt_internal.h"

int cbt_scan_uuid128(const char *string, uint8_t out[16])
{
	uint32_t data0, data4;
	uint16_t data1, data2, data3, data5;

	if (sscanf(string, "%08x-%04hx-%04hx-%04hx-%08x%04hx",
				&data0, &data1, &data2,
				&data3, &data4, &data5) != 6)
		return 0;

	out[0] = (data0 >> 24) & 0xff;
	out[1] = (data0 >> 16) & 0xff;
	out[2] = (data0 >> 8) & 0xff;
	out[3] = data0 & 0xff;
	out[4] = (data1 >> 8) & 0xff;
	out[5] = data1 & 0xff;
	out[6] = (data2 >> 8) & 0xff;
	out[7] = data2 & 0xff;
	out[8] = (data3 >> 8) & 0xff;
	out[9] = data3 & 0xff;
	out[10] = (data4 >> 24) & 0xff;
	out[11] = (data4 >> 16) & 0xff;
	out[12] = (data4 >> 8) & 0xff;
	out[13] = data4 & 0xff;
	out[14] = (data5 >> 8) & 0xff;
	out[15] = data5 & 0xff;

	return 1;
}

int cbt_scan_base_uuid128(const char *string)
{
	uint16_t uuid;
	char dummy[2];

	if (strlen(string) != 36 ||
			string[8] != '-' ||
			string[13] != '-' ||
			string[18] != '-' ||
			string[23] != '-')
		return 0;

	return sscanf(string,
		"0000%04hx-0000-1000-8000-00805%1[fF]9%1[bB]34%1[fF]%1[bB]",
		&uuid, dummy, dummy, dummy, dummy) == 5;
}
