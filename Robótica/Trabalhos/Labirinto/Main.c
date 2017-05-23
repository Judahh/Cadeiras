#include <p18f4520.h>		//aquivo cabeçalho padrão do PIC18F4520
#include <delays.h>
#include "Menu_System.h"
#include "LCD.h"
#include "Main.h"
#include "Lcd_8bits.h"
//#include "Running.h"

#pragma config OSC = HS, WDT = OFF, MCLRE = ON, PWRT = ON
#pragma config LVP=OFF

typedef unsigned char bool;
#define true 1
#define false 0

#define B_UP 			LATAbits.LATA4
#define B_DOWN 			LATAbits.LATA2
#define B_LEFT 			LATAbits.LATA3
#define B_RIGHT			LATAbits.LATA5

#define B_SELECT		LATAbits.LATA1
#define B_RETURN		LATAbits.LATA0

#define UP 			!PORTAbits.RA4
#define DOWN                    !PORTAbits.RA2
#define LEFT                    !PORTAbits.RA3
#define RIGHT                   !PORTAbits.RA5

#define SELECT                  !PORTAbits.RA1
#define RETURN                  !PORTAbits.RA0

int maximumRange = 200; // Maximum range needed
int minimumRange = 0; // Minimum range needed
long time, distance; // Duration used to calculate distance

//****************************************************************************

void main(void) {
    Inic_Regs();

    LCD_Welcome(); // escreve string no display

    LCD_delay_ms(10);
    clear(); // limpa e posiciona o cursor na primeira linha e primeira coluna
    LCD_write_string_rom("Test!!!!");

    //Switch_MenuP ();
    while (1) { //loop infinito
        /*PORTBbits.RB2=1;
        delay_us(20);              // sending 20us pulse
        PORTBbits.RB2=1;
        while(!RETURN){}
        set_timer1(0);              // setting timer zero
        while(RETURN){}
        time=get_timer1();            // Getting the time
        distance=time*0.028 + 1.093 ;      // Calculating the distance
  
        if(distance>maximumRange || distance<minimumRange){
                LCD_write_string_rom("Out of range!");
        }else{
                LCD_write_string_rom("Distance = %Lu", distance);
        }

        //Delay 1000ms before next reading.
        delay_ms(1000);
        clear();*/
    }
}
//****************************************************************************

void Inic_Regs(void) {
    TRISA = 0xFF; //Do pino RA0 ao RA5 entrada e demais pinos do PORTA saida
    TRISB = 0b00000001; //portb1 interrupt, resto saída
    TRISC = 0x0b11010000; //portc spi ligado no mrf24j...
    //TRISBbits.RB2=0;
    //TRISBbits.RB3=0;
    //TRISBbits.RB4=0;
    //TRISBbits.RB5=0;
    //TRISBbits.RB6=0;
    //TRISBbits.RB7=0;
    //TRISC = 0x00;			    //PORTC saida
    //TRISD = 0x00;			    //PORTD saida
    //TRISE = 0x00;			    //PORTE saida
    ADCON1 = 0x0F; //configura os pinos dos PORTA e PORTE como digitais
    PORTA = 0; //limpa PORTA
    PORTB = 0; //limpa PORTB
    PORTC = 0; //limpa PORTC
    PORTD = 0; //limpa PORTD
    PORTE = 0; //limpa PORTE
    //timer1(0);   // initiating timer
}

