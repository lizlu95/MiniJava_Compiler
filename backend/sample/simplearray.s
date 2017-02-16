.text
.globl _Test_fill
_Test_fill:
   subq   $8, %rsp
_L_15:
   movq    %rbx, %rsp/*t004*/
   movq    %r12, %rsp/*t005*/
   movq    %r13, %rsp/*t006*/
   movq    %r14, %rsp/*t007*/
   movq    %r15, %rsp/*t008*/
   movq    %rdi, %rsp/*t000*/
   # movq    %rsp/*t000*/, %rsp/*t030*/
   movq    $10, %rsp/*t031*/
   movq    %rsp/*t031*/, %rdi
   call    _cs411newarray
   movq    %rax, %rsp/*t029*/
   movq    %rsp/*t029*/, (%rsp/*t030*/)
   xorq    %rsp/*t032*/, %rsp/*t032*/
   # movq    %rsp/*t032*/, %rsp/*t001*/
   movq    $10, %rsp/*t033*/
   cmpq    %rsp/*t033*/, %rsp/*t001*/
   jge     _loopend_2
_loopbody_3:
   movq    (%rsp/*t000*/), %rsp/*t034*/
   # movq    %rsp/*t034*/, %rsp/*t002*/
   movq    $-8, %rsp/*t037*/
   # movq    %rsp/*t037*/, %rsp/*t036*/
   addq    %rsp/*t002*/, %rsp/*t036*/
   movq    (%rsp/*t036*/), %rsp/*t035*/
   cmpq    %rsp/*t035*/, %rsp/*t001*/
   jae     _boundsbad_6
_boundsok_5:
   # movq    %rsp/*t001*/, %rsp/*t038*/
   imulq   %rsp/*t001*/, %rsp/*t038*/
   # movq    %rsp/*t038*/, %rsp/*t003*/
   movq    $8, %rsp/*t041*/
   # movq    %rsp/*t041*/, %rsp/*t040*/
   imulq   %rsp/*t001*/, %rsp/*t040*/
   # movq    %rsp/*t040*/, %rsp/*t039*/
   addq    %rsp/*t002*/, %rsp/*t039*/
   movq    %rsp/*t003*/, (%rsp/*t039*/)
   movq    $1, %rsp/*t043*/
   # movq    %rsp/*t043*/, %rsp/*t042*/
   addq    %rsp/*t001*/, %rsp/*t042*/
   # movq    %rsp/*t042*/, %rsp/*t001*/
_looptest_4:
   movq    $10, %rsp/*t044*/
   cmpq    %rsp/*t044*/, %rsp/*t001*/
   jl      _loopbody_3
_loopend_2:
   xorq    %rsp/*t045*/, %rsp/*t045*/
   movq    %rsp/*t045*/, %rax
_bail_1:
   movq    %rsp/*t004*/, %rbx
   movq    %rsp/*t005*/, %r12
   movq    %rsp/*t006*/, %r13
   movq    %rsp/*t007*/, %r14
   movq    %rsp/*t008*/, %r15
   jmp     _DONE_16
_boundsbad_6:
   movq    $1, %rsp/*t046*/
   movq    %rsp/*t046*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_1
_DONE_16:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Test_print
_Test_print:
   subq   $8, %rsp
_L_17:
   movq    %rbx, %rsp/*t012*/
   movq    %r12, %rsp/*t013*/
   movq    %r13, %rsp/*t014*/
   movq    %r14, %rsp/*t015*/
   movq    %r15, %rsp/*t016*/
   movq    %rdi, %rsp/*t009*/
   xorq    %rsp/*t047*/, %rsp/*t047*/
   # movq    %rsp/*t047*/, %rsp/*t010*/
   movq    $10, %rsp/*t048*/
   cmpq    %rsp/*t048*/, %rsp/*t010*/
   jge     _loopend_8
_loopbody_9:
   movq    (%rsp/*t009*/), %rsp/*t049*/
   # movq    %rsp/*t049*/, %rsp/*t011*/
   movq    $-8, %rsp/*t052*/
   # movq    %rsp/*t052*/, %rsp/*t051*/
   addq    %rsp/*t011*/, %rsp/*t051*/
   movq    (%rsp/*t051*/), %rsp/*t050*/
   cmpq    %rsp/*t050*/, %rsp/*t010*/
   jae     _boundsbad_12
_boundsok_11:
   movq    $8, %rsp/*t056*/
   # movq    %rsp/*t056*/, %rsp/*t055*/
   imulq   %rsp/*t010*/, %rsp/*t055*/
   # movq    %rsp/*t055*/, %rsp/*t054*/
   addq    %rsp/*t011*/, %rsp/*t054*/
   movq    (%rsp/*t054*/), %rsp/*t053*/
   movq    %rsp/*t053*/, %rdi
   call    _cs411println
   movq    $1, %rsp/*t058*/
   # movq    %rsp/*t058*/, %rsp/*t057*/
   addq    %rsp/*t010*/, %rsp/*t057*/
   # movq    %rsp/*t057*/, %rsp/*t010*/
_looptest_10:
   movq    $10, %rsp/*t059*/
   cmpq    %rsp/*t059*/, %rsp/*t010*/
   jl      _loopbody_9
_loopend_8:
   xorq    %rsp/*t060*/, %rsp/*t060*/
   movq    %rsp/*t060*/, %rax
_bail_7:
   movq    %rsp/*t012*/, %rbx
   movq    %rsp/*t013*/, %r12
   movq    %rsp/*t014*/, %r13
   movq    %rsp/*t015*/, %r14
   movq    %rsp/*t016*/, %r15
   jmp     _DONE_18
_boundsbad_12:
   movq    $1, %rsp/*t061*/
   movq    %rsp/*t061*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_7
_DONE_18:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Test_do
_Test_do:
   subq   $8, %rsp
_L_19:
   movq    %rbx, %rsp/*t019*/
   movq    %r12, %rsp/*t020*/
   movq    %r13, %rsp/*t021*/
   movq    %r14, %rsp/*t022*/
   movq    %r15, %rsp/*t023*/
   movq    %rdi, %rsp/*t017*/
   movq    %rsp/*t017*/, %rdi
   call    _Test_fill
   movq    %rax, %rsp/*t018*/
   movq    %rsp/*t017*/, %rdi
   call    _Test_print
   movq    %rax, %rsp/*t018*/
   xorq    %rsp/*t062*/, %rsp/*t062*/
   movq    %rsp/*t062*/, %rax
_bail_13:
   movq    %rsp/*t019*/, %rbx
   movq    %rsp/*t020*/, %r12
   movq    %rsp/*t021*/, %r13
   movq    %rsp/*t022*/, %r14
   movq    %rsp/*t023*/, %r15
_DONE_20:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_21:
   movq    %rbx, %rsp/*t024*/
   movq    %r12, %rsp/*t025*/
   movq    %r13, %rsp/*t026*/
   movq    %r14, %rsp/*t027*/
   movq    %r15, %rsp/*t028*/
   movq    $8, %rsp/*t065*/
   movq    %rsp/*t065*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t064*/
   movq    %rsp/*t064*/, %rdi
   call    _Test_do
   movq    %rax, %rsp/*t063*/
   movq    %rsp/*t063*/, %rdi
   call    _cs411println
_bail_14:
   movq    %rsp/*t024*/, %rbx
   movq    %rsp/*t025*/, %r12
   movq    %rsp/*t026*/, %r13
   movq    %rsp/*t027*/, %r14
   movq    %rsp/*t028*/, %r15
_DONE_22:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
