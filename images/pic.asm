
ORG	0x0000	; 

; _main:
; 
;MyProject.c,35 ::                 void main() {
;MyProject.c,36 ::                 ADCON1 = 0x80;
;         MOVLW      128
;         MOVWF      ADCON1+0
;MyProject.c,37 ::                 TRISA = 0xFF; // PORTA is input
;         MOVLW      255
;         MOVWF      TRISA+0
;MyProject.c,38 ::                 TRISC = 0x3F; // Pins RC7, RC6 are outputs
;         MOVLW      63
;         MOVWF      TRISC+0
;MyProject.c,39 ::                 TRISB = 0;    // PORTB is output
;         CLRF       TRISB+0
;MyProject.c,42 ::                 EEPROM_Write(0x02,5);           // Write some data at address 2
;         MOVLW      2
;         MOVWF      FARG_EEPROM_Write_Address+0
;         MOVLW      5
;         MOVWF      FARG_EEPROM_Write_data_+0
;         CALL       _EEPROM_Write+0
;MyProject.c,43 ::                 Delay_ms(100);
;         MOVLW      3
;         MOVWF      R11+0
;         MOVLW      138
;         MOVWF      R12+0
;         MOVLW      85
;         MOVWF      R13+0
; L_main0:
;         DECFSZ     R13+0, 1
;         GOTO       L_main0
;         DECFSZ     R12+0, 1
;         GOTO       L_main0
;         DECFSZ     R11+0, 1
;         GOTO       L_main0
;         NOP
;         NOP
;MyProject.c,44 ::                 count = EEPROM_Read(0x02);      // Read data from address 2 and display it on PORTB
;         MOVLW      2
;         MOVWF      FARG_EEPROM_Read_Address+0
;         CALL       _EEPROM_Read+0
;         MOVF       R0+0, 0
;         MOVWF      _count+0
;MyProject.c,47 ::                 Lcd_Init();                      // Initialize LCD
;         CALL       _Lcd_Init+0
;MyProject.c,48 ::                 Lcd_Cmd(_LCD_CLEAR);             // CLEAR display
;         MOVLW      1
;         MOVWF      FARG_Lcd_Cmd_out_char+0
;         CALL       _Lcd_Cmd+0
;MyProject.c,49 ::                 Lcd_Cmd(_LCD_CURSOR_OFF);        // Cursor off
;         MOVLW      12
;         MOVWF      FARG_Lcd_Cmd_out_char+0
;         CALL       _Lcd_Cmd+0
;MyProject.c,52 ::                 read = EEPROM_Read(0x11);             // Read data from EEPROM and store in count
;         MOVLW      17
;         MOVWF      FARG_EEPROM_Read_Address+0
;         CALL       _EEPROM_Read+0
;         MOVF       R0+0, 0
;         MOVWF      _read+0
;MyProject.c,53 ::                 if(read!=0){
;         MOVF       R0+0, 0
;         XORLW      0
;         BTFSC      STATUS+0, 2
;         GOTO       L_main1
;MyProject.c,54 ::                 count=read;
;         MOVF       _read+0, 0
;         MOVWF      _count+0
;MyProject.c,55 ::                 }
;         GOTO       L_main2
; L_main1:
;MyProject.c,57 ::                 count=0;
;         CLRF       _count+0
;MyProject.c,58 ::                 }
; L_main2:
;MyProject.c,63 ::                 do {
; L_main3:
;MyProject.c,65 ::                 adc = ADC_Read(1); // Get 10-bit results of AD conversion
;         MOVLW      1
;         MOVWF      FARG_ADC_Read_channel+0
;         CALL       _ADC_Read+0
;         MOVF       R0+0, 0
;         MOVWF      _adc+0
;         MOVF       R0+1, 0
;         MOVWF      _adc+1
;MyProject.c,66 ::                 adc2 = ADC_Read(2);
;         MOVLW      2
;         MOVWF      FARG_ADC_Read_channel+0
;         CALL       _ADC_Read+0
;         MOVF       R0+0, 0
;         MOVWF      _adc2+0
;         MOVF       R0+1, 0
;         MOVWF      _adc2+1
;MyProject.c,71 ::                 if(adc>400){
;         MOVF       _adc+1, 0
;         SUBLW      1
;         BTFSS      STATUS+0, 2
;         GOTO       L__main22
;         MOVF       _adc+0, 0
;         SUBLW      144
; L__main22:
;         BTFSC      STATUS+0, 0
;         GOTO       L_main6
;MyProject.c,72 ::                 count++;
;         INCF       _count+0, 1
;MyProject.c,73 ::                 Lcd_Cmd(_LCD_CLEAR);
;         MOVLW      1
;         MOVWF      FARG_Lcd_Cmd_out_char+0
;         CALL       _Lcd_Cmd+0
;MyProject.c,74 ::                 Lcd_Out(1,1,"Entered ");
;         MOVLW      1
;         MOVWF      FARG_Lcd_Out_row+0
;         MOVLW      1
;         MOVWF      FARG_Lcd_Out_column+0
;         MOVLW      ?lstr1_MyProject+0
;         MOVWF      FARG_Lcd_Out_text+0
;         CALL       _Lcd_Out+0
;MyProject.c,75 ::                 for(i=0; i<4; i++) {               // Move text to the right 4 times
;         CLRF       _i+0
; L_main7:
;         MOVLW      4
;         SUBWF      _i+0, 0
;         BTFSC      STATUS+0, 0
;         GOTO       L_main8
;MyProject.c,76 ::                 Lcd_Cmd(_LCD_SHIFT_RIGHT);
;         MOVLW      28
;         MOVWF      FARG_Lcd_Cmd_out_char+0
;         CALL       _Lcd_Cmd+0
;MyProject.c,77 ::                 Delay_ms(500);
;         MOVLW      13
;         MOVWF      R11+0
;         MOVLW      175
;         MOVWF      R12+0
;         MOVLW      182
;         MOVWF      R13+0
; L_main10:
;         DECFSZ     R13+0, 1
;         GOTO       L_main10
;         DECFSZ     R12+0, 1
;         GOTO       L_main10
;         DECFSZ     R11+0, 1
;         GOTO       L_main10
;         NOP
;MyProject.c,75 ::                 for(i=0; i<4; i++) {               // Move text to the right 4 times
;         INCF       _i+0, 1
;MyProject.c,78 ::                 }
;         GOTO       L_main7
; L_main8:
;MyProject.c,79 ::                 Lcd_Cmd(_LCD_CLEAR);
;         MOVLW      1
;         MOVWF      FARG_Lcd_Cmd_out_char+0
;         CALL       _Lcd_Cmd+0
;MyProject.c,80 ::                 }
;         GOTO       L_main11
; L_main6:
;MyProject.c,81 ::                 else if(adc2>400){
;         MOVF       _adc2+1, 0
;         SUBLW      1
;         BTFSS      STATUS+0, 2
;         GOTO       L__main23
;         MOVF       _adc2+0, 0
;         SUBLW      144
; L__main23:
;         BTFSC      STATUS+0, 0
;         GOTO       L_main12
;MyProject.c,82 ::                 if(count<=0){
;         MOVF       _count+0, 0
;         SUBLW      0
;         BTFSS      STATUS+0, 0
;         GOTO       L_main13
;MyProject.c,83 ::                 count =0;
;         CLRF       _count+0
;MyProject.c,84 ::                 Delay_ms(800);
;         MOVLW      21
;         MOVWF      R11+0
;         MOVLW      75
;         MOVWF      R12+0
;         MOVLW      190
;         MOVWF      R13+0
; L_main14:
;         DECFSZ     R13+0, 1
;         GOTO       L_main14
;         DECFSZ     R12+0, 1
;         GOTO       L_main14
;         DECFSZ     R11+0, 1
;         GOTO       L_main14
;         NOP
;MyProject.c,85 ::                 }
;         GOTO       L_main15
; L_main13:
;MyProject.c,87 ::                 count--;
;         DECF       _count+0, 1
;MyProject.c,88 ::                 Lcd_Cmd(_LCD_CLEAR);
;         MOVLW      1
;         MOVWF      FARG_Lcd_Cmd_out_char+0
;         CALL       _Lcd_Cmd+0
;MyProject.c,89 ::                 Lcd_Out(1,1,"Left ");
;         MOVLW      1
;         MOVWF      FARG_Lcd_Out_row+0
;         MOVLW      1
;         MOVWF      FARG_Lcd_Out_column+0
;         MOVLW      ?lstr2_MyProject+0
;         MOVWF      FARG_Lcd_Out_text+0
;         CALL       _Lcd_Out+0
;MyProject.c,90 ::                 for(i=0; i<4; i++) {               // Move text to the right 4 times
;         CLRF       _i+0
; L_main16:
;         MOVLW      4
;         SUBWF      _i+0, 0
;         BTFSC      STATUS+0, 0
;         GOTO       L_main17
;MyProject.c,91 ::                 Lcd_Cmd(_LCD_SHIFT_RIGHT);
;         MOVLW      28
;         MOVWF      FARG_Lcd_Cmd_out_char+0
;         CALL       _Lcd_Cmd+0
;MyProject.c,92 ::                 Delay_ms(500);
;         MOVLW      13
;         MOVWF      R11+0
;         MOVLW      175
;         MOVWF      R12+0
;         MOVLW      182
;         MOVWF      R13+0
; L_main19:
;         DECFSZ     R13+0, 1
;         GOTO       L_main19
;         DECFSZ     R12+0, 1
;         GOTO       L_main19
;         DECFSZ     R11+0, 1
;         GOTO       L_main19
;         NOP
;MyProject.c,90 ::                 for(i=0; i<4; i++) {               // Move text to the right 4 times
;         INCF       _i+0, 1
;MyProject.c,93 ::                 }
;         GOTO       L_main16
; L_main17:
;MyProject.c,94 ::                 }
; L_main15:
;MyProject.c,95 ::                 Lcd_Cmd(_LCD_CLEAR);
;         MOVLW      1
;         MOVWF      FARG_Lcd_Cmd_out_char+0
;         CALL       _Lcd_Cmd+0
;MyProject.c,96 ::                 }
; L_main12:
; L_main11:
;MyProject.c,99 ::                 Lcd_Out(1,1," People Counter ");
;         MOVLW      1
;         MOVWF      FARG_Lcd_Out_row+0
;         MOVLW      1
;         MOVWF      FARG_Lcd_Out_column+0
;         MOVLW      ?lstr3_MyProject+0
;         MOVWF      FARG_Lcd_Out_text+0
;         CALL       _Lcd_Out+0
;MyProject.c,100 ::                 Lcd_Out(2,1,"People=");
;         MOVLW      2
;         MOVWF      FARG_Lcd_Out_row+0
;         MOVLW      1
;         MOVWF      FARG_Lcd_Out_column+0
;         MOVLW      ?lstr4_MyProject+0
;         MOVWF      FARG_Lcd_Out_text+0
;         CALL       _Lcd_Out+0
;MyProject.c,101 ::                 ShortToStr(count, counterArray);    //convert int to string
;         MOVF       _count+0, 0
;         MOVWF      FARG_ShortToStr_input+0
;         MOVLW      _counterArray+0
;         MOVWF      FARG_ShortToStr_output+0
;         CALL       _ShortToStr+0
;MyProject.c,102 ::                 Lcd_Out(2,10,counterArray);
;         MOVLW      2
;         MOVWF      FARG_Lcd_Out_row+0
;         MOVLW      10
;         MOVWF      FARG_Lcd_Out_column+0
;         MOVLW      _counterArray+0
;         MOVWF      FARG_Lcd_Out_text+0
;         CALL       _Lcd_Out+0
;MyProject.c,103 ::                 Delay_ms(200);
;         MOVLW      6
;         MOVWF      R11+0
;         MOVLW      19
;         MOVWF      R12+0
;         MOVLW      173
;         MOVWF      R13+0
; L_main20:
;         DECFSZ     R13+0, 1
;         GOTO       L_main20
;         DECFSZ     R12+0, 1
;         GOTO       L_main20
;         DECFSZ     R11+0, 1
;         GOTO       L_main20
;         NOP
;         NOP
;MyProject.c,105 ::                 EEPROM_Write(0x11,count);               // Write some data at EEPROM
;         MOVLW      17
;         MOVWF      FARG_EEPROM_Write_Address+0
;         MOVF       _count+0, 0
;         MOVWF      FARG_EEPROM_Write_data_+0
;         CALL       _EEPROM_Write+0
;MyProject.c,107 ::                 } while(1);
;         GOTO       L_main3
;MyProject.c,108 ::                 }
; L_end_main:
;         GOTO       $+0
; end of _main

		END

