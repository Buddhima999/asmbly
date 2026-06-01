//Plaindrome------------------------------------------------------------------------------------
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
-----------------------------------------------------------------------------------------------------------------------

// ArmStrong
.data
	prompt: .asciiz "Enter 3-digit Number : "
	arm: .asciiz "Armstrong"
	notarm: .asciiz "Not Armstrong"
	
.text
.globl main

main:
	# prompt
	la $a0, prompt
	li $v0, 4
	syscall 
	
	# read number
	li $v0, 5
	syscall 
	
	move $t0, $v0	# original
	move $t1, $v0
	
	li $t7, 0	# sum
	
Loop: 
	beq $t1, $zero, Check
	
	li $t2, 10
	
	div $t1, $t2
	mfhi $t3	# digit
	mflo $t1
	
	# digit^3
	mul $t4, $t3, $t3
	mul $t4, $t4, $t3
	
	add $t7, $t7, $t4
	
	j Loop
	
Check:
	beq $t0, $t7, ARMSTRONG

NOTARM:
	la $a0, notarm
	li $v0, 4
	syscall 
	
	li $v0, 10
	syscall
	
ARMSTRONG: 
	la $a0, arm
	li $v0, 4
	syscall 
	
	li $v0, 10
	syscall
------------------------------------------------------------------------------------------------------------------------------------------------------------

//Array
.data
	array: .word 55, 27, 13, 5, 44, 32, 17, 36
	size: .word 8
	
	msg1: .asciiz "\nArray elements:\n"
	msg2: .asciiz "\nMaximum value: "
	msg3: .asciiz "\nSum of elements: "
	space: .asciiz " "
	
.text
.globl main

main:
	# print array message
	la $a0, msg1
	li $v0, 4
	syscall 
	
	# print array
	la $a0, array
	li $a1, 8
	jal print_array
	
	# find max
	la $a0, array
	li $a1, 8
	jal find_max
	move $s0, $v0	# store max
	
	# find sum
	la $a0, array
	li $a1, 8
	jal find_sum
	move $s1, $v0	# store sum
	
	# print max message
	la $a0, msg2
	li $v0, 4
	syscall 
	
	# print max value
	move $a0, $s0
	li $v0, 1
	syscall
	
	# print sum message
	la $a0, msg3
	li $v0, 4
	syscall
	
	# print sum value
	move $a0, $s1
	li $v0, 1
	syscall 
	
	# exit
	li $v0, 10
	syscall
	
#----------Print Array----------
print_array:
	li $t0, 0	# i = 0
	move $t1, $a0	# base address
	move $t2, $a1	# size
	
print_loop:
	beq $t0, $t2, end_print
	
	lw $t3, 0($t1)
	
	move $a0, $t3
	li $v0, 1
	syscall 
	
	# print space
	la $a0, space
	li $v0, 4
	syscall
	
	addi $t1, $t1, 4
	addi $t0, $t0, 1
	j print_loop
	
end_print:
	jr $ra
	
	
#----------Find Max----------
find_max:
	lw $t0, 0($a0)	# max  = first element
	li $t1, 1
	
	addi $t2, $a0, 4	# pointer to next element
	
max_loop:
	beq $t1, $a1, end_max
	
	lw $t3, 0($t2)
	
	ble $t3, $t0, skip
	move $t0, $t3
	
skip:
	addi $t2, $t2, 4
	addi $t1, $t1, 1
	j max_loop
	
end_max:
	move $v0, $t0
	jr $ra
	
	
#----------Find Sum----------
find_sum:
	li $t0, 0	# sum = 0
	li $t1, 0
	
	move $t2, $a0	# pointer
	
sum_loop:
	beq $t1, $a1, end_sum
	
	lw $t3, 0($t2)
	add $t0, $t0, $t3
	
	addi $t2, $t2, 4
	addi $t1, $t1, 1
	j sum_loop
	
end_sum:
	move $v0, $t0
	jr $ra
-------------------------------------------------------------------------------------------------------------

//Sub program
.text

ExitProgram:
	li $v0, 10
	syscall 
	
PrintString:
	li $v0, 4 
	syscall 
	jr $ra
	
PromptInteger:
	li $v0, 5
	syscall 
	jr $ra
	
PrintInteger: 
	li $v0, 1
	syscall 
	jr $ra
	
PrintTab:
	li $a0, 9
	li $v0, 11
	syscall 
	jr $ra
	
ExtractDigit:
	li $t0, 10
	div $a0, $t0
	mfhi $v0
	jr $ra
