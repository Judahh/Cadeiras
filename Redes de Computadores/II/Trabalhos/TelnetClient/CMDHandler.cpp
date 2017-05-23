#include "CMDHandler.h"
CMDHandler::CMDHandler(){

}

CMDHandler::CMDHandler(int i){

}

CMDHandler::~CMDHandler(){

}

void CMDHandler::sendString(char* String){
	gTelnet->sendMessage(0,"%s\r\n",String);
}

void CMDHandler::receiveString(){
	unsigned int c=0;
	const char *b=gTelnet->receiveMessage(c);
	string a;
	
	if(b!=NULL){
		printf("%d\n",a.compare(b));
		printf("%s\n",b);
	}
}

int CMDHandler::getLevel(const char *Level){
	if(strstr (Level,">")!=NULL){
		this->Level=1;
	}
	if(strstr (Level,"(")!=NULL){
		if(strstr (Level,"(config")!=NULL){
			this->Level=3;
		}
		
		return this->Level;
	}
	if(strstr (Level,"#")!=NULL){
		this->Level=2;
	}
	return this->Level;
}