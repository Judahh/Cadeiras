#ifndef __MAIN
#define __MAIN
//#include "Main.h"
typedef unsigned char bool;
#define true 1
#define false 0
//****************************************************************************
//*********************************SETS***************************************
//****************************************************************************
//Way
void setWayFront(unsigned char New);

void setWayRear(unsigned char New);

void setWayRot4(unsigned char New);

void setWayRet4(unsigned char New);

//Traction

void setTraction_Right_Rear(bool New);

void setTraction_Left_Rear(bool New);

void setTraction_Right_Front(bool New);

void setTraction_Left_Front(bool New);

//Breakes

void setBreak_Right_Front(bool New);

void setBreak_Left_Front(bool New);

void setBreak_Right_Rear(bool New);

void setBreak_Left_Rear(bool New);

//****************************************************************************
//*********************************GETS***************************************
//****************************************************************************
//Way

unsigned char getWayFront(void);

unsigned char getWayRear(void);

unsigned char getWayRot4(void);

unsigned char getWayRet4(void);

//Traction

bool getTraction_Right_Rear(void);

bool getTraction_Left_Rear(void);

bool getTraction_Right_Front(void);

bool getTraction_Left_Front(void);
//Breakes

bool getBreak_Right_Front(void);

bool getBreak_Left_Front(void);

bool getBreak_Right_Rear(void);

bool getBreak_Left_Rear(void);
	void Running (void);
#endif  //__MAIN