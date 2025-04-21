		processor 16F628
		#include P16f628.inc
		radix dec

		N1 equ 0
		N2 equ 0
		CNT1 equ 0x20
		CNT2 equ 0x21
		MODE equ 0x22
		TIMER equ 0x23

		org 0x00
		goto main
		
		org	0x04
		goto services

main
		bsf STATUS,RP0
		bcf STATUS,RP1
		clrf TRISB 
		bcf STATUS,RP0
		movlw b'10011101'
		movwf PORTB

		movlw 1
		movwf MODE
		movlw 20
		movwf TIMER
		
		GLOBAL_LOOP
		clrwdt
		call DELAY

		movlw 1
		subwf MODE,w
		btfsc STATUS,Z
		call SHIFT_LEFT

		movlw 2
		subwf MODE,w
		btfsc STATUS,Z
		comf PORTB,f

		movlw 3
		subwf MODE,w
		btfsc STATUS,Z
		call SHIFT_RIGHT

		movlw 4
		subwf MODE,w
		btfsc STATUS,Z
		comf PORTB,f

		decfsz TIMER,f
		goto GLOBAL_LOOP
		incf MODE,f
		movlw 5
		subwf MODE,w
		btfsc STATUS,Z
		call SET_MODE1

		movlw 1
		subwf MODE,w
		btfsc STATUS,Z
		call TIME1

		movlw 2
		subwf MODE,w
		btfsc STATUS,Z
		call TIME2

		movlw 3
		subwf MODE,w
		btfsc STATUS,Z
		call TIME3

		movlw 4
		subwf MODE,w
		btfsc STATUS,Z
		call TIME1

		goto GLOBAL_LOOP
		
		SET_MODE1
		movlw 1
		movwf MODE
		return

		TIME1
		movlw 20
		movwf TIMER
		return

		TIME2
		movlw 10
		movwf TIMER
		return

		TIME3
		movlw 30
		movwf TIMER
		return

		SHIFT_LEFT
		rlf PORTB,w
		rlf PORTB,f
		return

		SHIFT_RIGHT
		rrf PORTB,w
		rrf PORTB,f
		return

		DELAY
		movlw N1
		movwf CNT1
		START_1
		movlw N2
		movwf CNT2
		START_2
		nop
		nop
		nop
		nop
		nop
		decfsz CNT2,f
		goto START_2
		decfsz CNT1,f
		goto START_1
		return

services
		retfie

		end