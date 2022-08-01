.data
	entryMessage: .asciiz"Enter any number for factorial calculation\n"
	resultMessage: .asciiz"The result is :"
	theNumber: .word 0
	theResult: .word 0
	
.text
main:
	#read the number from the user
	li $v0 4
	la $a0 entryMessage
	syscall
	
	li $v0 5
	syscall
	
	sw $v0 theNumber
	#Calling findFactorial function
	lw $a0 theNumber
	jal findFactorial
	sw $v0 theResult #After calculation
	#Display the results
	li $v0 4
	la $a0 resultMessage
	syscall
	
	li $v0 1
	lw $a0 theResult
	syscall
	#exit
	li $v0 10
	syscall
	#findFactorial function
findFactorial:
	subu $sp $sp 8
	sw $ra ($sp)
	sw $s0 4($sp)
	#Base Case
	li $v0 1
	beq $a0 0 quitFactorial #Line L
	move $s0 $a0
	sub $a0 $a0 1
	jal findFactorial
	
	mul $v0 $s0 $v0
	
	quitFactorial:
		lw $ra ($sp)
		lw $s0 4($sp)
		addu $sp $sp 8
		jr $ra #it will jump to the line L to do the multiplication		