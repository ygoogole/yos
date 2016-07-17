/*
 * entry c function of kernel
 */

#include "console.h"

int kern_entry()
{
    console_clear();

    console_write_color("!!Second Time ! Hello, OS kernel!\n", rc_black, rc_green);

    return 0;
}

