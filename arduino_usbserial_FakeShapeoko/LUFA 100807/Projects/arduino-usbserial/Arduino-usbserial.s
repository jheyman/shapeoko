	.file	"Arduino-usbserial.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.RingBuffer_Insert,"ax",@progbits
	.type	RingBuffer_Insert, @function
RingBuffer_Insert:
.LFB75:
	.file 1 "Lib/LightweightRingBuff.h"
	.loc 1 160 0
	.cfi_startproc
.LVL0:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 161 0
	movw r30,r24
	subi r30,-128
	sbci r31,-1
	ld r26,Z
	ldd r27,Z+1
	st X,r22
	.loc 1 163 0
	ld r26,Z
	ldd r27,Z+1
	movw r18,r26
	subi r18,-1
	sbci r19,-1
	std Z+1,r19
	st Z,r18
	cp r18,r30
	cpc r19,r31
	brne .L2
	.loc 1 164 0
	adiw r26,1+1
	st X,r25
	st -X,r24
	sbiw r26,1
.L2:
.LBB34:
	.loc 1 166 0
	in r18,__SREG__
.LVL1:
.LBB35:
.LBB36:
	.file 2 "c:\\program files (x86)\\arduino\\hardware\\tools\\avr\\avr\\include\\util\\atomic.h"
	.loc 2 50 0
/* #APP */
 ;  50 "c:\program files (x86)\arduino\hardware\tools\avr\avr\include\util\atomic.h" 1
	cli
 ;  0 "" 2
.LVL2:
/* #NOAPP */
.LBE36:
.LBE35:
	.loc 1 168 0
	movw r30,r24
	subi r30,124
	sbci r31,-1
	ld r24,Z
.LVL3:
	subi r24,lo8(-(1))
	st Z,r24
.LVL4:
.LBB37:
.LBB38:
	.loc 2 70 0
	out __SREG__,r18
	.loc 2 71 0
	ret
.LBE38:
.LBE37:
.LBE34:
	.cfi_endproc
.LFE75:
	.size	RingBuffer_Insert, .-RingBuffer_Insert
	.section	.text.RingBuffer_Remove,"ax",@progbits
	.type	RingBuffer_Remove, @function
RingBuffer_Remove:
.LFB76:
	.loc 1 183 0
	.cfi_startproc
.LVL5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 184 0
	movw r26,r24
	subi r26,126
	sbci r27,-1
	ld r30,X+
	ld r31,X
	sbiw r26,1
	ld r18,Z+
.LVL6:
	.loc 1 186 0
	adiw r26,1
	st X,r31
	st -X,r30
	movw r20,r24
	subi r20,-128
	sbci r21,-1
	cp r30,r20
	cpc r31,r21
	brne .L5
	.loc 1 187 0
	st X+,r24
	st X,r25
.L5:
.LBB39:
	.loc 1 189 0
	in r19,__SREG__
.LVL7:
.LBB40:
.LBB41:
	.loc 2 50 0
/* #APP */
 ;  50 "c:\program files (x86)\arduino\hardware\tools\avr\avr\include\util\atomic.h" 1
	cli
 ;  0 "" 2
.LVL8:
/* #NOAPP */
.LBE41:
.LBE40:
	.loc 1 191 0
	movw r30,r24
	subi r30,124
	sbci r31,-1
	ld r25,Z
	subi r25,lo8(-(-1))
	st Z,r25
.LVL9:
.LBB42:
.LBB43:
	.loc 2 70 0
	out __SREG__,r19
	.loc 2 71 0
.LBE43:
.LBE42:
.LBE39:
	.loc 1 195 0
	mov r24,r18
.LVL10:
	ret
	.cfi_endproc
.LFE76:
	.size	RingBuffer_Remove, .-RingBuffer_Remove
	.section	.text.SetupHardware,"ax",@progbits
.global	SetupHardware
	.type	SetupHardware, @function
SetupHardware:
.LFB90:
	.file 3 "Arduino-usbserial.c"
	.loc 3 140 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 142 0
	in r24,0x34
	andi r24,lo8(-9)
	out 0x34,r24
.LBB50:
.LBB51:
	.file 4 "c:\\program files (x86)\\arduino\\hardware\\tools\\avr\\avr\\include\\avr\\wdt.h"
	.loc 4 515 0
/* #APP */
 ;  515 "c:\program files (x86)\arduino\hardware\tools\avr\avr\include\avr\wdt.h" 1
	in __tmp_reg__,__SREG__
	cli
	wdr
	lds r24,96
	ori r24,24
	sts 96,r24
	sts 96,__zero_reg__
	out __SREG__,__tmp_reg__
	
 ;  0 "" 2
.LVL11:
/* #NOAPP */
.LBE51:
.LBE50:
.LBB52:
.LBB53:
	.file 5 "../../LUFA/Drivers/Peripheral/Serial.h"
	.loc 5 102 0
	ldi r24,lo8(103)
	ldi r25,0
	sts 204+1,r25
	sts 204,r24
	.loc 5 104 0
	ldi r24,lo8(6)
	sts 202,r24
	.loc 5 105 0
	sts 200,__zero_reg__
	.loc 5 106 0
	ldi r24,lo8(24)
	sts 201,r24
	.loc 5 108 0
	sbi 0xa,3
	.loc 5 109 0
	sbi 0xb,2
.LBE53:
.LBE52:
.LBB54:
.LBB55:
	.file 6 "./Board/LEDs.h"
	.loc 6 69 0
	in r24,0xa
	ori r24,lo8(48)
	out 0xa,r24
	.loc 6 70 0
	in r24,0xb
	ori r24,lo8(48)
	out 0xb,r24
.LBE55:
.LBE54:
	.loc 3 148 0
	call USB_Init
.LVL12:
	.loc 3 151 0
	ldi r24,lo8(4)
	out 0x25,r24
	.loc 3 154 0
	sbi 0xb,7
	.loc 3 155 0
	sbi 0xa,7
	ret
	.cfi_endproc
.LFE90:
	.size	SetupHardware, .-SetupHardware
	.section	.text.startup.main,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB89:
	.loc 3 81 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 82 0
	call SetupHardware
.LVL13:
.LBB107:
.LBB108:
	.loc 1 87 0
	in r18,__SREG__
.LVL14:
.LBB109:
.LBB110:
	.loc 2 50 0
/* #APP */
 ;  50 "c:\program files (x86)\arduino\hardware\tools\avr\avr\include\util\atomic.h" 1
	cli
 ;  0 "" 2
.LVL15:
/* #NOAPP */
.LBE110:
.LBE109:
	.loc 1 89 0
	ldi r24,lo8(USBtoUSART_Buffer)
	ldi r25,hi8(USBtoUSART_Buffer)
	sts USBtoUSART_Buffer+128+1,r25
	sts USBtoUSART_Buffer+128,r24
	.loc 1 90 0
	sts USBtoUSART_Buffer+130+1,r25
	sts USBtoUSART_Buffer+130,r24
.LVL16:
.LBB111:
.LBB112:
	.loc 2 70 0
	out __SREG__,r18
	.loc 2 71 0
.LVL17:
.LBE112:
.LBE111:
.LBE108:
.LBE107:
.LBB113:
.LBB114:
	.loc 1 87 0
	in r18,__SREG__
.LVL18:
.LBB115:
.LBB116:
	.loc 2 50 0
/* #APP */
 ;  50 "c:\program files (x86)\arduino\hardware\tools\avr\avr\include\util\atomic.h" 1
	cli
 ;  0 "" 2
.LVL19:
/* #NOAPP */
.LBE116:
.LBE115:
	.loc 1 89 0
	ldi r24,lo8(USARTtoUSB_Buffer)
	ldi r25,hi8(USARTtoUSB_Buffer)
	sts USARTtoUSB_Buffer+128+1,r25
	sts USARTtoUSB_Buffer+128,r24
	.loc 1 90 0
	sts USARTtoUSB_Buffer+130+1,r25
	sts USARTtoUSB_Buffer+130,r24
.LVL20:
.LBB117:
.LBB118:
	.loc 2 70 0
	out __SREG__,r18
.LVL21:
	.loc 2 71 0
.LBE118:
.LBE117:
.LBE114:
.LBE113:
	.loc 3 87 0
/* #APP */
 ;  87 "Arduino-usbserial.c" 1
	sei
 ;  0 "" 2
/* #NOAPP */
.LBB119:
	.loc 3 109 0
	ldi r29,lo8(3)
.LVL22:
.L22:
.LBB120:
.LBB121:
.LBB122:
.LBB123:
	.loc 1 111 0
	in r25,__SREG__
.LVL23:
.LBB124:
.LBB125:
	.loc 2 50 0
/* #APP */
 ;  50 "c:\program files (x86)\arduino\hardware\tools\avr\avr\include\util\atomic.h" 1
	cli
 ;  0 "" 2
.LVL24:
/* #NOAPP */
.LBE125:
.LBE124:
	.loc 1 113 0
	lds r24,USBtoUSART_Buffer+132
.LVL25:
.LBB126:
.LBB127:
	.loc 2 70 0
	out __SREG__,r25
	.loc 2 71 0
.LBE127:
.LBE126:
.LBE123:
.LBE122:
.LBE121:
.LBE120:
	.loc 3 92 0
	cpi r24,lo8(-128)
	breq .L9
.LBB128:
	.loc 3 94 0
	ldi r24,lo8(VirtualSerial_CDC_Interface)
	ldi r25,hi8(VirtualSerial_CDC_Interface)
.LVL26:
	call CDC_Device_ReceiveByte
.LVL27:
	.loc 3 97 0
	sbrc r25,7
	rjmp .L9
	.loc 3 98 0
	mov r22,r24
	ldi r24,lo8(USBtoUSART_Buffer)
	ldi r25,hi8(USBtoUSART_Buffer)
.LVL28:
	call RingBuffer_Insert
.LVL29:
.L9:
.LBE128:
.LBB129:
.LBB130:
.LBB131:
	.loc 1 111 0
	in r24,__SREG__
.LVL30:
.LBB132:
.LBB133:
	.loc 2 50 0
/* #APP */
 ;  50 "c:\program files (x86)\arduino\hardware\tools\avr\avr\include\util\atomic.h" 1
	cli
 ;  0 "" 2
.LVL31:
/* #NOAPP */
.LBE133:
.LBE132:
	.loc 1 113 0
	lds r28,USARTtoUSB_Buffer+132
.LVL32:
.LBB134:
.LBB135:
	.loc 2 70 0
	out __SREG__,r24
	.loc 2 71 0
.LBE135:
.LBE134:
.LBE131:
.LBE130:
.LBE129:
	.loc 3 103 0
	sbic 0x15,0
	rjmp .L11
	.loc 3 103 0 is_stmt 0 discriminator 1
	cpi r28,lo8(97)
	brlo .L12
.L11:
	.loc 3 105 0 is_stmt 1
	sbi 0x15,0
	.loc 3 107 0
	lds r24,USARTtoUSB_Buffer+132
.LVL33:
	tst r24
	breq .L14
.LVL34:
.LBB136:
.LBB137:
	.loc 6 75 0
	cbi 0xb,5
.LBE137:
.LBE136:
	.loc 3 109 0
	sts PulseMSRemaining,r29
.LVL35:
.L14:
	.loc 3 113 0
	tst r28
	breq .L34
	.loc 3 114 0
	ldi r24,lo8(USARTtoUSB_Buffer)
	ldi r25,hi8(USARTtoUSB_Buffer)
	call RingBuffer_Remove
.LVL36:
	mov r22,r24
	ldi r24,lo8(VirtualSerial_CDC_Interface)
	ldi r25,hi8(VirtualSerial_CDC_Interface)
	call CDC_Device_SendByte
.LVL37:
	subi r28,lo8(-(-1))
.LVL38:
	rjmp .L14
.LVL39:
.L34:
	.loc 3 117 0
	lds r24,PulseMSRemaining
	tst r24
	breq .L17
	.loc 3 117 0 is_stmt 0 discriminator 1
	lds r24,PulseMSRemaining
	subi r24,lo8(-(-1))
	sts PulseMSRemaining,r24
	cpse r24,__zero_reg__
	rjmp .L17
.LVL40:
.LBB138:
.LBB139:
	.loc 6 80 0 is_stmt 1
	sbi 0xb,5
.LVL41:
.L17:
.LBE139:
.LBE138:
	.loc 3 121 0
	lds r24,PulseMSRemaining+1
	tst r24
	breq .L12
	.loc 3 121 0 is_stmt 0 discriminator 1
	lds r24,PulseMSRemaining+1
	subi r24,lo8(-(-1))
	sts PulseMSRemaining+1,r24
	cpse r24,__zero_reg__
	rjmp .L12
.LVL42:
.LBB140:
.LBB141:
	.loc 6 80 0 is_stmt 1
	sbi 0xb,4
.LVL43:
.L12:
.LBE141:
.LBE140:
.LBB142:
.LBB143:
.LBB144:
.LBB145:
	.loc 1 111 0
	in r25,__SREG__
.LVL44:
.LBB146:
.LBB147:
	.loc 2 50 0
/* #APP */
 ;  50 "c:\program files (x86)\arduino\hardware\tools\avr\avr\include\util\atomic.h" 1
	cli
 ;  0 "" 2
.LVL45:
/* #NOAPP */
.LBE147:
.LBE146:
	.loc 1 113 0
	lds r24,USBtoUSART_Buffer+132
.LVL46:
.LBB148:
.LBB149:
	.loc 2 70 0
	out __SREG__,r25
	.loc 2 71 0
.LBE149:
.LBE148:
.LBE145:
.LBE144:
.LBE143:
.LBE142:
	.loc 3 126 0
	tst r24
	breq .L20
	.loc 3 127 0
	ldi r24,lo8(USBtoUSART_Buffer)
	ldi r25,hi8(USBtoUSART_Buffer)
.LVL47:
	call RingBuffer_Remove
.LVL48:
.L21:
.LBB150:
.LBB151:
	.loc 5 142 0
	lds r25,200
	sbrs r25,5
	rjmp .L21
	.loc 5 143 0
	sts 206,r24
.LVL49:
.LBE151:
.LBE150:
.LBB152:
.LBB153:
	.loc 6 75 0
	cbi 0xb,4
.LBE153:
.LBE152:
	.loc 3 130 0
	sts PulseMSRemaining+1,r29
.LVL50:
.L20:
	.loc 3 133 0
	ldi r24,lo8(VirtualSerial_CDC_Interface)
	ldi r25,hi8(VirtualSerial_CDC_Interface)
	call CDC_Device_USBTask
.LVL51:
	.loc 3 134 0
	call USB_USBTask
.LVL52:
.LBE119:
	.loc 3 135 0
	rjmp .L22
	.cfi_endproc
.LFE89:
	.size	main, .-main
	.section	.text.EVENT_USB_Device_ConfigurationChanged,"ax",@progbits
.global	EVENT_USB_Device_ConfigurationChanged
	.type	EVENT_USB_Device_ConfigurationChanged, @function
EVENT_USB_Device_ConfigurationChanged:
.LFB91:
	.loc 3 160 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 161 0
	ldi r24,lo8(VirtualSerial_CDC_Interface)
	ldi r25,hi8(VirtualSerial_CDC_Interface)
	jmp CDC_Device_ConfigureEndpoints
.LVL53:
	.cfi_endproc
.LFE91:
	.size	EVENT_USB_Device_ConfigurationChanged, .-EVENT_USB_Device_ConfigurationChanged
	.section	.text.EVENT_USB_Device_UnhandledControlRequest,"ax",@progbits
.global	EVENT_USB_Device_UnhandledControlRequest
	.type	EVENT_USB_Device_UnhandledControlRequest, @function
EVENT_USB_Device_UnhandledControlRequest:
.LFB92:
	.loc 3 166 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 167 0
	ldi r24,lo8(VirtualSerial_CDC_Interface)
	ldi r25,hi8(VirtualSerial_CDC_Interface)
	jmp CDC_Device_ProcessControlRequest
.LVL54:
	.cfi_endproc
.LFE92:
	.size	EVENT_USB_Device_UnhandledControlRequest, .-EVENT_USB_Device_UnhandledControlRequest
	.section	.text.EVENT_CDC_Device_LineEncodingChanged,"ax",@progbits
.global	EVENT_CDC_Device_LineEncodingChanged
	.type	EVENT_CDC_Device_LineEncodingChanged, @function
EVENT_CDC_Device_LineEncodingChanged:
.LFB93:
	.loc 3 175 0
	.cfi_startproc
.LVL55:
	push r16
.LCFI0:
	.cfi_def_cfa_offset 3
	.cfi_offset 16, -2
	push r17
.LCFI1:
	.cfi_def_cfa_offset 4
	.cfi_offset 17, -3
	push r28
.LCFI2:
	.cfi_def_cfa_offset 5
	.cfi_offset 28, -4
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	movw r16,r24
.LVL56:
	.loc 3 178 0
	movw r30,r24
	ldd r24,Z+20
.LVL57:
	cpi r24,lo8(1)
	breq .L39
	cpi r24,lo8(2)
	brne .L52
.LVL58:
	.loc 3 184 0
	ldi r28,lo8(32)
	.loc 3 185 0
	rjmp .L38
.LVL59:
.L39:
	.loc 3 181 0
	ldi r28,lo8(48)
	rjmp .L38
.L52:
	.loc 3 176 0
	ldi r28,0
.LVL60:
.L38:
	.loc 3 188 0
	movw r30,r16
	ldd r24,Z+19
	cpi r24,lo8(2)
	brne .L41
	.loc 3 189 0
	ori r28,lo8(8)
.LVL61:
.L41:
	.loc 3 191 0
	movw r30,r16
	ldd r24,Z+21
	cpi r24,lo8(7)
	breq .L43
	cpi r24,lo8(8)
	breq .L44
	cpi r24,lo8(6)
	brne .L42
	.loc 3 194 0
	ori r28,lo8(2)
.LVL62:
	.loc 3 195 0
	rjmp .L42
.L43:
	.loc 3 197 0
	ori r28,lo8(4)
.LVL63:
	.loc 3 198 0
	rjmp .L42
.L44:
	.loc 3 200 0
	ori r28,lo8(6)
.LVL64:
.L42:
	.loc 3 205 0
	sts 201,__zero_reg__
	.loc 3 206 0
	sts 200,__zero_reg__
	.loc 3 207 0
	sts 202,__zero_reg__
	.loc 3 210 0
	movw r30,r16
	ldd r18,Z+15
	ldd r19,Z+16
	ldd r20,Z+17
	ldd r21,Z+18
	cp r18,__zero_reg__
	ldi r31,-31
	cpc r19,r31
	cpc r20,__zero_reg__
	cpc r21,__zero_reg__
	breq .L49
	.loc 3 212 0 discriminator 2
	movw r26,r20
	movw r24,r18
	lsr r27
	ror r26
	ror r25
	ror r24
	movw r22,r24
	movw r24,r26
	subi r22,-128
	sbci r23,123
	sbci r24,-31
	sbci r25,-1
	call __udivmodsi4
	.loc 3 210 0 discriminator 2
	subi r18,1
	sbc r19,__zero_reg__
	rjmp .L46
.L49:
	.loc 3 210 0 is_stmt 0
	ldi r18,lo8(16)
	ldi r19,0
.L46:
	.loc 3 210 0 discriminator 4
	sts 204+1,r19
	sts 204,r18
	.loc 3 214 0 is_stmt 1 discriminator 4
	sts 202,r28
	.loc 3 215 0 discriminator 4
	movw r30,r16
	ldd r24,Z+15
	ldd r25,Z+16
	ldd r26,Z+17
	ldd r27,Z+18
	cp r24,__zero_reg__
	sbci r25,-31
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	breq .L50
	.loc 3 215 0 is_stmt 0
	ldi r24,lo8(2)
	rjmp .L47
.L50:
	ldi r24,0
.L47:
	.loc 3 215 0 discriminator 4
	sts 200,r24
	.loc 3 216 0 is_stmt 1 discriminator 4
	ldi r24,lo8(-104)
	sts 201,r24
/* epilogue start */
	.loc 3 217 0 discriminator 4
	pop r28
.LVL65:
	pop r17
	pop r16
.LVL66:
	ret
	.cfi_endproc
.LFE93:
	.size	EVENT_CDC_Device_LineEncodingChanged, .-EVENT_CDC_Device_LineEncodingChanged
	.section	.text.__vector_23,"ax",@progbits
.global	__vector_23
	.type	__vector_23, @function
__vector_23:
.LFB94:
	.loc 3 223 0
	.cfi_startproc
	push r1
.LCFI3:
	.cfi_def_cfa_offset 3
	.cfi_offset 1, -2
	push r0
.LCFI4:
	.cfi_def_cfa_offset 4
	.cfi_offset 0, -3
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r18
.LCFI5:
	.cfi_def_cfa_offset 5
	.cfi_offset 18, -4
	push r19
.LCFI6:
	.cfi_def_cfa_offset 6
	.cfi_offset 19, -5
	push r20
.LCFI7:
	.cfi_def_cfa_offset 7
	.cfi_offset 20, -6
	push r21
.LCFI8:
	.cfi_def_cfa_offset 8
	.cfi_offset 21, -7
	push r22
.LCFI9:
	.cfi_def_cfa_offset 9
	.cfi_offset 22, -8
	push r23
.LCFI10:
	.cfi_def_cfa_offset 10
	.cfi_offset 23, -9
	push r24
.LCFI11:
	.cfi_def_cfa_offset 11
	.cfi_offset 24, -10
	push r25
.LCFI12:
	.cfi_def_cfa_offset 12
	.cfi_offset 25, -11
	push r26
.LCFI13:
	.cfi_def_cfa_offset 13
	.cfi_offset 26, -12
	push r27
.LCFI14:
	.cfi_def_cfa_offset 14
	.cfi_offset 27, -13
	push r30
.LCFI15:
	.cfi_def_cfa_offset 15
	.cfi_offset 30, -14
	push r31
.LCFI16:
	.cfi_def_cfa_offset 16
	.cfi_offset 31, -15
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 15 */
.L__stack_usage = 15
	.loc 3 224 0
	lds r22,206
.LVL67:
	.loc 3 226 0
	in r24,0x1e
	cpi r24,lo8(4)
	brne .L53
	.loc 3 227 0
	ldi r24,lo8(USARTtoUSB_Buffer)
	ldi r25,hi8(USARTtoUSB_Buffer)
	call RingBuffer_Insert
.LVL68:
.L53:
/* epilogue start */
	.loc 3 228 0
	pop r31
	pop r30
	pop r27
	pop r26
	pop r25
	pop r24
	pop r23
	pop r22
	pop r21
	pop r20
	pop r19
	pop r18
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.cfi_endproc
.LFE94:
	.size	__vector_23, .-__vector_23
	.section	.text.EVENT_CDC_Device_ControLineStateChanged,"ax",@progbits
.global	EVENT_CDC_Device_ControLineStateChanged
	.type	EVENT_CDC_Device_ControLineStateChanged, @function
EVENT_CDC_Device_ControLineStateChanged:
.LFB95:
	.loc 3 235 0
	.cfi_startproc
.LVL69:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 236 0
	movw r30,r24
	ldd r24,Z+13
.LVL70:
	.loc 3 238 0
	sbrs r24,0
	rjmp .L56
	.loc 3 239 0
	cbi 0xb,7
	ret
.L56:
	.loc 3 241 0
	sbi 0xb,7
	ret
	.cfi_endproc
.LFE95:
	.size	EVENT_CDC_Device_ControLineStateChanged, .-EVENT_CDC_Device_ControLineStateChanged
.global	VirtualSerial_CDC_Interface
	.data
	.type	VirtualSerial_CDC_Interface, @object
	.size	VirtualSerial_CDC_Interface, 22
VirtualSerial_CDC_Interface:
	.byte	0
	.byte	3
	.word	64
	.byte	0
	.byte	4
	.word	64
	.byte	0
	.byte	2
	.word	8
	.byte	0
	.zero	9
	.comm	PulseMSRemaining,3,1
	.comm	USARTtoUSB_Buffer,133,1
	.comm	USBtoUSART_Buffer,133,1
	.text
.Letext0:
	.file 7 "c:\\program files (x86)\\arduino\\hardware\\tools\\avr\\avr\\include\\stdint.h"
	.file 8 "../../LUFA/Drivers/USB/HighLevel/../LowLevel/Device.h"
	.file 9 "../../LUFA/Drivers/USB/Class/Device/../Common/CDC.h"
	.file 10 "../../LUFA/Drivers/USB/Class/Device/CDC.h"
	.file 11 "../../LUFA/Drivers/USB/HighLevel/../LowLevel/USBController.h"
	.file 12 "../../LUFA/Drivers/USB/HighLevel/USBTask.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xc08
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF96
	.byte	0x1
	.long	.LASF97
	.long	.LASF98
	.long	.Ldebug_ranges0+0
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x7
	.byte	0x7e
	.long	0x3b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.long	.LASF3
	.byte	0x7
	.byte	0x7f
	.long	0x4d
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF4
	.byte	0x7
	.byte	0x80
	.long	0x5f
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF6
	.uleb128 0x3
	.long	.LASF7
	.byte	0x7
	.byte	0x82
	.long	0x78
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF11
	.uleb128 0x5
	.long	.LASF18
	.byte	0x1
	.byte	0x8
	.byte	0x72
	.long	0xc5
	.uleb128 0x6
	.long	.LASF12
	.sleb128 0
	.uleb128 0x6
	.long	.LASF13
	.sleb128 1
	.uleb128 0x6
	.long	.LASF14
	.sleb128 2
	.uleb128 0x6
	.long	.LASF15
	.sleb128 3
	.uleb128 0x6
	.long	.LASF16
	.sleb128 4
	.uleb128 0x6
	.long	.LASF17
	.sleb128 5
	.byte	0
	.uleb128 0x5
	.long	.LASF19
	.byte	0x1
	.byte	0x9
	.byte	0x9b
	.long	0xe4
	.uleb128 0x6
	.long	.LASF20
	.sleb128 0
	.uleb128 0x6
	.long	.LASF21
	.sleb128 1
	.uleb128 0x6
	.long	.LASF22
	.sleb128 2
	.byte	0
	.uleb128 0x5
	.long	.LASF23
	.byte	0x1
	.byte	0x9
	.byte	0xa3
	.long	0x10f
	.uleb128 0x6
	.long	.LASF24
	.sleb128 0
	.uleb128 0x6
	.long	.LASF25
	.sleb128 1
	.uleb128 0x6
	.long	.LASF26
	.sleb128 2
	.uleb128 0x6
	.long	.LASF27
	.sleb128 3
	.uleb128 0x6
	.long	.LASF28
	.sleb128 4
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF29
	.uleb128 0x7
	.byte	0xd
	.byte	0xa
	.byte	0x64
	.long	0x1ab
	.uleb128 0x8
	.long	.LASF30
	.byte	0xa
	.byte	0x66
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF31
	.byte	0xa
	.byte	0x68
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x8
	.long	.LASF32
	.byte	0xa
	.byte	0x69
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x8
	.long	.LASF33
	.byte	0xa
	.byte	0x6a
	.long	0x1ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.long	.LASF34
	.byte	0xa
	.byte	0x6c
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x8
	.long	.LASF35
	.byte	0xa
	.byte	0x6d
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x8
	.long	.LASF36
	.byte	0xa
	.byte	0x6e
	.long	0x1ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.long	.LASF37
	.byte	0xa
	.byte	0x70
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0x8
	.long	.LASF38
	.byte	0xa
	.byte	0x71
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x8
	.long	.LASF39
	.byte	0xa
	.byte	0x72
	.long	0x1ab
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF40
	.uleb128 0x7
	.byte	0x2
	.byte	0xa
	.byte	0x78
	.long	0x1d7
	.uleb128 0x8
	.long	.LASF41
	.byte	0xa
	.byte	0x7a
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF42
	.byte	0xa
	.byte	0x7d
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0
	.uleb128 0x7
	.byte	0x7
	.byte	0xa
	.byte	0x83
	.long	0x218
	.uleb128 0x8
	.long	.LASF43
	.byte	0xa
	.byte	0x85
	.long	0x6d
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF44
	.byte	0xa
	.byte	0x86
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.long	.LASF45
	.byte	0xa
	.byte	0x89
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x8
	.long	.LASF46
	.byte	0xa
	.byte	0x8c
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.byte	0
	.uleb128 0x7
	.byte	0x9
	.byte	0xa
	.byte	0x76
	.long	0x23d
	.uleb128 0x8
	.long	.LASF47
	.byte	0xa
	.byte	0x81
	.long	0x1b2
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF48
	.byte	0xa
	.byte	0x8d
	.long	0x1d7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0
	.uleb128 0x7
	.byte	0x16
	.byte	0xa
	.byte	0x62
	.long	0x262
	.uleb128 0x8
	.long	.LASF49
	.byte	0xa
	.byte	0x73
	.long	0x262
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF50
	.byte	0xa
	.byte	0x90
	.long	0x218
	.byte	0x2
	.byte	0x23
	.uleb128 0xd
	.byte	0
	.uleb128 0x9
	.long	0x116
	.uleb128 0x3
	.long	.LASF51
	.byte	0xa
	.byte	0x93
	.long	0x23d
	.uleb128 0x7
	.byte	0x85
	.byte	0x1
	.byte	0x46
	.long	0x2b5
	.uleb128 0x8
	.long	.LASF52
	.byte	0x1
	.byte	0x48
	.long	0x2b5
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xa
	.string	"In"
	.byte	0x1
	.byte	0x49
	.long	0x2c5
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xa
	.string	"Out"
	.byte	0x1
	.byte	0x4a
	.long	0x2c5
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0x8
	.long	.LASF53
	.byte	0x1
	.byte	0x4b
	.long	0x30
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.byte	0
	.uleb128 0xb
	.long	0x30
	.long	0x2c5
	.uleb128 0xc
	.long	0x8d
	.byte	0x7f
	.byte	0
	.uleb128 0xd
	.byte	0x2
	.long	0x30
	.uleb128 0x3
	.long	.LASF54
	.byte	0x1
	.byte	0x4c
	.long	0x272
	.uleb128 0x7
	.byte	0x3
	.byte	0x3
	.byte	0x2e
	.long	0x309
	.uleb128 0x8
	.long	.LASF55
	.byte	0x3
	.byte	0x30
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF56
	.byte	0x3
	.byte	0x31
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x8
	.long	.LASF57
	.byte	0x3
	.byte	0x32
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0
	.uleb128 0xe
	.long	.LASF60
	.byte	0x2
	.byte	0x44
	.byte	0x1
	.byte	0x3
	.long	0x322
	.uleb128 0xf
	.string	"__s"
	.byte	0x2
	.byte	0x44
	.long	0x322
	.byte	0
	.uleb128 0xd
	.byte	0x2
	.long	0x328
	.uleb128 0x9
	.long	0x30
	.uleb128 0x10
	.long	.LASF99
	.byte	0x2
	.byte	0x30
	.byte	0x1
	.long	0x30
	.byte	0x3
	.uleb128 0x11
	.long	.LASF65
	.byte	0x1
	.byte	0x6b
	.byte	0x1
	.long	0x30
	.byte	0x3
	.long	0x37a
	.uleb128 0x12
	.long	.LASF52
	.byte	0x1
	.byte	0x6b
	.long	0x37a
	.uleb128 0x13
	.long	.LASF53
	.byte	0x1
	.byte	0x6d
	.long	0x30
	.uleb128 0x14
	.uleb128 0x13
	.long	.LASF58
	.byte	0x1
	.byte	0x6f
	.long	0x30
	.uleb128 0x13
	.long	.LASF59
	.byte	0x1
	.byte	0x6f
	.long	0x30
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0x37f
	.uleb128 0xd
	.byte	0x2
	.long	0x2cb
	.uleb128 0x15
	.long	.LASF61
	.byte	0x4
	.word	0x1ec
	.byte	0x1
	.byte	0x3
	.long	0x3a2
	.uleb128 0x14
	.uleb128 0x16
	.long	.LASF62
	.byte	0x4
	.word	0x202
	.long	0x30
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	.LASF63
	.byte	0x5
	.byte	0x8c
	.byte	0x1
	.byte	0x3
	.long	0x3bb
	.uleb128 0x12
	.long	.LASF64
	.byte	0x5
	.byte	0x8c
	.long	0x3bb
	.byte	0
	.uleb128 0x9
	.long	0x10f
	.uleb128 0x11
	.long	.LASF66
	.byte	0x1
	.byte	0x7f
	.byte	0x1
	.long	0x1ab
	.byte	0x3
	.long	0x3dd
	.uleb128 0x12
	.long	.LASF52
	.byte	0x1
	.byte	0x7f
	.long	0x37a
	.byte	0
	.uleb128 0x11
	.long	.LASF67
	.byte	0x1
	.byte	0x90
	.byte	0x1
	.long	0x1ab
	.byte	0x3
	.long	0x3fa
	.uleb128 0x12
	.long	.LASF52
	.byte	0x1
	.byte	0x90
	.long	0x37a
	.byte	0
	.uleb128 0xe
	.long	.LASF68
	.byte	0x5
	.byte	0x63
	.byte	0x1
	.byte	0x3
	.long	0x41e
	.uleb128 0x12
	.long	.LASF69
	.byte	0x5
	.byte	0x63
	.long	0x41e
	.uleb128 0x12
	.long	.LASF70
	.byte	0x5
	.byte	0x64
	.long	0x423
	.byte	0
	.uleb128 0x9
	.long	0x6d
	.uleb128 0x9
	.long	0x1ab
	.uleb128 0x17
	.long	.LASF100
	.byte	0x1
	.byte	0x9e
	.byte	0x1
	.long	.LFB75
	.long	.LFE75
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x4af
	.uleb128 0x18
	.long	.LASF52
	.byte	0x1
	.byte	0x9e
	.long	0x37a
	.long	.LLST0
	.uleb128 0x19
	.long	.LASF71
	.byte	0x1
	.byte	0x9f
	.long	0x328
	.byte	0x1
	.byte	0x66
	.uleb128 0x1a
	.long	.LBB34
	.long	.LBE34
	.uleb128 0x1b
	.long	.LASF58
	.byte	0x1
	.byte	0xa6
	.long	0x30
	.byte	0x1
	.byte	0x62
	.uleb128 0x1c
	.long	.LASF59
	.byte	0x1
	.byte	0xa6
	.long	0x30
	.long	.LLST1
	.uleb128 0x1d
	.long	0x32d
	.long	.LBB35
	.long	.LBE35
	.byte	0x1
	.byte	0xa6
	.uleb128 0x1e
	.long	0x309
	.long	.LBB37
	.long	.LBE37
	.byte	0x1
	.byte	0xa6
	.uleb128 0x1f
	.long	0x316
	.byte	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1126
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	.LASF101
	.byte	0x1
	.byte	0xb6
	.byte	0x1
	.long	0x30
	.long	.LFB76
	.long	.LFE76
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x53a
	.uleb128 0x18
	.long	.LASF52
	.byte	0x1
	.byte	0xb6
	.long	0x37a
	.long	.LLST2
	.uleb128 0x1b
	.long	.LASF71
	.byte	0x1
	.byte	0xb8
	.long	0x30
	.byte	0x1
	.byte	0x62
	.uleb128 0x1a
	.long	.LBB39
	.long	.LBE39
	.uleb128 0x1b
	.long	.LASF58
	.byte	0x1
	.byte	0xbd
	.long	0x30
	.byte	0x1
	.byte	0x63
	.uleb128 0x1c
	.long	.LASF59
	.byte	0x1
	.byte	0xbd
	.long	0x30
	.long	.LLST3
	.uleb128 0x1d
	.long	0x32d
	.long	.LBB40
	.long	.LBE40
	.byte	0x1
	.byte	0xbd
	.uleb128 0x1e
	.long	0x309
	.long	.LBB42
	.long	.LBE42
	.byte	0x1
	.byte	0xbd
	.uleb128 0x1f
	.long	0x316
	.byte	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1265
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	.LASF102
	.byte	0x6
	.byte	0x43
	.byte	0x1
	.byte	0x3
	.uleb128 0x22
	.byte	0x1
	.long	.LASF78
	.byte	0x3
	.byte	0x8b
	.byte	0x1
	.long	.LFB90
	.long	.LFE90
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x5ba
	.uleb128 0x23
	.long	0x385
	.long	.LBB50
	.long	.LBE50
	.byte	0x3
	.byte	0x8f
	.long	0x580
	.uleb128 0x1a
	.long	.LBB51
	.long	.LBE51
	.uleb128 0x24
	.long	0x394
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	0x3fa
	.long	.LBB52
	.long	.LBE52
	.byte	0x3
	.byte	0x92
	.long	0x5a1
	.uleb128 0x25
	.long	0x407
	.word	0x2580
	.uleb128 0x26
	.long	0x412
	.byte	0
	.byte	0
	.uleb128 0x1d
	.long	0x53a
	.long	.LBB54
	.long	.LBE54
	.byte	0x3
	.byte	0x93
	.uleb128 0x27
	.long	.LVL12
	.long	0xb84
	.byte	0
	.uleb128 0xe
	.long	.LASF72
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.byte	0x3
	.long	0x5eb
	.uleb128 0x12
	.long	.LASF52
	.byte	0x1
	.byte	0x55
	.long	0x37a
	.uleb128 0x14
	.uleb128 0x13
	.long	.LASF58
	.byte	0x1
	.byte	0x57
	.long	0x30
	.uleb128 0x13
	.long	.LASF59
	.byte	0x1
	.byte	0x57
	.long	0x30
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	.LASF73
	.byte	0x6
	.byte	0x49
	.byte	0x1
	.byte	0x3
	.long	0x604
	.uleb128 0x12
	.long	.LASF74
	.byte	0x6
	.byte	0x49
	.long	0x328
	.byte	0
	.uleb128 0xe
	.long	.LASF75
	.byte	0x6
	.byte	0x4e
	.byte	0x1
	.byte	0x3
	.long	0x61d
	.uleb128 0x12
	.long	.LASF74
	.byte	0x6
	.byte	0x4e
	.long	0x328
	.byte	0
	.uleb128 0x28
	.byte	0x1
	.long	.LASF103
	.byte	0x3
	.byte	0x50
	.byte	0x1
	.long	0x4d
	.long	.LFB89
	.long	.LFE89
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0xa10
	.uleb128 0x23
	.long	0x5ba
	.long	.LBB107
	.long	.LBE107
	.byte	0x3
	.byte	0x54
	.long	0x69f
	.uleb128 0x1f
	.long	0x5c7
	.byte	0x6
	.byte	0x3
	.long	USBtoUSART_Buffer
	.byte	0x9f
	.uleb128 0x1a
	.long	.LBB108
	.long	.LBE108
	.uleb128 0x29
	.long	0x5d3
	.long	.LLST4
	.uleb128 0x29
	.long	0x5de
	.long	.LLST5
	.uleb128 0x1d
	.long	0x32d
	.long	.LBB109
	.long	.LBE109
	.byte	0x1
	.byte	0x57
	.uleb128 0x1e
	.long	0x309
	.long	.LBB111
	.long	.LBE111
	.byte	0x1
	.byte	0x57
	.uleb128 0x2a
	.long	0x316
	.long	.LLST6
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	0x5ba
	.long	.LBB113
	.long	.LBE113
	.byte	0x3
	.byte	0x55
	.long	0x703
	.uleb128 0x1f
	.long	0x5c7
	.byte	0x6
	.byte	0x3
	.long	USARTtoUSB_Buffer
	.byte	0x9f
	.uleb128 0x1a
	.long	.LBB114
	.long	.LBE114
	.uleb128 0x29
	.long	0x5d3
	.long	.LLST7
	.uleb128 0x29
	.long	0x5de
	.long	.LLST8
	.uleb128 0x1d
	.long	0x32d
	.long	.LBB115
	.long	.LBE115
	.byte	0x1
	.byte	0x57
	.uleb128 0x1e
	.long	0x309
	.long	.LBB117
	.long	.LBE117
	.byte	0x1
	.byte	0x57
	.uleb128 0x2a
	.long	0x316
	.long	.LLST9
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2b
	.long	.LBB119
	.long	.LBE119
	.long	0xa06
	.uleb128 0x1c
	.long	.LASF76
	.byte	0x3
	.byte	0x66
	.long	0x30
	.long	.LLST10
	.uleb128 0x23
	.long	0x3c0
	.long	.LBB120
	.long	.LBE120
	.byte	0x3
	.byte	0x5c
	.long	0x7ab
	.uleb128 0x1f
	.long	0x3d1
	.byte	0x6
	.byte	0x3
	.long	USBtoUSART_Buffer
	.byte	0x9f
	.uleb128 0x1e
	.long	0x33a
	.long	.LBB121
	.long	.LBE121
	.byte	0x1
	.byte	0x81
	.uleb128 0x2c
	.long	0x34b
	.uleb128 0x1a
	.long	.LBB122
	.long	.LBE122
	.uleb128 0x29
	.long	0x356
	.long	.LLST11
	.uleb128 0x1a
	.long	.LBB123
	.long	.LBE123
	.uleb128 0x29
	.long	0x362
	.long	.LLST12
	.uleb128 0x29
	.long	0x36d
	.long	.LLST13
	.uleb128 0x1d
	.long	0x32d
	.long	.LBB124
	.long	.LBE124
	.byte	0x1
	.byte	0x6f
	.uleb128 0x1e
	.long	0x309
	.long	.LBB126
	.long	.LBE126
	.byte	0x1
	.byte	0x6f
	.uleb128 0x2a
	.long	0x316
	.long	.LLST14
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2b
	.long	.LBB128
	.long	.LBE128
	.long	0x7fc
	.uleb128 0x1c
	.long	.LASF77
	.byte	0x3
	.byte	0x5e
	.long	0x42
	.long	.LLST15
	.uleb128 0x2d
	.long	.LVL27
	.long	0xb8f
	.long	0x7e3
	.uleb128 0x2e
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	VirtualSerial_CDC_Interface
	.byte	0
	.uleb128 0x2f
	.long	.LVL29
	.long	0x428
	.uleb128 0x2e
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	USBtoUSART_Buffer
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	0x33a
	.long	.LBB129
	.long	.LBE129
	.byte	0x3
	.byte	0x66
	.long	0x86c
	.uleb128 0x2c
	.long	0x34b
	.uleb128 0x1a
	.long	.LBB130
	.long	.LBE130
	.uleb128 0x29
	.long	0x356
	.long	.LLST16
	.uleb128 0x1a
	.long	.LBB131
	.long	.LBE131
	.uleb128 0x29
	.long	0x362
	.long	.LLST17
	.uleb128 0x29
	.long	0x36d
	.long	.LLST18
	.uleb128 0x1d
	.long	0x32d
	.long	.LBB132
	.long	.LBE132
	.byte	0x1
	.byte	0x6f
	.uleb128 0x1e
	.long	0x309
	.long	.LBB134
	.long	.LBE134
	.byte	0x1
	.byte	0x6f
	.uleb128 0x2a
	.long	0x316
	.long	.LLST19
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	0x5eb
	.long	.LBB136
	.long	.LBE136
	.byte	0x3
	.byte	0x6c
	.long	0x889
	.uleb128 0x2a
	.long	0x5f8
	.long	.LLST20
	.byte	0
	.uleb128 0x23
	.long	0x604
	.long	.LBB138
	.long	.LBE138
	.byte	0x3
	.byte	0x76
	.long	0x8a6
	.uleb128 0x2a
	.long	0x611
	.long	.LLST21
	.byte	0
	.uleb128 0x23
	.long	0x604
	.long	.LBB140
	.long	.LBE140
	.byte	0x3
	.byte	0x7a
	.long	0x8c3
	.uleb128 0x2a
	.long	0x611
	.long	.LLST22
	.byte	0
	.uleb128 0x23
	.long	0x3dd
	.long	.LBB142
	.long	.LBE142
	.byte	0x3
	.byte	0x7e
	.long	0x952
	.uleb128 0x1f
	.long	0x3ee
	.byte	0x6
	.byte	0x3
	.long	USBtoUSART_Buffer
	.byte	0x9f
	.uleb128 0x1e
	.long	0x33a
	.long	.LBB143
	.long	.LBE143
	.byte	0x1
	.byte	0x92
	.uleb128 0x2c
	.long	0x34b
	.uleb128 0x1a
	.long	.LBB144
	.long	.LBE144
	.uleb128 0x29
	.long	0x356
	.long	.LLST23
	.uleb128 0x1a
	.long	.LBB145
	.long	.LBE145
	.uleb128 0x29
	.long	0x362
	.long	.LLST24
	.uleb128 0x29
	.long	0x36d
	.long	.LLST25
	.uleb128 0x1d
	.long	0x32d
	.long	.LBB146
	.long	.LBE146
	.byte	0x1
	.byte	0x6f
	.uleb128 0x1e
	.long	0x309
	.long	.LBB148
	.long	.LBE148
	.byte	0x1
	.byte	0x6f
	.uleb128 0x1f
	.long	0x316
	.byte	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2321
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	0x3a2
	.long	.LBB150
	.long	.LBE150
	.byte	0x3
	.byte	0x7f
	.long	0x96f
	.uleb128 0x2a
	.long	0x3af
	.long	.LLST26
	.byte	0
	.uleb128 0x23
	.long	0x5eb
	.long	.LBB152
	.long	.LBE152
	.byte	0x3
	.byte	0x81
	.long	0x98c
	.uleb128 0x2a
	.long	0x5f8
	.long	.LLST27
	.byte	0
	.uleb128 0x2d
	.long	.LVL36
	.long	0x4af
	.long	0x9a8
	.uleb128 0x2e
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	USARTtoUSB_Buffer
	.byte	0
	.uleb128 0x2d
	.long	.LVL37
	.long	0xba8
	.long	0x9c4
	.uleb128 0x2e
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	VirtualSerial_CDC_Interface
	.byte	0
	.uleb128 0x2d
	.long	.LVL48
	.long	0x4af
	.long	0x9e0
	.uleb128 0x2e
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	USBtoUSART_Buffer
	.byte	0
	.uleb128 0x2d
	.long	.LVL51
	.long	0xbc5
	.long	0x9fc
	.uleb128 0x2e
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	VirtualSerial_CDC_Interface
	.byte	0
	.uleb128 0x27
	.long	.LVL52
	.long	0xbd9
	.byte	0
	.uleb128 0x27
	.long	.LVL13
	.long	0x543
	.byte	0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF79
	.byte	0x3
	.byte	0x9f
	.byte	0x1
	.long	.LFB91
	.long	.LFE91
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0xa44
	.uleb128 0x30
	.long	.LVL53
	.byte	0x1
	.long	0xbe3
	.uleb128 0x2e
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	VirtualSerial_CDC_Interface
	.byte	0
	.byte	0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF80
	.byte	0x3
	.byte	0xa5
	.byte	0x1
	.long	.LFB92
	.long	.LFE92
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0xa78
	.uleb128 0x30
	.long	.LVL54
	.byte	0x1
	.long	0xbfb
	.uleb128 0x2e
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	VirtualSerial_CDC_Interface
	.byte	0
	.byte	0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF81
	.byte	0x3
	.byte	0xae
	.byte	0x1
	.long	.LFB93
	.long	.LFE93
	.long	.LLST28
	.byte	0x1
	.long	0xab1
	.uleb128 0x18
	.long	.LASF82
	.byte	0x3
	.byte	0xae
	.long	0xab1
	.long	.LLST29
	.uleb128 0x1c
	.long	.LASF83
	.byte	0x3
	.byte	0xb0
	.long	0x30
	.long	.LLST30
	.byte	0
	.uleb128 0x9
	.long	0xab6
	.uleb128 0xd
	.byte	0x2
	.long	0x267
	.uleb128 0x31
	.byte	0x1
	.long	.LASF84
	.byte	0x3
	.byte	0xde
	.byte	0x1
	.long	.LFB94
	.long	.LFE94
	.long	.LLST31
	.byte	0x1
	.long	0xafe
	.uleb128 0x1c
	.long	.LASF77
	.byte	0x3
	.byte	0xe0
	.long	0x30
	.long	.LLST32
	.uleb128 0x2f
	.long	.LVL68
	.long	0x428
	.uleb128 0x2e
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	USARTtoUSB_Buffer
	.byte	0
	.byte	0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF85
	.byte	0x3
	.byte	0xea
	.byte	0x1
	.long	.LFB95
	.long	.LFE95
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0xb37
	.uleb128 0x18
	.long	.LASF82
	.byte	0x3
	.byte	0xea
	.long	0xab1
	.long	.LLST33
	.uleb128 0x1c
	.long	.LASF86
	.byte	0x3
	.byte	0xec
	.long	0x1ab
	.long	.LLST34
	.byte	0
	.uleb128 0x32
	.long	.LASF87
	.byte	0x3
	.byte	0x28
	.long	0x2cb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	USBtoUSART_Buffer
	.uleb128 0x32
	.long	.LASF88
	.byte	0x3
	.byte	0x2b
	.long	0x2cb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	USARTtoUSB_Buffer
	.uleb128 0x32
	.long	.LASF89
	.byte	0x3
	.byte	0x33
	.long	0xb6d
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	PulseMSRemaining
	.uleb128 0x33
	.long	0x2d6
	.uleb128 0x32
	.long	.LASF90
	.byte	0x3
	.byte	0x39
	.long	0x267
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	VirtualSerial_CDC_Interface
	.uleb128 0x34
	.byte	0x1
	.long	.LASF93
	.byte	0xb
	.word	0x123
	.byte	0x1
	.byte	0x1
	.uleb128 0x35
	.byte	0x1
	.long	.LASF91
	.byte	0xa
	.word	0x106
	.byte	0x1
	.long	0x42
	.byte	0x1
	.long	0xba8
	.uleb128 0x36
	.long	0xab1
	.byte	0
	.uleb128 0x37
	.byte	0x1
	.long	.LASF92
	.byte	0xa
	.byte	0xe9
	.byte	0x1
	.long	0x30
	.byte	0x1
	.long	0xbc5
	.uleb128 0x36
	.long	0xab1
	.uleb128 0x36
	.long	0x328
	.byte	0
	.uleb128 0x38
	.byte	0x1
	.long	.LASF104
	.byte	0xa
	.byte	0xac
	.byte	0x1
	.byte	0x1
	.long	0xbd9
	.uleb128 0x36
	.long	0xab1
	.byte	0
	.uleb128 0x39
	.byte	0x1
	.long	.LASF94
	.byte	0xc
	.byte	0xb2
	.byte	0x1
	.byte	0x1
	.uleb128 0x37
	.byte	0x1
	.long	.LASF95
	.byte	0xa
	.byte	0x9e
	.byte	0x1
	.long	0x1ab
	.byte	0x1
	.long	0xbfb
	.uleb128 0x36
	.long	0xab1
	.byte	0
	.uleb128 0x3a
	.byte	0x1
	.long	.LASF105
	.byte	0xa
	.byte	0xa5
	.byte	0x1
	.byte	0x1
	.uleb128 0x36
	.long	0xab1
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x1d
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0xc
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LVL0
	.long	.LVL3
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL3
	.long	.LFE75
	.word	0x4
	.byte	0x8e
	.sleb128 -132
	.byte	0x9f
	.long	0
	.long	0
.LLST1:
	.long	.LVL2
	.long	.LVL4
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL4
	.long	.LFE75
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST2:
	.long	.LVL5
	.long	.LVL10
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL10
	.long	.LFE76
	.word	0x4
	.byte	0x8e
	.sleb128 -132
	.byte	0x9f
	.long	0
	.long	0
.LLST3:
	.long	.LVL8
	.long	.LVL9
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL9
	.long	.LFE76
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST4:
	.long	.LVL14
	.long	.LVL18
	.word	0x1
	.byte	0x62
	.long	.LVL18
	.long	.LVL21
	.word	0x2
	.byte	0x8
	.byte	0x5f
	.long	0
	.long	0
.LLST5:
	.long	.LVL15
	.long	.LVL16
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL16
	.long	.LFE89
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST6:
	.long	.LVL16
	.long	.LVL20
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1635
	.sleb128 0
	.long	.LVL20
	.long	.LVL22
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1735
	.sleb128 0
	.long	.LVL25
	.long	.LVL32
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1901
	.sleb128 0
	.long	.LVL32
	.long	.LVL46
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2095
	.sleb128 0
	.long	.LVL46
	.long	.LFE89
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2321
	.sleb128 0
	.long	0
	.long	0
.LLST7:
	.long	.LVL18
	.long	.LVL22
	.word	0x1
	.byte	0x62
	.long	0
	.long	0
.LLST8:
	.long	.LVL19
	.long	.LVL20
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL20
	.long	.LFE89
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST9:
	.long	.LVL20
	.long	.LVL22
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1735
	.sleb128 0
	.long	.LVL25
	.long	.LVL32
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1901
	.sleb128 0
	.long	.LVL32
	.long	.LVL46
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2095
	.sleb128 0
	.long	.LVL46
	.long	.LFE89
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2321
	.sleb128 0
	.long	0
	.long	0
.LLST10:
	.long	.LVL35
	.long	.LVL38
	.word	0x3
	.byte	0x8c
	.sleb128 -1
	.byte	0x9f
	.long	.LVL38
	.long	.LVL39
	.word	0x1
	.byte	0x6c
	.long	.LVL39
	.long	.LVL43
	.word	0x3
	.byte	0x8c
	.sleb128 -1
	.byte	0x9f
	.long	0
	.long	0
.LLST11:
	.long	.LVL25
	.long	.LVL26
	.word	0x1
	.byte	0x68
	.long	.LVL26
	.long	.LVL27-1
	.word	0x5
	.byte	0x3
	.long	USBtoUSART_Buffer+132
	.long	0
	.long	0
.LLST12:
	.long	.LVL23
	.long	.LVL27-1
	.word	0x1
	.byte	0x69
	.long	0
	.long	0
.LLST13:
	.long	.LVL24
	.long	.LVL25
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL25
	.long	.LFE89
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST14:
	.long	.LVL25
	.long	.LVL32
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1901
	.sleb128 0
	.long	.LVL32
	.long	.LVL46
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2095
	.sleb128 0
	.long	.LVL46
	.long	.LFE89
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2321
	.sleb128 0
	.long	0
	.long	0
.LLST15:
	.long	.LVL27
	.long	.LVL28
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST16:
	.long	.LVL32
	.long	.LVL35
	.word	0x1
	.byte	0x6c
	.long	0
	.long	0
.LLST17:
	.long	.LVL30
	.long	.LVL33
	.word	0x1
	.byte	0x68
	.long	.LVL33
	.long	.LVL35
	.word	0x2
	.byte	0x8
	.byte	0x5f
	.long	0
	.long	0
.LLST18:
	.long	.LVL31
	.long	.LVL32
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL32
	.long	.LFE89
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST19:
	.long	.LVL32
	.long	.LVL46
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2095
	.sleb128 0
	.long	.LVL46
	.long	.LFE89
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2321
	.sleb128 0
	.long	0
	.long	0
.LLST20:
	.long	.LVL34
	.long	.LVL35
	.word	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.long	0
	.long	0
.LLST21:
	.long	.LVL40
	.long	.LVL41
	.word	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.long	0
	.long	0
.LLST22:
	.long	.LVL42
	.long	.LVL43
	.word	0x2
	.byte	0x40
	.byte	0x9f
	.long	0
	.long	0
.LLST23:
	.long	.LVL46
	.long	.LVL47
	.word	0x1
	.byte	0x68
	.long	.LVL47
	.long	.LVL48-1
	.word	0x5
	.byte	0x3
	.long	USBtoUSART_Buffer+132
	.long	0
	.long	0
.LLST24:
	.long	.LVL44
	.long	.LVL48-1
	.word	0x1
	.byte	0x69
	.long	0
	.long	0
.LLST25:
	.long	.LVL45
	.long	.LVL46
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL46
	.long	.LFE89
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST26:
	.long	.LVL48
	.long	.LVL50
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST27:
	.long	.LVL49
	.long	.LVL50
	.word	0x2
	.byte	0x40
	.byte	0x9f
	.long	0
	.long	0
.LLST28:
	.long	.LFB93
	.long	.LCFI0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI0
	.long	.LCFI1
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI1
	.long	.LCFI2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI2
	.long	.LFE93
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	0
	.long	0
.LLST29:
	.long	.LVL55
	.long	.LVL57
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL57
	.long	.LVL66
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL66
	.long	.LFE93
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST30:
	.long	.LVL56
	.long	.LVL58
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL58
	.long	.LVL59
	.word	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.long	.LVL59
	.long	.LVL60
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL60
	.long	.LVL65
	.word	0x1
	.byte	0x6c
	.long	0
	.long	0
.LLST31:
	.long	.LFB94
	.long	.LCFI3
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI3
	.long	.LCFI4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI4
	.long	.LCFI5
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI5
	.long	.LCFI6
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI6
	.long	.LCFI7
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI7
	.long	.LCFI8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI8
	.long	.LCFI9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	.LCFI9
	.long	.LCFI10
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 9
	.long	.LCFI10
	.long	.LCFI11
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 10
	.long	.LCFI11
	.long	.LCFI12
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 11
	.long	.LCFI12
	.long	.LCFI13
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 12
	.long	.LCFI13
	.long	.LCFI14
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 13
	.long	.LCFI14
	.long	.LCFI15
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 14
	.long	.LCFI15
	.long	.LCFI16
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 15
	.long	.LCFI16
	.long	.LFE94
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 16
	.long	0
	.long	0
.LLST32:
	.long	.LVL67
	.long	.LVL68-1
	.word	0x1
	.byte	0x66
	.long	0
	.long	0
.LLST33:
	.long	.LVL69
	.long	.LVL70
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL70
	.long	.LFE95
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST34:
	.long	.LVL69
	.long	.LVL70
	.word	0x7
	.byte	0x88
	.sleb128 13
	.byte	0x94
	.byte	0x1
	.byte	0x31
	.byte	0x1a
	.byte	0x9f
	.long	.LVL70
	.long	.LFE95
	.word	0x5
	.byte	0x88
	.sleb128 0
	.byte	0x31
	.byte	0x1a
	.byte	0x9f
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x5c
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.LFB75
	.long	.LFE75-.LFB75
	.long	.LFB76
	.long	.LFE76-.LFB76
	.long	.LFB90
	.long	.LFE90-.LFB90
	.long	.LFB89
	.long	.LFE89-.LFB89
	.long	.LFB91
	.long	.LFE91-.LFB91
	.long	.LFB92
	.long	.LFE92-.LFB92
	.long	.LFB93
	.long	.LFE93-.LFB93
	.long	.LFB94
	.long	.LFE94-.LFB94
	.long	.LFB95
	.long	.LFE95-.LFB95
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB75
	.long	.LFE75
	.long	.LFB76
	.long	.LFE76
	.long	.LFB90
	.long	.LFE90
	.long	.LFB89
	.long	.LFE89
	.long	.LFB91
	.long	.LFE91
	.long	.LFB92
	.long	.LFE92
	.long	.LFB93
	.long	.LFE93
	.long	.LFB94
	.long	.LFE94
	.long	.LFB95
	.long	.LFE95
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF61:
	.string	"wdt_disable"
.LASF90:
	.string	"VirtualSerial_CDC_Interface"
.LASF102:
	.string	"LEDs_Init"
.LASF99:
	.string	"__iCliRetVal"
.LASF84:
	.string	"__vector_23"
.LASF10:
	.string	"long long unsigned int"
.LASF67:
	.string	"RingBuffer_IsEmpty"
.LASF12:
	.string	"DEVICE_STATE_Unattached"
.LASF14:
	.string	"DEVICE_STATE_Default"
.LASF3:
	.string	"int16_t"
.LASF9:
	.string	"long long int"
.LASF0:
	.string	"signed char"
.LASF43:
	.string	"BaudRateBPS"
.LASF91:
	.string	"CDC_Device_ReceiveByte"
.LASF69:
	.string	"BaudRate"
.LASF24:
	.string	"CDC_PARITY_None"
.LASF68:
	.string	"Serial_Init"
.LASF6:
	.string	"long int"
.LASF56:
	.string	"RxLEDPulse"
.LASF55:
	.string	"TxLEDPulse"
.LASF44:
	.string	"CharFormat"
.LASF36:
	.string	"DataOUTEndpointDoubleBank"
.LASF4:
	.string	"uint16_t"
.LASF18:
	.string	"USB_Device_States_t"
.LASF31:
	.string	"DataINEndpointNumber"
.LASF74:
	.string	"LEDMask"
.LASF42:
	.string	"DeviceToHost"
.LASF59:
	.string	"__ToDo"
.LASF5:
	.string	"unsigned int"
.LASF88:
	.string	"USARTtoUSB_Buffer"
.LASF92:
	.string	"CDC_Device_SendByte"
.LASF28:
	.string	"CDC_PARITY_Space"
.LASF8:
	.string	"long unsigned int"
.LASF19:
	.string	"CDC_LineEncodingFormats_t"
.LASF27:
	.string	"CDC_PARITY_Mark"
.LASF58:
	.string	"sreg_save"
.LASF20:
	.string	"CDC_LINEENCODING_OneStopBit"
.LASF62:
	.string	"temp_reg"
.LASF73:
	.string	"LEDs_TurnOnLEDs"
.LASF16:
	.string	"DEVICE_STATE_Configured"
.LASF23:
	.string	"CDC_LineEncodingParity_t"
.LASF49:
	.string	"Config"
.LASF101:
	.string	"RingBuffer_Remove"
.LASF100:
	.string	"RingBuffer_Insert"
.LASF35:
	.string	"DataOUTEndpointSize"
.LASF17:
	.string	"DEVICE_STATE_Suspended"
.LASF30:
	.string	"ControlInterfaceNumber"
.LASF25:
	.string	"CDC_PARITY_Odd"
.LASF66:
	.string	"RingBuffer_IsFull"
.LASF32:
	.string	"DataINEndpointSize"
.LASF105:
	.string	"CDC_Device_ProcessControlRequest"
.LASF11:
	.string	"sizetype"
.LASF34:
	.string	"DataOUTEndpointNumber"
.LASF53:
	.string	"Count"
.LASF22:
	.string	"CDC_LINEENCODING_TwoStopBits"
.LASF93:
	.string	"USB_Init"
.LASF37:
	.string	"NotificationEndpointNumber"
.LASF15:
	.string	"DEVICE_STATE_Addressed"
.LASF13:
	.string	"DEVICE_STATE_Powered"
.LASF33:
	.string	"DataINEndpointDoubleBank"
.LASF77:
	.string	"ReceivedByte"
.LASF83:
	.string	"ConfigMask"
.LASF78:
	.string	"SetupHardware"
.LASF104:
	.string	"CDC_Device_USBTask"
.LASF76:
	.string	"BufferCount"
.LASF40:
	.string	"_Bool"
.LASF1:
	.string	"unsigned char"
.LASF80:
	.string	"EVENT_USB_Device_UnhandledControlRequest"
.LASF70:
	.string	"DoubleSpeed"
.LASF38:
	.string	"NotificationEndpointSize"
.LASF65:
	.string	"RingBuffer_GetCount"
.LASF75:
	.string	"LEDs_TurnOffLEDs"
.LASF7:
	.string	"uint32_t"
.LASF26:
	.string	"CDC_PARITY_Even"
.LASF94:
	.string	"USB_USBTask"
.LASF29:
	.string	"char"
.LASF95:
	.string	"CDC_Device_ConfigureEndpoints"
.LASF50:
	.string	"State"
.LASF86:
	.string	"CurrentDTRState"
.LASF87:
	.string	"USBtoUSART_Buffer"
.LASF21:
	.string	"CDC_LINEENCODING_OneAndAHalfStopBits"
.LASF85:
	.string	"EVENT_CDC_Device_ControLineStateChanged"
.LASF57:
	.string	"PingPongLEDPulse"
.LASF47:
	.string	"ControlLineStates"
.LASF89:
	.string	"PulseMSRemaining"
.LASF60:
	.string	"__iRestore"
.LASF72:
	.string	"RingBuffer_InitBuffer"
.LASF54:
	.string	"RingBuff_t"
.LASF97:
	.string	"Arduino-usbserial.c"
.LASF48:
	.string	"LineEncoding"
.LASF52:
	.string	"Buffer"
.LASF98:
	.string	"C:\\Users\\Julien\\Desktop\\temp\\arduino_usbserial_TEST\\LUFA 100807\\Projects\\arduino-usbserial"
.LASF46:
	.string	"DataBits"
.LASF2:
	.string	"uint8_t"
.LASF71:
	.string	"Data"
.LASF39:
	.string	"NotificationEndpointDoubleBank"
.LASF79:
	.string	"EVENT_USB_Device_ConfigurationChanged"
.LASF82:
	.string	"CDCInterfaceInfo"
.LASF45:
	.string	"ParityType"
.LASF81:
	.string	"EVENT_CDC_Device_LineEncodingChanged"
.LASF64:
	.string	"DataByte"
.LASF103:
	.string	"main"
.LASF96:
	.string	"GNU C 4.9.2 -mn-flash=1 -mno-skip-bug -mmcu=avr35 -gdwarf-2 -Os -std=gnu99 -funsigned-char -funsigned-bitfields -ffunction-sections -fno-inline-small-functions -fpack-struct -fshort-enums -fno-strict-aliasing"
.LASF63:
	.string	"Serial_TxByte"
.LASF51:
	.string	"USB_ClassInfo_CDC_Device_t"
.LASF41:
	.string	"HostToDevice"
	.ident	"GCC: (GNU) 4.9.2"
.global __do_copy_data
.global __do_clear_bss
