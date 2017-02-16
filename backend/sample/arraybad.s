.text
.globl _Foo_doit
_Foo_doit:
   subq   $8, %rsp
_L_7:
   movq    %rbx, %rsp/*t002*/
   movq    %r12, %rsp/*t003*/
   movq    %r13, %rsp/*t004*/
   movq    %r14, %rsp/*t005*/
   movq    %r15, %rsp/*t006*/
   movq    %rdi, %rsp/*t000*/
   movq    $2, %rsp/*t012*/
   movq    %rsp/*t012*/, %rdi
   call    _cs411newarray
   movq    %rax, %rsp/*t001*/
   xorq    %rsp/*t013*/, %rsp/*t013*/
   movq    $-8, %rsp/*t016*/
   # movq    %rsp/*t016*/, %rsp/*t015*/
   addq    %rsp/*t001*/, %rsp/*t015*/
   movq    (%rsp/*t015*/), %rsp/*t014*/
   cmpq    %rsp/*t014*/, %rsp/*t013*/
   jae     _boundsbad_3
_boundsok_2:
   xorq    %rsp/*t017*/, %rsp/*t017*/
   movq    %rsp/*t017*/, (%rsp/*t001*/)
   movq    $1, %rsp/*t018*/
   movq    $-8, %rsp/*t021*/
   # movq    %rsp/*t021*/, %rsp/*t020*/
   addq    %rsp/*t001*/, %rsp/*t020*/
   movq    (%rsp/*t020*/), %rsp/*t019*/
   cmpq    %rsp/*t019*/, %rsp/*t018*/
   jae     _boundsbad_3
_boundsok_4:
   movq    $8, %rsp/*t023*/
   # movq    %rsp/*t023*/, %rsp/*t022*/
   addq    %rsp/*t001*/, %rsp/*t022*/
   movq    $1, %rsp/*t024*/
   movq    %rsp/*t024*/, (%rsp/*t022*/)
   movq    $2, %rsp/*t025*/
   movq    $-8, %rsp/*t028*/
   # movq    %rsp/*t028*/, %rsp/*t027*/
   addq    %rsp/*t001*/, %rsp/*t027*/
   movq    (%rsp/*t027*/), %rsp/*t026*/
   cmpq    %rsp/*t026*/, %rsp/*t025*/
   jae     _boundsbad_3
_boundsok_5:
   movq    $16, %rsp/*t030*/
   # movq    %rsp/*t030*/, %rsp/*t029*/
   addq    %rsp/*t001*/, %rsp/*t029*/
   movq    $2, %rsp/*t031*/
   movq    %rsp/*t031*/, (%rsp/*t029*/)
   xorq    %rsp/*t032*/, %rsp/*t032*/
   movq    %rsp/*t032*/, %rax
_bail_1:
   movq    %rsp/*t002*/, %rbx
   movq    %rsp/*t003*/, %r12
   movq    %rsp/*t004*/, %r13
   movq    %rsp/*t005*/, %r14
   movq    %rsp/*t006*/, %r15
   jmp     _DONE_8
_boundsbad_3:
   movq    $1, %rsp/*t033*/
   movq    %rsp/*t033*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_1
_DONE_8:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_9:
   movq    %rbx, %rsp/*t007*/
   movq    %r12, %rsp/*t008*/
   movq    %r13, %rsp/*t009*/
   movq    %r14, %rsp/*t010*/
   movq    %r15, %rsp/*t011*/
   xorq    %rsp/*t036*/, %rsp/*t036*/
   movq    %rsp/*t036*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t035*/
   movq    %rsp/*t035*/, %rdi
   call    _Foo_doit
   movq    %rax, %rsp/*t034*/
   movq    %rsp/*t034*/, %rdi
   call    _cs411println
_bail_6:
   movq    %rsp/*t007*/, %rbx
   movq    %rsp/*t008*/, %r12
   movq    %rsp/*t009*/, %r13
   movq    %rsp/*t010*/, %r14
   movq    %rsp/*t011*/, %r15
_DONE_10:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
