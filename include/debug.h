/*
 * debugging related functions
 * */

#ifndef INCLUDE_DEBUG_H_
#define INCLUDE_DEBUG_H_

#include "console.h"
#include "vargs.h"
#include "elf.h"

#define assert(x, info)                                       	\
	do {                                                	\
		if (!(x)) {                                     \
			panic(info); 		     		\
		}                                               \
	} while (0)

// 编译期间静态检测
#define static_assert(x)                                	\
	switch (x) { case 0: case (x): ; }

void init_debug();

// print current call stack
void panic(const char *msg);

// print section register value
void print_cur_status();

// kernel print
void printk(const char *format, ...);

// kernel print with color
void printk_color(real_color_t back, real_color_t fore, const char *format, ...);

#endif 	// INCLUDE_DEBUG_H_
