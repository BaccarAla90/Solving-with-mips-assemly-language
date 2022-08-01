.data
	Tab1: .word 45, 36, 28, -70, 7, 90, 8, 32, 20 ,10
	Tab2: .word 0:10
	text1: .asciiz "The Tab2 ordered values are:"
	text2: .asciiz ","
	text3: .asciiz "\n"
	text4: .asciiz "The Somm value is:"	

.text
	addi $t0 $0 0 #tab1 counter
	addi $t1 $0 36 #tab2 counter
	
	while:
	 	beq $t0 40 exit0
	 	lw $t2 Tab1($t0)
	 	sw $t2 Tab2($t1) 
	 	addi $t0 $t0 4
	 	addi $t1 $t1 -4
	 	j while
	 exit0:
	 addi $t0 $0 0
	 addi $s0 $0 0 #Somm
	 li $v0 4
	 la $a0 text1
	 syscall
	 #Somm and Print
	 while_s:
	 	beq $t0 40 exit1
	 	lw $t1 Tab2($t0)
	 	add $s0 $s0 $t1
	 	addi $t0 $t0 4
	 	
	 	li $v0 1
		addi $a0 $t1 0
		syscall
	 	li $v0 4
		la $a0 text2
		syscall	
		
	 	j while_s
	exit1:
	#Printing Somm
	li $v0 4
	la $a0 text3
	syscall
	
	li $v0 4
	la $a0 text4
	syscall
	
	li $v0 1
	addi $a0 $s0 0
	syscall