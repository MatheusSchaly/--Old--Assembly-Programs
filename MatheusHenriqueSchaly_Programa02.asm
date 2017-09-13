# Disciplina: Arquitetura e Organização de Computadores
# Atividade: Avaliação 01 – Programação em Linguagem de Montagem
# Programa 01
# Grupo: - Matheus Henrique Schaly

#Data stored in RAM
.data	
	#Creates RAM variables
	message1:	.asciiz		"Enter class' number (0 to 15): "
	message2:	.asciiz		"Enter student's number (0 to 31): "
	message3:	.asciiz		"Enger register's type (presence = 1; absence = 0): "
	presenceVector:	.word		0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF 		#Create a vector with 16 elements, each of them has 32 bits, that are all set to 1
	mask:		.word		0x00000001	#Mask with 32 bits, with only its last bit set to 1

.text

	#Inifinite loop
start:

	#Creates while's bounds
	addi	$t6,	$zero,	0			#Store 0 at t6 (while's lower bound)	
	addi	$t7,	$zero,	15			#Store 15 at t7 (while's upper bound)
	
	#Do while loop to get class' number
getClass:
	
	#Prints a text
	li	$v0,	4				#Command to print a text
	la	$a0,	message1			#Load address of mensagem1 to a0
	syscall						#Do it
	
	#Reads integer
	li	$v0,	5				#Read an integer and store it in v0
	syscall
	
	#Stores integer
	move	$t0,	$v0				#Move to t0 (class' number) the integer in v0
	
	#While's first if condition
	bgt 	$t0	$t6	secondCondition1	#Branch to secondCondition if t0 (class' number) is greater than t6 (while's lower bound)
	j	getClass				#Jump to getClass
	 
	#While's second if condition
secondCondition1:
	blt	$t0	$t7	getClassExit		#Branch to exit if t0 (class' number) is less than t7 (while's upper bound)
	j	getClass
	
getClassExit:

	#Readjusts while's upper bound
	addi	$t7,	$zero,	31			#Store 31 at t7 (while's upper bound)
	
	#Do while loop to get student's number
getStudent:

	#Prints a text
	li	$v0,	4				#Command to print a text
	la	$a0,	message2			#Load address of mensagem2 to a0
	syscall						#Do it
	
	#Reads integer
	li	$v0,	5				#Read an integer and store it in v0
	syscall
	
	#Stores integer
	move	$t1,	$v0				#Move to t1 (student's number) the integer in v0
	
	#While's first if condition
	bgt 	$t1,	$t6	secondCondition2	#Branch to secondCondition if t1 (student's number) is greater than t6 (while's lower bound)
	j	getStudent				#Jump to getStudent	
	
	#While's second if condition
secondCondition2:
	blt	$t1,	$t7	getStudentExit		#Branch to exit if t1 (student's number) is less than t7 (while's upper bound)
	j	getStudent
	
getStudentExit:
	
	#Readjusts while's upper bound
	addi	$t7,	$zero,	1			#Store 31 at t7 (while's upper bound)
	
	#Do while loop to get student's presence
getPresence:

	#Prints a text
	li	$v0,	4				#Command to print a text
	la	$a0,	message3			#Load address of mensagem2 to a0
	syscall						#Do it
	
	#Reads integer
	li	$v0,	5				#Read an integer and store it in v0
	syscall
	
	#Stores integer
	move	$t2,	$v0				#Move to t2 (student's presence) the integer in v0
	
	#While's first if condition
	bge 	$t2,	$t6	secondCondition3	#Branch to secondCondition if t2 (student's presence) is greater than t6 (while's lower bound)
	j	getPresence				#Jump to getPresence	
	
	#While's second if condition
secondCondition3:
	ble	$t2,	$t7	getPresenceExit		#Branch to exit if t2 (student's presence) is less than t7 (while's upper bound)
	j	getPresence
	
getPresenceExit:
	
	#Restarts the whole loop
	j 	start					#Jump to start

