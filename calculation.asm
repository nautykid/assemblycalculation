; Arithmatic Calculation


INCLUDE Irvine32.inc

; .data is used for declaring and defining variables
.data
num1			DWORD ?
num2			DWORD ?
codeTitle		BYTE "  ---------  This program will calculate arithmetic operation  ---------  ", 0
directions		BYTE "Please enter only integers from 0 to 9", 0
prompt1			BYTE "Enter your First number: ", 0
prompt2			BYTE "Enteer your Second number: ", 0
equals			BYTE " = ", 0
plus			BYTE " + ", 0
subtract		BYTE " - ", 0
multiply		BYTE " * ", 0
divide			BYTE " / ", 0
remaintxt		BYTE " remainder ", 0

total           DWORD ?
subtotal        DWORD ?
multotal        DWORD ?
remainder		DWORD ?
divtotal		DWORD ?

; .code is for the executable part of the program
.code
main PROC
	; Output code title 
		mov		edx, OFFSET codeTitle
		call	WriteString
		call	CrLf

	; Output user to verify directions
		mov		edx, OFFSET directions
		call	WriteString
		call	CrLf

	; Prompt for the first number
		mov		edx, OFFSET prompt1
		call	WriteString
		call	ReadInt
		mov		num1, eax

	; Prompt for the second number
		mov		edx, OFFSET prompt2
		call	WriteString
		call	ReadInt
		mov		num2, eax
	
	; Add the two numbers using the eax registry
		mov		eax, num1
		add		eax, num2
		mov		total, eax


	; Subtract the two numbers using the eax registry
		mov		eax, num1
		sub	    eax, num2
		mov		subtotal, eax

	; Multiply the two number using the eax registry
		mov		eax, num1
		mov		ebx, num2
		imul	ebx
		mov		multotal, eax

	; Divide the numbers 
		mov		eax, num1
		mov		ebx, num2
		xor		edx, edx
		div		ebx
		mov		divtotal , eax
		mov		remainder , edx
		call	CrLf
			
	
	; Print the added total to the console
		; Print num1
		mov		eax, num1
		call	WriteDec
		; Print the plus sign
		mov		edx, OFFSET plus
		call	WriteString
		; Print num2
		mov		eax,  num2
		call	WriteDec
		; Print the equals sign
		mov		edx, OFFSET equals
		call	WriteString
		; Print out the total
		mov		eax, total
		call	WriteDec
		call	CrLf
		call	CrLf

	; Print the subtract total to the console
		; Print num1
		mov		eax, num1
		call	WriteDec
		; Print the subtract sign
		mov		edx, OFFSET subtract
		call	WriteString
		; Print num2
		mov		eax,  num2
		call	WriteDec
		; Print the equals sign
		mov		edx, OFFSET equals
		call	WriteString
		; Print out the total of subtraction
		mov		eax, subtotal
		call	WriteDec
		call	CrLf
		call	CrLf
	
	; Print the multiply total to the console
		; Print num1
		mov		eax, num1
		call	WriteDec
		; Print the multiply sign
		mov		edx, OFFSET multiply
		call	WriteString
		; Print num2
		mov		eax,  num2
		call	WriteDec
		; Print the equals sign
		mov		edx, OFFSET equals
		call	WriteString
		; Print out the total
		mov		eax, multotal
		call	WriteDec
		call	CrLf
		call	CrLf

		
	; Print the division total to the console
		; Print num1
		mov		eax, num1
		call	WriteDec
		; Print the divide sign
		mov		edx, OFFSET divide
		call	WriteString
		; Print num2
		mov		eax,  num2
		call	WriteDec
		; Print the equals sign
		mov		edx, OFFSET equals
		call	WriteString
		; Print out the division total
		mov		eax, divtotal
		call	WriteDec
		mov		edx, OFFSET remaintxt
		call	WriteString
		mov        eax, remainder
		call	WriteDec
		call	CrLf
		call	CrLf

	
	exit	
main ENDP

END main
