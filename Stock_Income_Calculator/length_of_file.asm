
length_of_file:
#function to find length of data read from file
#arguments: a1=bufferAdress holding file data
#return file length in a0
	
#Start your coding here

#if no student code provided, this function just returns 0 in a0
li a0, 0

#save registers 
addi sp, sp, -4
sw t2, 0(sp)
iterate:

	lbu t2, (a1)	#lbu is load byte unsigned 
	blez t2, finish_loop		#break loop if we run out of bytes to read from (we start reading 0)
	addi a0, a0, 1			#count += 1 
	addi a1, a1, 1			#move to read from the next bit
	bgtz t2, iterate		#call back loop



#End your coding here
finish_loop:
	#restore registers
	lw t2, 0(sp)	
	addi sp, sp, 4
	ret
#######################end of length_of_file###############################################	
