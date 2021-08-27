;Program #1
;By Robert jun1219@calu.edu , Luke tin2093@calu.edu , Josh vit8629@calu.edu
;course CSC 323: Assembly Language Programming
INCLUDE Irvine32.inc

.data 

	;messages

	message  byte "Enter A Grade 0-100: ",0					;creates a variable named message to say Enter Grade:
	message2 byte "Your average Grade is: ",0				;message for final answer
	message3 byte "The sum of Your Grades are: ",0			;message for sum		
	message4 byte "The count of grades you have: ",0		;message for count
	message5 byte " ! Invalid Grade Entered ! ",0			;message for invalid grade
		
	;variables

	max = 100											;creates max = 100
	min = 0												;creates min = 0
	count SDWORD 0										;count holder
	answer SDWORD ?										;space for the final answer
	sum SDWORD 0										;space for sum of grades

.code		
main PROC

target:

	;receieves input from user

	mov edx, OFFSET message							;prints mesage
	call WriteString								;says enter grade
	call ReadInt									;reads input from user

	;if statement for greater then 100

	CMP eax, max									;compare eax to max
	JLE target2										;if eax <= max then go to target 2
	jmp target4										;if eax !<= max then go to final
	
target2:
	
	;if statement for less then 0
	
	CMP eax, min									;compare eax to min
	JGE target3										;if eax >= min then go to target 3
	jmp target4										;if eax !>= min then go to final
	
target3:
	
	;adds eax to sum

	add sum, eax									;add eax to sum
	mov eax, sum									;moves eax to sum

	;adds 1 to count

	mov eax, count									;moves count to eax
	add eax, 1										;add 1 to count

	;jumps back to begining

	mov count, eax									;move ebx to count
	jmp target										;goes to target
	
target4:
	
	;error message

	mov edx, OFFSET message5						;points to message5 
	call WriteString								;prints invalid grade 
	call Crlf										;calls for end of line
	
	;divsion

	mov edx, 0										;clears edx
	mov ecx, 0										;clears ecx
	mov eax, sum									;moves sum to eax
	mov ecx, count									;moves count to ecx
	div ecx											;eax= sum / count
	
	;final displays

	mov edx, OFFSET message2						;points to message2
	call WriteString								;prints message2
	mov answer, eax									;moves answer to eax
	mov edx, OFFSET answer							;points to answer
	call WriteInt									;prints answer
	call Crlf										;calls for end of line
	
	mov eax, sum									;moves sum to eax
	mov edx, OFFSET message3						;points to message3
	call WriteString								;prints message3
	mov edx, OFFSET sum								;points to sum
	call WriteInt									;prints sum
	call Crlf										;calls for end of line

	mov eax, count									;moves sum to eax
	mov edx, OFFSET message4						;points to message4
	call WriteString								;prints message4
	mov edx, OFFSET count							;points to count
	call WriteInt									;prints count
	call Crlf										;calls for end of line

exit
main endp
end main
