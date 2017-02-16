.text
.globl _Test_do
_Test_do:
_L_6:
   movq    %rbx, %rsp/*t004*/
   movq    %r12, %rsp/*t005*/
   movq    %r13, %rsp/*t006*/
   movq    %r14, %rsp/*t007*/
   movq    %r15, %rsp/*t008*/
   movq    %rdi, %rsp/*t000*/
   movq    %rsi, %rsp/*t001*/
   movq    $3, %rsp/*t014*/
   cmpq    %rsp/*t001*/, %rsp/*t014*/
   jge     _loopend_2
_loopbody_3:
   xorq    %rsp/*t015*/, %rsp/*t015*/
   # movq    %rsp/*t015*/, %rsp/*t002*/
   movq    $5, %rsp/*t017*/
   # movq    %rsp/*t017*/, %rsp/*t016*/
   imulq   %rsp/*t001*/, %rsp/*t016*/
   # movq    %rsp/*t016*/, %rsp/*t003*/
   # movq    %rsp/*t001*/, %rsp/*t018*/
   movq    $2, %rsp/*t019*/
   subq    %rsp/*t019*/, %rsp/*t018*/
   # movq    %rsp/*t018*/, %rsp/*t001*/
_looptest_4:
   movq    $3, %rsp/*t020*/
   cmpq    %rsp/*t001*/, %rsp/*t020*/
   jl      _loopbody_3
_loopend_2:
   movq    $6, %rsp/*t021*/
   movq    %rsp/*t021*/, %rax
_bail_1:
   movq    %rsp/*t004*/, %rbx
   movq    %rsp/*t005*/, %r12
   movq    %rsp/*t006*/, %r13
   movq    %rsp/*t007*/, %r14
   movq    %rsp/*t008*/, %r15
_DONE_7:
   # return sink
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_8:
   movq    %rbx, %rsp/*t009*/
   movq    %r12, %rsp/*t010*/
   movq    %r13, %rsp/*t011*/
   movq    %r14, %rsp/*t012*/
   movq    %r15, %rsp/*t013*/
   xorq    %rsp/*t024*/, %rsp/*t024*/
   movq    %rsp/*t024*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t023*/
   movq    $6, %rsp/*t025*/
   movq    %rsp/*t025*/, %rsi
   movq    %rsp/*t023*/, %rdi
   call    _Test_do
   movq    %rax, %rsp/*t022*/
   movq    %rsp/*t022*/, %rdi
   call    _cs411println
_bail_5:
   movq    %rsp/*t009*/, %rbx
   movq    %rsp/*t010*/, %r12
   movq    %rsp/*t011*/, %r13
   movq    %rsp/*t012*/, %r14
   movq    %rsp/*t013*/, %r15
_DONE_9:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
