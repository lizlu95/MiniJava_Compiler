.text
.globl _Foo_do
_Foo_do:
   subq   $8, %rsp
_L_9:
   movq    %rbx, %rsp/*t004*/
   movq    %r12, %rsp/*t005*/
   movq    %r13, %rsp/*t006*/
   movq    %r14, %rsp/*t007*/
   movq    %r15, %rsp/*t008*/
   movq    %rdi, %rsp/*t000*/
   movq    %rsi, %rsp/*t001*/
   movq    $5, %rsp/*t023*/
   movq    %rsp/*t023*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _Foo_n
   movq    %rax, %rsp/*t002*/
   xorq    %rsp/*t024*/, %rsp/*t024*/
   movq    $-8, %rsp/*t027*/
   # movq    %rsp/*t027*/, %rsp/*t026*/
   addq    %rsp/*t002*/, %rsp/*t026*/
   movq    (%rsp/*t026*/), %rsp/*t025*/
   cmpq    %rsp/*t025*/, %rsp/*t024*/
   jae     _boundsbad_3
_boundsok_2:
   movq    (%rsp/*t002*/), %rsp/*t028*/
   # movq    %rsp/*t028*/, %rsp/*t022*/
   movq    $15, %rsp/*t029*/
   movq    %rsp/*t029*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _Foo_n
   movq    %rax, %rsp/*t003*/
   xorq    %rsp/*t030*/, %rsp/*t030*/
   movq    $-8, %rsp/*t033*/
   # movq    %rsp/*t033*/, %rsp/*t032*/
   addq    %rsp/*t003*/, %rsp/*t032*/
   movq    (%rsp/*t032*/), %rsp/*t031*/
   cmpq    %rsp/*t031*/, %rsp/*t030*/
   jae     _boundsbad_3
_boundsok_4:
   movq    (%rsp/*t003*/), %rsp/*t035*/
   # movq    %rsp/*t035*/, %rsp/*t034*/
   addq    %rsp/*t022*/, %rsp/*t034*/
   movq    %rsp/*t034*/, %rax
_bail_1:
   movq    %rsp/*t004*/, %rbx
   movq    %rsp/*t005*/, %r12
   movq    %rsp/*t006*/, %r13
   movq    %rsp/*t007*/, %r14
   movq    %rsp/*t008*/, %r15
   jmp     _DONE_10
_boundsbad_3:
   movq    $1, %rsp/*t036*/
   movq    %rsp/*t036*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_1
_DONE_10:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Foo_n
_Foo_n:
   subq   $8, %rsp
_L_11:
   movq    %rbx, %rsp/*t012*/
   movq    %r12, %rsp/*t013*/
   movq    %r13, %rsp/*t014*/
   movq    %r14, %rsp/*t015*/
   movq    %r15, %rsp/*t016*/
   movq    %rdi, %rsp/*t009*/
   movq    %rsi, %rsp/*t010*/
   # movq    %rsp/*t009*/, %rsp/*t038*/
   movq    %rsp/*t010*/, %rdi
   call    _cs411newarray
   movq    %rax, %rsp/*t037*/
   movq    %rsp/*t037*/, (%rsp/*t038*/)
   movq    (%rsp/*t009*/), %rsp/*t039*/
   # movq    %rsp/*t039*/, %rsp/*t011*/
   xorq    %rsp/*t040*/, %rsp/*t040*/
   movq    $-8, %rsp/*t043*/
   # movq    %rsp/*t043*/, %rsp/*t042*/
   addq    %rsp/*t011*/, %rsp/*t042*/
   movq    (%rsp/*t042*/), %rsp/*t041*/
   cmpq    %rsp/*t041*/, %rsp/*t040*/
   jae     _boundsbad_7
_boundsok_6:
   movq    %rsp/*t010*/, (%rsp/*t011*/)
   movq    (%rsp/*t009*/), %rsp/*t044*/
   movq    %rsp/*t044*/, %rax
_bail_5:
   movq    %rsp/*t012*/, %rbx
   movq    %rsp/*t013*/, %r12
   movq    %rsp/*t014*/, %r13
   movq    %rsp/*t015*/, %r14
   movq    %rsp/*t016*/, %r15
   jmp     _DONE_12
_boundsbad_7:
   movq    $1, %rsp/*t045*/
   movq    %rsp/*t045*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_5
_DONE_12:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_13:
   movq    %rbx, %rsp/*t017*/
   movq    %r12, %rsp/*t018*/
   movq    %r13, %rsp/*t019*/
   movq    %r14, %rsp/*t020*/
   movq    %r15, %rsp/*t021*/
   movq    $8, %rsp/*t048*/
   movq    %rsp/*t048*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t047*/
   movq    $2, %rsp/*t049*/
   movq    %rsp/*t049*/, %rsi
   movq    %rsp/*t047*/, %rdi
   call    _Foo_do
   movq    %rax, %rsp/*t046*/
   movq    %rsp/*t046*/, %rdi
   call    _cs411println
_bail_8:
   movq    %rsp/*t017*/, %rbx
   movq    %rsp/*t018*/, %r12
   movq    %rsp/*t019*/, %r13
   movq    %rsp/*t020*/, %r14
   movq    %rsp/*t021*/, %r15
_DONE_14:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
