/*
 * entry c function of kernel
 */

#include "console.h"

int kern_entry()
{
    console_clear();

    console_write_colr("Hello, OS kernel!\n", rc_black, rc_green);

	return 0;
}

