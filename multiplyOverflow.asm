.data

.text
	addi $t0, $zero, 2000
	addi $t1, $zero, 10
	
	mult $t0, $t1 # The result will be placed at lo (low)
	
	mflo $s0 # Load from lo
	
	li $v0, 1
	add $a0, $zero, $s0
	syscall