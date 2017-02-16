.text
.globl _Test_do
_Test_do:
   subq   $8, %rsp
_L_6:
   movq    %rbx, %rsp/*t004*/
   movq    %r12, %rsp/*t005*/
   movq    %r13, %rsp/*t006*/
   movq    %r14, %rsp/*t007*/
   movq    %r15, %rsp/*t008*/
   movq    %rdi, %rsp/*t000*/
   movq    $23, %rsp/*t014*/
   # movq    %rsp/*t014*/, %rsp/*t002*/
   # movq    %rsp/*t002*/, %rsp/*t015*/
   movq    $6, %rsp/*t016*/
   subq    %rsp/*t016*/, %rsp/*t015*/
   # movq    %rsp/*t015*/, %rsp/*t002*/
   # movq    %rsp/*t002*/, %rsp/*t018*/
   movq    $5, %rsp/*t019*/
   imulq   %rsp/*t019*/, %rsp/*t018*/
   # movq    %rsp/*t018*/, %rsp/*t017*/
   movq    $6, %rsp/*t020*/
   subq    %rsp/*t020*/, %rsp/*t017*/
   # movq    %rsp/*t017*/, %rsp/*t002*/
   movq    $7, %rsp/*t021*/
   movq    %rsp/*t021*/, (%rsp/*t000*/)
   movq    $8, %rsp/*t023*/
   # movq    %rsp/*t023*/, %rsp/*t022*/
   addq    %rsp/*t000*/, %rsp/*t022*/
   movq    (%rsp/*t000*/), %rsp/*t024*/
   movq    %rsp/*t024*/, (%rsp/*t022*/)
   movq    $4, %rsp/*t025*/
   movq    %rsp/*t025*/, %rdi
   call    _cs411newarray
   movq    %rax, %rsp/*t001*/
   xorq    %rsp/*t026*/, %rsp/*t026*/
   movq    $-8, %rsp/*t029*/
   # movq    %rsp/*t029*/, %rsp/*t028*/
   addq    %rsp/*t001*/, %rsp/*t028*/
   movq    (%rsp/*t028*/), %rsp/*t027*/
   cmpq    %rsp/*t027*/, %rsp/*t026*/
   jae     _boundsbad_3
_boundsok_4:
   movq    $1, %rsp/*t030*/
   movq    $-8, %rsp/*t033*/
   # movq    %rsp/*t033*/, %rsp/*t032*/
   addq    %rsp/*t001*/, %rsp/*t032*/
   movq    (%rsp/*t032*/), %rsp/*t031*/
   cmpq    %rsp/*t031*/, %rsp/*t030*/
   jae     _boundsbad_3
_boundsok_2:
   movq    $8, %rsp/*t036*/
   # movq    %rsp/*t036*/, %rsp/*t035*/
   addq    %rsp/*t001*/, %rsp/*t035*/
   movq    (%rsp/*t035*/), %rsp/*t034*/
   # movq    %rsp/*t034*/, %rsp/*t003*/
   movq    %rsp/*t003*/, (%rsp/*t001*/)
   xorq    %rsp/*t037*/, %rsp/*t037*/
   movq    %rsp/*t037*/, %rax
_bail_1:
   movq    %rsp/*t004*/, %rbx
   movq    %rsp/*t005*/, %r12
   movq    %rsp/*t006*/, %r13
   movq    %rsp/*t007*/, %r14
   movq    %rsp/*t008*/, %r15
   jmp     _DONE_7
_boundsbad_3:
   movq    $1, %rsp/*t038*/
   movq    %rsp/*t038*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_1
_DONE_7:
   # return sink
   addq   $8, %rsp
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
   movq    $16, %rsp/*t041*/
   movq    %rsp/*t041*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t040*/
   movq    %rsp/*t040*/, %rdi
   call    _Test_do
   movq    %rax, %rsp/*t039*/
   movq    %rsp/*t039*/, %rdi
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
