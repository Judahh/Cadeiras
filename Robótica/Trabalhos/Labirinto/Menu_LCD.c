//#include <p18f4520.h>
//#include <delays.h>
#include "LCD.h"
//#include "Lcd_8bits.h"
//#include "Main.c"
//#include "Menu_LCD.c"

void MenuP(int op) {
    switch (op) {
        case 1:
            LCD_write_string_rom("-Start");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("Config.");
            break;
        case 2:
            LCD_write_string_rom("Start");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("-Config.");
            break;
    }
}

void MenuC(int op) {
    switch (op) {
        case 1:
            LCD_write_string_rom("-Way");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("Traction");
            break;
        case 2:
            LCD_write_string_rom("-Traction");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("Break");
            break;
        case 3:
            LCD_write_string_rom("Traction");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("-Break");
            break;
    }
}

void MenuW(int op) {
    switch (op) {
        case 1:
            LCD_write_string_rom("-Front");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("Rear");
            break;
        case 2:
            LCD_write_string_rom("-Rear");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("Rot4");
            break;
        case 3:
            LCD_write_string_rom("-Rot4");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("Ret4");
            break;
        case 4:
            LCD_write_string_rom("Rot4");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("-Ret4");
            break;
    }
}

void MenuT_and_B(int op) {
    switch (op) {
        case 1:
            LCD_write_string_rom("-Multi");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("Single");
            break;
        case 2:
            LCD_write_string_rom("Multi");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("-Single");
            break;
    }
}

void MenuTM(int op) {
    switch (op) {
        case 1:
            LCD_write_string_rom("-2xR");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("2xF");
            break;
        case 2:
            LCD_write_string_rom("-2xF");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("4x4");
            break;
        case 3:
            LCD_write_string_rom("2xF");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("-4x4");
            break;
    }
}

void MenuTS(int op) {
    switch (op) {
        case 1:
            LCD_write_string_rom("-RR");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("LR");
            break;
        case 2:
            LCD_write_string_rom("-LR");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("RF");
            break;
        case 3:
            LCD_write_string_rom("-RF");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("LF");
            break;
        case 4:
            LCD_write_string_rom("RF");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("-LF");
            break;
    }
}

void MenuBM(int op) {
    switch (op) {
        case 1:
            LCD_write_string_rom("-2xF");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("2xR");
            break;
        case 2:
            LCD_write_string_rom("-2xR");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("4x4");
            break;
        case 3:
            LCD_write_string_rom("2xR");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("-4x4");
            break;
    }
}

void MenuBS(int op) {//Menu Break Single
    switch (op) {
        case 1:
            LCD_write_string_rom("-RF");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("LF");
            break;
        case 2:
            LCD_write_string_rom("-LF");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("RR");
            break;
        case 3:
            LCD_write_string_rom("-RR");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("LR");
            break;
        case 4:
            LCD_write_string_rom("RR");

            LCD_pos_xy(0, 2); //Move to  2nd line

            LCD_write_string_rom("-LR");
            break;
    }
}
