.include "m16def.inc"

.def temp = R16
.def cnt_temp = R17
.def tempH = R18 
.def cnt_byte = R19

.equ for_sec = 31250


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

	ldi temp,(1<<PB7|1<<PB5|1<<PB4) ;настройка PB7, PB5, PB4 на выход
	out DDRB,temp 
	ldi temp, 0 ;начальная комбинация для порта B
	out PORTB,temp 

	;настройка таймера
	ldi temp,high(for_sec)
	out OCR1AH,temp
	ldi temp,low(for_sec)
	out OCR1AL,temp
	ldi temp,(1<<CTC1|1<<CS12|0<<CS11|0<<CS10)	; /256 --> 1 Гц при 8 МГц в режиме сброса по совпадению
	out TCCR1B, temp
	ldi temp, (1<<OCIE1A) ;разрешение прерывания по совпадению А таймера T1
	out TIMSK, temp

	;настройка модуля SPI
	ldi temp,(1<<SPIE|1<<SPE|0<<DORD|1<<MSTR|0<<CPOL|0<<CPHA|1<<SPR1|1<<SPR0)	; включение модуля, разрешение прерывания, режим ведущего, старший бит передается первым, "положительные" синхроимпульсы, данные активны по переднему фронту, максимальный коэффициент деления для более стабильной работы
	out SPCR,temp

	;начальные значения времени и даты
	clr temp
	sts Seconds,temp
	sts Minutes,temp
	sts Hours,temp
	ldi temp,1
	sts Days,temp
	sts Months,temp
	ldi temp,20
	sts Years,temp

	;формирование данных для отображения и начало посдоваельной передачи
	rcall Start_serial_out

	sei ;глобальное разрешение прерываний 

Start: ;бесконечный цикл
	rjmp Start


Start_serial_out:
	ldi XL,low(Years)
	ldi XH,high(Years)
	ldi YL,low(Data_buf)
	ldi YH,high(Data_buf)
	ldi cnt_temp,6
	Next_value:
		ld temp,X+
		rcall To_BCD
		rcall To_Image
		st Y+,temp
		mov temp,tempH
		rcall To_Image
		st Y+,temp
		dec cnt_temp
		brne Next_value
	clr cnt_byte
	rcall Out_SPI
ret


To_BCD:
	clr tempH
	High_digit:
		cpi temp,10
		brlo Low_digit
		subi temp,10
		inc tempH
		rjmp High_digit
	Low_digit:
ret


To_Image:
	ldi ZL,low(2*Digit_To_Image)
	ldi ZH,high(2*Digit_To_Image)
	add ZL,temp
	clr temp
	adc ZH,temp
	lpm temp,Z
ret


Out_SPI:
	ldi XL,low(Data_buf)
	ldi XH,high(Data_buf)
	add XL,cnt_byte
	clr temp
	adc XH,temp
	ld temp,X
	out SPDR,temp
ret


Inc_Time_Date:
	lds temp,Seconds
	inc temp
	sts Seconds,temp
	cpi temp,60
	brlo Exit
		clr temp
		sts Seconds,temp
		lds temp,Minutes
		inc temp
		sts Minutes,temp
		cpi temp,60
		brlo Exit
			clr temp
			sts Minutes,temp
			lds temp,Hours
			inc temp
			sts Hours,temp
			cpi temp,24
			brlo Exit
				clr temp
				sts Hours,temp
				lds temp,Days
				inc temp
				sts Days,temp
				; необходима дополнительная обработка для месяцев с количеством дней менее 31
				cpi temp,32
				brlo Exit
					ldi temp,1
					sts Days,temp
					lds temp,Months
					inc temp
					sts Months,temp
					cpi temp,13
					brlo Exit
						ldi temp,1
						sts Months,temp
						lds temp,Years
						inc temp
						sts Years,temp
						cpi temp,100
						brlo Exit
							clr temp
							sts Years,temp
Exit:
ret


SPI_STC: ; SPI Transfer Complete Handler
	inc cnt_byte
	cpi cnt_byte,12
	breq Stop_trasfer
	rcall Out_SPI
reti
Stop_trasfer:
	sbi PORTB,PB4
	ldi cnt_temp,10
	Delay:
		nop
		dec cnt_temp
		brne Delay
	cbi PORTB,PB4
reti


TIM1_COMPA: ; Timer1 CompareA Handler
	rcall Inc_Time_Date
	rcall Start_serial_out
reti


EXT_INT0: ; IRQ0 Handler
EXT_INT1: ; IRQ1 Handler
TIM2_COMP: ; Timer2 Compare Handler
TIM2_OVF: ; Timer2 Overflow Handler
TIM1_CAPT: ; Timer1 Capture Handler
TIM1_COMPB: ; Timer1 CompareB Handler
TIM1_OVF: ; Timer1 Overflow Handler
TIM0_OVF: ; Timer0 Overflow Handler
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

;правильно сформировать эту таблицу
Digit_To_Image:
.db 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09


; RAM
.dseg

Years:
.byte 1

Months:
.byte 1

Days:
.byte 1

Seconds:
.byte 1

Minutes:
.byte 1

Hours:
.byte 1

Data_buf:
.byte 12
