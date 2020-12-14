   .text
main:
   la  $s1,arrayA
   lbu $s2,number
   ori  $a0,0             #mov ax,0
   sub $s2,$s2,1          #dec cx
   loop1:
   move $k0, $s2          #push cx
   move $k1, $s1          #push si  
   loop2: 
   lbu $a0, ($s1)
   lbu $a1, 1($s1)
   sub $a2,$a0,$a1
   blez $a2 cont
   sb $a0, 1($s1)
   sb $a1,($s1)
   cont:
   addiu $t0,$t0,1
   sub $s2,$s2,1
   bgtz $s2, loop2        #loop loop2
   move $t0,$k1           #pop si
   move $s2,$k0           #pop cx
   sub $s2,$s2,1
   bgtz $s2, loop1        #loop loop1
.data	
arrayA:
   .byte 45,32,16,22,9,14
number:
   .byte 6
