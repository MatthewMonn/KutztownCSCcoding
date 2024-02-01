; 
; Find first 25 Fibonacci numbers
; print them in reverse order
; 
; Name: Matthew Monn

include Irvine32.inc

.data
	total = 25										; number of values for array. 	
	arrayFib DWORD 2 DUP(1), total-2 DUP(?)			; array of 32 bits that sets the first two values to one and the rest to uninitialized.
	
.code
main PROC
	mov esi, OFFSET arrayFib + 2 * TYPE arrayFib	; points towards the memory of the array in esi for viewing. 
	mov ecx, total									; ecx is used to decrement the loop, in this case its total for all 25 values in array. 
	mov eax, 1										; move the first value of 1 into the eax register
	mov ebx, 1										; move the second value of 1 into the ebx register. 

compute_fibonacci:									; computing fibonacci loop
	add eax, ebx									; adds the two registers values into eax register.
	mov [esi], eax									; moves the computed value into the array's current position through esi. 
	mov ebx , [esi - TYPE arrayFib]					; sets the previous value of the sequence to ebx by going 4 bytes back in the array.
	add esi, TYPE arrayFib							; sets esi to next 4 byte memory location for next number. 
	loop compute_fibonacci

    call Crlf										; next line (from Irvine)
	mov esi, OFFSET arrayFib + (total-1) * 4		; starts from the last position of the array memory location. 
	mov ecx, total									; moves the total back into the ecx for print loop. 

	Print_Fib:										; loop for printing. 
	mov eax, [esi]									; moves the array into eax for manipulation/ printing. 
	call WriteDec									; print it out (from Irvine)
	call Crlf										; next line (from Irvine)
	sub esi, 4										; subtracts the list by 4 Bytes to reach the next value in reverse order of array. 
	loop Print_Fib										
		
	call WaitMsg									; wait for user to hit enter (from Irvine)						
	invoke ExitProcess, 0                           ; 'bye

main ENDP
END main