.text
.globl _Test_do
_Test_do:
_L_6:
   movq    %rbx, %rsp/*t003*/
   movq    %r12, %rsp/*t004*/
   movq    %r13, %rsp/*t005*/
   movq    %r14, %rsp/*t006*/
   movq    %r15, %rsp/*t007*/
   movq    %rdi, %rsp/*t000*/
   xorq    %rsp/*t013*/, %rsp/*t013*/
   # movq    %rsp/*t013*/, %rsp/*t001*/
   movq    $5, %rsp/*t014*/
   # movq    %rsp/*t014*/, %rsp/*t002*/
   movq    $10, %rsp/*t015*/
   cmpq    %rsp/*t015*/, %rsp/*t001*/
   jge     _loopend_2
_loopbody_3:
   movq    $1, %rsp/*t017*/
   # movq    %rsp/*t017*/, %rsp/*t016*/
   addq    %rsp/*t001*/, %rsp/*t016*/
   # movq    %rsp/*t016*/, %rsp/*t001*/
_looptest_4:
   movq    $10, %rsp/*t018*/
   cmpq    %rsp/*t018*/, %rsp/*t001*/
   jl      _loopbody_3
_loopend_2:
   # movq    %rsp/*t002*/, %rsp/*t019*/
   imulq   %rsp/*t001*/, %rsp/*t019*/
   movq    %rsp/*t019*/, %rax
_bail_1:
   movq    %rsp/*t003*/, %rbx
   movq    %rsp/*t004*/, %r12
   movq    %rsp/*t005*/, %r13
   movq    %rsp/*t006*/, %r14
   movq    %rsp/*t007*/, %r15
_DONE_7:
   # return sink
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_8:
   movq    %rbx, %rsp/*t008*/
   movq    %r12, %rsp/*t009*/
   movq    %r13, %rsp/*t010*/
   movq    %r14, %rsp/*t011*/
   movq    %r15, %rsp/*t012*/
   xorq    %rsp/*t022*/, %rsp/*t022*/
   movq    %rsp/*t022*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t021*/
   movq    %rsp/*t021*/, %rdi
   call    _Test_do
   movq    %rax, %rsp/*t020*/
   movq    %rsp/*t020*/, %rdi
   call    _cs411println
_bail_5:
   movq    %rsp/*t008*/, %rbx
   movq    %rsp/*t009*/, %r12
   movq    %rsp/*t010*/, %r13
   movq    %rsp/*t011*/, %r14
   movq    %rsp/*t012*/, %r15
_DONE_9:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
