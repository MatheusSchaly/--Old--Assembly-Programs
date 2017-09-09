#########################################################################################################
#Exercício 03
#Implemente um programa que declare um vetor de inteiros com 8 elementos, solicite ao usuário a
#entrada dos elementos do vetor e, após a leitura dos 8 elementos, apresente o valor de cada
#elemento, em mensagens como as exemplificadas abaixo:
#	LEITURA DOS ELEMENTOS DO VETOR:
#	Entre com A[0]:
#	...
#	Entre com A[7]:
#	APRESENTAÇÃO DO VETOR LIDO:
#	A[0] = 4
#	...
#	A[7] = 7
#OBS: Este exercício aborda o uso de instruções de desvio (podem ser usadas pseudo-instruções), da
#instrução syscall e de instruções de acesso à memória (la, lw e sw).
#########################################################################################################

.data
	array:		.space 32
	leitura:	.asciiz "LEITURA DOS ELEMENTOS DO VETOR:\n"
	apresentacao:	.asciiz "APRESENTACAO DO VETOR LIDO:"
	entreCom:	.asciiz "Entre com A["
	entreFim:	.asciiz "]:\n"
	Acolchete:	.asciiz "\nA["
	colchete:	.asciiz "] = "

.text
	# Initialize
	li $t0, 0	#Load to $t0 the value 0 (is the "i")
	li $t1, 8	#Load to $t1 the value 8 (how many times the loop will execute)
	
	# Print leitura message
	li $v0, 4 			#Print a text
	la $a0, leitura 		#Load address in of leitura in the argument register ($a0)
	syscall 			#Do it
	
	#For loop
forLoop:
	# If condition
	beq  $t1, $t0, forLoopDone	#Branch if $t1 = $0 to forLoopDone
	
	# Print entreCom
	li $v0, 4 			#Print a text
	la $a0, entreCom 		#Load address in of entreCom in the argument register ($a0)
	syscall 			#Do it

	# Print index
	li $v0, 1			# Print a integer
	move $a0, $t0			# Move $t0 (the i) to $a0
	syscall				# Do it
	
	# Print entreFim
	li $v0, 4 			#Print a text
	la $a0, entreFim		#Load address in of entreFim in the argument register ($a0)
	syscall 			#Do it
	
	# Read an integer
	li $v0, 5			#Read the text and store in $v0
	syscall				#Do it
	
	# Calculate the address
	la $t2, array			#Load array's base to $t2
	sll $t3, $t0, 2			#Multiply $t0 by 4 and put the result into $t3
	add $t3, $t3, $t2		#Add array's base ($t2) and i multiplied by 4 ($t3) and put it back into $t3
	
	# Store the input in array
	sw $v0, ($t3)			#Store word from $v0 to array at address $t3
	
	# Increase i++
	addi $t0, $t0, 1		#Increase $t0 by $t0 + 1
	
	# Go back to the beginning
	j forLoop			#Jump to forLoop
forLoopDone:

	li $t0, 0			#Load to $t0 the value 0 (is the "i")

	# Print apresentacao
	li $v0, 4 			#Print a text
	la $a0, apresentacao		#Load address in of apresentacao in the argument register ($a0)
	syscall 			#Do it

forLoop2:
	# If condition
	beq  $t1, $t0, forLoopDone2	#Branch if $t1 = $0 to forLoopDone2
	
	# Print Acolchete
	li $v0, 4 			#Print a text
	la $a0, Acolchete		#Load address in of Acolchete in the argument register ($a0)
	syscall 			#Do it
	
	# Print index
	li $v0, 1			# Print a integer
	move $a0, $t0			# Move $t0 (the i) to $a0
	syscall				# Do it
	
	# Print colchete
	li $v0, 4 			#Print a text
	la $a0, colchete		#Load address in of colchete in the argument register ($a0)
	syscall 			#Do it
	
	# Calculate the address
	la $t2, array			#Load array's base to $t2
	sll $t3, $t0, 2			#Multiply $t0 by 4 and put the result into $t3
	add $t3, $t3, $t2		#Add array's base ($t2) and i multiplied by 4 ($t3) and put it back into $t3
	
	# Load the input from array
	lw $t4, ($t3)			#Store word from $v0 to array at address $t3
	
	# Print array at index $t0
	li $v0, 1			# Print a integer
	move $a0, $t4			# Move $t4 (the value) to $a0
	syscall				# Do it
	
	# Increase i++
	addi $t0, $t0, 1		#Increase $t0 by $t0 + 1
	
	# Go back to the beginning
	j forLoop2			#Jump to forLoop1
forLoopDone2:











