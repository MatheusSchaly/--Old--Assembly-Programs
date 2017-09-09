# Disciplina: Arquitetura e Organização de Computadores
# Atividade: Avaliação 01 – Programação em Linguagem de Montagem
# Programa 01
# Grupo: - Matheus Henrique Schaly

.data
	vector1:	.word 0, 0, 0, 0, 0, 0, 0, 0				#Inicializing vector 1
	vector2:	.word 0, 0, 0, 0, 0, 0, 0, 0				#Inicializing vector 2
	mensagem1:	.asciiz "Enter with array's size (max. = 8):\n"		#Message prompting vectors size
	mensagem2:	.asciiz "Invalid value.\n"				#Message warning invalid value
	mensagem3:	.asciiz "Vector1["					
	mensagem4:	.asciiz "] = "		
	mensagem5:	.asciiz "Vector2["					
	mensagem6:	.asciiz "\n"						#Jump line
	
.text
	#Creating while's bounds
	addi	$t1,	$zero,	0						#Store 0 at t1 (while's lower bound)
	addi	$t2,	$zero,	9						#Store 9 at t2 (while's upper bound)
	
while:
	#Print mensagem1
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem1 						#Load address of mensagem1 to a0
	syscall 								#Do it
	
	#Read integer
	li	$v0,	5							#Read an integer and store it in v0
	syscall									#Do it
	
	#Store integer
	move $t0, $v0								#Move to $t0 (arrays' size) the integer in v0

	#While's first if condition
	bgt 	$t0	$t1	secondCondition					#Branch to secondCondition if t0 (arrays' size) is greater than t2 (while's lower bound)							

	# Print mensagem2
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem2 						#Load address of mensagem2 to a0
	syscall 								#Do it
	
	#Restart while loop
	j while									#Jump to while
		
	#While's second if condition
secondCondition:
	blt	$t0	$t2	exit						#Branch to exit if t0 (arrays' size) is less than t2 (while's lower bound)
	
	# Print mensagem2
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem2 						#Load address of mensagem2 to a0
	syscall 								#Do it
	
	#Restart while
	j while									#Jump to while
exit:
	addi	$t1,	$zero,	0						#Add zero and 0 and store it in t1 (loop's index)
for1:
	#Loop's if condition
	beq	$t1,	$t0,	for1Exit					#Branch to for1Exit if t1 (loop's index) is equal to t0 (arrays' size)
	
	#Print mensagem3
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem3 						#Load address of mensagem3 to a0
	syscall 								#Do it
	
	#Print index
	li 	$v0, 	1							#Command to print a integer
	move 	$a0, 	$t1							#Move $t1 (loop index) to a0
	syscall									#Do it
	
	#Print mensagem4
	li	$v0, 	4 							#Command to print a text
	la	$a0, 	mensagem4 						#Load address of mensagem4 to a0
	syscall 								#Do it
	
	#Read integer
	li	$v0,	5							#Read an integer and store it in v0 (it now has the input)
	syscall									#Do it
	
	#Calculate the array's addres to store the integer
	la 	$t2, 	vector1							#Load array's base to t2 (array's base)
	sll	$t3, 	$t1,	2						#Multiply t1 (loop's index) by 4 and put the result into t3 (bytes to be moved from array's base address)
	add 	$t3, 	$t3, 	$t2						#Add t2 (array's base) and t3 (bytes to be moved from array's base address) and put it back into t3 (array's fully calculated address)
	
	#Store the input in array
	sw 	$v0, 	($t3)							#Store word from v0 (that has the imput) t3 (array's fully calculated address)
	
	#Increase loop's index
	addi 	$t1, 	$t1, 	1						#Increase t1 (loop's index) by 1
	
	#Restart for loop
	j for1									#Jump to for1
for1Exit:


