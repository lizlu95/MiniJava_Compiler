.text
.globl _Test_odd
_Test_odd:
_L_18:
   movq    %rbx, %rsp/*t003*/
   movq    %r12, %rsp/*t004*/
   movq    %r13, %rsp/*t005*/
   movq    %r14, %rsp/*t006*/
   movq    %r15, %rsp/*t007*/
   movq    %rdi, %rsp/*t000*/
   movq    %rsi, %rsp/*t001*/
   movq    $1, %rsp/*t021*/
   cmpq    %rsp/*t001*/, %rsp/*t021*/
   jge     _loopend_2
_loopbody_3:
   # movq    %rsp/*t001*/, %rsp/*t022*/
   movq    $2, %rsp/*t023*/
   subq    %rsp/*t023*/, %rsp/*t022*/
   # movq    %rsp/*t022*/, %rsp/*t001*/
_looptest_4:
   movq    $1, %rsp/*t024*/
   cmpq    %rsp/*t001*/, %rsp/*t024*/
   jl      _loopbody_3
_loopend_2:
   movq    $1, %rsp/*t025*/
   # movq    %rsp/*t025*/, %rsp/*t002*/
   movq    $1, %rsp/*t026*/
   cmpq    %rsp/*t026*/, %rsp/*t001*/
   jge     _L_6
_L_5:
   movq    %rsp/*t002*/, %rax
_bail_1:
   movq    %rsp/*t003*/, %rbx
   movq    %rsp/*t004*/, %r12
   movq    %rsp/*t005*/, %r13
   movq    %rsp/*t006*/, %r14
   movq    %rsp/*t007*/, %r15
   jmp     _DONE_19
_L_6:
   xorq    %rsp/*t027*/, %rsp/*t027*/
   # movq    %rsp/*t027*/, %rsp/*t002*/
   jmp     _L_5
_DONE_19:
   # return sink
   ret

.text
.globl _Test_do
_Test_do:
   subq   $8, %rsp
_L_20:
   movq    %rbx, %rsp/*t011*/
   movq    %r12, %rsp/*t012*/
   movq    %r13, %rsp/*t013*/
   movq    %r14, %rsp/*t014*/
   movq    %r15, %rsp/*t015*/
   movq    %rdi, %rsp/*t008*/
   xorq    %rsp/*t029*/, %rsp/*t029*/
   # movq    %rsp/*t029*/, %rsp/*t009*/
   movq    $10, %rsp/*t030*/
   cmpq    %rsp/*t030*/, %rsp/*t009*/
   jge     _loopend_8
_loopbody_9:
   xorq    %rsp/*t031*/, %rsp/*t031*/
   # movq    %rsp/*t031*/, %rsp/*t010*/
   movq    $10, %rsp/*t032*/
   cmpq    %rsp/*t032*/, %rsp/*t010*/
   jge     _loopend_11
_loopbody_12:
   movq    %rsp/*t010*/, %rsi
   movq    %rsp/*t008*/, %rdi
   call    _Test_odd
   movq    %rax, %rsp/*t028*/
   xorq    %rsp/*t033*/, %rsp/*t033*/
   cmpq    %rsp/*t033*/, %rsp/*t028*/
   je      _L_15
_L_14:
   movq    $1, %rsp/*t035*/
   # movq    %rsp/*t035*/, %rsp/*t034*/
   addq    %rsp/*t010*/, %rsp/*t034*/
   # movq    %rsp/*t034*/, %rsp/*t010*/
_L_16:
_looptest_13:
   movq    $10, %rsp/*t036*/
   cmpq    %rsp/*t036*/, %rsp/*t010*/
   jl      _loopbody_12
_loopend_11:
   movq    $1, %rsp/*t038*/
   # movq    %rsp/*t038*/, %rsp/*t037*/
   addq    %rsp/*t009*/, %rsp/*t037*/
   # movq    %rsp/*t037*/, %rsp/*t009*/
_looptest_10:
   movq    $10, %rsp/*t039*/
   cmpq    %rsp/*t039*/, %rsp/*t009*/
   jl      _loopbody_9
_loopend_8:
   # movq    %rsp/*t010*/, %rsp/*t040*/
   imulq   %rsp/*t009*/, %rsp/*t040*/
   movq    %rsp/*t040*/, %rax
_bail_7:
   movq    %rsp/*t011*/, %rbx
   movq    %rsp/*t012*/, %r12
   movq    %rsp/*t013*/, %r13
   movq    %rsp/*t014*/, %r14
   movq    %rsp/*t015*/, %r15
   jmp     _DONE_21
_L_15:
   movq    $3, %rsp/*t042*/
   # movq    %rsp/*t042*/, %rsp/*t041*/
   addq    %rsp/*t010*/, %rsp/*t041*/
   # movq    %rsp/*t041*/, %rsp/*t010*/
   jmp     _L_16
_DONE_21:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_22:
   movq    %rbx, %rsp/*t016*/
   movq    %r12, %rsp/*t017*/
   movq    %r13, %rsp/*t018*/
   movq    %r14, %rsp/*t019*/
   movq    %r15, %rsp/*t020*/
   xorq    %rsp/*t045*/, %rsp/*t045*/
   movq    %rsp/*t045*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t044*/
   movq    %rsp/*t044*/, %rdi
   call    _Test_do
   movq    %rax, %rsp/*t043*/
   movq    %rsp/*t043*/, %rdi
   call    _cs411println
_bail_17:
   movq    %rsp/*t016*/, %rbx
   movq    %rsp/*t017*/, %r12
   movq    %rsp/*t018*/, %r13
   movq    %rsp/*t019*/, %r14
   movq    %rsp/*t020*/, %r15
_DONE_23:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
