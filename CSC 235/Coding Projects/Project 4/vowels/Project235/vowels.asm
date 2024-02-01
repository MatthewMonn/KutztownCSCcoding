; 
; Count matching vowels in a string
; 
; Name: Matthew Monn
;
include Irvine32.inc


.data
buffersi equ 100                                        ;Total size allocated for the User inputted string.
user_input BYTE buffersi + 1 dup(0)                     ;Buffer to store user input (limited to 100 characters).
vowel_counts DWORD 5 dup(0) 	                        ;DWORD array to store the counter values for vowels.
msg BYTE "aeiou", 0ah, 0                                ;string to be used for comparison and correctly formatted output. 
prompt BYTE "Enter string: ",0                          ;String Prompt for the user interface.
VM BYTE "Vowel Count:",0ah,0                            ;User interface Vowel Count prompt for output.
total DWORD 0                                           ;Used to store the amount of characters in the user inputted string. 
Tvowels DWORD 5                                         ;Counter for the total amount of vowels (a,e,i,o,u).
counter DWORD 0                                         ;counter used in StoreCounts function for correct looping.

.code
main PROC
    mov edx, OFFSET prompt                              ;sets the location of prompt to edx.
    call WriteString                                    ;uses edx to write the prompt.
    mov edx, OFFSET user_input                          ;sets the location of user_input array to edx.
    mov ecx, buffersi                                   ;total amount of size allocated by user_input stored in ecx so it doesn't overfill.
    call ReadString                                     ;prompts the user for input string.

    mov total, eax                                      ;stores the amount of strings from user inputted string into total counter. 
    mov esi, OFFSET user_input                          ;stores the starting location of user_input in esi for accessing each char. 
  
    mov ebx, 0                                          ;default value set for ebx.
    mov edi, 0                                          ;default value set for edi.
    mov ecx, Tvowels                                    ;Tvowels stored in ecx to be used in StoreCounts for maximum amount of vowels. 

StoreCounts:                                            ;function to connect the CountChars proc and add the counters to vowel_counts.
    mov bl,[msg + edi]                                  ;iterates through msg by characters in the string "aeiou".
    call CountChars                                     ;calls function for comparision.
    mov [vowel_counts + edi * TYPE vowel_counts], edx   ;takes the count return and adds it to each positon of vowel_counts. 
    mov edx, 0                                          ;resets edx for new counting of next vowel.
    inc counter                                         ;increases the counter each time for CMP.
    inc edi                                             ;increases edi to reach next character in msg.
    CMP counter, 5                                      ;compares the counter with 5 as there is a maximum amount of 5 vowels.
    je Next                                             ;JMPS if all vowels have been counted for. 
    loop StoreCounts                                    ;loops StoreCounts for all characters in user_input and vowels.

Next: 
    mov esi, 0                                          ;sets default value to esi.
    mov ecx, Tvowels                                    ;sets the max amount of vowels to ecx for looping. 
    mov esi, OFFSET vowel_counts                        ;sets esi with the location of counts of vowels in vowel_counts. 
    mov edx, OFFSET Vm                                  ;sets the location of Vm to edx.
    call WriteString                                    ;writes the Vm.
    mov edi, OFFSET msg                                 ;sets the location of msg to edi.

displayV:                                               ;display loop.
    mov al, BYTE PTR [edi]                              ;sets the PTR to edi location which is the string "aeiou" 
    call WriteChar                                      ;writes only the first char of msg. 
    mov al, 32                                          ;sets a space in al.
    call WriteChar                                      ;writes the space.
    mov eax, [esi]                                      ;sets the esi index of vowel_counts array to eax.
    call WriteDec                                       ;writes the counters of each vowel.
    add esi, TYPE vowel_counts                          ;sets the next location of vowel_counts by 4 for next counter reading.
    call Crlf                                           ;sets newline.
    add edi, 1                                          ;increases edi by 1 to read the next character in msg.
    loop displayV


    call WaitMsg   				        ; wait for user to hit enter
    invoke ExitProcess,0   		        ; bye

main ENDP
;---------------------------------------------------------------------------------------------------------
;
; CountChars 
;
; checks the user inputted string and the vowel passed in and adds a counter if found in the stack of user_input.
; Recieves: BL = vowel for comparison
;
; Returns: EDX = vowel counter.
;---------------------------------------------------------------------------------------------------------

CountChars PROC
    mov edx, 0                                          ;sets default value into edx.
    mov eax, 0                                          ;sets default value into eax.
    mov ecx, total                                      ;moves total amount of characters from user_input into ecx for looping.
L1:     
    movzx ax, BYTE PTR [esi]                            ;sets the first character in user_input into ax.
    push ax                                             ;pushes character into stack.
    inc esi                                             ;increases esi for next character retrieval.
    loop L1                                             ;loops pushing of characters into the stack.

    mov ecx, total                                      ;resets the ecx by total again.
    
L2: 
    pop ax                                              ;pops the character.
    CMP al, bl                                          ;compares the popped character to the current vowel being checked.
    je FoundVowel                                       ;jumps to FoundVowel function if the vowel is equal to character.
    loop L2                                             ;loops to check all characters in stack.
    mov esi, OFFSET user_input                          ;resets the location of user_input into esi.
    ret                                                 ;returns if no vowels are found.
  
FoundVowel:                             
    add edx, 1                                          ;adds 1 to edx for counter of vowels.
    loop L2                                             ;jumps back to the loop.

    mov esi, OFFSET user_input                          ;resets the location of user_input to esi.
    ret                                                 ;returns the count of edx.

CountChars ENDP                                         ;end of CountChars Proc


END main                                               