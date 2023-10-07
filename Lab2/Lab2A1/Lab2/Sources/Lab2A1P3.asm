 *****************************************************************
 * LAB 2 Assignment 1 Part 3                                     *
 *                                                               *
 * Following routine generates a sound tone using it to drive    *
 * the buzzer LS1                                                *
 *                                                               *
 * Author: Ivan Wang 501086429                                   *
 *****************************************************************

; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



; Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 
		
****************
* CODE SECTION *
****************

		        ORG $3000
		       
Entry:
_Startup:

            BSET    DDRP,%11111111  ; Config. Port P for output
            LDAA    #%10000000      ; Prepare to drive PP7 high
            
MainLoop    STAA    PTP             ; Drive PP7
            LDX     #$1FFF          ; Initialize the loop counter
            
Delay       DEX                     ; Decrement the loop counter
            BNE     Delay           ; If not done, continue to loop
            EORA    #%10000000      ; Toggle the MSB of AccA
            BRA     MainLoop        ; Go to MainLoop

**************************************************************
*                 Interrupt Vectors                          *
**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector

         