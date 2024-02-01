; 
; Load a list of olympians into an array of structs
; print them out, calculating the olympian's total medals
;
; Name: Matthew Monn
; 

include Irvine32.inc

; define some constants
FSIZE = 150											; max file name size
CR = 0Dh											; c/r
LF = 0Ah											; line feed
ASTERISK = 2Ah										; asterisk for new entry
NULL = 00h											; null character
SPACE = 20h											; space character
STRSIZE = 32										; string sizes in struct
NUMTESTS = 3										; number of olympian medals
ROUND = 1											; cutoff for rounding

olympian STRUCT
	sname BYTE STRSIZE DUP('n')						; 32 bytes	
	country BYTE STRSIZE DUP('c')					; 32
	medals DWORD NUMTESTS DUP(0)					; NUMTESTS x 32 
olympian ENDS										; 76 total

.data
filename BYTE FSIZE DUP(?)							; array to hold the file name
fileptr DWORD 0										; the file pointer
prompt1 BYTE "Enter the number of olympians: ",0	; prompt for a string
prompt2 BYTE "Enter a filename: ",0					; prompt for a string
ferror BYTE "Invalid input...",0					; error message
maxnum DWORD 0										; max number of olympians
slistptr DWORD 0									; pointer to olympian list
numread	DWORD 0										; number of olympians loaded
outname  BYTE "Olympian: ",0						; for output listing (these can be used as globals)
outcountry BYTE "Country: ",0
outmedals  BYTE "Medals: ",0

.code
main PROC
	; prompt for the number of olympians 

	Read:
		mov edx,OFFSET prompt1						; set offset to promp1 for number of olympians.
		call WriteString							; writes to terminal from edx. 
		call ReadInt								; returns the user inputted number to EAX if valid
		cmp eax, 0
		je ZeroCase
		jno GoodInput								; error checking. if EAX is zero, non-int number was inputted.
		Call Crlf									; new line.
		jmp Read									; Reprompts user if invalid integer was entered.  

	ZeroCase:
		call Crlf
		mov edx, OFFSET ferror
		call WriteString
		jmp Read

	GoodInput: 
		mov maxnum,eax								;takes integer and stores into maxnum constant.	

	;;;;;;;;;;;;;;;;;;;
	; access the heap and allocate memory for olympian struct array
	;;;;;;;;;;;;;;;;;;

													; prompt for the file name 
	ReadFileA: 
		mov edx,OFFSET prompt2						; output the prompt
		call WriteString							; uses edx 

		; read the file name
		mov edx,OFFSET filename						; point to the start of the file name string
		mov ecx,FSIZE								; max size for file name
		call ReadString								; load the file name (string pointer in edx, max size in ecx)
	
	;;;;;;;;;;;;;;;;;;
	; open the file, get the file pointer
	;;;;;;;;;;;;;;;;;;
	
	mov edx, OFFSET filename						; loads the location of filename into edx.
	call OpenInputFile								; loads the file from edx, if successful, returns file handle in eax.
	cmp eax, INVALID_HANDLE_VALUE					; Error checking file handle.
	je FileOpenFail									; failed to open file function.
	jmp FileSuccess									; file open success function.

	FileOpenFail:									; fail function.
		mov edx, OFFSET ferror						; loads error message into edx.
		call WriteString							; writes error to terminal.
		call  Crlf									; new line.
		jmp ReadFileA								; recalls readfile for user to enter it correctly. 
	
	FileSuccess:									; file success function
		mov [fileptr], eax							; Store the file pointer for later use

	;;;;;;;;;;;;;;;;;;
	; load the olympian information
	;;;;;;;;;;;;;;;;;;

	call GetProcessHeap								; returns a handle to heap process in eax
	mov ebx, maxnum									; moves user-entered integer into ebx.
	imul ebx, SIZEOF olympian						; multiplies the user-entered integer and SIZEOF the struct for heap allocation. 
	push ebx										; pushes total BYTE size of heap into the stack frame.
	call allocOlympians								; calls allocOlympians for heap allocation process. 
	mov slistptr, eax								; moves valid heap handle from eax to slistptr for later manipulation.						
											
	call crlf										; new line.
	jnc heapok										; checks carry flag for error in AllocOlympian PROC.
	jmp DONE

	heapok:											; Heap handle successful.
	push slistptr									; pushes array of structs ptr for proc manipulation.
	push fileptr									; pushes fileptr for reading in from text file in readFileLine and readFileChar
	push maxnum										; pushes the user-entered number for correct looping procedure.
	call loadAllOlympians							; Loading Olympians

	;;;;;;;;;;;;;;;;;;
	; output the olympian information
	;;;;;;;;;;;;;;;;;;
	push numread
	push maxnum
	push slistptr							
	call outputAllOlympians

	;;;;;;;;;;;;;;;;;;
	; be sure to:
	;     close the file
	;     handle any errors encountered
	;;;;;;;;;;;;;;;;;;

DONE:
	call WaitMsg									; wait for user to hit enter
	invoke ExitProcess,0							; bye

main ENDP

; read a character from a file
; receives:
;	[ebp+8]  = file pointer
; returns:
;	eax = character read, or system error code if carry flag is set

readFileChar PROC
	push ebp										; save the base pointer
	mov ebp,esp										; base of the stack frame
	sub esp,4										; create a local variable for the return value
	push edx										; save the registers
	push ecx

	mov eax,[ebp+8]									; file pointer
	lea edx,[ebp-4]									; pointer to value read
	mov ecx,1										; number of chars to read
	call ReadFromFile								; gets file handle from eax (loaded above)
	jc DONE											; if CF is set, leave the error code in eax
	mov eax,[ebp-4]									; otherwise, copy the char read from local variable

DONE:
	pop ecx											; restore the registers
	pop edx
	mov esp,ebp										; remove local var from stack 
	pop ebp
	ret 4
readFileChar ENDP

; Allocates a location and space for the heap
;
; receives:
;	[ebp + 8]  = Total number of BYTEs needed to store for array of structs in heap.
; returns:
;	eax = a pointer to the allocated array.

allocOlympians PROC
	ENTER 0, 0										; Enter the stack frame. 	
	push [ebp + 8]									; Loads the total size of BYTES from stack frame. 
	push HEAP_ZERO_MEMORY							; clears the heap memory to zeros.
	push eax										; fileptr handle.
	call HeapAlloc									; creates a heap handle and saves it to EAX if successful.

	cmp eax, 0										; compares to 0 if handle failed.
	jne OK											; Jumps to OK if not zero.
	stc												; sets the carry flag if invalid. 
	jmp DONE										; JMP to DONE when finihsed with allocation.

	OK:												
		clc											; clears the carry flag since handle to heap was successful.

	DONE:														
		LEAVE										;clears the stack.
		ret	4										;return to main.

allocOlympians ENDP

; reads each character from readFIleChar PROC and stores 
; into a LOCAL BYTE array.
; receives:
;	[ebp + 8]  = local BYTE string array
;   [ebp + 12] = loads max size of string
;   [ebp + 40] = file pointer
; returns:
;	eax = number of characters that are stored into the array

readFileLine PROC
	ENTER 0, 0										; Enter the stack frame.
	mov ecx, [ebp + 12]								; load User-inputted number in ecx for looping.   
	mov esi, [ebp + 8]								; loads in LOCAL BYTE string array for temp storing.		

	readLoop: 
        xor eax, eax								; clears the eax.
		push fileptr								; pushes fileptr for readFileChar PROC.
        call readFileChar							; grabs single character from txt file. 
        cmp eax, -1									; error checking if invalid.
        je endRead									; ends reading if invalid. 

        cmp al, LF									; Line feed checking to endline and not store as needed.
        je endLine

        cmp al, CR									; Checks carriage feed and skips over it as windows is handling the strings.
        je skipCR									; skips CR.
        jmp Store									; Stores the character.

    skipCR:
        jmp readLoop								; Loops the read again.

    Store:
        mov byte ptr [esi], al						; Takes character that is stored in eax and puts into LOCAL array.
        inc esi										; postion of LOCAL array moved forward. 
        jmp readLoop								; loops for next character.

    endLine:										
        mov byte ptr [esi], NULL					; Null-terminate the string if encounters a line feed.
		jmp endRead									; end of line, so last read.

    endRead:										
		LEAVE										; Clear the stack frame.
        ret 8										; returns and clears pushed in registers.

readFileLine ENDP

; Takes the line from readFileLine PROC and loads into array of structs
; receives:
;	[ebp + 28] = pointer to beginning of struct object.
;   [ebp + 24] = file pointer. 
; returns:
;	eax = updated fileptr.

loadOlympian PROC 
	LOCAL targetA[STRSIZE]: BYTE					; LOCAL array for stack frame, manipulation in readFIleLine and readFIleChar.
	mov edx, STRSIZE								; max size string can be.
	lea esi, targetA								; loads the local byte array address into esi.
	push edx										; pushes the max string size.
	push esi										; pushes address of local byte array 
	call readFileLine								; file line stored into local byte array.

	lea esi, targetA								; sets the starting location of targetA back into esi. 
	mov al, ASTERISK								; moves ASTERISK constant into al.
	cmp byte ptr [esi], al							; compares LOCAL byte array first position for asterisk.
	jne LoadFail									; if not equal, fails the loading of file.

	mov esi, [ebp + 28]								; moves the array of structs ptr into esi.
	lea edi, (olympian PTR [esi]).sname				; loads the address of the ptr pointing to the location of the heap sname for manipulation. 
	push edx										; STRSIZE for string.
	push esi										; pushes slistptr into stack.
	call readFileLine								; reads line and stores into heap at sname.
													; moves the slistptr to country name beginning.
	
	mov esi, [ebp + 28]								; resets the slistptr into esi.
	mov eax, STRSIZE								; increments to the next position for country struct.
	add esi, eax									; adds the increment to the position of the pointer of the struct.
	lea edi, (olympian PTR [esi]).country			; loads the address of the ptr pointing to the location of the heap country for manipulation.
	push edx										; STRSIZE pushed.
	push esi										; slistptr pushed.
	call readFileLine								; reads line for country and stores into struct country position.
	mov eax, STRSIZE								; resets the position of slistptr for medals section.
	sub esi, eax									; subtracting for location resetting.
	mov ecx, NUMTESTS								; total number of medals stored into ecx.
	xor ebx, ebx									; clears ebx

	resets:											; loop for medal loading.
		push ecx									; saves the medal total state of ecx in stack.
		xor edx, edx								; clears edx register.
		lea esi, targetA							; reloads the LOCAL byte array to beginning postion.
		push STRSIZE								; max string size pushed.
		push esi									; LOCAL array pushed.
		call readFileLine							; read medal line.
		lea edx, targetA							; loads the address of LOCAL array.
		mov ecx, 1									; total number of bytes needed to read in.
		call ParseInteger32							; conversion from string to integer.
		mov esi, [ebp + 28]							; loads address of struct array.
		lea edi, (olympian PTR [esi]).medals		; loads the address of the ptr pointing to the location of the heap medals for manipulation.
		mov [edi], eax								; loads the integer into the struct heap.
		add ebx, TYPE maxnum						; increments 4 BYTEs forward for DWORD positioning.
		add [ebp + 28], ebx							; moves the slistptr 4 BYTE forward for struct.
		xor ebx, ebx								; clears the ebx register for next pass through.
		pop ecx										; pops the saved numtests state of ecx out for looping.
		loop resets									
		mov edx, 64									; NEEDS ATTENTION	
	ret												; return 

	LoadFail:										; failure of reading asterisk
		stc											; Set carry flag (indicating failure)                   
		ret											; return

loadOlympian ENDP 

; loops through the amount of olympians needed by User-inputted integer
; receives:
;	[ebp + 8]  = User-inputted number.
;   [ebp + 16] = array of structs pointer.
;   [ebp + 12] = file pointer.
; returns:
;	eax = number of Olympians read.

loadAllOlympians PROC
	ENTER 0,0										; stack frame creation.
	mov ecx, [ebp + 8]								; User-inputted integer for looping. 
	
Store:												; storing of olympians struct.
	push ecx										; save the state of ecx.
	call loadOlympian								; calls loadOlympian PROC.
	pop ecx											; pops the ecx for looping.
	add [ebp + 16], edx								; increments to the next struct in the array.
	inc numread										; increases what is read.
	cmp numread, 5									; max of 5.
	je DONE
loop Store

DONE:
	mov eax, [ebp + 8]
	LEAVE											; clears the stack frame.
	ret 12											; clears pushed registers and returns.

loadAllOlympians ENDP

; Output the information from the loading procedures.
; receives:
;	[ebp + 20]  = array of structs pointer.
; returns:
;   no return value.

outputOlympians PROC
	Enter 0,0
PrintLoop:
		; Output olympian sname
		mov esi, [ebp + 20]							; load the slistptr into esi.
        mov edx, OFFSET outname						; Load the "Olympian: " prompt.
        call WriteString							; write the prompt to terminal.
        lea edi, (olympian PTR [esi]).sname			; Point to the name of the current Olympian.
        mov edx, edi								; Load the address of the name into edx.
        call WriteString							; Print the name
		call crlf									; newline

        ; Output Olympian country
        mov edx, OFFSET outcountry					; Load the "Country: " prompt.
        call WriteString							; Write to terminal.
        lea edi, (olympian PTR [esi]).country		; Point to the country of the current Olympian.
        mov edx, edi								; Load the address of the country struct.
        call WriteString							; Outprint to country to terminal.
		call Crlf									; Newline

        ; Output Olympian medals
        mov edx, OFFSET outmedals					; Load the "Medals: " prompt.
        call WriteString							; Output to terminal.
        lea edi, (olympian PTR [esi]).medals		; Point to the medals of the current Olympian.
        mov ecx, NUMTESTS							; Set loop counter for medals
        mov ebx, 0									; Initialize the medal index
		xor eax, eax								; clear eax register.

    MedalLoop:
        add eax, [edi + ebx * 4]					; Load the value of the current medal.
        add ebx, 1									; Move to the next medal.
        loop MedalLoop								; Loop for each medal.

		call WriteDec								; Output the total medal value.
        add esi, SIZEOF olympian					; Move to the next Olympian entry
		call Crlf									; new line
		mov edx, SIZEOF olympian					; moves to the next struct.

	LEAVE											; clear stack frame.
    ret												; return.

outputOlympians ENDP

; Output all of olympians up to number inputted.
; receives:
;	[ebp + 8]  = array of structs pointer.
;   [ebp + 12] = number of olympians to be read.
;   [ebp + 16] = numread for number of Olympians read.
; returns:
;   no return value.

outputAllOlympians PROC
	Enter 0,0										; ENTER the stack frame.
	mov ecx, [ebp + 16]								; User-inputted integer stored into ecx for looping
	outLoop:
	push ecx										; saves the state of ecx for current loop.
	call outputOlympians							; output one olympian struct.
	call Crlf										; new line.
	pop ecx											; loops saved ecx.
	add [ebp + 8], edx								; adds the position of struct pointer to the next struct
	mov eax, [ebp + 16]								; Load numread into the eax register
    dec eax											; Decrement numread
    mov [ebp + 16], eax								; Store back into [ebp + 8]
	cmp eax, 0
	je DONE
	loop outLoop

	DONE: 
		LEAVE										; clear the stack.
		ret 16										; return.

outputAllOlympians ENDP

END main
