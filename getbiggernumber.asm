.text
main:
		ori  $a0,4					#address increace step
		ori  $a1,3					#cycle times
		lw $t0,number				#load 1st to t0 and k0
		lw $k0,number
label1:   	lw $t1,number($a0)		#load next to t1 and k1
		lw $k1,number($a0)
		sub $a3,$t0,$t1				#sub t0 t1
		bgez $a3,continue			#if t0 bigger or equel next
		move $t0,$k1				#otherwise exchange t0 t1, and k0 k1
		move $t1,$k0
		move $k0,$t0
		move $k1,$t1
continue:
		add $a0,$a0,4				#a0 as the point add 4 for next address
		sub $a1,$a1,1				#cycly times-1
		blez $a1,end				#reach time to exit
		j label1					#cycly not reach time
end:		sw $t0,number($a0)		#get the biggest put into next address

.data 0x10010080
number:
		.word 51233467,88201469,88201470,-204620463

