#include <p18f4520.h>
#include <delays.h>
#include <stdio.h>
#include <string.h>
#include "Menu_System.h"
#include "Running.h"
#include "LCD.h"
#include "Menu_LCD.h"
//#include "Main.h"
#define B_UP 			LATAbits.LATA4
#define B_DOWN 			LATAbits.LATA2
#define B_LEFT 			LATAbits.LATA3
#define B_RIGHT			LATAbits.LATA5

#define B_SELECT		LATAbits.LATA1
#define B_RETURN		LATAbits.LATA0

#define UP 			!PORTAbits.RA4
#define DOWN 			!PORTAbits.RA2
#define LEFT 			!PORTAbits.RA3
#define RIGHT			!PORTAbits.RA5

#define SELECT                  !PORTAbits.RA1
#define RETURN                  !PORTAbits.RA0

typedef unsigned char bool;

#define true 1
#define false 0

void wait(int k) {
    int i;
    int z;
    k = k * 1000000;
    z = 10;
    for (i = 0; i < k; i++) {
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
    }
}

void show(void) {
    int i;
    //char c[100]="";
    //rom char *str;
    //rom char *aux;
    //char str[60];
    char str0[5] = "Way:";
    char str1[10] = "Traction:";
    char str2[6] = "Front";
    char str3[5] = "Rear";
    char str4[5] = "Rot4";
    char str5[5] = "Ret4";
    char str6[12] = "Right Rear,";
    char str7[11] = "Left Rear,";
    char str8[13] = "Right Front,";
    char str9[12] = "Left Front,";

    i = 0;
    clear();
    //str="";
    //aux="";
    LCD_write_string2(str0, i);
    i = 5;
    if (getWayFront() == true) {
        LCD_write_string2(str2, i);
        i = i + 6;
    }
    if (getWayRear() == true) {
        LCD_write_string2(str3, i);
        i = i + 5;
    }
    if (getWayRot4() == true) {
        LCD_write_string2(str4, i);
        i = i + 5;
    }
    if (getWayRet4() == true) {
        LCD_write_string2(str5, i);
        i = i + 5;
    }
    LCD_delay_ms(10);
    clear();
    i = 0;
    LCD_write_string2(str1, i);
    i = 10;
    if (getTraction_Right_Rear() == true) {
        LCD_write_string2(str6, i);
        i = i + 12;
    }
    if (getTraction_Left_Rear() == true) {
        LCD_write_string2(str7, i);
        i = i + 11;
        LCD_delay_ms(10);
    }
    i = 0;
    if (getTraction_Right_Front() == true) {
        LCD_write_string2(str8, i);
        i = i + 13;
    }
    if (getTraction_Left_Front() == true) {
        LCD_write_string2(str9, i);
        i = i + 12;
    }
    LCD_delay_ms(10);
    clear();
    str1[0] = 'B';
    str1[1] = 'r';
    str1[2] = 'e';
    str1[3] = 'a';
    str1[4] = 'k';
    str1[5] = ':';
    str1[6] = ' ';
    str1[7] = ' ';
    str1[8] = ' ';
    i = 0;
    LCD_write_string2(str1, i);
    i = 10;
    if (getBreak_Right_Front() == true) {
        LCD_write_string2(str8, i);
        i = i + 13;
    }
    if (getBreak_Left_Front() == true) {
        LCD_write_string2(str9, i);
        i = i + 12;
        LCD_delay_ms(10);
    }
    i = 0;
    if (getBreak_Right_Rear() == true) {
        LCD_write_string2(str6, i);
        i = i + 12;
    }
    if (getBreak_Left_Rear() == true) {
        LCD_write_string2(str7, i);
        i = i + 11;
    }
    LCD_delay_ms(10);
}

void trans(void) {
    clear();
    wait(1);
}

void Switch_MenuP() {//TODO:
    int op = 1;
    bool t = true;
    trans();
    while (!SELECT) {
        if (t) {
            clear();
            MenuP(op);
            t = false;
        }
        if (UP) {
            op++;
            t = true;
        }
        if (DOWN) {
            op--;
            t = true;
        }
        if (op > 2) {
            op = 1;
        }
        if (op < 1) {
            op = 2;
        }
    }
    if (op == 1) {
        clear();
        LCD_write_string_rom("...Running...");
        Running();
        Switch_MenuP();
    }
    if (op == 2) {
        Switch_MenuC();
    }
}

void Switch_MenuC() {//TODO:
    int op2 = 1;
    bool t = true;
    trans();
    while (!SELECT) {
        if (t) {
            clear();
            MenuC(op2);
            t = false;
        }
        if (UP) {
            op2++;
            t = true;
        }
        if (DOWN) {
            op2--;
            t = true;
        }
        if (op2 > 3) {
            op2 = 1;
        }
        if (op2 < 1) {
            op2 = 3;
        }
        if (RETURN) {
            Switch_MenuP();
        }

    }
    if (op2 == 1) {
        Switch_MenuW();
    }
    if (op2 == 2) {
        Switch_MenuT();
    }
    if (op2 == 3) {
        Switch_MenuB();
    }
}

void Switch_MenuW() {//TODO:
    int op = 1;
    bool t = true;
    trans();
    while (!SELECT) {
        if (t) {
            clear();
            MenuW(op);
            t = false;
        }
        if (UP) {
            op++;
            t = true;
        }
        if (DOWN) {
            op--;
            t = true;
        }
        if (op > 4) {
            op = 1;
        }
        if (op < 1) {
            op = 4;
        }
        if (RETURN) {
            Switch_MenuC();
        }
    }
    if (op == 1) {
        setWayFront(true);
        setWayRear(false);
        setWayRot4(false);
        setWayRet4(false);

        show();
        Switch_MenuC();
    }
    if (op == 2) {
        setWayFront(false);
        setWayRear(true);
        setWayRot4(false);
        setWayRet4(false);
        show(); //mostra no LCD as config.s abilitadas por 5s
        Switch_MenuC();
    }
    if (op == 3) {
        setWayFront(false);
        setWayRear(false);
        setWayRot4(true);
        setWayRet4(false);
        show(); //mostra no LCD as config.s abilitadas por 5s
        Switch_MenuC();
    }
    if (op == 4) {
        setWayFront(false);
        setWayRear(false);
        setWayRot4(false);
        setWayRet4(true);
        show(); //mostra no LCD as config.s abilitadas por 5s
        Switch_MenuC();
    }
}

void Switch_MenuT() {//TODO:
    int op = 1;
    bool t = true;
    trans();
    while (!SELECT) {
        if (t) {
            clear();
            MenuT_and_B(op);
            t = false;
        }
        if (UP) {
            op++;
            t = true;
        }
        if (DOWN) {
            op--;
            t = true;
        }
        if (op > 2) {
            op = 1;
        }
        if (op < 1) {
            op = 2;
        }
        if (RETURN) {
            Switch_MenuC();
        }

    }

    if (op == 1) {
        Switch_MenuTM();
    }
    if (op == 2) {
        Switch_MenuTS();
    }
}

void Switch_MenuB() {//TODO:
    int op = 1;
    bool t = true;
    trans();
    while (!SELECT) {
        if (t) {
            clear();
            MenuT_and_B(op);
            t = false;
        }
        if (UP) {
            op++;
            t = true;
        }
        if (DOWN) {
            op--;
            t = true;
        }
        if (op > 2) {
            op = 1;
        }
        if (op < 1) {
            op = 2;
        }
        if (RETURN) {
            Switch_MenuC();
        }
    }
    if (op == 1) {
        Switch_MenuBM();
    }
    if (op == 2) {
        Switch_MenuBS();
    }
}

void Switch_MenuTM() {//TODO:
    int op = 1;
    bool t = true;
    trans();
    while (!SELECT) {
        if (t) {
            clear();
            MenuTM(op);
            t = false;
        }
        if (UP) {
            op++;
            t = true;
        }
        if (DOWN) {
            op--;
            t = true;
        }
        if (op > 3) {
            op = 1;
        }
        if (op < 1) {
            op = 3;
        }
        if (RETURN) {
            Switch_MenuT();
        }

    }
    if (op == 1) {
        setTraction_Right_Rear(true);
        setTraction_Left_Rear(true);
        setTraction_Right_Front(false);
        setTraction_Left_Front(false);
        show(); //mostra no LCD as config.s abilitadas por 5s
        Switch_MenuT();
    }
    if (op == 2) {
        setTraction_Right_Rear(false);
        setTraction_Left_Rear(false);
        setTraction_Right_Front(true);
        setTraction_Left_Front(true);
        show(); //mostra no LCD as config.s abilitadas por 5s
        Switch_MenuT();
    }
    if (op == 3) {
        setTraction_Right_Rear(true);
        setTraction_Left_Rear(true);
        setTraction_Right_Front(true);
        setTraction_Left_Front(true);
        show(); //mostra no LCD as config.s abilitadas por 5s
        Switch_MenuT();
    }
}

void Switch_MenuTS() {//TODO:
    int op = 1;
    bool t = true;
    trans();
    while (!SELECT) {
        if (t) {
            clear();
            MenuTS(op);
            t = false;
        }
        if (UP) {
            op++;
            t = true;
        }
        if (DOWN) {
            op--;
            t = true;
        }
        if (op > 4) {
            op = 1;
        }
        if (op < 1) {
            op = 4;
        }
        if (RETURN) {
            Switch_MenuT();
        }

    }
    if (op == 1) {
        if (getTraction_Right_Rear() == false) {
            setTraction_Right_Rear(true);
        } else {
            setTraction_Right_Rear(false);
        }
        show(); //mostra no LCD as config.s abilitadas por 5s
        Switch_MenuT();
    }
    if (op == 2) {

        if (getTraction_Left_Rear() == false) {
            setTraction_Left_Rear(true);
        } else {
            setTraction_Left_Rear(false);
        }
        show(); //mostra no LCD as config.s abilitadas por 5s
        Switch_MenuT();
    }
    if (op == 3) {

        if (getTraction_Right_Front() == false) {
            setTraction_Right_Front(true);
        } else {
            setTraction_Right_Front(false);
        }
        show(); //mostra no LCD as config.s abilitadas por 5s
        Switch_MenuT();
    }
    if (op == 4) {

        if (getTraction_Left_Front() == false) {
            setTraction_Left_Front(true);
        } else {
            setTraction_Left_Front(false);
        }
        show(); //mostra no LCD as config.s abilitadas por 5s
        Switch_MenuT();
    }
}

void Switch_MenuBM() {//TODO:
    int op = 1;
    bool t = true;
    trans();
    while (!SELECT) {
        if (t) {
            clear();
            MenuBM(op);
            t = false;
        }
        if (UP) {
            op++;
            t = true;
        }
        if (DOWN) {
            op--;
            t = true;
        }
        if (op > 3) {
            op = 1;
        }
        if (op < 1) {
            op = 3;
        }
        if (RETURN) {
            Switch_MenuB();
        }
    }

    if (op == 1) {
        setBreak_Right_Front(true);
        setBreak_Left_Front(true);
        setBreak_Right_Rear(false);
        setBreak_Left_Rear(false);
        show(); //mostra no LCD as config.s abilitadas por 5s
        Switch_MenuB();
    }
    if (op == 2) {
        setBreak_Right_Front(false);
        setBreak_Left_Front(false);
        setBreak_Right_Rear(true);
        setBreak_Left_Rear(true);
        show(); //mostra no LCD as config.s abilitadas por 5s
        Switch_MenuB();
    }
    if (op == 3) {
        setBreak_Right_Front(true);
        setBreak_Left_Front(true);
        setBreak_Right_Rear(true);
        setBreak_Left_Rear(true);
        show(); //mostra no LCD as config.s abilitadas por 5s
        Switch_MenuB();
    }
}

void Switch_MenuBS() {//TODO:
    int op = 1;
    bool t = true;
    trans();
    while (!SELECT) {
        if (t) {
            clear();
            MenuBS(op);
            t = false;
        }
        if (UP) {
            op++;
            t = true;
        }
        if (DOWN) {
            op--;
            t = true;
        }
        if (op > 4) {
            op = 1;
        }
        if (op < 1) {
            op = 4;
        }
        if (RETURN) {
            Switch_MenuB();
        }

    }

    if (op == 1) {

        if (getBreak_Right_Front() == false) {
            setBreak_Right_Front(true);
        } else {
            setBreak_Right_Front(false);
        }
        show(); //mostra no LCD as config.s abilitadas por 5s
        Switch_MenuB();
    }
    if (op == 2) {
        if (getBreak_Left_Front() == false) {
            setBreak_Left_Front(true);
        } else {
            setBreak_Left_Front(false);
        }

        show(); //mostra no LCD as config.s abilitadas por 5s
        Switch_MenuB();
    }
    if (op == 3) {

        if (getBreak_Right_Rear() == false) {
            setBreak_Right_Rear(true);
        } else {
            setBreak_Right_Rear(false);
        }
        show(); //mostra no LCD as config.s abilitadas por 5s
        Switch_MenuB();
    }
    if (op == 4) {

        if (getBreak_Left_Rear() == false) {
            setBreak_Left_Rear(true);
        } else {
            setBreak_Left_Rear(false);
        }
        show(); //mostra no LCD as config.s abilitadas por 5s
        Switch_MenuB();
    }
}
