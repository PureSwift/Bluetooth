//
//  cbt_alloc.c
//  Bluetooth
//
//  libbluetooth's allocation entry points. These stay in C so that the
//  ownership contract is exactly the system allocator's: buffers returned
//  by `batostr`/`strtoba` (allocated here from Swift) are released by the
//  caller with `bt_free`/`free`.
//

#include <stdlib.h>

#include <bluetooth/bluetooth.h>

void *bt_malloc(size_t size)
{
	return malloc(size);
}

void *bt_malloc0(size_t size)
{
	return calloc(size, 1);
}

void bt_free(void *ptr)
{
	free(ptr);
}
