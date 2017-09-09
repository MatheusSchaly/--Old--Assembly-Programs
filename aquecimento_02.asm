#########################################################################################################
#Exercício 02
#
#Implemente um laço de repetição do tipo for que conte de 0 a 9 e imprima o valor de contagem no
#console, conforme o exemplo abaixo:
#	for (i=0; i<10; i++)
#	cout << i;
#OBS: Este exercício aborda o uso de instruções de desvio (podem ser usadas pseudo-instruções),
#aritmética e da instrução syscall.
#########################################################################################################

.data
	
.text
	li $t0, 0	# Load to $t0 the value 0 (is the "i")
	li $t1, 10	# Load to $t1 the value 4 (how many times the loop will execute)
	
forLoop:
	# If condition
	beq  $t1, $t0, forLoopDone	# Branch if $t1 = $0 to forLoopDone
	
	# Print $t0
	li $v0, 1			# Print a integer
	move $a0, $t0			# Move $t0 (the i) to $a0
	syscall				# Do it
	
	# Increase i++
	addi $t0, $t0, 1		# Increase $t0 by $t0 + 1
	
	# Loop
	j forLoop			# Jump to forLoop
forLoopDone:
