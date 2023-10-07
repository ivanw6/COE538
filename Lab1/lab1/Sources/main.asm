********************************************************************
* Lab 1                                                            *
*                                                                  *
* This program performs unsigned multiply operation                *
* with two 8 bit numbers and leaves                                *
* the  result in the 'PRODUCT' location.                           *                                       
* Author: Ivan Wang 501086429                                      *
********************************************************************

; export symbols
            XDEF Entry, _Startup  ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point
            
; Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 
		
****************
* Code section *                  
****************

                ORG  $3000  

MULTIPLICAND    FCB 25  ; First Number
MULTIPLIER      FCB 25  ; Second Number   
PRODUCT         RMB 2   ; Result of Multiplication

**********************************
* The actual program starts here *
**********************************

            ORG   $4000
Entry:
_Startup:
            LDAA  MULTIPLICAND ; Get the first number into ACCA
            LDAB  MULTIPLIER   ; Get the second number into ACCB
            MUL                ; Multiply the two numbers in ACCA and ACCB
            STD   PRODUCT      ; and store the product into register D (16 bytes)
            SWI                ; break to the monitor

*********************
* Interrupt Vectors *                          
*********************

            ORG   $FFFE
            DC.W  Entry           ; Reset Vector
