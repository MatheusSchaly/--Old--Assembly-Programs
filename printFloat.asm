.data
	myFloat: .float 10
.text
	li $v0, 2 #To print a float
	lwc1 $f12, myFloat
	syscall