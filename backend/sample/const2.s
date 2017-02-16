.text
.globl _Test_do
_Test_do:
_L_12:
   movq    %rbx, %rsp/*t005*/
   movq    %r12, %rsp/*t006*/
   movq    %r13, %rsp/*t007*/
   movq    %r14, %rsp/*t008*/
   movq    %r15, %rsp/*t009*/
   movq    %rdi, %rsp/*t000*/
   xorq    %rsp/*t015*/, %rsp/*t015*/
   # movq    %rsp/*t015*/, %rsp/*t001*/
   movq    $6, %rsp/*t016*/
   # movq    %rsp/*t016*/, %rsp/*t002*/
   # movq    %rsp/*t002*/, %rsp/*t017*/
   addq    %rsp/*t001*/, %rsp/*t017*/
   # movq    %rsp/*t017*/, %rsp/*t004*/
   movq    $10, %rsp/*t018*/
   cmpq    %rsp/*t018*/, %rsp/*t001*/
   jge     _loopend_2
_loopbody_3:
   movq    $1, %rsp/*t020*/
   # movq    %rsp/*t020*/, %rsp/*t019*/
   addq    %rsp/*t001*/, %rsp/*t019*/
   # movq    %rsp/*t019*/, %rsp/*t001*/
   # movq    %rsp/*t001*/, %rsp/*t021*/
   imulq   %rsp/*t001*/, %rsp/*t021*/
   # movq    %rsp/*t021*/, %rsp/*t003*/
_looptest_4:
   movq    $10, %rsp/*t022*/
   cmpq    %rsp/*t022*/, %rsp/*t001*/
   jl      _loopbody_3
_loopend_2:
   movq    $7, %rsp/*t023*/
   cmpq    %rsp/*t023*/, %rsp/*t002*/
   jge     _L_6
_L_5:
   movq    $10, %rsp/*t024*/
   # movq    %rsp/*t024*/, %rsp/*t001*/
_L_7:
   movq    $3, %rsp/*t025*/
   cmpq    %rsp/*t025*/, %rsp/*t002*/
   jge     _L_9
_L_8:
   movq    $10, %rsp/*t026*/
   # movq    %rsp/*t026*/, %rsp/*t001*/
_L_10:
   # movq    %rsp/*t004*/, %rsp/*t027*/
   # movq    %rsp/*t002*/, %rsp/*t028*/
   # movq    %rsp/*t002*/, %rsp/*t029*/
   imulq   %rsp/*t004*/, %rsp/*t029*/
   subq    %rsp/*t029*/, %rsp/*t028*/
   addq    %rsp/*t028*/, %rsp/*t027*/
   movq    %rsp/*t027*/, %rax
_bail_1:
   movq    %rsp/*t005*/, %rbx
   movq    %rsp/*t006*/, %r12
   movq    %rsp/*t007*/, %r13
   movq    %rsp/*t008*/, %r14
   movq    %rsp/*t009*/, %r15
   jmp     _DONE_13
_L_6:
   # movq    %rsp/*t001*/, %rsp/*t001*/
   jmp     _L_7
_L_9:
   # movq    %rsp/*t001*/, %rsp/*t001*/
   jmp     _L_10
_DONE_13:
   # return sink
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_14:
   movq    %rbx, %rsp/*t010*/
   movq    %r12, %rsp/*t011*/
   movq    %r13, %rsp/*t012*/
   movq    %r14, %rsp/*t013*/
   movq    %r15, %rsp/*t014*/
   xorq    %rsp/*t032*/, %rsp/*t032*/
   movq    %rsp/*t032*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t031*/
   movq    %rsp/*t031*/, %rdi
   call    _Test_do
   movq    %rax, %rsp/*t030*/
   movq    %rsp/*t030*/, %rdi
   call    _cs411println
_bail_11:
   movq    %rsp/*t010*/, %rbx
   movq    %rsp/*t011*/, %r12
   movq    %rsp/*t012*/, %r13
   movq    %rsp/*t013*/, %r14
   movq    %rsp/*t014*/, %r15
_DONE_15:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
