     .text
    .globl hamming_convert
    .type  hamming_convert, @function

hamming_convert:
    xorl %eax, %eax         

.L_outer:
    movzbl (%rdi), %edx      
    movzbl (%rsi), %ecx      

    testb %dl, %dl           
    je .L_done
    testb %cl, %cl           
    je .L_done

    xorb %cl, %dl           

    movl $8, %ecx            

.L_bits:
    shrb $1, %dl             
    adcl $0, %eax            
    decl %ecx
    jne .L_bits

    incq %rdi               
    incq %rsi                
    jmp .L_outer

.L_done:
    ret

.section .note.GNU-stack,"",@progbits
