//Plaindrome
# MIPS Program: Palindrome Checker for Integers

.data
    prompt:   .asciiz  "Enter an integer: "
    isPalin:  .asciiz  "Palindrome\n"
    notPalin: .asciiz  "Not Palindrome\n"

.text
.globl main

main:
    # Print prompt
    li   $v0, 4
    la   $a0, prompt
    syscall

    # Read integer from user
    li   $v0, 5
    syscall
    move $t0, $v0         # t0 = original number

    # Handle negative: use absolute value for comparison
    bge  $t0, $zero, skip_neg
    sub  $t0, $zero, $t0  # t0 = abs(original)

skip_neg:
    move $t1, $t0         # t1 = copy to reverse
    li   $t2, 0           # t2 = reversed number

reverse_loop:
    beq  $t1, $zero, done_reverse
    li   $t3, 10
    rem  $t4, $t1, $t3  # t4 = last digit
    mul  $t2, $t2, $t3  # t2 = t2 * 10
    add  $t2, $t2, $t4  # t2 = t2 + last digit
    div  $t1, $t1, $t3  # t1 = t1 / 10
    j    reverse_loop

done_reverse:
    # Compare original (t0) with reversed (t2)
    bne  $t0, $t2, not_palindrome

print_palindrome:
    li   $v0, 4
    la   $a0, isPalin
    syscall
    j    exit

not_palindrome:
    li   $v0, 4
    la   $a0, notPalin
    syscall

exit:
    li   $v0, 10
    syscall               # Exit program
