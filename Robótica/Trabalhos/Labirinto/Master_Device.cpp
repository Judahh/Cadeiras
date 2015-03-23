




#include "MRF24J40MA.h"

int main()
{   
  


MRF24J40A_Stack_NAME_TAG();




unsigned char Ausgang_MASTER[500];//TEST DATA
unsigned char PAYLOAD_MASTER[500];//TEST DATA


int Bit_index;

for (Bit_index=0;Bit_index<140;Bit_index++)
{

	 Ausgang_MASTER[Bit_index]=Bit_index;
	 PAYLOAD_MASTER[Bit_index]=216;//DUMMY DATA
}

MRF24J40_Atavistic_XMT_NAME_TAG  ( Ausgang_MASTER);    // Transmitts to slave
MRF24J40_Atavistic_RECVR_NAME_TAG( PAYLOAD_MASTER );   // Recieves from slave


for (Bit_index=0;Bit_index<128;Bit_index++)
{

	cout <<"PAYLOAD_MASTER["<<Bit_index<<"]="<<int (PAYLOAD_MASTER[Bit_index])<<endl;
}





return 0;

};

	
	
	
	

   
  



