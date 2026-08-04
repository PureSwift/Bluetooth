//
//  cbt_printf.c
//  Bluetooth
//
//  The four C-variadic entry points of libbluetooth. Swift can export a
//  function taking `va_list`, but not one declared with `...`, so these
//  four remain hand-written C, matching the reference implementation exactly.
//

#include <stdio.h>
#include <stdarg.h>

#include <bluetooth/bluetooth.h>

int baprintf(const char *format, ...)
{
	va_list ap;
	int len;

	va_start(ap, format);
	len = vprintf(format, ap);
	va_end(ap);

	return len;
}

int bafprintf(FILE *stream, const char *format, ...)
{
	va_list ap;
	int len;

	va_start(ap, format);
	len = vfprintf(stream, format, ap);
	va_end(ap);

	return len;
}

int basprintf(char *str, const char *format, ...)
{
	va_list ap;
	int len;

	va_start(ap, format);
	len = vsnprintf(str, (~0U) >> 1, format, ap);
	va_end(ap);

	return len;
}

int basnprintf(char *str, size_t size, const char *format, ...)
{
	va_list ap;
	int len;

	va_start(ap, format);
	len = vsnprintf(str, size, format, ap);
	va_end(ap);

	return len;
}
