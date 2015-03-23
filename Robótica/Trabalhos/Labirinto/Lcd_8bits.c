/********************************************************************
;	Nome do arquivo:		LCD_8bits.c            
;	Data:				    10 de mar�o de 2010          
;	Versao:		  			1.0                              
;	MPLAB IDE:				v8.20a  
;	Autor:				    Wagner Zanco              
**********************************************************************/
#include <p18f4520.h>					
#include <delays.h>						
#include "Lcd_8bits.H"

void IniciaLCD (unsigned char NL)
{
	const unsigned char Seq_Inic[3] = {0x0F, 0x06, 0x01};	//declara��o de vetor inicizlizado
	unsigned char i;										//declara��o de vari�vel local
	char x;													//declara��o de vari�vel local
	_EN = 0;							//envia intru��o
	_RS = 0;							//limpa pino enable
	_RW = 0;							//ativa ciclo de escrita
	ADCON1 = 0x0F;						//configura PORT de controle com digital
	TRIS_CONT_LCD = 0;					//configura PORT de controle como sa�da 
	TRIS_PORT_LCD = 0;					//configura PORT de dados como sa�da
//*******************************
//envia para o LCD o comando 0x30 tr�s vezes	
	for(i=0;i<3;i++)
		{
		PORT_LCD = 0x30;				//comando 0x30
		Pulse();						//aplica pulso enable no LCD
		_Delay5ms();					//delay 5ms
		}
//*******************************
//configura linha simples ou linha dupla
	if(NL == 1)PORT_LCD =  0x30;		//se NL=1, ativa uma linha 
	else PORT_LCD =  0x38;				//se NL!=1, ativa duas linhas 
	Pulse();							//aplica pulso enable no LCD
	_Delay5ms();						//delay 5ms
//*******************************
/*configura:
- display ativo com cursor piscando
- desloca cursor para a direita na entrada de um novo caractere
- limpa display e retorna cursor a primeira posi��o da primeira linha
*/
	for(i=0;i<3;i++)
		{
		PORT_LCD = Seq_Inic[i];			//LCD recebe comando
		Pulse();						//aplica pulso enable no LCD
		_Delay5ms();					//delay 5ms
		}
	TRIS_PORT_LCD = 0xFF;				//configura PORT de dados como entrada
//**********************************************************************
}										//final  da fun��o IniciaLCD
//**********************************************************************
//esta fun��o escreve comando/dado no LCD
void Pulse(void)
	{
	DelayFor20TCY();					//delay de 20 ciclos de clock					
	_EN = 1;							//seta pino enable
	DelayFor20TCY();					//delay de 20 ciclos de clock					
	_EN = 0;							//limpa pino enable
	}
//**********************************************************************
//							fun��es de delay
//**********************************************************************
//delay de 100us
void _Delay100us(void)
{
	Delay100TCYx(2);					//delay 100us
}
//**********************************************************************
//delay de 5ms
void _Delay5ms(void)
{
	Delay10KTCYx(1);					//delay 5ms
}
//**********************************************************************
//delay 20 ciclos do oscilador principal
void DelayFor20TCY( void )
{
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
void DelayFor18TCY( void )
{
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
void LCD_delay_ms2 (unsigned char time){
	unsigned char i;
	unsigned char j;
	for(j=0;j<time;j++){
		for(i=0;i<10;i++){
			Delay100TCYx(2);
		}
	}	
}
//*******************************************************************
//				fun��es de acesso ao LCD
//*******************************************************************
/*esta fun��o fica aguardando o LCD controller terminar de executar
a instru��o atual. ela retorna o  valor 0 quando a instru��o terminar.*/
unsigned char TesteBusyFlag(void)
{
//	TRIS_PORT_LCD = 0xFF;				//configura PORT de dados como entrada

    _RW = 1;             				//ativa ciclo de leitura
	_RS = 0;							//ciclo de intru��o			
    DelayFor20TCY();					//delay de 20 cliclos de clock
    _EN = 1;               		       	//seta pino enable
    DelayFor20TCY();					//delay de 20 cliclos de clock
	if(PORT_LCD&0x80)          	    	//leitura do bit busy flag
    {                          	     	//se bit busy == 1, LCD ocupado 
    	_EN = 0;              			//reseta pino enable
        _RW = 0;             			//reseta linha de escrita
        return 1;              		 	//LCD ocupado, retorna 1
    }
    else                     	        //se busy flag == 0, LCD livre
    {
        _EN = 0;              		    //reseta pino enable
        _RW = 0;             			//ativa ciclo de escrita
        return 0;               		//LCD livre, retorna 0
    }
//*******************************************************************
}										//final da fun��o TesteBusyFlag
//*******************************************************************
//esta fun��o escreve um caractere na poci��o apontada pelo cursor.
void EscDataLCD(char _data)
{
	TRIS_PORT_LCD = 0;					//configura PORT de dados como sa�da
	PORT_LCD = _data;					//escreve dado
	_RS = 1;							//envia dado
	_RW = 0;							//ativa ciclo de escrita
	Pulse();							//aplica pulso enable no LCD
	_RS = 0;							//envia instru��o
    DelayFor20TCY();					//delay de 20 ciclos de clock
	TRIS_PORT_LCD = 0xFF;				//configura PORT de dados como entrada
//*******************************************************************
}										//final da fun��o EscDataLCD
//*******************************************************************
//esta fun��o envia uma instru��o para o LCD.
void EscInstLCD(unsigned char _inst)
{
	TRIS_PORT_LCD = 0;					//configura PORT de dados como sa�da
	PORT_LCD = _inst;					//escreve instru��o
	_RS = 0;							//envia intru��o
	_RW = 0;							//ativa ciclo de escrita
	Pulse();							//aplica pulso enable no LCD
	_RS = 0;							//envia dado
    DelayFor20TCY();					//delay de 20 ciclos de clock
	TRIS_PORT_LCD = 0xFF;				//configura PORT de dados como entrada
//*******************************************************************
}										//final da fun��o EscInstLCD
void Intro(void)
{	
	EscInstLCD(0x0E);
	EscInstLCD(0x02);
	EscInstLCD(0x0C);
}
void LCD_pos_xy2(char x, char y){
	if(x==0 && y==2){	
		JumpLine();
	}
}
void clear2(void)
{
	EscInstLCD(0x0E);
	EscInstLCD(0x01);
	EscInstLCD(0x0C);
}
void JumpLine(void)
{
	EscInstLCD(0x0E);
	EscInstLCD(0xC0);
	EscInstLCD(0x0C);
}
//*******************************************************************/
/*esta fun��o escreve no LCD uma string lida da mem�ria RAM a partir 
da posi��o aponntada pelo cursor.*/
#pragma code My_codigo = 0x200
void EscStringLCD(char *buff)
{
    while(*buff)                  		//escreve caractere at� econtrar null
   {
		while(TesteBusyFlag());			//espera LCD terminar de executar instru��o
		EscDataLCD(*buff);				//escreve no LCD caractere apontado por bufff
        buff++;               			// Incrementa buffer
   }
//*******************************************************************
}										//final da fun��o EscStringLCD
#pragma code
//*******************************************************************
/*esta fun��o escreve no LCD uma string lida da mem�ria de programa 
a partir da posi��o aponntada pelo cursor.*/
void EscStringLCD_ROM(const rom char *buff)
{
    while(*buff)                  		// Write data to LCD up to null
   {
		while(TesteBusyFlag());			//espera LCD controller terminar de executar instru��o
     	EscDataLCD(*buff);				//escreve no LCD caractere apontado por bufff
        buff++;               			// Incrementa buffer
   }
        return;
//*******************************************************************
}										//final da fun��o EscStringLCD_ROM
void LCD_write_string_rom2(const rom char *buffy)
{
	EscStringLCD_ROM(buffy);
}
//*******************************************************************
//esta fun��o testa o LCD acendendo todos os pixels do display.
void TestPixelsLCD(void)
{
unsigned char BffCheio[32];				//declara��o de vetor 
unsigned char i;						//declara��o de vari�vel local

	EscInstLCD(0x80);					//posiciona cursor na primeira posi��o da primeira linha
	while(TesteBusyFlag());				//espera LCD controller terminar de executar instru��o

	for(i=0;i<32;i++)					//la�o de itera��o
	{
		if(i<16)						//i < 16? 
		{								//sim, executa bloco de c�digo a seguir
			EscDataLCD(0xFF);			//escreve caractere na posi��o pantada pelo  cursor
			while(TesteBusyFlag());		//espera LCD controller terminar de executar instru��o
		}
		else 	if(i==16)				//i==16?
		{								//sim, executa bloco de c�digo a seguir
			EscInstLCD(0xC0);			//posiciona cursor na primeira posi��o da segunda linha
			while(TesteBusyFlag());		//espera LCD controller terminar de executar instru��o

			EscDataLCD(0xFF);			//escreve caractere na posi��o pantada pelo  cursor
			while(TesteBusyFlag());		//espera LCD controller terminar de executar instru��o
		}
		else							//se i !=16 executa bloco de c[odigo a seguir
		{
			EscDataLCD(0xFF);			//escreve caractere na posi��o pantada pelo  cursor
			while(TesteBusyFlag());		//espera LCD controller terminar de executar instru��o
		}
	}
//*******************************************************************
}
										