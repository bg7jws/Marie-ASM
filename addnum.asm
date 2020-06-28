   .text
main:
   lw $t1,number		#initial the first number
   lw $t4,times			#initial cycle times
begin:
   addi $t3,$t3,4		#pointer to next number
   lw $t2 number($t3)		#load the number to $t2
   add $t1,$t1,$t2		#add once
   subi $t4,$t4,1		#counter-1
   blez $t4 finish		#less or equ 0 finish
   j begin			#continue add
finish:
   add $t3,$t3,4		#pointer to the result address
   sw $t1,number($t3)		#store the sum to result address
.data  0x10010080
number:
   .word 43218888,23459999,84563211,-500300888,0		# define the numbers at here
   .word -349058790
times:
   .byte 3			# define how many numbers do add,
