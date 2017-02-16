.text
.globl _Test_do
_Test_do:
   subq   $8, %rsp
_L_7:
   movq    %rbx, %rsp/*t005*/
   movq    %r12, %rsp/*t006*/
   movq    %r13, %rsp/*t007*/
   movq    %r14, %rsp/*t008*/
   movq    %r15, %rsp/*t009*/
   movq    %rdi, %rsp/*t000*/
   movq    $1, %rsp/*t022*/
   movq    %rsp/*t022*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _Test_id
   movq    %rax, %rsp/*t001*/
   movq    $2, %rsp/*t023*/
   movq    %rsp/*t023*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _Test_id
   movq    %rax, %rsp/*t002*/
   cmpq    %rsp/*t002*/, %rsp/*t001*/
   jge     _L_3
_L_2:
   # movq    %rsp/*t002*/, %rsp/*t024*/
   imulq   %rsp/*t001*/, %rsp/*t024*/
   # movq    %rsp/*t024*/, %rsp/*t003*/
_L_4:
   # movq    %rsp/*t002*/, %rsp/*t025*/
   imulq   %rsp/*t001*/, %rsp/*t025*/
   movq    %rsp/*t025*/, %rax
_bail_1:
   movq    %rsp/*t005*/, %rbx
   movq    %rsp/*t006*/, %r12
   movq    %rsp/*t007*/, %r13
   movq    %rsp/*t008*/, %r14
   movq    %rsp/*t009*/, %r15
   jmp     _DONE_8
_L_3:
   # movq    %rsp/*t002*/, %rsp/*t026*/
   imulq   %rsp/*t001*/, %rsp/*t026*/
   # movq    %rsp/*t026*/, %rsp/*t004*/
   jmp     _L_4
_DONE_8:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Test_id
_Test_id:
_L_9:
   movq    %rbx, %rsp/*t012*/
   movq    %r12, %rsp/*t013*/
   movq    %r13, %rsp/*t014*/
   movq    %r14, %rsp/*t015*/
   movq    %r15, %rsp/*t016*/
   movq    %rdi, %rsp/*t010*/
   movq    %rsi, %rsp/*t011*/
   movq    %rsp/*t011*/, %rax
_bail_5:
   movq    %rsp/*t012*/, %rbx
   movq    %rsp/*t013*/, %r12
   movq    %rsp/*t014*/, %r13
   movq    %rsp/*t015*/, %r14
   movq    %rsp/*t016*/, %r15
_DONE_10:
   # return sink
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_11:
   movq    %rbx, %rsp/*t017*/
   movq    %r12, %rsp/*t018*/
   movq    %r13, %rsp/*t019*/
   movq    %r14, %rsp/*t020*/
   movq    %r15, %rsp/*t021*/
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
   movq    %rsp/*t017*/, %rbx
   movq    %rsp/*t018*/, %r12
   movq    %rsp/*t019*/, %r13
   movq    %rsp/*t020*/, %r14
   movq    %rsp/*t021*/, %r15
_DONE_12:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
