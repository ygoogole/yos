#ifndef INCLUDE_COMMON_H_
#define INCLUDE_COMMON_H_

#include "types.h"

// port write a byte
void outb(uint16_t port, uint8_t value);

// port read a byte
uint8_t inb(uint16_t port);

// port read a word
uint16_t inw(uint16_t port);

#endif // INCLUDE_COMMON_H_
