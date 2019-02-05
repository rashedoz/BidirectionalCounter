
// LCD module connections

sbit LCD_RS at RC2_bit;
sbit LCD_EN at RC3_bit;
sbit LCD_D4 at RC4_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D7 at RC7_bit;
sbit LCD_RS_Direction at TRISC2_bit;
sbit LCD_EN_Direction at TRISC3_bit;
sbit LCD_D4_Direction at TRISC4_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D7_Direction at TRISC7_bit;
// End LCD module connections


 
 unsigned int adc;
 unsigned int adc2;
 char arrayFlow[7];
 char counterArray[5];
 char adc2String[7];
 //unsigned int count;
 unsigned int flag1=0;
 unsigned int flag2=0;
 unsigned int threshold=400; //Threshold value 2V
 unsigned char i;
 
unsigned short count;
unsigned short read;
char txt2[5];
char resA[7];
char Da[7];
unsigned int res;
 int countD=0;

char *t;


void LightSet(int countD){
         if(countD<=0)
         PORTD=0b00000000;
         else if(countD>0 && countD<3)
         PORTD=0b00000001;
         else if(countD>=3 && countD<5)
          PORTD=0b00000111;
          else if(countD>=5 && countD<10)
           PORTD=0b00111111;
           else
          PORTD=0b11111111;
}
 void main() {
      ADCON1 = 0x80;
      TRISA = 0xFF; // PORTA is input
      TRISC = 0x3F; // Pins RC7, RC6 are outputs
      TRISB = 0b10000000;    // PORTB is output
      
      TRISB.F7 = 1;   //RB7 Reset input
      TRISD = 0;    // PORTD is output

      //PORTB=0;
      PORTD=0;
      
      
      
      
      
      
      EEPROM_Write(0x02,5);           // Write some data at address 2
      Delay_ms(100);
      count = EEPROM_Read(0x02);      // Read data from address 2 and display it on PORTB
       

      Lcd_Init();                      // Initialize LCD
      Lcd_Cmd(_LCD_CLEAR);             // CLEAR display
      Lcd_Cmd(_LCD_CURSOR_OFF);        // Cursor off
      
      
      read = EEPROM_Read(0x11);             // Read data from EEPROM and store in count
      if(read>0){
                  count=read;
                  countD=count;
      }
      else{
           count=0;
           PORTD=0;
           countD=count;
      }
      
      
      

      do {      
                
                adc = ADC_Read(1); // Get 10-bit results of AD conversion
                adc2 = ADC_Read(2);

                 //adc= (5*adc)/1024;   //convert to Volts
                 //adc2= (5*adc2)/1024;   //convert to Volts
                 
                 if(adc>400){
                              count++;
                              Lcd_Cmd(_LCD_CLEAR);
                              Lcd_Out(1,1,"Entered ");
                              PORTB= 0b00100000;
                              Delay_ms(50);
                              PORTB= 0b01000000;
                              
                              countD++;
                              for(i=0; i<4; i++) {               // Move text to the right 4 times
                                                     Lcd_Cmd(_LCD_SHIFT_RIGHT);
                                                     Delay_ms(500);
                              }
                              Lcd_Cmd(_LCD_CLEAR);
                              PORTB= 0b00000000;
                              
                              LightSet(countD);
                 }
                 else if(adc2>400){
                      if(count<=0){
                                   count =0;
                                   Delay_ms(800);
                                   PORTD=0;
                                   countD=0;
                                   LightSet(countD);
                      }
                       else{
                        PORTB= 0b00100000;
                        Delay_ms(50);
                        PORTB= 0b00010000;
                        count--;
                        countD--;
                        PORTD>>countD;
                        Lcd_Cmd(_LCD_CLEAR);
                              Lcd_Out(1,1,"Left ");
                              for(i=0; i<4; i++) {               // Move text to the right 4 times
                                                     Lcd_Cmd(_LCD_SHIFT_RIGHT);
                                                     Delay_ms(500);
                              }
                       }
                       Lcd_Cmd(_LCD_CLEAR);
                       PORTB= 0b00000000;
                       LightSet(countD);
                 }
                 LightSet(countD);
                 Lcd_Out(1,1,"Counter System");
                 Lcd_Out(2,1,"Counter=");
                 ShortToStr(count, counterArray);    //convert int to string
                 t = Ltrim(counterArray);            //trim Leading Spaces
                 Lcd_Out(2,9,t);
                 

                 
                 if(PORTB.F7 == 0)   //If the switch is pressed reset counter
                  {
                             Delay_ms(100);    //Switch Debounce
                             if(PORTB.F7 == 0)//If the switch is still pressed
                             {
                               Lcd_Cmd(_LCD_CLEAR);
                               Delay_ms(100); //1 Second Delay
                              Lcd_Out(1,1,"Counter Reset");
                              count=0;
                              countD=0;
                             }
                   }
                 
                 
                 
                 Delay_ms(200);
                  
                EEPROM_Write(0x11,count);               // Write some data at EEPROM
                
      } while(1);
 }