.text
.globl _A_m
_A_m:
_L_4:
   movq    %rbx, %rax/*t001*/
   movq    %r12, %rax/*t002*/
   movq    %r13, %rax/*t003*/
   movq    %r14, %rax/*t004*/
   movq    %r15, %rax/*t005*/
   movq    %rdi, %rax/*t000*/
   xorq    %rax/*t019*/, %rax/*t019*/
   # movq    %rax/*t019*/, %rax
_bail_1:
   movq    %rax/*t001*/, %rbx
   movq    %rax/*t002*/, %r12
   movq    %rax/*t003*/, %r13
   movq    %rax/*t004*/, %r14
   movq    %rax/*t005*/, %r15
_DONE_5:
   # return sink
   ret

.text
.globl _Test_do
_Test_do:
   subq   $8, %rsp
_L_6:
   movq    %rbx, %rax/*t009*/
   movq    %r12, %rax/*t010*/
   movq    %r13, %rax/*t011*/
   movq    %r14, %rax/*t012*/
   movq    %r15, %rax/*t013*/
   movq    %rdi, %rax/*t006*/
   xorq    %rax/*t020*/, %rax/*t020*/
   # movq    %rax/*t020*/, %rax/*t007*/
   movq    (%rax/*t006*/), %rax/*t021*/
   movq    %rax/*t021*/, %rdi
   call    _A_m
   # movq    %rax, %rax/*t008*/
   movq    %rax/*t007*/, %rdi
   call    _A_m
   # movq    %rax, %rax/*t008*/
   xorq    %rax/*t022*/, %rax/*t022*/
   # movq    %rax/*t022*/, %rax
_bail_2:
   movq    %rax/*t009*/, %rbx
   movq    %rax/*t010*/, %r12
   movq    %rax/*t011*/, %r13
   movq    %rax/*t012*/, %r14
   movq    %rax/*t013*/, %r15
_DONE_7:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_8:
   movq    %rbx, %rax/*t014*/
   movq    %r12, %rax/*t015*/
   movq    %r13, %rax/*t016*/
   movq    %r14, %rax/*t017*/
   movq    %r15, %rax/*t018*/
   movq    $8, %rax/*t025*/
   movq    %rax/*t025*/, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t024*/
   movq    %rax/*t024*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t023*/
   movq    %rax/*t023*/, %rdi
   call    _cs411println
_bail_3:
   movq    %rax/*t014*/, %rbx
   movq    %rax/*t015*/, %r12
   movq    %rax/*t016*/, %r13
   movq    %rax/*t017*/, %r14
   movq    %rax/*t018*/, %r15
_DONE_9:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
