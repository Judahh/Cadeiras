#include "telnet.h"
#include <stdio.h>
#include <string.h>
#include <direct.h>

#ifdef WIN32
#pragma warning(disable:4996)
#include <conio.h>
#endif

void main(int /* argc */,const char **argv){
  gTelnet = TELNET::createTelnet("10.10.0.151",23);//variavel global declarada no .h

  if ( gTelnet->haveConnection() ){
    if ( gTelnet->isServer() ){
      printf("Telnet Server\r\n");
    }else{
      printf("Telnet Client.\r\n");
    }
	printf("\r\n");
    printf("bye ou botao esc para fechar\r\n");
	printf("\r\n");
    while (true){
		unsigned int client = 0;

		const char* msg = gTelnet->receiveMessage(client);
		while(msg != NULL)
		{
			printf("%s\n", msg);
			msg = gTelnet->receiveMessage(client);
		}

		const char* snd = "";
		scanf("%s", snd);
		gTelnet->sendMessage(client, snd);
    }
  }else{
    printf("Unable to establish a telnet connection!\r\n");
  }

  TELNET::releaseTelnet(gTelnet);
}