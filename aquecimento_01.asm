#########################################################################################################
#Exercício 01
#
#Usando a instrução syscall, implemente um programa que: (1) solicite ao usuário que forneça dois
#números inteiros (X e Y); (2) realize a soma desses dois valores; e (3) apresente o resultado da soma.
#O programa deve apresentar no console mensagens do tipo:
#	Entre com o valor de X:
#	Entre com o valor de Y:
#	A soma de X e Y é igual a:
#OBS: Este exercício aborda o uso da instrução syscall, da instrução add e dos registradores.
#########################################################################################################

.data
	integer1: 	.asciiz "Forceca o primeiro inteiro: "
	integer2: 	.asciiz "Forneca o segundo inteiro: "
	resultado:	.asciiz "A soma de X e Y e igual a: "
	
.text 
	#Prompt the first integer
	li $v0, 4 		#Print a text
	la $a0, integer1 	#Load address in of integer1 in the argument register ($a0)
	syscall 		#Do it
	
	#Read the first integer
	li $v0, 5		#Read the text and store in $v0
	syscall			#Do it
	
	#Store the result in $t0
	move $t0, $v0		#Move to $t0 the value in $v0
	
	#Prompt the second integer
	li $v0, 4 		#Print a text
	la $a0, integer2 	#Load address in of integer2 in the argument register ($a0)
	syscall 		#Do it
	
	#Read the second integer
	li $v0, 5		#Read the text and store in $v0
	syscall			#Do it
	
	#Store the result in $t1
	move $t1, $v0		#Move to $t1 the value in $v0
	
	#Sum the temporary registers
	add $s0, $t0, $t1	#Add $t1 and $t2 and store the result in $s0
	
	#Print message "resultado"
	li $v0, 4		#Print a text
	la $a0, resultado	#Load the message "resultado" to $a0
	syscall			#Do it

	#Print the final sum stored in $s0
	li $v0, 1		#Print a integer
	move $a0, $s0		#Move $t0 (the sum) to $a0
	syscall			#Do it
	
	
	
	
