.data
	myInteger: .word 23
	
.text
	li $v0, 1 #To print a word
	lw $a0, myInteger 
	syscall