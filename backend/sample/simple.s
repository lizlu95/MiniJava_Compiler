.text
.globl _Test_do
_Test_do:
   subq   $8, %rsp
_L_3:
   movq    %rbx, %rsp/*t002*/
   movq    %r12, %rsp/*t003*/
   movq    %r13, %rsp/*t004*/
   movq    %r14, %rsp/*t005*/
   movq    %r15, %rsp/*t006*/
   movq    %rdi, %rsp/*t000*/
   movq    %rsi, %rsp/*t001*/
   movq    %rsp/*t001*/, %rdi
   call    _cs411println
   movq    %rsp/*t001*/, %rax
_bail_1:
   movq    %rsp/*t002*/, %rbx
   movq    %rsp/*t003*/, %r12
   movq    %rsp/*t004*/, %r13
   movq    %rsp/*t005*/, %r14
   movq    %rsp/*t006*/, %r15
_DONE_4:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_5:
   movq    %rbx, %rsp/*t007*/
   movq    %r12, %rsp/*t008*/
   movq    %r13, %rsp/*t009*/
   movq    %r14, %rsp/*t010*/
   movq    %r15, %rsp/*t011*/
   xorq    %rsp/*t014*/, %rsp/*t014*/
   movq    %rsp/*t014*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t013*/
   movq    $6, %rsp/*t015*/
   movq    %rsp/*t015*/, %rsi
   movq    %rsp/*t013*/, %rdi
   call    _Test_do
   movq    %rax, %rsp/*t012*/
   movq    %rsp/*t012*/, %rdi
   call    _cs411println
_bail_2:
   movq    %rsp/*t007*/, %rbx
   movq    %rsp/*t008*/, %r12
   movq    %rsp/*t009*/, %r13
   movq    %rsp/*t010*/, %r14
   movq    %rsp/*t011*/, %r15
_DONE_6:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
