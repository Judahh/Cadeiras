#include <p18f4520.h>
#include <delays.h>
#include "LCD.h"
//#include "Main.c"

// Os defines a seguir setam os pinos padrão do display LCD
#define LCD_SEC_LINE            0x40    	 		// Endereço da Segunda linha do LCD

#define LCD_DATA4_TRIS		(TRISDbits.TRISD0)	
#define LCD_DATA4_IO		(LATDbits.LATD0)
#define LCD_DATA5_TRIS		(TRISDbits.TRISD1)
#define LCD_DATA5_IO		(LATDbits.LATD1)
#define LCD_DATA6_TRIS		(TRISDbits.TRISD2)
#define LCD_DATA6_IO		(LATDbits.LATD2)
#define LCD_DATA7_TRIS		(TRISDbits.TRISD3)
#define LCD_DATA7_IO		(LATDbits.LATD3)

#define LCD_RS_IO_TRIS		(TRISDbits.TRISD5)
#define LCD_RS_IO		(LATDbits.LATD5)
#define LCD_E_TRIS		(TRISDbits.TRISD4)
#define LCD_E_IO		(LATDbits.LATD4)

#define _RS                     PORTEbits.RE0
#define _EN                     PORTEbits.RE1
#define _RW                     PORTEbits.RE2
#define PORT_LCD                PORTD
#define PORT_CONT_LCD           PORTE
#define TRIS_PORT_LCD           TRISD
#define TRIS_CONT_LCD           TRISE

// Variável global de configuração do display
static char lcd_mode;
// The lower 4 bits of this port will be used
#define LCD_DATA		LATD				// as RF Explorer Smart Radio Board
#define LCD_EN 			LATDbits.LATD4
#define LCD_RS 			LATDbits.LATD5

#define TRIS_LCD_DATA           TRISD
#define TRIS_LCD_EN             TRISDbits.TRISD4
#define TRIS_LCD_RS             TRISDbits.TRISD5

// Commands for Hitachi LCD
#define CLEAR_DISPLAY           0x01
#define FOUR_BIT                0b00101111  /* 4-bit Interface               */
#define EIGHT_BIT               0b00111111  /* 8-bit Interface               */
#define LINE_5X7                0b00110011  /* 5x7 characters, single line   */
#define LINE_5X10               0b00110111  /* 5x10 characters               */
#define LINES_5X7               0b00111011  /* 5x7 characters, multiple line */

#define DISPLAY_ON              0b00001111  /* Display on      */
#define DISPLAY_OFF             0b00001011  /* Display off     */
#define CURSOR_ON               0b00001111  /* Cursor on       */
#define CURSOR_OFF              0b00001101  /* Cursor off      */
#define BLINK_ON                0b00001111  /* Cursor Blink    */
#define BLINK_OFF               0b00001110  /* Cursor No Blink */
#define UNDERLINE_ON            0b00001111
#define UNDERLINE_OFF           0b00001101

#define INCREMENT               0b00000111	/* Entry mode increment */
#define DECREMENT               0b00000101	/* Entry mode decrement */
#define SHIFT_ON                0b00000111	/* Display shift on		*/
#define SHIFT_OFF               0b00000110	/* Display shift off	*/

#define PulseEnable { LCD_EN = 1; Nop(); LCD_EN = 0; }

//**************************************************************************
//* Protótipos
//**************************************************************************

void Delay5ms(void) {
    Delay1KTCYx(60); // Delay of 5ms
    // Cycles = (TimeDelay * Fosc) / 4
    // Cycles = (5ms * 8MHz) / 4
    // Cycles = 10,000
    return;
}

void Delay15ms(void) {
    Delay1KTCYx(180); // Delay of 15ms
    // Cycles = (TimeDelay * Fosc) / 4
    // Cycles = (15ms * 8MHz) / 4
    // Cycles = 30,000
    return;
}
//**************************************************************************
//* Uma função de atraso utilizada pelas funções do LCD
//**************************************************************************
//* Argumentos:
//* unsigned char time: tempo aproximado em milisegundos
//**************************************************************************

void LCD_delay_ms(unsigned char time) {

    unsigned char i;
    time = time * 20;
    for (i = 0; i < time; i++) {
        Delay1KTCYx(60); //(1/(20MHZ / 4 )) = 200us
    }
    return; //200us * 1000  = 200ms * 1 = 200ms
}

//**************************************************************************
//* Escreve um byte no LCD
//**************************************************************************
//* Argumentos:
//* char address : 0 para comandos, 1 para dados
//* char data : comando ou dado a ser escrito
//**************************************************************************

void Delay_(char temp) {
    for (temp; temp < 100; temp++) {
        Nop();
        Nop();
        Nop();
    }
}

void LCD_send_byte(char address, char Data) {
    LCD_RS_IO = address;

    LCD_DATA4_IO = ((Data & 0x10) == 0x10);
    LCD_DATA5_IO = ((Data & 0x20) == 0x20);
    LCD_DATA6_IO = ((Data & 0x40) == 0x40);
    LCD_DATA7_IO = ((Data & 0x80) == 0x80);

    LCD_E_IO = 1;
    Delay_(6);
    LCD_E_IO = 0;
    Delay_(6);

    Data = Data << 4;
    LCD_DATA4_IO = ((Data & 0x10) == 0x10);
    LCD_DATA5_IO = ((Data & 0x20) == 0x20);
    LCD_DATA6_IO = ((Data & 0x40) == 0x40);
    LCD_DATA7_IO = ((Data & 0x80) == 0x80);

    LCD_E_IO = 1;
    Delay_(6);
    LCD_E_IO = 0;
    ;
    Delay_(6);

}

//**************************************************************************
//* Inicialização do LCD
//**************************************************************************
//* Argumentos de chamada:
//* char mode1 : modo (número de linhas e tamanho do caractere)
//* char mode2 : modo (cursor e estado do display)
//**************************************************************************

void LCD_init() {
    unsigned char i;
    TRISD = 0x00; //LCD Port

    for (i = 0; i < 2; i++) {
        Delay15ms();
    }
    //LCD_send_byte(0, 3);
    //LCD_send_byte(0, 2);
    //LCD_send_byte(0, 40);
    //LCD_send_byte(0, 12);
    //LCD_send_byte(0, 6);
    //LCD_send_byte(0, 1);
    // Set port directions
    TRIS_LCD_DATA &= 0xf0; // Clear lower 4 bits
    TRIS_LCD_EN = 0;
    TRIS_LCD_RS = 0;

    //LCDCmd(FOUR_BIT);			// Nigel's code sends this before the next command?
    LCDCmd(FOUR_BIT & LINES_5X7);
    LCDCmd(INCREMENT & SHIFT_OFF);
    LCDCmd(DISPLAY_ON & BLINK_OFF & UNDERLINE_OFF);
    LCDCmd(CLEAR_DISPLAY);
}

//**************************************************************************
//* Configura a posição do cursor
//**************************************************************************
//* Argumentos de chamada:
//* char x : coluna (começando por 0)
//* char y : linha (0 ou 1)
//**************************************************************************

void LCD_pos_xy(char x, char y) {
    char address;
    if (y) address = LCD_SEC_LINE;
    else address = 0;
    address += x;
    LCD_send_byte(0, 0x80 | address);
}

//**************************************************************************
//* Escreve um caractere no display
//**************************************************************************
//* Argumentos de chamada:
//* char c : caractere a ser escrito
//**************************************************************************
//* Notas :
//* \f apaga o display
//* \n e \r retornam o cursor para a linha 0 coluna 0
//**************************************************************************

void LCD_write_char(char c) {
    switch (c) {
        case '\f':
            LCD_send_byte(0, 1);
            break;
        case '\n':
        case '\r':
            LCD_pos_xy(0, 0);
            break;
        default:
            LCD_send_byte(1, c);
    }
}

//**************************************************************************
//* Escreve uma string da memória de programa no display
//**************************************************************************
//* Argumentos de chamada:
//* const rom char *c : ponteiro para a string na memória de programa
//**************************************************************************

void LCD_write_string_rom(const rom char *c) {
    int i;
    i = 0;
    while (*c) {
        LCDChar(*c++);
        i++;
        if (i == 16) {
            Inicio_2Linha();
        }
    }
}

//**************************************************************************
//* Escreve uma string no display
//**************************************************************************
//* Argumentos de chamada:
//* char *c : ponteiro para a string
//**************************************************************************

void LCD_write_string(char *c) {
    int i;
    i = 0;
    while (*c) {
        LCDChar(*c++);
        i++;
        if (i == 16) {
            Inicio_2Linha();
        }
    }
}

void LCD_write_string2(char *c, int k) {
    int i;
    i = k;
    if (i == 0) {
        clear();
    }
    while (*c) {
        LCDChar(*c++);
        i++;
        if (i == 16) {
            Inicio_2Linha();
        }
        if (i == 32) {
            LCD_delay_ms(10);
            clear();
            i = 0;
        }
    }
}
//**************************************************************************
//* Liga o display
//**************************************************************************

void LCD_display_on(void) {
    lcd_mode |= 4;
    LCD_send_byte(0, lcd_mode);
}

//**************************************************************************
//* Desliga o display
//**************************************************************************

void LCD_display_off(void) {
    lcd_mode &= 0xFB;
    LCD_send_byte(0, lcd_mode);
}

//**************************************************************************
//* Liga o cursor
//**************************************************************************

void LCD_cursor_on(void) {
    lcd_mode |= 2;
    LCD_send_byte(0, lcd_mode);
}

//**************************************************************************
//* Desliga o cursor
//**************************************************************************

void LCD_cursor_off(void) {
    lcd_mode &= 0xFD;
    LCD_send_byte(0, lcd_mode);
}
//**************************************************************************
//* Liga o cursor piscante
//**************************************************************************

void LCD_cursor_blink_on(void) {
    lcd_mode |= 1;
    LCD_send_byte(0, lcd_mode);
}

void clear(void) {
    LCDCmd(0x01); //apaga os dados do display
    LCDCmd(0x02);
}
//**************************************************************************
//* Desliga o cursor piscante
//**************************************************************************

void LCD_cursor_blink_off(void) {
    lcd_mode &= 0xFE;
    LCD_send_byte(0, lcd_mode);
}

void LCDCmd(unsigned char c) {
    LCD_RS = 0;

    LCD_DATA &= 0xf0;
    LCD_DATA |= (c >> 4);
    PulseEnable;

    LCD_DATA &= 0xf0;
    LCD_DATA |= (c & 0x0f);
    PulseEnable;

    Delay5ms();
}

void LCDChar(unsigned char c) {
    LCD_RS = 1;

    LCD_DATA &= 0xf0;
    LCD_DATA |= (c >> 4);
    PulseEnable;

    LCD_DATA &= 0xf0;
    LCD_DATA |= (c & 0x0f);
    PulseEnable;

    Delay5ms();
}

void Inicio_2Linha(void) {
    LCDCmd(0xC0);
}

void LCD_Welcome(void) {
    unsigned char i;

    LCD_init();

    LCD_write_string_rom(" Welcome to  JH       1.1.      ");
    //LCD_write_string_rom("      1.0.      ");
}

void LCD_write_string_row(const rom char *c) {
    unsigned char i;
    i = 0;
    LCD_pos_xy(0, 2);
    while (*c) {
        LCDChar(*c++);
        i++;
        if (i == 16) {
            LCD_pos_xy(0, 0);
        }
        if (i == 32) {
            LCD_delay_ms(10);
            LCD_pos_xy(0, 2);
            i = 0;
        }
    }
}