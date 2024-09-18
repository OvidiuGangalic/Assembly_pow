.global main
.global pow
nameandid: .asciz "Ovidiu Gangalic ogangalic\nVictor Vorona vvorona\n"
input: .asciz "%ld"
output: .asciz "%ld"


main:
	#prologue
	pushq %rbp 				# push the base pointer 
	movq %rsp, %rbp 		# copy the stack pointer into the base pointer


	movq $0, %rax			# copy 0 into the registor ax
	movq $nameandid, %rdi 	# copy the string adress into the rdi


	# call printf				# call the printf funciton to print the string from rdi
	
	movq $0, %rax			# copy 0 into the registor ax
	subq $16, %rsp 			# reserve space
	movq $input, %rdi 		# input format string
	leaq -16(%rbp), %rsi 	#  scanf("%ld", pnt)
	call scanf				# 
	movq $0, %rax			# copy 0 into the registor ax
	
	movq $input, %rdi 		# input format string
	leaq -8(%rbp), %rsi 	#  scanf("%ld", pnt)
	call scanf				# 

	movq -16(%rbp), %rdi   	#copy the 
	movq -8(%rbp), %rsi 	#
	call pow 				# call the pow funciton
	movq %rax, %rsi 		# copy the final result into the rsi registor so it could be the input for the printf 
	movq $0, %rax			#clean the registor so we can call the printf function
	movq $output, %rdi 		#show what type of output we want 
	call printf	

	movq %rbp, %rsp  		# leave the usage from the stack from the main function
	popq %rbp				# restore base pointer location

end:
	movq $0, %rdi 			# clears the rdi 
	call exit


pow:
	
	#prologue
	pushq %rbp				# push the base pointer 
	movq %rsp, %rbp			# copy the stack pointer into the base pointer

	movq $1, %rax			# copy 1 into rax so we can multiply the rax 

loop: 
		
	cmpq $0, %rsi 			#compare rsi with 0
	jle fin 				#jump to fin if rsi is smaler or equals to 0
	imulq %rdi 				#multiply with rax the rdi number
	decq %rsi 				#decrease rsi which dictates the number of times you multiply 	
	jmp loop  				#go back to loop 

fin:
	movq %rbp, %rsp  		# leave the usage from the stack from the main function
	popq %rbp				# restore base pointer location

	ret 					#return to the call line







