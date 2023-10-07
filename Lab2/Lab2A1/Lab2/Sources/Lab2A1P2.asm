 *****************************************************************
 * LAB 2 Assignment 1 Part 2                                     *
 *                                                               *
 * Following routine reads the keypad and controls the colour    *
 * of LED2                                                       *
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

           BSET   DDRP,%11111111    ; Configure Port P for output (LED2 cntrl)
           BSET   DDRE,%00010000    ; Configure pin PE4 for output (enable bit)
           BCLR   PORTE,%00010000   ; Enable keypad       
           
Loop:      LDAA   PTS               ; Read a key code into AccA
           LSRA                     ; Shift right AccA
           LSRA                     ; -"-
           LSRA                     ; -"-
           LSRA                     ; -"-
           STAA   PTP               ; Output AccA content to LED2
           BRA    Loop              ; Loop
          
**************************************************************
*                 Interrupt Vectors                          *
**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector

         