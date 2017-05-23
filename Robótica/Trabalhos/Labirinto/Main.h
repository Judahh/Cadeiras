#ifndef __MAIN
#define __MAIN
#include "Menu_System.h"
#include "LCD.h"
//#include "Menu_LCD.h"
//#include "Lcd_8bits.h"
#define B_UP 			LATAbits.LATA4
#define B_DOWN 			LATAbits.LATA2
#define B_LEFT 			LATAbits.LATA3
#define B_RIGHT			LATAbits.LATA5

#define B_SELECT		LATAbits.LATA1
#define B_RETURN		LATAbits.LATA0
typedef unsigned char bool;
#define true 1
#define false 0

void Inic_Regs(void);
void main (void);
#endif  //__MAIN