;***************************************************************************
;* A P P L I C A T I O N   N O T E   F O R   T H E   A V R   F A M I L Y
;* 
;* Number				:AVR000
;* File Name			:"m16def.inc"
;* Title				:Register/Bit Definitions for the ATmega16
;* Date                 :07.09.2001
;* Version              :1.00
;* Support E-mail		:avr@atmel.no
;* Target MCU			:ATmega16
;*
;* DESCRIPTION
;* When including this file in the assembly program file, all I/O register	
;* names and I/O register bit names appearing in the data book can be used.
;* In addition, the six registers forming the three data pointers X, Y and
;* Z have been assigned names XL - ZH. Highest RAM address for Internal 
;* SRAM is also defined 
;*
;* The Register names are represented by their hexadecimal address.
;* 
;* The Register Bit names are represented by their bit number (0-7).
;* 
;* Please observe the difference in using the bit names with instructions
;* such as "sbr"/"cbr" (set/clear bit in register) and "sbrs"/"sbrc" 
;* (skip if bit in register set/cleared). The following example illustrates
;* this:
;* 
;* in	r16,PORTB				;read PORTB latch
;* sbr	r16,(1<<PB6)+(1<<PB5)	;set PB6 and PB5 (use masks, not bit#)
;* out  PORTB,r16				;output to PORTB
;*
;* in	r16,TIFR				;read the Timer Interrupt Flag Register
;* sbrc	r16,TOV0				;test the overflow flag (use bit#)
;* rjmp	TOV0_is_set				;jump if set
;* ...							;otherwise do something else
;***************************************************************************

;***** Specify Device
.device ATmega16

;***** I/O Register Definitions
.equ	SREG	=$3f
.equ	SPH		=$3e
.equ	SPL		=$3d
.equ	OCR0	=$3c		
.equ	GICR	=$3b		; New name for GIMSK
.equ	GIMSK	=$3b
.equ	GIFR	=$3a
.equ	TIMSK	=$39
.equ	TIFR	=$38
.equ	SPMCR	=$37
.equ    I2CR    =$36
.equ    TWCR    =$36
.equ    MCUCR   =$35
.equ    MCUSR   =$34
.equ    MCUCSR	=$34		; New name for MCUSR
.equ	TCCR0	=$33
.equ	TCNT0	=$32
.equ    OSCCAL  =$31
.equ    SFIOR   =$30
.equ	TCCR1A	=$2f
.equ	TCCR1B	=$2e
.equ	TCNT1H	=$2d
.equ	TCNT1L	=$2c
.equ	OCR1AH	=$2b
.equ	OCR1AL	=$2a
.equ	OCR1BH	=$29
.equ	OCR1BL	=$28
.equ	ICR1H	=$27
.equ	ICR1L	=$26
.equ	TCCR2	=$25
.equ	TCNT2	=$24
.equ	OCR2	=$23
.equ	ASSR	=$22
.equ	WDTCR	=$21
.equ    UBRRHI  =$20
.equ    UBRRH   =$20		; New name for UBRRHI
.equ	EEARH	=$1f
.equ	EEARL	=$1e
.equ	EEDR	=$1d
.equ	EECR	=$1c
.equ	PORTA	=$1b
.equ	DDRA	=$1a
.equ	PINA	=$19
.equ	PORTB	=$18
.equ	DDRB	=$17
.equ	PINB	=$16
.equ	PORTC	=$15
.equ	DDRC	=$14
.equ	PINC	=$13
.equ	PORTD	=$12
.equ	DDRD	=$11
.equ	PIND	=$10
.equ	SPDR	=$0f
.equ	SPSR	=$0e
.equ	SPCR	=$0d
.equ	UDR		=$0c
.equ	UCSRA	=$0b
.equ	USR		=$0b    ; For compatibility with S8535
.equ	UCSRB	=$0a
.equ	UCR		=$0a    ; For compatibility with S8535
.equ	UCSRC	=$20	; Note! UCSRC equals UBRRH 
.equ	UBRR	=$09
.equ	UBRRL	=$09	; New name for UBRR
.equ	ACSR	=$08
.equ    ADMUX   =$07
.equ    ADCSR   =$06
.equ    ADCH    =$05
.equ    ADCL    =$04
.equ    TWDR    =$03
.equ    TWAR    =$02
.equ    TWSR    =$01
.equ    TWBR    =$00
.equ    I2DR    =$03
.equ    I2AR    =$02
.equ    I2SR    =$01
.equ    I2BR    =$00

;***** Bit Definitions

; GIMSK / GICR
.equ	INT1	=7
.equ	INT0	=6
.equ	INT2	=5	
.equ	IVSEL	=1      
.equ	IVCE	=0      
	
; GIFR
.equ	INTF1	=7
.equ	INTF0	=6
.equ	INTF2	=5       

; TIMSK
.equ    TOIE0   =0
.equ    OCIE0   =1	 
.equ    TOIE1   =2
.equ    OCIE1B  =3
.equ    OCIE1A  =4
.equ    TICIE1  =5
.equ    TOIE2   =6
.equ    OCIE2   =7

; TIFR
.equ    TOV0    =0
.equ    OCF0    =1	 
.equ    TOV1    =2
.equ    OCF1B   =3
.equ    OCF1A   =4
.equ    ICF1    =5
.equ    TOV2    =6
.equ    OCF2    =7

; SPMCR
.equ	SPMIE	=7
.equ	ASB		=6
.equ	ASRE	=4
.equ	BLBSET	=3
.equ	PGWRT	=2
.equ	PGERS	=1
.equ	SPMEN	=0
.equ	RWWSB	=6
.equ	RWWSRE	=4

	
	
; TWCR
.equ    TWINT   =7
.equ    TWEA    =6
.equ    TWSTA   =5
.equ    TWSTO   =4
.equ    TWWC    =3
.equ    TWEN    =2

.equ    TWIE    =0

; MCUCR
	
.equ    SM2     =7   
.equ    SE      =6
.equ    SM1     =5
.equ    SM0     =4
.equ    ISC11   =3
.equ    ISC10   =2
.equ    ISC01   =1
.equ    ISC00   =0

; MCUSR
.equ    JTD     =7
.equ    ISC2    =6   
.equ    WDRF    =3
.equ    BORF    =2
.equ    EXTRF   =1
.equ    PORF    =0

; TCCR0
.equ    FOC0    =7   
.equ    PWM0    =6  ;OBSOLETE! Use WGM00
.equ    WGM00   =6
.equ	COM01	=5   
.equ	COM00	=4   
.equ	CTC0	=3  ;OBSOLETE! Use WGM01
.equ    WGM01   =3
.equ	CS02	=2
.equ	CS01	=1
.equ	CS00	=0

; SFIOR
.equ	ADTS2	=7	 			
.equ	ADTS1	=6	 			
.equ	ADTS0	=5	 			
.equ    ADHSM   =4
.equ    ACME    =3
.equ    PUD     =2
.equ    PSR2    =1
.equ    PSR10   =0

; TCCR1A
.equ	COM1A1	=7
.equ	COM1A0	=6
.equ	COM1B1	=5
.equ	COM1B0	=4
.equ	FOC1A	=3
.equ	FOC1B	=2
.equ	PWM11	=1  ; OBSOLETE! Use WGM11
.equ	PWM10	=0  ; OBSOLETE! Use WGM10
.equ	WGM11	=1
.equ	WGM10	=0

; TCCR1B
.equ	ICNC1	=7
.equ	ICES1	=6
.equ	CTC11	=4  ; OBSOLETE! Use WGM13
.equ	CTC10	=3  ; OBSOLETE! Use WGM12
.equ	CTC1	=3  ; OBSOLETE! Use WGM12
.equ	WGM13	=4
.equ	WGM12	=3
.equ	CS12	=2
.equ	CS11	=1
.equ	CS10	=0

; TCCR2
.equ	FOC2	=7
.equ    PWM2    =6  ; OBSOLETE! Use WGM20
.equ    WGM20   =6
.equ    COM21   =5
.equ    COM20   =4
.equ    CTC2    =3  ; OBSOLETE! Use WGM21
.equ    WGM21   =3
.equ    CS22    =2
.equ    CS21    =1
.equ    CS20    =0

; ASSR
.equ    AS2     =3
.equ    TCN2UB  =2
.equ    OCR2UB  =1
.equ    TCR2UB  =0

; WDTCR
.equ	WDTOE	=4
.equ	WDE	=3
.equ	WDP2	=2
.equ	WDP1	=1
.equ	WDP0	=0

; EECR
.equ    EERIE   =3
.equ	EEMWE	=2
.equ	EEWE	=1
.equ	EERE	=0

; PORTA
.equ	PA7	=7
.equ	PA6	=6
.equ	PA5	=5
.equ	PA4	=4
.equ	PA3	=3
.equ	PA2	=2
.equ	PA1	=1
.equ	PA0	=0

; DDRA
.equ	DDA7	=7
.equ	DDA6	=6
.equ	DDA5	=5
.equ	DDA4	=4
.equ	DDA3	=3
.equ	DDA2	=2
.equ	DDA1	=1
.equ	DDA0	=0

; PINA
.equ	PINA7	=7
.equ	PINA6	=6
.equ	PINA5	=5
.equ	PINA4	=4
.equ	PINA3	=3
.equ	PINA2	=2
.equ	PINA1	=1
.equ	PINA0	=0

; PORTB
.equ	PB7	=7
.equ	PB6	=6
.equ	PB5	=5
.equ	PB4	=4
.equ	PB3	=3
.equ	PB2	=2
.equ	PB1	=1
.equ	PB0	=0

; DDRB
.equ	DDB7	=7
.equ	DDB6	=6
.equ	DDB5	=5
.equ	DDB4	=4
.equ	DDB3	=3
.equ	DDB2	=2
.equ	DDB1	=1
.equ	DDB0	=0

; PINB
.equ	PINB7	=7
.equ	PINB6	=6
.equ	PINB5	=5
.equ	PINB4	=4
.equ	PINB3	=3
.equ	PINB2	=2
.equ	PINB1	=1
.equ	PINB0	=0

; PORTC
.equ	PC7	=7
.equ	PC6	=6
.equ	PC5	=5
.equ	PC4	=4
.equ	PC3	=3
.equ	PC2	=2
.equ	PC1	=1
.equ	PC0	=0

; DDRC
.equ	DDC7	=7
.equ	DDC6	=6
.equ	DDC5	=5
.equ	DDC4	=4
.equ	DDC3	=3
.equ	DDC2	=2
.equ	DDC1	=1
.equ	DDC0	=0

; PINC
.equ	PINC7	=7
.equ	PINC6	=6
.equ	PINC5	=5
.equ	PINC4	=4
.equ	PINC3	=3
.equ	PINC2	=2
.equ	PINC1	=1
.equ	PINC0	=0

; PORTD
.equ	PD7	=7
.equ	PD6	=6
.equ	PD5	=5
.equ	PD4	=4
.equ	PD3	=3
.equ	PD2	=2
.equ	PD1	=1
.equ	PD0	=0

; DDRD
.equ	DDD7	=7
.equ	DDD6	=6
.equ	DDD5	=5
.equ	DDD4	=4
.equ	DDD3	=3
.equ	DDD2	=2
.equ	DDD1	=1
.equ	DDD0	=0

; PIND
.equ	PIND7	=7
.equ	PIND6	=6
.equ	PIND5	=5
.equ	PIND4	=4
.equ	PIND3	=3
.equ	PIND2	=2
.equ	PIND1	=1
.equ	PIND0	=0

; SPSR
.equ	SPIF	=7
.equ	WCOL	=6
.equ	SPI2X	=0

; SPCR
.equ	SPIE	=7
.equ	SPE	=6
.equ	DORD	=5
.equ	MSTR	=4
.equ	CPOL	=3
.equ	CPHA	=2
.equ	SPR1	=1
.equ	SPR0	=0

; UCSRA
.equ	RXC	=7
.equ	TXC	=6
.equ	UDRE	=5
.equ	FE	=4
;.equ	OR	=3
.equ	DOR	=3	;New name for OR
.equ	PE	=2	 
.equ	U2X	=1
.equ	MPCM	=0

; UCSRB
.equ	RXCIE	=7
.equ	TXCIE	=6
.equ	UDRIE	=5
.equ	RXEN	=4
.equ	TXEN	=3
.equ	CHR9	=2
.equ	UCSZ2	=2	; New name for CHR9
.equ	RXB8	=1
.equ	TXB8	=0

;UCSRC
.equ	URSEL	=7	 
.equ	UMSEL	=6	 
.equ	UPM1	=5	 
.equ	UPM0	=4	 
.equ	USBS	=3	 
.equ	UCSZ1	=2	 
.equ	UCSZ0	=1	 
.equ	UCPOL	=0	 

; ACSR
.equ	ACD	=7
.equ    ACBG    =6
.equ	ACO	=5
.equ	ACI	=4
.equ	ACIE	=3
.equ	ACIC	=2
.equ	ACIS1	=1
.equ	ACIS0	=0

; ADMUX
.equ    REFS1   =7
.equ    REFS0   =6
.equ    ADLAR   =5
.equ    MUX4    =4
.equ    MUX3    =3
.equ    MUX2    =2
.equ    MUX1    =1
.equ    MUX0    =0

; ADCSR
.equ    ADEN    =7
.equ    ADSC    =6
.equ	ADATE	=5	 
.equ    ADFR    =5
.equ    ADIF    =4
.equ    ADIE    =3
.equ    ADPS2   =2
.equ    ADPS1   =1
.equ    ADPS0   =0

; TWAR
.equ    TWGCE   =0

.def	XL	=r26
.def	XH	=r27
.def	YL	=r28
.def	YH	=r29
.def	ZL	=r30
.def	ZH	=r31

.equ 	RAMEND =$45F

.equ 	BOOTSTART	=$1E00  ;OBSOLETE!!! temporarily kept for compatibility
;.equ 	LARGEBOOTSTART	=$0C00  ;largest boot block is 2KB
;.equ 	SMALLBOOTSTART	=$0F80  ;smallest boot block is 256B
.equ 	SMALLBOOTSTART	=0b1111110000000  ;($1F80) smallest boot block is 256B
.equ 	SECONDBOOTSTART	=0b1111100000000  ;($1F00) second boot block size is 512B
.equ 	THIRDBOOTSTART	=0b1111000000000  ;($1E00) third boot block size is 1KB
.equ 	LARGEBOOTSTART	=0b1110000000000  ;($1C00) largest boot block is 2KB
.equ	PAGESIZE	=64     ;number of WORDS in a page
.equ 	FLASHEND	=$1fff

.equ	INT0addr=$002	;External Interrupt0 Vector Address
.equ	INT1addr=$004	;External Interrupt1 Vector Address
.equ	OC2addr =$006	;Output Compare2 Interrupt Vector Address
.equ	OVF2addr=$008	;Overflow2 Interrupt Vector Address
.equ	ICP1addr=$00A	;Input Capture1 Interrupt Vector Address
.equ	OC1Aaddr=$00C	;Output Compare1A Interrupt Vector Address
.equ	OC1Baddr=$00E	;Output Compare1B Interrupt Vector Address
.equ	OVF1addr=$010	;Overflow1 Interrupt Vector Address
.equ	OVF0addr=$012	;Overflow0 Interrupt Vector Address
.equ	SPIaddr =$014	;SPI Interrupt Vector Address
.equ	URXCaddr=$016	;UART Receive Complete Interrupt Vector Address
.equ	UDREaddr=$018	;UART Data Register Empty Interrupt Vector Address
.equ	UTXCaddr=$01A	;UART Transmit Complete Interrupt Vector Address
.equ	ADCCaddr=$01C	;ADC Interrupt Vector Address
.equ	ERDYaddr=$01E	;EEPROM Interrupt Vector Address
.equ	ACIaddr =$020	;Analog Comparator Interrupt Vector Address
.equ    TWIaddr =$022   ;Irq. vector address for Two-Wire Interface
.equ	INT2addr=$024   ;External Interrupt2 Vector Address
.equ	OC0addr =$026   ;Output Compare0 Interrupt Vector Address
.equ	SPMRaddr=$028   ;Store Program Memory Ready Interrupt Vector Address
