income_from_record:
#function to return numerical income from a specific record
#e.g. for record "Microsoft,34\r\n", income to return is 34(for which name is Microsoft)

#arguments:	a0 contains pointer to start of numerical income in record 

#TEST CASE
#function RETURNS income numerical value of the asci income in a0 (34 in our example)
	
# Start your coding from here!
#ASCII for "\r" is 13
#ASCII for "\n" is 10
#make sure income_from_record and totalIncome don't use the same t registers
	#li a0, 0
	#retrieve from memory
			#points to the very first digit of the number
			
	#uses t6, t5, t4, t0
	
	#save registers
	addi sp, sp, -32	#4 + 4+ 8
	sd s5, 0(sp)
	sd s4, 8(sp)
	sd t1, 16(sp)
	sd t0, 24(sp)

	addi s5, zero, 13 #ASCII for "\r"
	addi s4, zero, 10 #to multiply
	lwu t1, 0(a0)	#loading memory address
	addi a0, zero, 0 #result
	income_from_record_loop:
		#iterarte over all characters in loop, use same strategy as length_of _file
		lbu t0, 0(t1)	#pulling data from memory address
		addi t1, t1, 1	#iterating to read from next bit
		beq t0, s5, exit_loop_ifr  #exit loop if next entry is "\r" (branch if eqaul to ascii value of "\r" or "\n" for a mac)
		addi t0, t0, -48       #to get ASCII value


		add a0, a0, t0		#add t0 to sum
		mul a0, a0, s4          #t0 = t0 * 10
		
		bne t0, s5, income_from_record_loop
		#30, 360, 36550
	
	#if no student code entered, a0 just returns 0 always :(
	
	#put final value in a0 or a1
	
# End your  coding  here! 
	exit_loop_ifr:

		div a0, a0, s4		#we multiply one extra time, so this gets rid of that
		#restore values
		ld s5, 0(sp)
		ld s4, 8(sp)
		ld t1, 16(sp)
		ld t0, 24(sp)
		addi sp, sp, 32 	#4 + 4+ 8
		ret
	
#######################end of income_from_record###############################################	
