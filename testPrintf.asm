SECTION .data	;here are arguments defined
format		db	'Integer data:%d',10,'String data:%s',10,'Float data:%e',10,0
integer_data	dd	12
string_data	db	'Today',0	;C always counts that string is terminated with 0
float_data	dq	5.3

SECTION .text
global main
extern printf		;import 
main:
;store values of registers
PUSH	EBP
MOV	EBP,ESP
PUSH	EBX
PUSH	ESI
PUSH	EDI

;storage arguments to stack
;rule: all arguments has to be same size on stack, since we have addresses (pointers) size will be 32b
PUSH	DWORD[float_data+4]	;always higher part first!
PUSH	DWORD[float_data]
PUSH	string_data	;push address(pointer)
PUSH	DWORD[integer_data]
PUSH 	format
CALL	printf

ADD 	ESP,20		;clean stack

;load values of registers
POP	EDI
POP	ESI
POP	EBX
MOV	ESP,EBP
POP	EBP

ret