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
	mask:		.word		0x00000001		#Mask with 32 bits, with only its last bit set to 1

.text

	#Loads array1's base address
	la 	$t3, 	presenceVector				#Load presenceVector's base address to t3 (presenceVector's base address)
	
	#Creates while's lower bound
	addi	$t6,	$zero,	0				#Store 0 at t6 (while's lower bound)	

	#Inifinite loop
start:

	#Creates/Resets while's upper bound
	addi	$t7,	$zero,	15				#Store 15 at t7 (while's upper bound)
	
	#Do while loop to get class' number
getClass:
	
	#Prints a text
	li	$v0,	4					#Command to print a text
	la	$a0,	message1				#Load address of mensagem1 to a0
	syscall							#Do it
	
	#Reads integer
	li	$v0,	5					#Read an integer and store it in v0
	syscall
	
	#Stores integer
	move	$t0,	$v0					#Move to t0 (class' number) the integer in v0
	
	#While's first if condition
	bge  	$t0	$t6	secondCondition1		#Branch to secondCondition if t0 (class' number) is greater than or equal t6 (while's lower bound)
	j	getClass					#Jump to getClass
	 
	#While's second if condition
secondCondition1:
	ble	$t0	$t7	getClassExit			#Branch to exit if t0 (class' number) is less than or equal t7 (while's upper bound)
	j	getClass
	
getClassExit:

	#Readjusts while's upper bound
	addi	$t7,	$zero,	31				#Store 31 at t7 (while's upper bound)
	
	#Do while loop to get student's number
getStudent:

	#Prints a text
	li	$v0,	4					#Command to print a text
	la	$a0,	message2				#Load address of mensagem2 to a0
	syscall							#Do it
	
	#Reads integer
	li	$v0,	5					#Read an integer and store it in v0
	syscall
	
	#Stores integer
	move	$t1,	$v0					#Move to t1 (student's number) the integer in v0
	
	#While's first if condition
	bge 	$t1,	$t6	secondCondition2		#Branch to secondCondition if t1 (student's number) is greater than or equal t6 (while's lower bound)
	j	getStudent					#Jump to getStudent	
	
	#While's second if condition
secondCondition2:
	ble	$t1,	$t7	getStudentExit			#Branch to exit if t1 (student's number) is less than or equal t7 (while's upper bound)
	j	getStudent
	
getStudentExit:
	
	#Readjusts while's upper bound
	addi	$t7,	$zero,	1				#Store 31 at t7 (while's upper bound)
	
	#Do while loop to get student's presence
getPresence:

	#Prints a text
	li	$v0,	4					#Command to print a text
	la	$a0,	message3				#Load address of mensagem2 to a0
	syscall							#Do it
	
	#Reads integer
	li	$v0,	5					#Read an integer and store it in v0
	syscall
	
	#Stores integer
	move	$t2,	$v0					#Move to t2 (student's presence) the integer in v0
	
	#While's first if condition
	bge 	$t2,	$t6	secondCondition3		#Branch to secondCondition if t2 (student's presence) is greater than or equal t6 (while's lower bound)
	j	getPresence					#Jump to getPresence	
	
	#While's second if condition
secondCondition3:
	ble	$t2,	$t7	getPresenceExit			#Branch to exit if t2 (student's presence) is less than or equal t7 (while's upper bound)
	j	getPresence
	
getPresenceExit:

	#A - Calculates the presenceVector's address to be changed
	sll	$t4, 	$t0,	2				#Multiply t0 (class' number) by 4 and put the result into t4 (bytes to be moved from presenceVector's base address)
	add 	$t3, 	$t3, 	$t4				#Add t3 (presenceVector's base) and t4 (bytes to be moved from presenceVector's base address) and put it back into t3 (presenceVector's fully calculated address)
	
	#Loads the input from presenceVector
	lw 	$t5, 	($t3)					#Load word from t3 (presenceVector's fully calculated address) to t5 (presenceVector's value)

	#B - Calculates how many mask's bits will be moved
	la	$t7,	mask					#Load address of mask to t7 (original mask)
	sllv	$t7,	$t7,	$t1				#Multiply t7 (original mask) by t1 (student's number) and put the result into t7 (mask bits moved for t1 times)	
	
	#C - If condition to check if student is or not present
	beq	$t2,	$t6,	registerAusence			#Branch to registerAusence if t2 (student's presence) is equal to t6 (while's lower bound (which is 0))
	
	#Register a presence
	
	#OR mask and presenceVector's single position
	or	$t5,	$t5,	$t7				#OR t7 (changed mask) and t5 (presenceVector's value) then put the result into t5 (presenceVector's changed value)
	
	#Stores presenceVector's changed value back
	sw 	$t5, 	($t3)					#Store word from t5 (presenceVector's changed value) in t3 (presenceVector's fully calculated address)

	#Restarts the whole loop
	j 	start						#Jump to start

	#Register a ausence
registerAusence:

	#XOR mask and 32 bits (all set to 1)
	xori	$t7,	$t7,	0xFFFFFFFF			#XOR (exclusive OR) t7 (changed mask) and 32 bits (all set to 1) then put the result into t7 (XORed mask)
	
	#AND XORed mask and presenceVector's single position
	and	$t5,	$t7,	$t5				#OR t7 (XORed mask) and t5 (presenceVector's value) then put the result into t5 (presenceVector's changed value)
	
	#Stores presenceVector's changed value back
	sw 	$t5, 	($t3)					#Store word from t5 (presenceVector's changed value) in t3 (presenceVector's fully calculated address)
	
	#Restarts the whole loop
	j 	start						#Jump to start
