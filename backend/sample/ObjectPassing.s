.text
.globl _Foo_doit
_Foo_doit:
   subq   $8, %rsp
_L_5:
   movq    %rbx, %rsp/*t001*/
   movq    %r12, %rsp/*t002*/
   movq    %r13, %rsp/*t003*/
   movq    %r14, %rsp/*t004*/
   movq    %r15, %rsp/*t005*/
   movq    %rdi, %rsp/*t000*/
   movq    $10, %rsp/*t025*/
   movq    %rsp/*t025*/, (%rsp/*t000*/)
   movq    %rsp/*t000*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _Foo_ident
   movq    %rax, %rsp/*t024*/
   movq    %rsp/*t024*/, %rdi
   call    _Foo_getField
   # movq    %rax, %rax
_bail_1:
   movq    %rsp/*t001*/, %rbx
   movq    %rsp/*t002*/, %r12
   movq    %rsp/*t003*/, %r13
   movq    %rsp/*t004*/, %r14
   movq    %rsp/*t005*/, %r15
_DONE_6:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Foo_ident
_Foo_ident:
_L_7:
   movq    %rbx, %rsp/*t008*/
   movq    %r12, %rsp/*t009*/
   movq    %r13, %rsp/*t010*/
   movq    %r14, %rsp/*t011*/
   movq    %r15, %rsp/*t012*/
   movq    %rdi, %rsp/*t006*/
   movq    %rsi, %rsp/*t007*/
   movq    %rsp/*t007*/, %rax
_bail_2:
   movq    %rsp/*t008*/, %rbx
   movq    %rsp/*t009*/, %r12
   movq    %rsp/*t010*/, %r13
   movq    %rsp/*t011*/, %r14
   movq    %rsp/*t012*/, %r15
_DONE_8:
   # return sink
   ret

.text
.globl _Foo_getField
_Foo_getField:
_L_9:
   movq    %rbx, %rsp/*t014*/
   movq    %r12, %rsp/*t015*/
   movq    %r13, %rsp/*t016*/
   movq    %r14, %rsp/*t017*/
   movq    %r15, %rsp/*t018*/
   movq    %rdi, %rsp/*t013*/
   movq    (%rsp/*t013*/), %rsp/*t026*/
   movq    %rsp/*t026*/, %rax
_bail_3:
   movq    %rsp/*t014*/, %rbx
   movq    %rsp/*t015*/, %r12
   movq    %rsp/*t016*/, %r13
   movq    %rsp/*t017*/, %r14
   movq    %rsp/*t018*/, %r15
_DONE_10:
   # return sink
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_11:
   movq    %rbx, %rsp/*t019*/
   movq    %r12, %rsp/*t020*/
   movq    %r13, %rsp/*t021*/
   movq    %r14, %rsp/*t022*/
   movq    %r15, %rsp/*t023*/
   movq    $8, %rsp/*t029*/
   movq    %rsp/*t029*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t028*/
   movq    %rsp/*t028*/, %rdi
   call    _Foo_doit
   movq    %rax, %rsp/*t027*/
   movq    %rsp/*t027*/, %rdi
   call    _cs411println
_bail_4:
   movq    %rsp/*t019*/, %rbx
   movq    %rsp/*t020*/, %r12
   movq    %rsp/*t021*/, %r13
   movq    %rsp/*t022*/, %r14
   movq    %rsp/*t023*/, %r15
_DONE_12:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
