#include <p18f4520.h>		//aquivo cabeçalho padrão do PIC18F4520
#include "Main.h"

#define UP 			!PORTAbits.RA4
#define DOWN 			!PORTAbits.RA2
#define LEFT 			!PORTAbits.RA3
#define RIGHT			!PORTAbits.RA5

#define SELECT                  !PORTAbits.RA1
#define RETURN                  !PORTAbits.RA0

bool Mod = false;
bool WayFront, WayRear, WayRot4, WayRet4;
bool Traction_Right_Rear, Traction_Left_Rear, Traction_Right_Front, Traction_Left_Front;
bool Break_Right_Front, Break_Left_Front, Break_Right_Rear, Break_Left_Rear;
//****************************************************************************
//*********************************SETS***************************************
//****************************************************************************
//Way

void setWayFront(bool New) {
    WayFront = New;
    Mod = true;
}

void setWayRear(bool New) {
    WayRear = New;
    Mod = true;
}

void setWayRot4(bool New) {
    WayRot4 = New;
    Mod = true;
}

void setWayRet4(bool New) {
    WayRet4 = New;
    Mod = true;
}

//Traction

void setTraction_Right_Rear(bool New) {
    Traction_Right_Rear = New;
    Mod = true;
}

void setTraction_Left_Rear(bool New) {
    Traction_Left_Rear = New;
    Mod = true;
}

void setTraction_Right_Front(bool New) {
    Traction_Right_Front = New;
    Mod = true;
}

void setTraction_Left_Front(bool New) {
    Traction_Left_Front = New;
    Mod = true;
}

//Breakes

void setBreak_Right_Front(bool New) {
    Break_Right_Front = New;
    Mod = true;
}

void setBreak_Left_Front(bool New) {
    Break_Left_Front = New;
    Mod = true;
}

void setBreak_Right_Rear(bool New) {
    Break_Right_Rear = New;
    Mod = true;
}

void setBreak_Left_Rear(bool New) {
    Break_Left_Rear = New;
    Mod = true;
}

//****************************************************************************
//*********************************GETS***************************************
//****************************************************************************
//Way

bool getWayFront(void) {
    return WayFront;
}

bool getWayRear(void) {
    return WayRear;
}

bool getWayRot4(void) {
    return WayRot4;
}

bool getWayRet4(void) {
    return WayRet4;
}

//Traction

bool getTraction_Right_Rear(void) {
    return Traction_Right_Rear;
}

bool getTraction_Left_Rear(void) {
    return Traction_Left_Rear;
}

bool getTraction_Right_Front(void) {
    return Traction_Right_Front;
}

bool getTraction_Left_Front(void) {
    return Traction_Left_Front;
}

//Breakes

bool getBreak_Right_Front(void) {
    return Break_Right_Front;
}

bool getBreak_Left_Front(void) {
    return Break_Left_Front;
}

bool getBreak_Right_Rear(void) {
    return Break_Right_Rear;
}

bool getBreak_Left_Rear(void) {
    return Break_Left_Rear;
}

void Running(void) {

    if (Mod == false) {//modo Padrão
        PORTBbits.RB2 = 1;
        PORTBbits.RB3 = 1;
        PORTBbits.RB4 = 1;
        PORTBbits.RB5 = 1;
        PORTBbits.RB6 = 1;
        PORTBbits.RB7 = 1;

        LCD_delay_ms(10);

        setWayFront(true);

        setTraction_Right_Rear(true);
        setTraction_Left_Rear(true);
        setTraction_Right_Front(false);
        setTraction_Left_Front(false);

        setBreak_Right_Front(true);
        setBreak_Left_Front(true);
        setBreak_Right_Rear(false);
        setBreak_Left_Rear(false);
    }
    do {
        PORTBbits.RB2 = UP;
        PORTBbits.RB3 = DOWN;
        PORTBbits.RB4 = LEFT;
        PORTBbits.RB5 = RIGHT;
        PORTBbits.RB6 = SELECT;
        //Send !PORTA;(via ZigBee)
    } while (!RETURN);

    PORTBbits.RB7 = 0;
}
