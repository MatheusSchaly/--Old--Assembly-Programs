# Disciplina: Arquitetura e Organização de Computadores
# Atividade: Avaliação 03 – Programação de Procedimentos
# Grupo: - Matheus Henrique Schaly

.data	
	#Creates RAM variables
	message1:	.asciiz		"Enter first number: "
	message2:	.asciiz		"Enter second number: "

.text
	#Prints a text
	li	$v0,	4					#Command to print a text
	la	$a0,	message1				#Load address of mensagem1 to a0
	syscall							#Do it
	
	#Reads integer
	li	$v0,	5					#Read an integer and store it in v0 (first number)
	syscall							#Do it
	
	#Stores integer
	move	$s0,	$v0					#Move to s0 (first number) the integer in v0 (first number)
	
	#Prints a text
	li	$v0,	4					#Command to print a text
	la	$a0,	message2				#Load address of mensagem2 to a0
	syscall							#Do it
	
	#Reads integer
	li	$v0,	5					#Read an integer and store it in v0 (second number)
	syscall							#Do it
	
	#Stores integer
	move	$s1,	$v0					#Move to s1 (second number) the integer in v0 (second number)
	
	#Stores integer in argument registers
	move	$a0,	$s0					#Move to a0 (first number) the integer in s0 (first number)
	move	$a1,	$s1					#Move to a1 (second number) the integer in s1 (second number)
	
	#Enters the procedure (gcd)
	jal	gcd						#jal (jump and link). Set ra to PC (return address) then jump to gcd (greatest common divisor). $ra <- PC + 4
	
	#Moves v0 (gcd answer) to s2 (asnwer)
	move	$s2,	$v0					#Move to s2 (answer) the integer in v0 (gcd answer)
	
	#Prints s2 (answer)
	li 	$v0, 	1					#Command to print a integer
	move 	$a0, 	$s2					#Move s2 (answer) to a0
	syscall							#Do it
	
	#Exits the program
	j	exitProgram					#jump to exitProgram
	
	#The procedure gcd (greatest common divisor)
gcd:

	#Stacks values to be immutably returned
	addi	$sp,	$sp,	-4				#Add sp (unchanged stack pointer) and -4 (bytes to be moved from sp) and put it back into sp (stack pointer moved by -4 bytes)
	sw	$s0,	($sp)					#Store word from s0 (first number) in sp (stack pointer moved by -4 bytes)
	addi	$sp,	$sp,	-4				#Add sp (stack pointer moved by -4 bytes) and -4 (bytes to be moved from sp) and put it back into sp (stack pointer moved by -8 bytes)
	sw	$s1,	($sp)					#Store word from s1 (second number) in sp (stack pointer moved by -8 bytes)

while:
	#While condition to check if s0 (first number) is equal to s1 (second number)
	beq	$s0,	$s1,	gcdExit				#Branch to gcdExit if s0 (first number) is equal to s1 (second number)

	#If condition to check if s0 (first number) is less than s1 (second number)
	blt	$s0,	$s1,	if				#Branch to if if s0 (first number) is less than s1 (second number)
	
	#Else condition, s0 (first number) is greater than s1 (second number)
	sub	$s0,	$s0,	$s1				#Subtract s0 (first number) from s1 (second number) and put it back in s0 (modified first number)
	j	while						#Jump to while loop
	
	#If condition, s0 (first number) is less than s1 (second number)
if:

	#If condition body s0 (first number) is less than s1 (second number)
	sub	$s1,	$s1,	$s0				#Subtract s1 (second number) from s0 (first number) and put it back in s1 (modified second number)
	j	while						#Jump to while loop
	
	#While end condition, s0 (first number) is equal to s1 (second number)
gcdExit:

	#Move the answer (s0 (first number)) to v0 (return register)
	move	$v0,	$s0					#Move to v0 (return value) the integer in s0 (first number)
	
	#Unstacks immutably returned values
	lw	$s1,	($sp)					#Load word from s1 (second number) from sp (stack pointer moved by -8 bytes)
	addi	$sp,	$sp,	4				#Add sp (stack pointer moved by -8 bytes) and 4 (bytes to be moved from sp) and put it back into sp (stack pointer moved by -4 bytes)
	lw	$s0,	($sp)					#Store word from s0 (first number) in sp (stack pointer moved by -4 bytes)
	addi	$sp,	$sp,	4				#Add sp (stack pointer moved by -4 bytes) and 4 (bytes to be moved from sp) and put it back into sp (unchanged stack pointer)

	#Returns to main
	jr	$ra						#jr (jump register unconditionally). Jump to statement whose address is in ra (old main PC address). PC <- $ra
		
exitProgram:
	
	
	
	
	
	
	
	
	
	
	
	
	
	
