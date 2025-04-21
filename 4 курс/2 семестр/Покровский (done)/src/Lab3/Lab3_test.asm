.include "m16def.inc"

.def temp = R16
.def cnt_temp = R17
.def cnt = R18
.def AbegL = R26 ;XL
.def AbegH = R27 ;XH

.equ String_max_length = 64

; FlashROM
.cseg
.org 0
jmp RESET ; Reset Handler
jmp EXT_INT0 ; IRQ0 Handler
jmp EXT_INT1 ; IRQ1 Handler
jmp TIM2_COMP ; Timer2 Compare Handler
jmp TIM2_OVF ; Timer2 Overflow Handler
jmp TIM1_CAPT ; Timer1 Capture Handler
jmp TIM1_COMPA ; Timer1 CompareA Handler
jmp TIM1_COMPB ; Timer1 CompareB Handler
jmp TIM1_OVF ; Timer1 Overflow Handler
jmp TIM0_OVF ; Timer0 Overflow Handler
jmp SPI_STC ; SPI Transfer Complete Handler
jmp USART_RXC ; USART RX Complete Handler
jmp USART_UDRE ; UDR Empty Handler
jmp USART_TXC ; USART TX Complete Handler
jmp ADC_C ; ADC Conversion Complete Handler
jmp EE_RDY ; EEPROM Ready Handler
jmp ANA_COMP ; Analog Comparator Handler
jmp TWSI ; Two-wire Serial Interface Handler
jmp EXT_INT2 ; IRQ2 Handler
jmp TIM0_COMP ; Timer0 Compare Handler
jmp SPM_RDY ; Store Program Memory Ready Handler


RESET: 
	ldi temp,high(RAMEND) ; Main program start
	out SPH,temp ; Set Stack Pointer to top of RAM
	ldi temp,low(RAMEND)
	out SPL,temp

	ldi temp,0b11111111 ;настройка порта А на выход
	out DDRA,temp 
	ldi temp, 0 ;начальная комбинация для порта А
	out PORTA,temp 

	ldi temp,0b11111111 ;настройка порта C на выход
	out DDRB,temp 
	ldi temp, 0 ;начальная комбинация для порта C
	out PORTB,temp

	;настройка таймеров
	ldi temp,(0<<CS02|1<<CS01|1<<CS00)	; /64 --> 488 Гц при 8 МГц
	out TCCR0, temp
	ldi temp,(0<<CS12|1<<CS11|1<<CS10)	; /64 --> 1,9 Гц при 8 МГц
	out TCCR1B, temp
	ldi temp, (1<<TOIE0|1<<TOIE1) ;разрешения прерываний по переполнению таймеров T0 и T1
	out TIMSK, temp

	;перекодирование строки Out_String, определение ее реальной длины и адреса ячейки после реального буфера изображения
	ldi ZL,low(2*Out_String)
	ldi ZH,high(2*Out_String)
	rcall ROM_String_To_Image

	;настройка начальных значений переменных
	clr cnt
	ldi AbegL,low(Image)
	ldi AbegH,high(Image)

	sei ;глобальное разрешение прерываний 

Start: ;бесконечный цикл
	rjmp Start


ROM_String_To_Image:
	clr cnt_temp
	ldi YL,low(Image)
	ldi YH,high(Image)
	Next_symbol:
		lpm temp,Z+
		cpi temp,0
		breq End_of_string
		inc cnt_temp
		push cnt_temp
		push ZL
		push ZH
		ldi ZL,low(2*Symbol_To_Image)
		ldi ZH,high(2*Symbol_To_Image)
		ldi cnt_temp,8
		mul temp,cnt_temp
		add ZL,R0
		adc ZH,R1
		ldi cnt_temp,8
		Load_symbol_image:
			lpm temp,Z+
			st Y+,temp
			dec cnt_temp
			brne Load_symbol_image
		pop ZH
		pop ZL
		pop cnt_temp
		cpi cnt_temp,String_max_length
		breq End_of_string
		rjmp Next_symbol
	End_of_string:
		cpi cnt_temp,0
		brne Not_zero_length
		;какие-нибудь действия, если попалась строка нулевой длины
	Not_zero_length:
		sts Real_string_length,cnt_temp
		sts (Addr_after_real_image+0),YL
		sts (Addr_after_real_image+1),YH
ret


TIM0_OVF: ; Timer0 Overflow Handler
	clr temp
	out PORTB,temp
	mov YL,AbegL
	mov YH,AbegH
	add YL,cnt
	clr temp
	adc YH,temp
	push YL
	push YH
	lds temp,(Addr_after_real_image+0)
	sub YL,temp
	lds temp,(Addr_after_real_image+1)
	sbc YH,temp
	brlo No_change_pointer
	ldi temp,low(Image)
	add YL,temp
	ldi temp,high(Image)
	adc YH,temp
	pop temp
	pop temp
	rjmp Out_data
No_change_pointer:
	pop YH
	pop YL
Out_data:
	ld temp,Y
	out PORTA,temp
	ldi temp,0b00000001 ; * ldi temp,0b10000000
	cpi cnt,0
	breq No_shift
	mov cnt_temp,cnt
	Shift:
		lsl temp ; * lsr temp
		dec cnt_temp
		brne Shift
No_shift:
	out PORTB,temp
	inc cnt
	cpi cnt,8
	brne No_change_cnt
	clr cnt
No_change_cnt:
reti


TIM1_OVF: ; Timer1 Overflow Handler
	adiw AbegL,1
	lds temp,(Addr_after_real_image+0)
	cp AbegL,temp
	brne No_change_Abeg
	lds temp,(Addr_after_real_image+1)
	cp AbegH,temp
	brne No_change_Abeg
	ldi AbegL,low(Image)
	ldi AbegH,high(Image)
No_change_Abeg:
reti


EXT_INT0: ; IRQ0 Handler
EXT_INT1: ; IRQ1 Handler
TIM2_COMP: ; Timer2 Compare Handler
TIM2_OVF: ; Timer2 Overflow Handler
TIM1_CAPT: ; Timer1 Capture Handler
TIM1_COMPB: ; Timer1 CompareB Handler
TIM1_COMPA: ; Timer1 CompareA Handler
SPI_STC: ; SPI Transfer Complete Handler
USART_RXC: ; USART RX Complete Handler
USART_UDRE: ; UDR Empty Handler
USART_TXC: ; USART TX Complete Handler
ADC_C: ; ADC Conversion Complete Handler
EE_RDY: ; EEPROM Ready Handler
ANA_COMP: ; Analog Comparator Handler
TWSI: ; Two-wire Serial Interface Handler
EXT_INT2: ; IRQ2 Handler
TIM0_COMP: ; Timer0 Compare Handler
SPM_RDY: ; SPM Ready Handler
reti


Out_String:
.db ' ', 'n', 'u', 'o', 's', '.', 'e', 'd', 'u', '.', 'u', 'a', 0

Symbol_To_Image:
.include "font_8x8.inc"


; RAM
.dseg

Real_string_length:
.byte 1

Addr_after_real_image:
.byte 2

Image:
.byte (8*String_max_length)
