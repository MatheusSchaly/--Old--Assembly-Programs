.data # Contains the Data (RAM)
	myMessage: .asciiz "Hello Wolrd\n" # Stored in RAM

.text # Contains the Instructions
	li $v0, 4 # Prepare for printing
	la $a0, myMessage # Load myMessage into the $a0 register
	syscall # Do it
