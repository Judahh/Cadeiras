#include "CMDHandler.h"
#include <stdio.h>
#include <string.h>
#include <direct.h>

#ifdef WIN32
#pragma warning(disable:4996)
#include <conio.h>
#endif

void main(int /* argc */,const char **argv){
	CMDHandler CMD;
	gTelnet = TELNET::createTelnet("localhost",23);//variavel global declarada no .h
	bool isClient;

	if ( gTelnet->haveConnection() ){
	if ( gTelnet->isServer() ){
		printf("Telnet Server\r\n");
		isClient=false;
	}else{
		printf("Telnet Client.\r\n");
		isClient=true;
		while(true){
			printf("\nENTROU\n\n\n");
			unsigned int c=0;
			char *a="";
			for(int i =0;i<3;i++){
				//char *b=const_cast<char*> (gTelnet->receiveMessage(c));
				const char *b=gTelnet->receiveMessage(c);
				string a="#";
				if(b!=NULL){
					printf("%d\n",a.compare(b));
					printf("%s\n",b);
				}
			}
			for(int i =0;i<1;i++){
				gTelnet->sendMessage(0,"\r\n");
			}
			char f = (char)getch();
			printf("\nChar:%c\n\n\n",f);
			while(f != 't'){
				printf("\nWHILE\n\n\n");
				f= (char)getch();
				a="disable";
				CMD.sendString(a);
				printf("\nMANDOU\n\n\n");
				//gTelnet->sendMessage(0,"%s\r\n",a);
			}
			//scanf("%s",a);
			//printf("Enviado:%s\n",a);
			//while(true);
			//gTelnet->sendMessage(0,"%s\r\n",a);
		}
	}
	printf("\r\n");
	printf("botao esc para fechar\r\n");
	printf("\r\n");
	
	}else{
	printf("Unable to establish a telnet connection!\r\n");
	}

	TELNET::releaseTelnet(gTelnet);
}