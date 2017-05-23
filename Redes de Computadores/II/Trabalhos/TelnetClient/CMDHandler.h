#ifndef CMDHANDLER_H
#define CMDHANDLER_H
	#pragma once
    #include <cstddef>//NULL
    #include <iostream>
	#include "telnet.h"
    using namespace std;
	class CMDHandler{
		public:
			CMDHandler(void);
			CMDHandler(int i);
			~CMDHandler(void);
			
			void sendString(char* String);
			void receiveString();
			
		private:
			int getLevel(const char *Level);
			/*riseLevel()
			riseLevelUntil(Level L)
			reduceLecel()
			reduceLevelUntil(Level L)
			goToSideLevel(Level L)
			goToLevel(Level L)*/
			int Level;
	};
#endif