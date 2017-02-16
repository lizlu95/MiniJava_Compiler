   .text
.globl _cs411main
_cs411main:
   pushq  %rbp
   movq   %rsp, %rbp
_L_1:
   movq    %rbx, t018
   movq    %r12, t019
   movq    %r13, t020
   movq    %r14, t021
   movq    %r15, t022
   movq    $0, t000
   movq    $1, t001
   movq    t001, t002
   addq    t000, t002
   movq    t002, t003
   addq    t001, t003
   movq    t003, t004
   addq    t002, t004
   movq    t004, t005
   addq    t003, t005
   movq    t005, t006
   addq    t004, t006
   movq    t006, t007
   addq    t005, t007
   movq    t007, t008
   addq    t006, t008
   movq    t008, t009
   addq    t007, t009
   movq    t009, t010
   addq    t008, t010
   movq    t010, t011
   addq    t009, t011
   movq    t011, t012
   addq    t010, t012
   movq    t012, t013
   addq    t011, t013
   movq    t013, t014
   addq    t012, t014
   movq    t014, t015
   addq    t013, t015
   movq    t015, t016
   addq    t014, t016
   movq    t016, t037
   addq    t015, t037
   movq    t037, t036
   addq    t014, t036
   movq    t036, t035
   addq    t013, t035
   movq    t035, t034
   addq    t012, t034
   movq    t034, t033
   addq    t011, t033
   movq    t033, t032
   addq    t010, t032
   movq    t032, t031
   addq    t009, t031
   movq    t031, t030
   addq    t008, t030
   movq    t030, t029
   addq    t007, t029
   movq    t029, t028
   addq    t006, t028
   movq    t028, t027
   addq    t005, t027
   movq    t027, t026
   addq    t004, t026
   movq    t026, t025
   addq    t003, t025
   movq    t025, t024
   addq    t002, t024
   movq    t024, t023
   addq    t001, t023
   movq    t023, t017
   addq    t000, t017
   movq    t017, %rdi
   call    _cs411println
   movq    t018, %rbx
   movq    t019, %r12
   movq    t020, %r13
   movq    t021, %r14
   movq    t022, %r15
_DONE_2:
   #return sink
   leave
   ret

   .ident	"expression compiler: cs411 course project 2011w2"

