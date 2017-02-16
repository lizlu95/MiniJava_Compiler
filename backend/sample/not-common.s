.text
.globl _Test_do
_Test_do:
_L_6:
   movq    %rbx, %rsp/*t005*/
   movq    %r12, %rsp/*t006*/
   movq    %r13, %rsp/*t007*/
   movq    %r14, %rsp/*t008*/
   movq    %r15, %rsp/*t009*/
   movq    %rdi, %rsp/*t000*/
   movq    $1, %rsp/*t015*/
   # movq    %rsp/*t015*/, %rsp/*t001*/
   movq    $2, %rsp/*t016*/
   # movq    %rsp/*t016*/, %rsp/*t002*/
   cmpq    %rsp/*t002*/, %rsp/*t001*/
   jge     _L_3
_L_2:
   # movq    %rsp/*t002*/, %rsp/*t017*/
   imulq   %rsp/*t001*/, %rsp/*t017*/
   # movq    %rsp/*t017*/, %rsp/*t001*/
_L_4:
   # movq    %rsp/*t002*/, %rsp/*t018*/
   imulq   %rsp/*t001*/, %rsp/*t018*/
   movq    %rsp/*t018*/, %rax
_bail_1:
   movq    %rsp/*t005*/, %rbx
   movq    %rsp/*t006*/, %r12
   movq    %rsp/*t007*/, %r13
   movq    %rsp/*t008*/, %r14
   movq    %rsp/*t009*/, %r15
   jmp     _DONE_7
_L_3:
   # movq    %rsp/*t002*/, %rsp/*t019*/
   imulq   %rsp/*t001*/, %rsp/*t019*/
   # movq    %rsp/*t019*/, %rsp/*t004*/
   jmp     _L_4
_DONE_7:
   # return sink
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_8:
   movq    %rbx, %rsp/*t010*/
   movq    %r12, %rsp/*t011*/
   movq    %r13, %rsp/*t012*/
   movq    %r14, %rsp/*t013*/
   movq    %r15, %rsp/*t014*/
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
   movq    %rsp/*t010*/, %rbx
   movq    %rsp/*t011*/, %r12
   movq    %rsp/*t012*/, %r13
   movq    %rsp/*t013*/, %r14
   movq    %rsp/*t014*/, %r15
_DONE_9:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
