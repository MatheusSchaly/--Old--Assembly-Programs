# Disciplina: Arquitetura e Organização de Computadores
# Atividade: Avaliação 01 – Programação em Linguagem de Montagem
# Programa 01
# Grupo: - Matheus Henrique Schaly

.data

	#Creates RAM variables
	vector1:	.word 0, 0, 0, 0, 0, 0, 0, 0				#Inicializing vector 1
	vector2:	.word 0, 0, 0, 0, 0, 0, 0, 0				#Inicializing vector 2
	mensagem1:	.asciiz "Enter with array's size (max. = 8):\n"		#Message prompting vectors size
	mensagem2:	.asciiz "Invalid value.\n"				#Message warning invalid value
	mensagem3:	.asciiz "Vector1["					
	mensagem4:	.asciiz "] = "		
	mensagem5:	.asciiz "Vector2["					
	mensagem6:	.asciiz "\n"						#Jump line
	
.text

	#Creates while's bounds
	addi	$t1,	$zero,	0						#Store 0 at t1 (while's lower bound)
	addi	$t2,	$zero,	9						#Store 9 at t2 (while's upper bound)
	
	#Prompt arrays' size
while:
	#Prints mensagem1
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem1 						#Load address of mensagem1 to a0
	syscall 								#Do it
	
	#Reads integer
	li	$v0,	5							#Read an integer and store it in v0
	syscall									#Do it
	
	#Stores integer
	move $t0, $v0								#Move to $t0 (arrays' size) the integer in v0

	#While's first if condition
	bgt 	$t0	$t1	secondCondition					#Branch to secondCondition if t0 (arrays' size) is greater than t2 (while's lower bound)							

	# Prints mensagem2
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem2 						#Load address of mensagem2 to a0
	syscall 								#Do it
	
	#Restarts while loop
	j while									#Jump to while
		
	#While's second if condition
secondCondition:
	blt	$t0	$t2	exit						#Branch to exit if t0 (arrays' size) is less than t2 (while's lower bound)
	
	# Prints mensagem2
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem2 						#Load address of mensagem2 to a0
	syscall 								#Do it
	
	#Restarts while
	j while									#Jump to while
exit:

	#Creates loop's index
	addi	$t1,	$zero,	0						#Add zero and 0 and store it in t1 (loop's index)
	
	#First for loop to gather first array's values
for1:
	#Loop's if condition
	beq	$t1,	$t0,	for1Exit					#Branch to for1Exit if t1 (loop's index) is equal to t0 (arrays' size)
	
	#Prints mensagem3
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem3 						#Load address of mensagem3 to a0
	syscall 								#Do it
	
	#Prints index
	li 	$v0, 	1							#Command to print a integer
	move 	$a0, 	$t1							#Move $t1 (loop index) to a0
	syscall									#Do it
	
	#Prints mensagem4
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem4 						#Load address of mensagem4 to a0
	syscall 								#Do it
	
	#Reads integer
	li	$v0,	5							#Read an integer and store it in v0 (it now has the input)
	syscall									#Do it
	
	#Calculates the array1's addres to store the integer
	la 	$t2, 	vector1							#Load array's base to t2 (array's base)
	sll	$t3, 	$t1,	2						#Multiply t1 (loop's index) by 4 and put the result into t3 (bytes to be moved from array's base address)
	add 	$t3, 	$t3, 	$t2						#Add t2 (array's base) and t3 (bytes to be moved from array's base address) and put it back into t3 (array's fully calculated address)
	
	#Stores the input in array
	sw 	$v0, 	($t3)							#Store word from v0 (that has the imput) in t3 (array's fully calculated address)
	
	#Increases loop's index
	addi 	$t1, 	$t1, 	1						#Increase t1 (loop's index) by 1
	
	#Restarts for loop
	j 	for1								#Jump to for1
	
	#Exits first for loop
for1Exit:

	#Resets loop's index to 0
	addi	$t1,	$zero,	0						#Add zero and 0 and store it in t1 (loop's index)
	
	#Second for loop to gather second array's values
for2:
	#Loop's if condition
	beq	$t1,	$t0,	for2Exit					#Branch to for2Exit if t1 (loop's index) is equal to t0 (arrays' size)
	
	#Prints mensagem3
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem5 						#Load address of mensagem3 to a0
	syscall 								#Do it
	
	#Prints index
	li 	$v0, 	1							#Command to print a integer
	move 	$a0, 	$t1							#Move $t1 (loop index) to a0
	syscall									#Do it
	
	#Prints mensagem4
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem4 						#Load address of mensagem4 to a0
	syscall 								#Do it
	
	#Reads integer
	li	$v0,	5							#Read an integer and store it in v0 (it now has the input)
	syscall									#Do it
	
	#Calculates the array2's addres to store the integer
	la 	$t2, 	vector2							#Load array's base to t2 (array's base)
	sll	$t3, 	$t1,	2						#Multiply t1 (loop's index) by 4 and put the result into t3 (bytes to be moved from array's base address)
	add 	$t3, 	$t3, 	$t2						#Add t2 (array's base) and t3 (bytes to be moved from array's base address) and put it back into t3 (array's fully calculated address)
	
	#Stores the input in array
	sw 	$v0, 	($t3)							#Store word from v0 (that has the imput) in t3 (array's fully calculated address)
	
	#Increases loop's index
	addi 	$t1, 	$t1, 	1						#Increase t1 (loop's index) by 1
	
	#Restarts for loop
	j 	for2								#Jump to for1
	
	#Exits second for loop
for2Exit:

	#Resets loop's index to 0
	addi	$t1,	$zero,	0						#Add zero and 0 and store it in t1 (loop's index)
	
	#Third for loop to swap arrays' values
for3:
	#Loop's if condition
	beq	$t1,	$t0,	for3Exit					#Branch to for3Exit if t1 (loop's index) is equal to t0 (arrays' size)

	#Calculates the array1's addres to load an integer
	la	$t2,	vector1							#Load array's base to t2 (array1's base)
	sll	$t3,	$t1,	2						#Multiply t1 (loop's index) by 4 and put the result into t3 (bytes to be moved from array's base address)
	add	$t3,	$t3,	$t2						#Add t2 (array1's base) and t3 (bytes to be moved from array1's base address) and put it back into t3 (array1's fully calculated address)
	
	#Loads the input from array1
	lw 	$t4, 	($t3)							#Load word from t3 (array1's fully calculated address) to t4 (array1's value)
	
	#Calculates the array2's addres to load an integer
	la	$t5,	vector2							#Load array's base to t5 (array2's base)
	sll	$t6,	$t1,	2						#Multiply t1 (loop's index) by 4 and put the result into t6 (bytes to be moved from array's base address)
	add	$t6,	$t6,	$t5						#Add t5 (array2's base) and t6 (bytes to be moved from array2's base address) and put it back into t6 (array2's fully calculated address)
	
	#Loads the input from array2
	lw 	$t7, 	($t6)							#Load word from t6 (array2's fully calculated address) to t7 (array2's value)

	#Stores array1's value in array2's
	sw 	$t4, 	($t6)							#Store word from t4 (array1's value) in t6 (array2's fully calculated address)
	
	#Stores array2's value in array1's
	sw 	$t7, 	($t3)							#Store word from t7 (array2's value) in t3 (array1's fully calculated address)
	
	#Increases loop's index
	addi 	$t1, 	$t1, 	1						#Increase t1 (loop's index) by 1
	
	#Restarts for loop
	j 	for3								#Jump to for1
	
	#Exits second for loop
for3Exit:

	#Prints mensagem6
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem6 						#Load address of mensagem3 to a0
	syscall 								#Do it

	#Resets loop's index to 0
	addi	$t1,	$zero,	0						#Add zero and 0 and store it in t1 (loop's index)
	
	#Forth for loop to print array1's values
for4:
	#Loop's if condition
	beq	$t1,	$t0,	for4Exit					#Branch to for4Exit if t1 (loop's index) is equal to t0 (arrays' size)
	
	#Prints mensagem3
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem3 						#Load address of mensagem3 to a0
	syscall 								#Do it
	
	#Prints index
	li 	$v0, 	1							#Command to print a integer
	move 	$a0, 	$t1							#Move $t1 (loop index) to a0
	syscall									#Do it
	
	#Prints mensagem4
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem4 						#Load address of mensagem4 to a0
	syscall 								#Do it

	#Calculates the array1's addres to load an integer
	la 	$t2, 	vector1							#Load array's base to t2 (array's base)
	sll	$t3, 	$t1,	2						#Multiply t1 (loop's index) by 4 and put the result into t3 (bytes to be moved from array's base address)
	add 	$t3, 	$t3, 	$t2						#Add t2 (array's base) and t3 (bytes to be moved from array's base address) and put it back into t3 (array's fully calculated address)
	
	#Loads the input from array1
	lw 	$t4, 	($t3)							#Load word from t3 (array1's fully calculated address) to t4 (array1's value)
	
	#Prints array1 at index t1
	li 	$v0, 	1							#Command to print a integer
	move 	$a0, 	$t4							#Move $t4 (the value) to a0
	syscall									#Do it
	
	#Prints mensagem6
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem6 						#Load address of mensagem6 to a0
	syscall 								#Do it

	#Increases loop's index
	addi 	$t1, 	$t1, 	1						#Increase t1 (loop's index) by 1
	
	#Restarts for loop
	j 	for4								#Jump to for1
	
	#Exits second for loop
for4Exit:

	#Resets loop's index to 0
	addi	$t1,	$zero,	0						#Add zero and 0 and store it in t1 (loop's index)
	
	#Fifth for loop to print array2's values
for5:
	#Loop's if condition
	beq	$t1,	$t0,	for5Exit					#Branch to for3Exit if t1 (loop's index) is equal to t0 (arrays' size)
	
	#Prints mensagem3
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem3 						#Load address of mensagem3 to a0
	syscall 								#Do it
	
	#Prints index
	li 	$v0, 	1							#Command to print a integer
	move 	$a0, 	$t1							#Move $t1 (loop index) to a0
	syscall									#Do it
	
	#Prints mensagem4
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem4 						#Load address of mensagem4 to a0
	syscall 								#Do it

	#Calculates the array2's addres to load an integer
	la 	$t2, 	vector2							#Load array's base to t2 (array's base)
	sll	$t3, 	$t1,	2						#Multiply t1 (loop's index) by 4 and put the result into t3 (bytes to be moved from array's base address)
	add 	$t3, 	$t3, 	$t2						#Add t2 (array's base) and t3 (bytes to be moved from array's base address) and put it back into t3 (array's fully calculated address)
	
	#Loads the input from array2
	lw 	$t4, 	($t3)							#Load word from t3 (array1's fully calculated address) to t4 (array1's value)
	
	#Prints array2 at index t1
	li 	$v0, 	1							#Command to print a integer
	move 	$a0, 	$t4							#Move $t4 (the value) to a0
	syscall									#Do it
	
	#Prints mensagem6
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem6 						#Load address of mensagem6 to a0
	syscall 								#Do it

	#Increases loop's index
	addi 	$t1, 	$t1, 	1						#Increase t1 (loop's index) by 1
	
	#Restarts for loop
	j 	for5								#Jump to for1
	
	#Exits second for loop
for5Exit: