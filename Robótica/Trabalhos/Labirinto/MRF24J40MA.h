    
/*****************************  General Comments ****************************

      Data Sheet version ID: DS39776B (© 2008 Microchip Technology Inc.)

     Required reading:

      
      2.14.1 SHORT ADDRESS REGISTER INTERFACE (DS39776B-page 12)

      2.14.2 LONG ADDRESS REGISTER INTERFACE  (DS39776B-page 13)
  



 ************************   Notes on "NAME_TAG" *************************** 

  In the event that you have two or more MRF24j40ma devices in you project,
you need to have differently named functions.  You must use your text
editor's search and replace function.  This is typically "Cntrl H".

***************************************************************************






 **************************   Notes on "CLIENT CODE BELOW HERE" ****************************
                                                                                           *
 You must determine what code makes the output signal high or low.  You can test this      *
with a digital voltmeter.                                                                  *
                                                                                           *
  There are two types of functions that YOU must write code for: I/O input I/O output.     *
 I do not know what your hardware is, but these should be VERY easy to write.              *
                                                                                           *
  IO INPUT FUNCTIONS:                                                                      *
                                                                                           *
	unsigned char  INT_signal_NAME_TAG ();//                                              *
     unsigned char  SDO_signal_NAME_TAG ();//                                              *

  IO OUTPUT Functions:                                                                     *

     void CS_bar_signal_NAME_TAG   ( unsigned char Bit_State);//                           *
	void SDI_signal_NAME_TAG      ( unsigned char Bit_State);//
	void SCK_signal_NAME_TAG      ( unsigned char Bit_State);//                           *
	void WAKE_signal_NAME_TAG     ( unsigned char Bit_State);//
	void RESET_bar_signal_NAME_TAG( unsigned char Bit_State);//                           *
                                                                                           *


  I have INTENTIONALLY wrote bogus varibles such as "Global_BANK_A_OUT","Global_BANK_B_OUT",
  " Refresh_Digital_Output( )" "Global_BANK_C_IN"and "Aquire_Digital_Input()"  These remind
  you of what you must to do.


  ******************************************************************************************




  ******************************* Notes on Delay Function **********************************

   void Delay_Function_NAME_TAG();//
  This is a simple DELAY FUNCTION.  You may need to adjust your delay if your clock speed is 
  too fast.  This is entirely an emperical number.  You need to adjust "DELAY_VALUE".  The BUS
  frequency (APPROX)=F_clck/ DELAY_VALUE
 
  *******************************************************************************************


*/



     void CS_bar_signal_NAME_TAG   ( unsigned char Bit_State);//
	void SDI_signal_NAME_TAG      ( unsigned char Bit_State);//
	void SCK_signal_NAME_TAG      ( unsigned char Bit_State);//
	void WAKE_signal_NAME_TAG     ( unsigned char Bit_State);//
	void RESET_bar_signal_NAME_TAG( unsigned char Bit_State);//



	unsigned char  INT_signal_NAME_TAG ();//
     unsigned char  SDO_signal_NAME_TAG ();//


     void Delay_Function_NAME_TAG();//

	
	void MRF24J40MA_Write_SARI_NAME_TAG( unsigned char MRF24J40MA_SARI_Address, unsigned char SARI_Data);
	unsigned char  MRF24J40MA_Read_SARI_NAME_TAG( unsigned char MRF24J40MA_SARI_Address);


	void MRF24J40MA_Write_LARI_NAME_TAG( unsigned short int MRF24J40MA_LARI_Address, unsigned char LARI_Data);
	unsigned char  MRF24J40MA_Read_LARI_NAME_TAG( unsigned short int MRF24J40MA_LARI_Address);

	
     void MRF24J40_Atavistic_XMT_NAME_TAG( unsigned char Ausgang_PAYLOAD_Array[]);
     void MRF24J40_Atavistic_RECVR_NAME_TAG( unsigned char PAYLOAD_Array[]);   


     void Transcribe_SARI_NAME_TAG(unsigned char MODIFIED_INPUT_BYTE, unsigned char ERASE_MASK, unsigned char REG_ADDR);
     void Transcribe_LARI_NAME_TAG(unsigned char MODIFIED_INPUT_BYTE, unsigned char ERASE_MASK, int REG_ADDR);
     void MRF24J40A_Stack_NAME_TAG();








	

	void MRF24J40MA_Write_SARI_NAME_TAG( unsigned char MRF24J40MA_SARI_Address, unsigned char SARI_Data)
	{


     

	 unsigned char Bit_Index;            // Used in bit array operarions
	 unsigned char CMD_Bit_Mask;         // Used in extracting bit data from MRF24J40MA_SARI_Address
	 unsigned char Masked_Address;       // Individual bits from requested address

	

	 unsigned char Single_Bit_SARI_DATA;

	 unsigned char Bit_Mask; 



   
	 
	 //**** Initial part bias *******
	 CS_bar_signal_NAME_TAG(0X01);//         *     
	 SCK_signal_NAME_TAG   (0X00);//         *  
	 SDI_signal_NAME_TAG   (0X00);//         *  

      
      CS_bar_signal_NAME_TAG( 0X00);//********* Lower CS_bar  **********
	 

	 //********* First bit of address ********
	 SCK_signal_NAME_TAG( 0X00 );
	 SDI_signal_NAME_TAG( 0X00);//
	 SCK_signal_NAME_TAG( 0X01);  
	 SCK_signal_NAME_TAG( 0X00); 
	 //********* First bit of address ********
	
	 

        //************ Transfer Address  ********** 	  
        for (Bit_Index=6;Bit_Index>0;Bit_Index--)
	   {
		   SCK_signal_NAME_TAG( 0X00);  
		  
             CMD_Bit_Mask=(1<<(Bit_Index-1));

		   Masked_Address=MRF24J40MA_SARI_Address&CMD_Bit_Mask;
  
             if (0==Masked_Address)
		   {
               SDI_signal_NAME_TAG( 0X00);
		   }else
		   {
               SDI_signal_NAME_TAG( 0X01);
		   }	  
   
	       SCK_signal_NAME_TAG( 0X01); 
	      
		 
	   }		
	   //************ Transfer Address  **********


	
	   //********** Apply Write Instruction *****
	   SCK_signal_NAME_TAG( 0X00);
	   SDI_signal_NAME_TAG (0X01);//
        SCK_signal_NAME_TAG( 0X01);
	   SCK_signal_NAME_TAG( 0X00);
	   //********* _______________________ *****



		  
	      
          

          //********** Actual Data Write ************
          for (Bit_Index=8;Bit_Index>0;Bit_Index--)
		{
		  SCK_signal_NAME_TAG( 0X00);
	      


	       
		  Bit_Mask=(1<<(Bit_Index-1));

		  
		  Single_Bit_SARI_DATA=Bit_Mask&SARI_Data;
		  

		  if (0== Single_Bit_SARI_DATA)
		  {
               SDI_signal_NAME_TAG(0X00);
		  }else
		  {
              SDI_signal_NAME_TAG(0X01);
		  }
              SCK_signal_NAME_TAG( 0X01);
            
		 
		}
		  SCK_signal_NAME_TAG( 0X00);
	       
		//********** Actual Data Write ************


	     CS_bar_signal_NAME_TAG(0X01);
		
	

	 
       
	}//END void MRF24J40MA_Write_SARI_NAME_TAG( unsigned char MRF24J40MA_SARI_Address, unsigned char SARI_Data)





	unsigned char  MRF24J40MA_Read_SARI_NAME_TAG( unsigned char MRF24J40MA_SARI_Address)
	{




	

     

	 unsigned char Bit_Index;            // Used in bit array operarions
	 unsigned char CMD_Bit_Mask;         // Used in extracting bit data from MRF24J40MA_SARI_Address
	 unsigned char Masked_Address;       // Individual bits from requested address
	 unsigned char Bit_data_from_ASIC;   // Bits 7 to 0 read from part 
	 unsigned char Reported_Data;        // Byte of data returned from part to user
	 unsigned char Shifted_ASIC_Data;    // This is a bit of data that has been shifted by the bit index



   
	 
	 //**** Initial part bias *******
	 CS_bar_signal_NAME_TAG(0X01);//         *     
	 SCK_signal_NAME_TAG   (0X00);//         *  
	 SDI_signal_NAME_TAG   (0X00);//         *  

      
      CS_bar_signal_NAME_TAG( 0X00);//********* Lower CS_bar  **********
	 

	 //********* First bit of address ********
	 SCK_signal_NAME_TAG( 0X00 );
	 SDI_signal_NAME_TAG( 0X00);//
	 SCK_signal_NAME_TAG( 0X01);  
	 SCK_signal_NAME_TAG( 0X00); 
	 //********* First bit of address ********
	
	 

        //************ Transfer Address  ********** 	  
        for (Bit_Index=6;Bit_Index>0;Bit_Index--)
	   {
		   SCK_signal_NAME_TAG( 0X00);  
		  
             CMD_Bit_Mask=(1<<(Bit_Index-1));

		   Masked_Address=MRF24J40MA_SARI_Address&CMD_Bit_Mask;
  
             if (0==Masked_Address)
		   {
               SDI_signal_NAME_TAG( 0X00);
		   }else
		   {
               SDI_signal_NAME_TAG( 0X01);
		   }	  
   
	       SCK_signal_NAME_TAG( 0X01); 
	      
		 
	   }		
	   //************ Transfer Address  **********



	   	 	

 
	
	   //********** Apply Read instruction *****
	   SCK_signal_NAME_TAG( 0X00);
	   SDI_signal_NAME_TAG (0X00);//
        SCK_signal_NAME_TAG( 0X01);
	   SCK_signal_NAME_TAG( 0X00);
	   //********* _______________________ *****



		  
	      
          Reported_Data=0X00;//Erase value

          //********** Actual Data Read ************
          for (Bit_Index=8;Bit_Index>0;Bit_Index--)
		{
		  SCK_signal_NAME_TAG( 0X00);
	       SCK_signal_NAME_TAG( 0X01);
	       Bit_data_from_ASIC=SDO_signal_NAME_TAG( );
 
		  Shifted_ASIC_Data=(Bit_data_from_ASIC<<(Bit_Index-1));//Bit_data_from_ASIC
            Reported_Data=(Reported_Data|Shifted_ASIC_Data);
		 
		}
		  SCK_signal_NAME_TAG( 0X00);
	       
		//********** Actual Data Write ************


	     CS_bar_signal_NAME_TAG(0X01);
		
	

	  return Reported_Data;
       
	};//END unsigned char  MRF24J40MA_Read_SARI_NAME_TAG( unsigned char MRF24J40MA_SARI_Address)





	
	unsigned char  MRF24J40MA_Read_LARI_NAME_TAG( unsigned short int MRF24J40MA_LARI_Address)
	{

	 unsigned char Bit_Index;            // Used in bit array operarions
	 unsigned short int  CMD_Bit_Mask;   // Used in extracting bit data from MRF24J40MA_SARI_Address
	 unsigned short int Masked_Address;  // Individual bits from requested address
	 unsigned char Bit_data_from_ASIC;   // Bits 7 to 0 read from part 
	 unsigned char Reported_Data;        // Byte of data returned from part to user
	 unsigned char Shifted_ASIC_Data;    // This is a bit of data that has been shifted by the bit index

	 
	 //**** Initial part bias *******
	 CS_bar_signal_NAME_TAG(0X01);//         *     
	 SCK_signal_NAME_TAG   (0X00);//         *  
	 SDI_signal_NAME_TAG   (0X00);//         *  

      CS_bar_signal_NAME_TAG(0X00);//********* Lower CS_bar  **********
	 



	 //********* First bit of address ********
	 SCK_signal_NAME_TAG( 0X00);
	 SDI_signal_NAME_TAG( 0X01);//
	 SCK_signal_NAME_TAG( 0X01);  
	 SCK_signal_NAME_TAG( 0X00); 
	 //********* First bit of address ********
	
	 

        //************ Transfer Address  ********** 	  
        for (Bit_Index=10;Bit_Index>0;Bit_Index--)
	   {
		   SCK_signal_NAME_TAG(0X00);  
		  
             CMD_Bit_Mask=(1<<(Bit_Index-1));

		   Masked_Address=MRF24J40MA_LARI_Address&CMD_Bit_Mask;

  
             if (0==Masked_Address)
		   {
               SDI_signal_NAME_TAG( 0X00);
		   }else
		   {
               SDI_signal_NAME_TAG( 0X01);
		   }	  
   
	       SCK_signal_NAME_TAG( 0X01); 
	      
		 
	   }		
	   //************ Transfer Address  **********

	   	 	 
	
	   //********** Apply Read instruction *****
	   SCK_signal_NAME_TAG( 0X00);
	   SDI_signal_NAME_TAG (0X00);//Actual read command
        SCK_signal_NAME_TAG( 0X01);
	   SCK_signal_NAME_TAG( 0X00);
	   //********* _______________________ *****


	   //************ Four Clock Cycles  *******
	   for (Bit_Index=4;Bit_Index>0;Bit_Index--)
	   {
		SCK_signal_NAME_TAG( 0X00);
          SCK_signal_NAME_TAG( 0X01);
	     SCK_signal_NAME_TAG( 0X00);	

	   };
	   //***************************************


		  
	      
          Reported_Data=0X00;//Erase value

          //********** Actual Data Read ************
          for (Bit_Index=8;Bit_Index>0;Bit_Index--)
		{
		  SCK_signal_NAME_TAG( 0X00);
	       SCK_signal_NAME_TAG( 0X01);
	       Bit_data_from_ASIC=SDO_signal_NAME_TAG( );

		
		  Shifted_ASIC_Data=(Bit_data_from_ASIC<<(Bit_Index-1));//Bit_data_from_ASIC
            Reported_Data=(Reported_Data|Shifted_ASIC_Data);
		 
		}
		SCK_signal_NAME_TAG( 0X00);
	     //********** Actual Data Read ************


	     CS_bar_signal_NAME_TAG(0X01);
		
	

	  return Reported_Data;
       
	};//unsigned char  MRF24J40MA_Read_LARI_NAME_TAG( unsigned short int MRF24J40MA_LARI_Address)





	void MRF24J40MA_Write_LARI_NAME_TAG( unsigned short int MRF24J40MA_LARI_Address, unsigned char LARI_Data)
	{



	 unsigned char Bit_Index;            // Used in bit array operarions
	 unsigned short int  CMD_Bit_Mask;   // Used in extracting bit data from MRF24J40MA_SARI_Address
	 unsigned short int Masked_Address;  // Individual bits from requested address
	 unsigned char Single_Bit_LARI_DATA;   // Bits 7 to 0 read from part.
	 unsigned char  Bit_Mask;    // This is a bit of data that has been shifted by the bit index



   
	 
	 //**** Initial part bias *******
	 CS_bar_signal_NAME_TAG(0X01);//         *     
	 SCK_signal_NAME_TAG   (0X00);//         *  
	 SDI_signal_NAME_TAG   (0X00);//         *  

      CS_bar_signal_NAME_TAG(0X00);//********* Lower CS_bar  **********
	 



	 //********* First bit of address ********
	 SCK_signal_NAME_TAG( 0X00);
	 SDI_signal_NAME_TAG( 0X01);//
	 SCK_signal_NAME_TAG( 0X01);  
	 SCK_signal_NAME_TAG( 0X00); 
	 //********* First bit of address ********
	
	 

        //************ Transfer Address  ********** 	  
        for (Bit_Index=10;Bit_Index>0;Bit_Index--)
	   {
		   SCK_signal_NAME_TAG(0X00);  
		  
             CMD_Bit_Mask=(1<<(Bit_Index-1));

		   Masked_Address=MRF24J40MA_LARI_Address&CMD_Bit_Mask;

  
             if (0==Masked_Address)
		   {
               SDI_signal_NAME_TAG( 0X00);
		   }else
		   {
               SDI_signal_NAME_TAG( 0X01);
		   }	  
   
	       SCK_signal_NAME_TAG( 0X01); 
	      
		 
	   }		
	   //************ Transfer Address  **********

	   	 	 
	
	   //********** Apply Write instruction *****
	   SCK_signal_NAME_TAG( 0X00);
	   SDI_signal_NAME_TAG (0X01);//Actual write command
        SCK_signal_NAME_TAG( 0X01);
	   SCK_signal_NAME_TAG( 0X00);
	   //********* _______________________ ******


	   //************ Four Clock Cycles  *******
	   for (Bit_Index=4;Bit_Index>0;Bit_Index--)
	   {
		SCK_signal_NAME_TAG( 0X00);
          SCK_signal_NAME_TAG( 0X01);
	     SCK_signal_NAME_TAG( 0X00);
		

	   };
	   //***************************************



         //********** Actual Data Write ************
          for (Bit_Index=8;Bit_Index>0;Bit_Index--)
		{
		  SCK_signal_NAME_TAG( 0X00);
	      
	       
		  Bit_Mask=(1<<(Bit_Index-1));	  
		  Single_Bit_LARI_DATA=Bit_Mask&LARI_Data;
		  

		  if (0== Single_Bit_LARI_DATA)
		  {
               SDI_signal_NAME_TAG(0X00);
		  }else
		  {
              SDI_signal_NAME_TAG(0X01);
		  }
              SCK_signal_NAME_TAG( 0X01);
            
		 
		}
		  SCK_signal_NAME_TAG( 0X00);
	       
		//********** Actual Data Write ************

	     CS_bar_signal_NAME_TAG(0X01);
		
	

	  return ;
       
	};//unsigned char  MRF24J40MA_Read_LARI_NAME_TAG( unsigned short int MRF24J40MA_LARI_Address)






	void CS_bar_signal_NAME_TAG( unsigned char Bit_State)
	{

		unsigned char  PIN_State;

       /*
            This is hardware specific command.  You must implement this function per your
	  specific micro controller.
       */
    


         PIN_State=0X01&Bit_State;

	    //************* CLIENT CODE BELOW HERE *************
		 
         Global_BANK_A_OUT[0]=PIN_State;//CS_bar
         Refresh_Digital_Output( );//My hardware command
             
	    //************** CLIENT CODE ABOVE HERE *************

	     Delay_Function_NAME_TAG();

       return;//
	};





	 void SDI_signal_NAME_TAG( unsigned char Bit_State)
	{


       	unsigned char  PIN_State;

       /*
            This is hardware specific command.  You must implement this function per your
	  specific micro controller.
       */

        
        PIN_State=0X01&Bit_State;

	   //************* CLIENT CODE BELOW HERE *************
       Global_BANK_A_OUT[1]=PIN_State;//SDI          //My hardware command
       Refresh_Digital_Output( );//My hardware command
       //************** CLIENT CODE ABOVE HERE *************

       

	   Delay_Function_NAME_TAG();
	   return;//
	};


	 

	
	 
	 void SCK_signal_NAME_TAG( unsigned char Bit_State)
	{

       /*
            This is hardware specific command.  You must implement this function per your
	  specific micro controller.

       */
		 unsigned char PIN_State;

         PIN_State=0X01&Bit_State;

	   //************* CLIENT CODE BELOW HERE *************
        Global_BANK_A_OUT[2]=PIN_State;//SCK ;          //My hardware command
        Refresh_Digital_Output( );//My hardware command
        //************** CLIENT CODE ABOVE HERE *************

	    Delay_Function_NAME_TAG();

       return;//
	}








	
	
	
	 
	
	
       void WAKE_signal_NAME_TAG( unsigned char Bit_State)
	{

       /*
            This is hardware specific command.  You must implement this function per your
	  specific micro controller.

       */

       unsigned char PIN_State;

	   PIN_State=0X01&Bit_State;

	   //************* CLIENT CODE BELOW HERE *************
	  Global_BANK_A_OUT[3]=PIN_State;//WAKE ;          //My hardware command
       Refresh_Digital_Output( );//My hardware command 
        //************** CLIENT CODE ABOVE HERE *************

        Delay_Function_NAME_TAG();
       return;//
	}
	


	  
       void RESET_bar_signal_NAME_TAG( unsigned char Bit_State)
	{

       /*
            This is hardware specific command.  You must implement this function per your
	  specific micro controller.

       */

      unsigned char PIN_State;
	  
	   PIN_State=0X01&Bit_State;

	   //************* CLIENT CODE BELOW HERE *************
        Global_BANK_A_OUT[4]=PIN_State;//Reset_bar ;          //My hardware command
        Refresh_Digital_Output( );//My hardware command
       //************** CLIENT CODE ABOVE HERE *************

	   Delay_Function_NAME_TAG();

       return;//
	}
	



	 unsigned char  SDO_signal_NAME_TAG( )
	{
       unsigned char SDO_value;//The results must be reported here
         
	  Delay_Function_NAME_TAG();
	  
	  //************* CLIENT CODE BELOW HERE *************

       Aquire_Digital_Input();
       SDO_value= Global_BANK_C_IN[0];//SDO

      //************** CLIENT CODE ABOVE HERE *************




	  SDO_value=SDO_value&(0X01);

       return SDO_value;//
	}

	  
	 unsigned char INT_signal_NAME_TAG( )
	{

       unsigned char INT_value;//The results must be reported here
       Delay_Function_NAME_TAG();

	  //************* CLIENT CODE BELOW HERE *************
	  Aquire_Digital_Input();
       INT_value= 0X01&Global_BANK_C_IN[1];//INT

       //************** CLIENT CODE ABOVE HERE *************


	  INT_value=INT_value&0X01;

       return INT_value;//
	}













void Delay_Function_NAME_TAG()
{
 /*
   This is futile code specifically designed to slow operation.
  */

   unsigned short int Delay_Loop;
   unsigned short int Dummy_Var;
   unsigned short int DELAY_VALUE=0X00FF;//(0X0000=>0XFFFF)

   for (Delay_Loop=0;Delay_Loop<DELAY_VALUE;Delay_Loop++)
   {

     Dummy_Var=Delay_Loop;//Meaningless
   };

};//END void Delay_Function_NAME_TAG()
	




void MRF24J40_Atavistic_XMT_NAME_TAG ( unsigned char Ausgang_PAYLOAD_Array[])  
{


  
      unsigned char SARI_ADDRESS;                       // Address used in hardware functions	 
      unsigned char STATUS_Byte;                        // SARI (0X31)
      unsigned char Bit_0_SARI_0X31; 


      MRF24J40MA_Write_LARI_NAME_TAG( 0X0000, 0  );// OGKW Microchip's mystery
	 MRF24J40MA_Write_LARI_NAME_TAG( 0X0001, 125);// 0 to 125 number of bytes.
	 MRF24J40MA_Write_LARI_NAME_TAG( 0X0002, 0  );// OGKW 
	 MRF24J40MA_Write_LARI_NAME_TAG( 0X0003, 128);// Control Byte must be 128(Oooga Booga Microchip)
  

	 MRF24J40MA_Read_LARI_NAME_TAG( 0X300);//Hardware Release (Ungus_Bungus Microchip)

      //*********** TRANSCRIBE ACTUAL PAYLOAD DATA **************************************
      for (SARI_ADDRESS=4;SARI_ADDRESS<128;SARI_ADDRESS++)//payload data 
	 {
        MRF24J40MA_Write_LARI_NAME_TAG( SARI_ADDRESS, Ausgang_PAYLOAD_Array[SARI_ADDRESS-4] );  
	 };
      

     
       //***************** ACTUAL TRANSMISSION **********************************
       Bit_0_SARI_0X31=0; 
	  MRF24J40MA_Read_LARI_NAME_TAG( 0X300);//Hardware Release (Unga_Bunga Microchip AMBUSH!!)
       MRF24J40MA_Write_SARI_NAME_TAG(0x1B,1);//Trigger transmission
       
	   while (0X01!=Bit_0_SARI_0X31)
	   {
          MRF24J40MA_Read_LARI_NAME_TAG( 0X300);//Hardware Release (Unga_Bunga Microchip AMBUSH!!)
          MRF24J40MA_Write_SARI_NAME_TAG(0x1B,1);//Trigger transmission


         STATUS_Byte=MRF24J40MA_Read_SARI_NAME_TAG(0X31);//Also PURGE BUFFER
	    
	    Bit_0_SARI_0X31=STATUS_Byte&0X01; 
	  };




};//END void MRF24J40_Atavistic_XMT ( unsigned char Ausgang_PAYLOAD_Array[]) 




void MRF24J40_Atavistic_RECVR_NAME_TAG( unsigned char PAYLOAD_Array[]) 
{

    unsigned short int BYTE_Index;      // Used in array operations
    unsigned short int MAX_BYTE_Index;  // Used in array operations
    unsigned short int PAYLOAD_Index;  // Used in array operations

    unsigned char      Bit_3_SARI_0X31; // 0X08&Read_SARI(0X31)                  
    unsigned char      HW_Status_Byte;  // Read_SARI(0X31)

    
    Bit_3_SARI_0X31=0;
    while (0==Bit_3_SARI_0X31)
    {
	 MRF24J40MA_Read_LARI_NAME_TAG( 0X300);//Hardware Release (Ungus_Bungus Microchip)
      HW_Status_Byte=MRF24J40MA_Read_SARI_NAME_TAG(0X31);
      Bit_3_SARI_0X31=(HW_Status_Byte&0X08);
	 //cout<<"HW_Status_Byte="<<int (HW_Status_Byte)<<endl;
    }



    // *********** TRANSCRIBE DATA FROM HARWARE ********************
    MAX_BYTE_Index=(0X300+128);
    for (BYTE_Index=0X300;BYTE_Index<MAX_BYTE_Index;BYTE_Index++)
    {

     PAYLOAD_Index=(BYTE_Index-0X300);
     PAYLOAD_Array[PAYLOAD_Index]=MRF24J40MA_Read_LARI_NAME_TAG(BYTE_Index);

    }
  


 };//void MRF24J40_Atavistic_RECVR( unsigned char PAYLOAD_Array[])



void MRF24J40A_Stack_NAME_TAG()
{
RESET_bar_signal_NAME_TAG(0X01);
RESET_bar_signal_NAME_TAG(0X00);
RESET_bar_signal_NAME_TAG(0X01);
WAKE_signal_NAME_TAG(0X00);
WAKE_signal_NAME_TAG(0X01);
    Transcribe_SARI_NAME_TAG(64,191,34);//// bit 6 REGWAKE: Register Wake-up Signal bit.
    Transcribe_SARI_NAME_TAG(0,191,34);//// bit 6 REGWAKE: Register Wake-up Signal bit.
    Transcribe_SARI_NAME_TAG(128,127,34);//// bit 7 IMMWAKE: Immediate Wake-up Mode Enable bit.
    Transcribe_SARI_NAME_TAG(64,191,13);////bit 6 WAKEPOL: Wake Signal Polarity bit.
    Transcribe_SARI_NAME_TAG(0,223,13);////bit 5 WAKEPAD: Wake I/O Pin Enable bit.
    Transcribe_SARI_NAME_TAG(2,253,42);//// bit 1 RSTBB: Baseband Reset bit.
    Transcribe_SARI_NAME_TAG(4,251,42);//// bit 2 RSTPWR: Power Management Reset bit.
    Transcribe_SARI_NAME_TAG(1,254,42);//// bit 0 RSTMAC: MAC Reset bit.
    Transcribe_SARI_NAME_TAG(0,253,42);//// bit 1 RSTBB: Baseband Reset bit.
    Transcribe_SARI_NAME_TAG(0,251,42);//// bit 2 RSTPWR: Power Management Reset bit.
    Transcribe_SARI_NAME_TAG(0,254,42);//// bit 0 RSTMAC: MAC Reset bit.
    Transcribe_SARI_NAME_TAG(240,15,37);//// bit 7-4 TURNTIME<3:0>: Turnaround Time bits.
    Transcribe_SARI_NAME_TAG(255,0,2);////bit 7-0 PANIDH<15:8>: PAN ID High Byte bits
    Transcribe_SARI_NAME_TAG(255,0,1);//// bit 7-0 PANIDL<7:0>: PAN ID Low Byte bits
    Transcribe_SARI_NAME_TAG(174,0,4);////bit 7-0 SADRH<15:8>: Short Address High Byte bits
    Transcribe_SARI_NAME_TAG(28,0,3);////bit 7-0 SADRL<7:0>: Short Address Low Byte bits
    Transcribe_SARI_NAME_TAG(240,15,16);////bit 7-4 BO<3:0>: Beacon Order bits (macBeaconOrder)(1)
    Transcribe_SARI_NAME_TAG(15,240,16);////bit 3-0 SO<3:0>: Superframe Order bits (macSuperframeOrder)(1)
    Transcribe_SARI_NAME_TAG(192,63,58);////   bit 7-6 CCAMODE<1:0>: Clear Channel Assessment (CCA) Mode bits.
    Transcribe_LARI_NAME_TAG(176,15,512);////  bit 7-4 CHANNEL<3:0>: Channel Number bits.
    Transcribe_SARI_NAME_TAG(4,251,54);////  bit 2 RFRST: RF State Machine Reset bit(2).
    Transcribe_SARI_NAME_TAG(0,251,54);////  bit 2 RFRST: RF State Machine Reset bit(2).
    Transcribe_LARI_NAME_TAG(128,127,514);////  bit 7 PLLEN: PLL Enable bit(1).
    Transcribe_SARI_NAME_TAG(0,251,57);////  bit 2 RXDECINV: RX Decode Inversion bit.
    Transcribe_SARI_NAME_TAG(0,0,49);////  REGISTER 2-45: INTSTAT: INTERRUPT STATUS REGISTER (ADDRESS: 0x31).
};//END void MRF24J40A_Stack()



 void Transcribe_SARI_NAME_TAG(unsigned char MODIFIED_INPUT_BYTE, unsigned char ERASE_MASK, unsigned char REG_ADDR)
{
 
unsigned char OLD_REG_DATA; // These are the previous contents from the register

unsigned char NEW_REG_DATA; // This is the data from user after removing incorrect requests

unsigned char Purged_Data;  // This is the data from the part after purging old command

OLD_REG_DATA=MRF24J40MA_Read_SARI_NAME_TAG(REG_ADDR);

Purged_Data=(OLD_REG_DATA&ERASE_MASK);//Remove old command

NEW_REG_DATA=(Purged_Data|MODIFIED_INPUT_BYTE); //add in new command

MRF24J40MA_Write_SARI_NAME_TAG(REG_ADDR,NEW_REG_DATA);

 
};// END void Transcribe_SARI_NAME_TAG(unsigned char MODIFIED_INPUT_BYTE, unsigned char ERASE_MASK, unsigned char REG_ADDR) 



 void Transcribe_LARI_NAME_TAG(unsigned char MODIFIED_INPUT_BYTE, unsigned char ERASE_MASK, int REG_ADDR)
{
 
unsigned char OLD_REG_DATA; // These are the previous contents from the register

unsigned char NEW_REG_DATA; // This is the data from user after removing incorrect requests

unsigned char Purged_Data;  // This is the data from the part after purging old command

OLD_REG_DATA=MRF24J40MA_Read_LARI_NAME_TAG(REG_ADDR);

Purged_Data=(OLD_REG_DATA&ERASE_MASK);//Remove old command

NEW_REG_DATA=(Purged_Data|MODIFIED_INPUT_BYTE); //add in new command

MRF24J40MA_Write_LARI_NAME_TAG(REG_ADDR,NEW_REG_DATA);

 
};// END void Transcribe_LARI_NAME_TAG(unsigned char MODIFIED_INPUT_BYTE, unsigned char ERASE_MASK, int REG_ADDR)
 	
	
