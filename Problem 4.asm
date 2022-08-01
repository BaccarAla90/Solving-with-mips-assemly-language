.data
	text1: .asciiz "Hello world"
	text2: .asciiz "Hell wrld"
	text3: .asciiz "The position of the character o in text one is:"
	text4: .asciiz "\n"
	text5: .asciiz "The result for text two is the number of total characters:"
	char:  .byte 'o'
.text
	main:
	la $a0 text1 # loading text1 into $a0(parameter)
	lb $a1 char #Loading the character(parameter)
	addi $a3 $0 11 #Loading the str length
	jal trouve_b #Function call
	
	li $v0 4
	la $a0 text3
	syscall
	li $v0 1
	addi $a0 $t0 0
	syscall
	#NewLine
	li $v0 4
	la $a0 text4
	syscall
	
	li $v0 4
	la $a0 text5
	syscall
	
	la $a0 text2 # loading text2 into $a0(parameter)
	addi $a3 $0 9 #Loading the str length
	jal trouve_b #Function call
	li $v0 1
	addi $a0 $t0 0
	syscall
	#exit
	li $v0 10
	syscall
	#trouve_b
	trouve_b:
		li $t0, 0 # initialize the count to zero
		loop:
			beq $t0, $a3 exit
			lbu $t1, 0($a0) # load the next character into t1
			beq $t1, $a1 exit # check for o character
			addi $a0, $a0, 1 # increment the string pointer
			addi $t0, $t0, 1 # increment the count
			j loop # return to the top of the loop
		exit:
		jr $ra