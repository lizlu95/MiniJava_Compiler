.text
.globl _Test_do
_Test_do:
   subq   $8, %rsp
_L_6:
   movq    %rbx, %rsp/*t003*/
   movq    %r12, %rsp/*t004*/
   movq    %r13, %rsp/*t005*/
   movq    %r14, %rsp/*t006*/
   movq    %r15, %rsp/*t007*/
   movq    %rdi, %rsp/*t000*/
   movq    $1, %rsp/*t013*/
   # movq    %rsp/*t013*/, %rsp/*t001*/
   xorq    %rsp/*t014*/, %rsp/*t014*/
   cmpq    %rsp/*t014*/, %rsp/*t001*/
   je      _L_3
_L_2:
   movq    $1, %rsp/*t015*/
   movq    %rsp/*t015*/, %rdi
   call    _cs411println
_L_4:
   movq    $23, %rsp/*t016*/
   movq    %rsp/*t016*/, %rax
_bail_1:
   movq    %rsp/*t003*/, %rbx
   movq    %rsp/*t004*/, %r12
   movq    %rsp/*t005*/, %r13
   movq    %rsp/*t006*/, %r14
   movq    %rsp/*t007*/, %r15
   jmp     _DONE_7
_L_3:
   movq    $2, %rsp/*t017*/
   movq    %rsp/*t017*/, %rdi
   call    _cs411println
   jmp     _L_4
_DONE_7:
   # return sink
   addq   $8, %rsp
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
   xorq    %rsp/*t020*/, %rsp/*t020*/
   movq    %rsp/*t020*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t019*/
   movq    %rsp/*t019*/, %rdi
   call    _Test_do
   movq    %rax, %rsp/*t018*/
   movq    %rsp/*t018*/, %rdi
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
