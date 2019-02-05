
_LightSet:

;MyProject.c,42 :: 		void LightSet(int countD){
;MyProject.c,43 :: 		if(countD<=0)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_LightSet_countD+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__LightSet45
	MOVF       FARG_LightSet_countD+0, 0
	SUBLW      0
L__LightSet45:
	BTFSS      STATUS+0, 0
	GOTO       L_LightSet0
;MyProject.c,44 :: 		PORTD=0b00000000;
	CLRF       PORTD+0
	GOTO       L_LightSet1
L_LightSet0:
;MyProject.c,45 :: 		else if(countD>0 && countD<3)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_LightSet_countD+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__LightSet46
	MOVF       FARG_LightSet_countD+0, 0
	SUBLW      0
L__LightSet46:
	BTFSC      STATUS+0, 0
	GOTO       L_LightSet4
	MOVLW      128
	XORWF      FARG_LightSet_countD+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__LightSet47
	MOVLW      3
	SUBWF      FARG_LightSet_countD+0, 0
L__LightSet47:
	BTFSC      STATUS+0, 0
	GOTO       L_LightSet4
L__LightSet43:
;MyProject.c,46 :: 		PORTD=0b00000001;
	MOVLW      1
	MOVWF      PORTD+0
	GOTO       L_LightSet5
L_LightSet4:
;MyProject.c,47 :: 		else if(countD>=3 && countD<5)
	MOVLW      128
	XORWF      FARG_LightSet_countD+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__LightSet48
	MOVLW      3
	SUBWF      FARG_LightSet_countD+0, 0
L__LightSet48:
	BTFSS      STATUS+0, 0
	GOTO       L_LightSet8
	MOVLW      128
	XORWF      FARG_LightSet_countD+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__LightSet49
	MOVLW      5
	SUBWF      FARG_LightSet_countD+0, 0
L__LightSet49:
	BTFSC      STATUS+0, 0
	GOTO       L_LightSet8
L__LightSet42:
;MyProject.c,48 :: 		PORTD=0b00000111;
	MOVLW      7
	MOVWF      PORTD+0
	GOTO       L_LightSet9
L_LightSet8:
;MyProject.c,49 :: 		else if(countD>=5 && countD<10)
	MOVLW      128
	XORWF      FARG_LightSet_countD+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__LightSet50
	MOVLW      5
	SUBWF      FARG_LightSet_countD+0, 0
L__LightSet50:
	BTFSS      STATUS+0, 0
	GOTO       L_LightSet12
	MOVLW      128
	XORWF      FARG_LightSet_countD+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__LightSet51
	MOVLW      10
	SUBWF      FARG_LightSet_countD+0, 0
L__LightSet51:
	BTFSC      STATUS+0, 0
	GOTO       L_LightSet12
L__LightSet41:
;MyProject.c,50 :: 		PORTD=0b00111111;
	MOVLW      63
	MOVWF      PORTD+0
	GOTO       L_LightSet13
L_LightSet12:
;MyProject.c,52 :: 		PORTD=0b11111111;
	MOVLW      255
	MOVWF      PORTD+0
L_LightSet13:
L_LightSet9:
L_LightSet5:
L_LightSet1:
;MyProject.c,53 :: 		}
L_end_LightSet:
	RETURN
; end of _LightSet

_main:

;MyProject.c,54 :: 		void main() {
;MyProject.c,55 :: 		ADCON1 = 0x80;
	MOVLW      128
	MOVWF      ADCON1+0
;MyProject.c,56 :: 		TRISA = 0xFF; // PORTA is input
	MOVLW      255
	MOVWF      TRISA+0
;MyProject.c,57 :: 		TRISC = 0x3F; // Pins RC7, RC6 are outputs
	MOVLW      63
	MOVWF      TRISC+0
;MyProject.c,58 :: 		TRISB = 0b10000000;    // PORTB is output
	MOVLW      128
	MOVWF      TRISB+0
;MyProject.c,60 :: 		TRISB.F7 = 1;   //RB7 Reset input
	BSF        TRISB+0, 7
;MyProject.c,61 :: 		TRISD = 0;    // PORTD is output
	CLRF       TRISD+0
;MyProject.c,64 :: 		PORTD=0;
	CLRF       PORTD+0
;MyProject.c,71 :: 		EEPROM_Write(0x02,5);           // Write some data at address 2
	MOVLW      2
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      5
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,72 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
	NOP
;MyProject.c,73 :: 		count = EEPROM_Read(0x02);      // Read data from address 2 and display it on PORTB
	MOVLW      2
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _count+0
;MyProject.c,76 :: 		Lcd_Init();                      // Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.c,77 :: 		Lcd_Cmd(_LCD_CLEAR);             // CLEAR display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,78 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,81 :: 		read = EEPROM_Read(0x11);             // Read data from EEPROM and store in count
	MOVLW      17
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _read+0
;MyProject.c,82 :: 		if(read>0){
	MOVF       R0+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main15
;MyProject.c,83 :: 		count=read;
	MOVF       _read+0, 0
	MOVWF      _count+0
;MyProject.c,84 :: 		countD=count;
	MOVF       _read+0, 0
	MOVWF      _countD+0
	CLRF       _countD+1
;MyProject.c,85 :: 		}
	GOTO       L_main16
L_main15:
;MyProject.c,87 :: 		count=0;
	CLRF       _count+0
;MyProject.c,88 :: 		PORTD=0;
	CLRF       PORTD+0
;MyProject.c,89 :: 		countD=count;
	CLRF       _countD+0
	CLRF       _countD+1
;MyProject.c,90 :: 		}
L_main16:
;MyProject.c,95 :: 		do {
L_main17:
;MyProject.c,97 :: 		adc = ADC_Read(1); // Get 10-bit results of AD conversion
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc+0
	MOVF       R0+1, 0
	MOVWF      _adc+1
;MyProject.c,98 :: 		adc2 = ADC_Read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc2+0
	MOVF       R0+1, 0
	MOVWF      _adc2+1
;MyProject.c,103 :: 		if(adc>400){
	MOVF       _adc+1, 0
	SUBLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVF       _adc+0, 0
	SUBLW      144
L__main53:
	BTFSC      STATUS+0, 0
	GOTO       L_main20
;MyProject.c,104 :: 		count++;
	INCF       _count+0, 1
;MyProject.c,105 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,106 :: 		Lcd_Out(1,1,"Entered ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,107 :: 		PORTB= 0b00100000;
	MOVLW      32
	MOVWF      PORTB+0
;MyProject.c,108 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
	NOP
	NOP
;MyProject.c,109 :: 		PORTB= 0b01000000;
	MOVLW      64
	MOVWF      PORTB+0
;MyProject.c,111 :: 		countD++;
	INCF       _countD+0, 1
	BTFSC      STATUS+0, 2
	INCF       _countD+1, 1
;MyProject.c,112 :: 		for(i=0; i<4; i++) {               // Move text to the right 4 times
	CLRF       _i+0
L_main22:
	MOVLW      4
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main23
;MyProject.c,113 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,114 :: 		Delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	DECFSZ     R11+0, 1
	GOTO       L_main25
	NOP
;MyProject.c,112 :: 		for(i=0; i<4; i++) {               // Move text to the right 4 times
	INCF       _i+0, 1
;MyProject.c,115 :: 		}
	GOTO       L_main22
L_main23:
;MyProject.c,116 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,117 :: 		PORTB= 0b00000000;
	CLRF       PORTB+0
;MyProject.c,119 :: 		LightSet(countD);
	MOVF       _countD+0, 0
	MOVWF      FARG_LightSet_countD+0
	MOVF       _countD+1, 0
	MOVWF      FARG_LightSet_countD+1
	CALL       _LightSet+0
;MyProject.c,120 :: 		}
	GOTO       L_main26
L_main20:
;MyProject.c,121 :: 		else if(adc2>400){
	MOVF       _adc2+1, 0
	SUBLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVF       _adc2+0, 0
	SUBLW      144
L__main54:
	BTFSC      STATUS+0, 0
	GOTO       L_main27
;MyProject.c,122 :: 		if(count<=0){
	MOVF       _count+0, 0
	SUBLW      0
	BTFSS      STATUS+0, 0
	GOTO       L_main28
;MyProject.c,123 :: 		count =0;
	CLRF       _count+0
;MyProject.c,124 :: 		Delay_ms(800);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main29:
	DECFSZ     R13+0, 1
	GOTO       L_main29
	DECFSZ     R12+0, 1
	GOTO       L_main29
	DECFSZ     R11+0, 1
	GOTO       L_main29
	NOP
;MyProject.c,125 :: 		PORTD=0;
	CLRF       PORTD+0
;MyProject.c,126 :: 		countD=0;
	CLRF       _countD+0
	CLRF       _countD+1
;MyProject.c,127 :: 		LightSet(countD);
	CLRF       FARG_LightSet_countD+0
	CLRF       FARG_LightSet_countD+1
	CALL       _LightSet+0
;MyProject.c,128 :: 		}
	GOTO       L_main30
L_main28:
;MyProject.c,130 :: 		PORTB= 0b00100000;
	MOVLW      32
	MOVWF      PORTB+0
;MyProject.c,131 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_main31:
	DECFSZ     R13+0, 1
	GOTO       L_main31
	DECFSZ     R12+0, 1
	GOTO       L_main31
	DECFSZ     R11+0, 1
	GOTO       L_main31
	NOP
	NOP
;MyProject.c,132 :: 		PORTB= 0b00010000;
	MOVLW      16
	MOVWF      PORTB+0
;MyProject.c,133 :: 		count--;
	DECF       _count+0, 1
;MyProject.c,134 :: 		countD--;
	MOVLW      1
	SUBWF      _countD+0, 1
	BTFSS      STATUS+0, 0
	DECF       _countD+1, 1
;MyProject.c,136 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,137 :: 		Lcd_Out(1,1,"Left ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,138 :: 		for(i=0; i<4; i++) {               // Move text to the right 4 times
	CLRF       _i+0
L_main32:
	MOVLW      4
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main33
;MyProject.c,139 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,140 :: 		Delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	DECFSZ     R11+0, 1
	GOTO       L_main35
	NOP
;MyProject.c,138 :: 		for(i=0; i<4; i++) {               // Move text to the right 4 times
	INCF       _i+0, 1
;MyProject.c,141 :: 		}
	GOTO       L_main32
L_main33:
;MyProject.c,142 :: 		}
L_main30:
;MyProject.c,143 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,144 :: 		PORTB= 0b00000000;
	CLRF       PORTB+0
;MyProject.c,145 :: 		LightSet(countD);
	MOVF       _countD+0, 0
	MOVWF      FARG_LightSet_countD+0
	MOVF       _countD+1, 0
	MOVWF      FARG_LightSet_countD+1
	CALL       _LightSet+0
;MyProject.c,146 :: 		}
L_main27:
L_main26:
;MyProject.c,147 :: 		LightSet(countD);
	MOVF       _countD+0, 0
	MOVWF      FARG_LightSet_countD+0
	MOVF       _countD+1, 0
	MOVWF      FARG_LightSet_countD+1
	CALL       _LightSet+0
;MyProject.c,148 :: 		Lcd_Out(1,1,"Counter System");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,149 :: 		Lcd_Out(2,1,"Counter=");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,150 :: 		ShortToStr(count, counterArray);    //convert int to string
	MOVF       _count+0, 0
	MOVWF      FARG_ShortToStr_input+0
	MOVLW      _counterArray+0
	MOVWF      FARG_ShortToStr_output+0
	CALL       _ShortToStr+0
;MyProject.c,151 :: 		t = Ltrim(counterArray);            //trim Leading Spaces
	MOVLW      _counterArray+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      _t+0
;MyProject.c,152 :: 		Lcd_Out(2,9,t);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,156 :: 		if(PORTB.F7 == 0)   //If the switch is pressed reset counter
	BTFSC      PORTB+0, 7
	GOTO       L_main36
;MyProject.c,158 :: 		Delay_ms(100);    //Switch Debounce
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main37:
	DECFSZ     R13+0, 1
	GOTO       L_main37
	DECFSZ     R12+0, 1
	GOTO       L_main37
	DECFSZ     R11+0, 1
	GOTO       L_main37
	NOP
	NOP
;MyProject.c,159 :: 		if(PORTB.F7 == 0)//If the switch is still pressed
	BTFSC      PORTB+0, 7
	GOTO       L_main38
;MyProject.c,161 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,162 :: 		Delay_ms(100); //1 Second Delay
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main39:
	DECFSZ     R13+0, 1
	GOTO       L_main39
	DECFSZ     R12+0, 1
	GOTO       L_main39
	DECFSZ     R11+0, 1
	GOTO       L_main39
	NOP
	NOP
;MyProject.c,163 :: 		Lcd_Out(1,1,"Counter Reset");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,164 :: 		count=0;
	CLRF       _count+0
;MyProject.c,165 :: 		countD=0;
	CLRF       _countD+0
	CLRF       _countD+1
;MyProject.c,166 :: 		}
L_main38:
;MyProject.c,167 :: 		}
L_main36:
;MyProject.c,171 :: 		Delay_ms(200);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main40:
	DECFSZ     R13+0, 1
	GOTO       L_main40
	DECFSZ     R12+0, 1
	GOTO       L_main40
	DECFSZ     R11+0, 1
	GOTO       L_main40
	NOP
	NOP
;MyProject.c,173 :: 		EEPROM_Write(0x11,count);               // Write some data at EEPROM
	MOVLW      17
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _count+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProject.c,175 :: 		} while(1);
	GOTO       L_main17
;MyProject.c,176 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
