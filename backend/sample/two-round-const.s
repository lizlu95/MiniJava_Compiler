.text
.globl _Test_do
_Test_do:
   subq   $8, %rsp
_L_7:
   movq    %rbx, %rsp/*t003*/
   movq    %r12, %rsp/*t004*/
   movq    %r13, %rsp/*t005*/
   movq    %r14, %rsp/*t006*/
   movq    %r15, %rsp/*t007*/
   movq    %rdi, %rsp/*t000*/
   movq    %rsp/*t000*/, %rdi
   call    _Test_something
   movq    %rax, %rsp/*t002*/
   xorq    %rsp/*t019*/, %rsp/*t019*/
   # movq    %rsp/*t019*/, %rsp/*t001*/
   xorq    %rsp/*t020*/, %rsp/*t020*/
   cmpq    %rsp/*t020*/, %rsp/*t001*/
   je      _L_3
_L_2:
   movq    $1, %rsp/*t022*/
   # movq    %rsp/*t022*/, %rsp/*t021*/
   addq    %rsp/*t002*/, %rsp/*t021*/
   # movq    %rsp/*t021*/, %rsp/*t002*/
_L_4:
   movq    $2, %rsp/*t024*/
   # movq    %rsp/*t024*/, %rsp/*t023*/
   addq    %rsp/*t002*/, %rsp/*t023*/
   movq    %rsp/*t023*/, %rax
_bail_1:
   movq    %rsp/*t003*/, %rbx
   movq    %rsp/*t004*/, %r12
   movq    %rsp/*t005*/, %r13
   movq    %rsp/*t006*/, %r14
   movq    %rsp/*t007*/, %r15
   jmp     _DONE_8
_L_3:
   xorq    %rsp/*t025*/, %rsp/*t025*/
   # movq    %rsp/*t025*/, %rsp/*t002*/
   jmp     _L_4
_DONE_8:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Test_something
_Test_something:
_L_9:
   movq    %rbx, %rsp/*t009*/
   movq    %r12, %rsp/*t010*/
   movq    %r13, %rsp/*t011*/
   movq    %r14, %rsp/*t012*/
   movq    %r15, %rsp/*t013*/
   movq    %rdi, %rsp/*t008*/
   movq    $3, %rsp/*t026*/
   movq    %rsp/*t026*/, %rax
_bail_5:
   movq    %rsp/*t009*/, %rbx
   movq    %rsp/*t010*/, %r12
   movq    %rsp/*t011*/, %r13
   movq    %rsp/*t012*/, %r14
   movq    %rsp/*t013*/, %r15
_DONE_10:
   # return sink
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_11:
   movq    %rbx, %rsp/*t014*/
   movq    %r12, %rsp/*t015*/
   movq    %r13, %rsp/*t016*/
   movq    %r14, %rsp/*t017*/
   movq    %r15, %rsp/*t018*/
   xorq    %rsp/*t029*/, %rsp/*t029*/
   movq    %rsp/*t029*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t028*/
   movq    %rsp/*t028*/, %rdi
   call    _Test_do
   movq    %rax, %rsp/*t027*/
   movq    %rsp/*t027*/, %rdi
   call    _cs411println
_bail_6:
   movq    %rsp/*t014*/, %rbx
   movq    %rsp/*t015*/, %r12
   movq    %rsp/*t016*/, %r13
   movq    %rsp/*t017*/, %r14
   movq    %rsp/*t018*/, %r15
_DONE_12:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
