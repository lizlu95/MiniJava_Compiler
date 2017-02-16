.text
.globl _Foo_doit
_Foo_doit:
   subq   $8, %rsp
_L_15:
   movq    %rbx, %rsp/*t003*/
   movq    %r12, %rsp/*t004*/
   movq    %r13, %rsp/*t005*/
   movq    %r14, %rsp/*t006*/
   movq    %r15, %rsp/*t007*/
   movq    %rdi, %rsp/*t000*/
   movq    %rsi, %rsp/*t001*/
   movq    %rsp/*t001*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _Foo_init
   movq    %rax, %rsp/*t002*/
   movq    %rsp/*t001*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _Foo_sum
   # movq    %rax, %rax
_bail_1:
   movq    %rsp/*t003*/, %rbx
   movq    %rsp/*t004*/, %r12
   movq    %rsp/*t005*/, %r13
   movq    %rsp/*t006*/, %r14
   movq    %rsp/*t007*/, %r15
_DONE_16:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Foo_init
_Foo_init:
   subq   $8, %rsp
_L_17:
   movq    %rbx, %rsp/*t012*/
   movq    %r12, %rsp/*t013*/
   movq    %r13, %rsp/*t014*/
   movq    %r14, %rsp/*t015*/
   movq    %r15, %rsp/*t016*/
   movq    %rdi, %rsp/*t008*/
   movq    %rsi, %rsp/*t009*/
   xorq    %rsp/*t032*/, %rsp/*t032*/
   # movq    %rsp/*t032*/, %rsp/*t010*/
   movq    $-8, %rsp/*t035*/
   # movq    %rsp/*t035*/, %rsp/*t034*/
   addq    %rsp/*t009*/, %rsp/*t034*/
   movq    (%rsp/*t034*/), %rsp/*t033*/
   cmpq    %rsp/*t033*/, %rsp/*t010*/
   jge     _loopend_3
_loopbody_4:
   movq    $-8, %rsp/*t038*/
   # movq    %rsp/*t038*/, %rsp/*t037*/
   addq    %rsp/*t009*/, %rsp/*t037*/
   movq    (%rsp/*t037*/), %rsp/*t036*/
   cmpq    %rsp/*t036*/, %rsp/*t010*/
   jae     _boundsbad_7
_boundsok_6:
   movq    $1, %rsp/*t040*/
   # movq    %rsp/*t040*/, %rsp/*t039*/
   addq    %rsp/*t010*/, %rsp/*t039*/
   # movq    %rsp/*t039*/, %rsp/*t011*/
   movq    $8, %rsp/*t043*/
   # movq    %rsp/*t043*/, %rsp/*t042*/
   imulq   %rsp/*t010*/, %rsp/*t042*/
   # movq    %rsp/*t042*/, %rsp/*t041*/
   addq    %rsp/*t009*/, %rsp/*t041*/
   movq    %rsp/*t011*/, (%rsp/*t041*/)
   movq    $1, %rsp/*t045*/
   # movq    %rsp/*t045*/, %rsp/*t044*/
   addq    %rsp/*t010*/, %rsp/*t044*/
   # movq    %rsp/*t044*/, %rsp/*t010*/
_looptest_5:
   movq    $-8, %rsp/*t048*/
   # movq    %rsp/*t048*/, %rsp/*t047*/
   addq    %rsp/*t009*/, %rsp/*t047*/
   movq    (%rsp/*t047*/), %rsp/*t046*/
   cmpq    %rsp/*t046*/, %rsp/*t010*/
   jl      _loopbody_4
_loopend_3:
   xorq    %rsp/*t049*/, %rsp/*t049*/
   movq    %rsp/*t049*/, %rax
_bail_2:
   movq    %rsp/*t012*/, %rbx
   movq    %rsp/*t013*/, %r12
   movq    %rsp/*t014*/, %r13
   movq    %rsp/*t015*/, %r14
   movq    %rsp/*t016*/, %r15
   jmp     _DONE_18
_boundsbad_7:
   movq    $1, %rsp/*t050*/
   movq    %rsp/*t050*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_2
_DONE_18:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Foo_sum
_Foo_sum:
   subq   $8, %rsp
_L_19:
   movq    %rbx, %rsp/*t022*/
   movq    %r12, %rsp/*t023*/
   movq    %r13, %rsp/*t024*/
   movq    %r14, %rsp/*t025*/
   movq    %r15, %rsp/*t026*/
   movq    %rdi, %rsp/*t017*/
   movq    %rsi, %rsp/*t018*/
   xorq    %rsp/*t052*/, %rsp/*t052*/
   # movq    %rsp/*t052*/, %rsp/*t019*/
   xorq    %rsp/*t053*/, %rsp/*t053*/
   # movq    %rsp/*t053*/, %rsp/*t020*/
   movq    $-8, %rsp/*t056*/
   # movq    %rsp/*t056*/, %rsp/*t055*/
   addq    %rsp/*t018*/, %rsp/*t055*/
   movq    (%rsp/*t055*/), %rsp/*t054*/
   # movq    %rsp/*t054*/, %rsp/*t021*/
   cmpq    %rsp/*t021*/, %rsp/*t019*/
   jge     _loopend_9
_loopbody_10:
   # movq    %rsp/*t020*/, %rsp/*t051*/
   movq    $-8, %rsp/*t059*/
   # movq    %rsp/*t059*/, %rsp/*t058*/
   addq    %rsp/*t018*/, %rsp/*t058*/
   movq    (%rsp/*t058*/), %rsp/*t057*/
   cmpq    %rsp/*t057*/, %rsp/*t019*/
   jae     _boundsbad_13
_boundsok_12:
   movq    $8, %rsp/*t064*/
   # movq    %rsp/*t064*/, %rsp/*t063*/
   imulq   %rsp/*t019*/, %rsp/*t063*/
   # movq    %rsp/*t063*/, %rsp/*t062*/
   addq    %rsp/*t018*/, %rsp/*t062*/
   movq    (%rsp/*t062*/), %rsp/*t061*/
   # movq    %rsp/*t061*/, %rsp/*t060*/
   addq    %rsp/*t051*/, %rsp/*t060*/
   # movq    %rsp/*t060*/, %rsp/*t020*/
   movq    $1, %rsp/*t066*/
   # movq    %rsp/*t066*/, %rsp/*t065*/
   addq    %rsp/*t019*/, %rsp/*t065*/
   # movq    %rsp/*t065*/, %rsp/*t019*/
_looptest_11:
   cmpq    %rsp/*t021*/, %rsp/*t019*/
   jl      _loopbody_10
_loopend_9:
   movq    %rsp/*t020*/, %rax
_bail_8:
   movq    %rsp/*t022*/, %rbx
   movq    %rsp/*t023*/, %r12
   movq    %rsp/*t024*/, %r13
   movq    %rsp/*t025*/, %r14
   movq    %rsp/*t026*/, %r15
   jmp     _DONE_20
_boundsbad_13:
   movq    $1, %rsp/*t067*/
   movq    %rsp/*t067*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_8
_DONE_20:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_21:
   movq    %rbx, %rsp/*t027*/
   movq    %r12, %rsp/*t028*/
   movq    %r13, %rsp/*t029*/
   movq    %r14, %rsp/*t030*/
   movq    %r15, %rsp/*t031*/
   xorq    %rsp/*t072*/, %rsp/*t072*/
   movq    %rsp/*t072*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t069*/
   # movq    %rsp/*t069*/, %rsp/*t071*/
   movq    $10, %rsp/*t073*/
   movq    %rsp/*t073*/, %rdi
   call    _cs411newarray
   movq    %rax, %rsp/*t070*/
   movq    %rsp/*t070*/, %rsi
   movq    %rsp/*t071*/, %rdi
   call    _Foo_doit
   movq    %rax, %rsp/*t068*/
   movq    %rsp/*t068*/, %rdi
   call    _cs411println
_bail_14:
   movq    %rsp/*t027*/, %rbx
   movq    %rsp/*t028*/, %r12
   movq    %rsp/*t029*/, %r13
   movq    %rsp/*t030*/, %r14
   movq    %rsp/*t031*/, %r15
_DONE_22:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
