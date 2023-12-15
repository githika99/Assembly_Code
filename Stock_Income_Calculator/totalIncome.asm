totalIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0:the total income (add up all the record incomes)

	#if empty file, return 0 for  a0
	bnez a1, totalIncome_fileNotEmpty
	li a0, 0
	ret

totalIncome_fileNotEmpty:
	addi t2, zero, 0 	#t2 is sum
	# Start your coding from here!

	#li a0, 0
	#if no student code entered, a0 just returns 0 always :(
	
	addi a0, a0, 4 #first company income
	#addi a1, a1, -1
	
	#INSERRT HERE
	totalIncomeloop:
		blez a1, endtotalIncomeloop
		#lw t1, (a0)	#fetches data
		
		#save ra and a0
		addi sp, sp, -16		#if saving ra, make it -16
		sw a0, 0(sp)
		sw ra, 8(sp)
		
		#mv a0, t1
		jal income_from_record	
		add t2, t2, a0			#save the output of income_from_record to t2 because it is stored in a0 and a0 will get overwritten
		
		#restore a0 and ra
		ld a0, 0(sp)
		ld ra, 8(sp)
		addi sp, sp, 16		
		
		addi a0, a0, 8  	#get to next company income
		addi a1, a1, -1		#number of companies -= 1
		j totalIncomeloop
	
# End your  coding  here!
	endtotalIncomeloop:
		mv a0, t2
		ret
#######################end of nameOfMaxIncome_totalIncome###############################################
