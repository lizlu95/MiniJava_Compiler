.text
.globl _Test_do
_Test_do:
_L_9:
   movq    %rbx, %rsp/*t003*/
   movq    %r12, %rsp/*t004*/
   movq    %r13, %rsp/*t005*/
   movq    %r14, %rsp/*t006*/
   movq    %r15, %rsp/*t007*/
   movq    %rdi, %rsp/*t000*/
   xorq    %rsp/*t013*/, %rsp/*t013*/
   # movq    %rsp/*t013*/, %rsp/*t001*/
   movq    $10, %rsp/*t014*/
   cmpq    %rsp/*t014*/, %rsp/*t001*/
   jge     _loopend_2
_loopbody_3:
   xorq    %rsp/*t015*/, %rsp/*t015*/
   # movq    %rsp/*t015*/, %rsp/*t002*/
   movq    $10, %rsp/*t016*/
   cmpq    %rsp/*t016*/, %rsp/*t002*/
   jge     _loopend_5
_loopbody_6:
   movq    $1, %rsp/*t018*/
   # movq    %rsp/*t018*/, %rsp/*t017*/
   addq    %rsp/*t002*/, %rsp/*t017*/
   # movq    %rsp/*t017*/, %rsp/*t002*/
_looptest_7:
   movq    $10, %rsp/*t019*/
   cmpq    %rsp/*t019*/, %rsp/*t002*/
   jl      _loopbody_6
_loopend_5:
   movq    $1, %rsp/*t021*/
   # movq    %rsp/*t021*/, %rsp/*t020*/
   addq    %rsp/*t001*/, %rsp/*t020*/
   # movq    %rsp/*t020*/, %rsp/*t001*/
_looptest_4:
   movq    $10, %rsp/*t022*/
   cmpq    %rsp/*t022*/, %rsp/*t001*/
   jl      _loopbody_3
_loopend_2:
   # movq    %rsp/*t002*/, %rsp/*t023*/
   imulq   %rsp/*t001*/, %rsp/*t023*/
   movq    %rsp/*t023*/, %rax
_bail_1:
   movq    %rsp/*t003*/, %rbx
   movq    %rsp/*t004*/, %r12
   movq    %rsp/*t005*/, %r13
   movq    %rsp/*t006*/, %r14
   movq    %rsp/*t007*/, %r15
_DONE_10:
   # return sink
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_11:
   movq    %rbx, %rsp/*t008*/
   movq    %r12, %rsp/*t009*/
   movq    %r13, %rsp/*t010*/
   movq    %r14, %rsp/*t011*/
   movq    %r15, %rsp/*t012*/
   xorq    %rsp/*t026*/, %rsp/*t026*/
   movq    %rsp/*t026*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t025*/
   movq    %rsp/*t025*/, %rdi
   call    _Test_do
   movq    %rax, %rsp/*t024*/
   movq    %rsp/*t024*/, %rdi
   call    _cs411println
_bail_8:
   movq    %rsp/*t008*/, %rbx
   movq    %rsp/*t009*/, %r12
   movq    %rsp/*t010*/, %r13
   movq    %rsp/*t011*/, %r14
   movq    %rsp/*t012*/, %r15
_DONE_12:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
