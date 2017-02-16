.text
.globl _Foo_doit
_Foo_doit:
_L_6:
   movq    %rbx, %rsp/*t004*/
   movq    %r12, %rsp/*t005*/
   movq    %r13, %rsp/*t006*/
   movq    %r14, %rsp/*t007*/
   movq    %r15, %rsp/*t008*/
   movq    %rdi, %rsp/*t000*/
   movq    %rsi, %rsp/*t001*/
   xorq    %rsp/*t014*/, %rsp/*t014*/
   # movq    %rsp/*t014*/, %rsp/*t002*/
   movq    $1, %rsp/*t015*/
   # movq    %rsp/*t015*/, %rsp/*t003*/
   cmpq    %rsp/*t001*/, %rsp/*t003*/
   jge     _loopend_2
_loopbody_3:
   # movq    %rsp/*t003*/, %rsp/*t016*/
   addq    %rsp/*t002*/, %rsp/*t016*/
   # movq    %rsp/*t016*/, %rsp/*t002*/
   movq    $1, %rsp/*t018*/
   # movq    %rsp/*t018*/, %rsp/*t017*/
   addq    %rsp/*t003*/, %rsp/*t017*/
   # movq    %rsp/*t017*/, %rsp/*t003*/
_looptest_4:
   cmpq    %rsp/*t001*/, %rsp/*t003*/
   jl      _loopbody_3
_loopend_2:
   movq    %rsp/*t002*/, %rax
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
   xorq    %rsp/*t021*/, %rsp/*t021*/
   movq    %rsp/*t021*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t020*/
   movq    $10, %rsp/*t022*/
   movq    %rsp/*t022*/, %rsi
   movq    %rsp/*t020*/, %rdi
   call    _Foo_doit
   movq    %rax, %rsp/*t019*/
   movq    %rsp/*t019*/, %rdi
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
