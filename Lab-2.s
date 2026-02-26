# hamming_convert.s  (AT&T syntax for gcc)
# int hamming_convert(char *str1, char *str2);
# args: str1 in RDI, str2 in RSI
# return: EAX

    .text
    .globl hamming_convert
    .type  hamming_convert, @function

hamming_convert:
    xorl %eax, %eax          # total = 0  (EAX will be our running Hamming distance)

.L_outer:
    movzbl (%rdi), %edx      # EDX = (unsigned char)*str1
    movzbl (%rsi), %ecx      # ECX = (unsigned char)*str2

    testb %dl, %dl           # if *str1 == 0 -> done
    je .L_done
    testb %cl, %cl           # if *str2 == 0 -> done
    je .L_done

    xorb %cl, %dl            # DL = DL XOR CL  (bits that differ become 1)

    movl $8, %ecx            # bit loop counter = 8 bits

.L_bits:
    shrb $1, %dl             # shift right, LSB goes into CF
    adcl $0, %eax            # EAX += CF
    decl %ecx
    jne .L_bits

    incq %rdi                # str1++
    incq %rsi                # str2++
    jmp .L_outer

.L_done:
    ret

.section .note.GNU-stack,"",@progbits
