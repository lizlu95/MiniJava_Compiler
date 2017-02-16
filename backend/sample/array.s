.text
.globl _Test_fill
_Test_fill:
   subq   $8, %rsp
_L_24:
   movq    %rbx, %rsp/*t004*/
   movq    %r12, %rsp/*t005*/
   movq    %r13, %rsp/*t006*/
   movq    %r14, %rsp/*t007*/
   movq    %r15, %rsp/*t008*/
   movq    %rdi, %rsp/*t000*/
   # movq    %rsp/*t000*/, %rsp/*t045*/
   movq    $10, %rsp/*t046*/
   movq    %rsp/*t046*/, %rdi
   call    _cs411newarray
   movq    %rax, %rsp/*t044*/
   movq    %rsp/*t044*/, (%rsp/*t045*/)
   xorq    %rsp/*t047*/, %rsp/*t047*/
   # movq    %rsp/*t047*/, %rsp/*t001*/
   movq    $10, %rsp/*t048*/
   cmpq    %rsp/*t048*/, %rsp/*t001*/
   jge     _loopend_2
_loopbody_3:
   movq    (%rsp/*t000*/), %rsp/*t049*/
   # movq    %rsp/*t049*/, %rsp/*t002*/
   movq    $-8, %rsp/*t052*/
   # movq    %rsp/*t052*/, %rsp/*t051*/
   addq    %rsp/*t002*/, %rsp/*t051*/
   movq    (%rsp/*t051*/), %rsp/*t050*/
   cmpq    %rsp/*t050*/, %rsp/*t001*/
   jae     _boundsbad_6
_boundsok_5:
   # movq    %rsp/*t001*/, %rsp/*t053*/
   imulq   %rsp/*t001*/, %rsp/*t053*/
   # movq    %rsp/*t053*/, %rsp/*t003*/
   movq    $8, %rsp/*t056*/
   # movq    %rsp/*t056*/, %rsp/*t055*/
   imulq   %rsp/*t001*/, %rsp/*t055*/
   # movq    %rsp/*t055*/, %rsp/*t054*/
   addq    %rsp/*t002*/, %rsp/*t054*/
   movq    %rsp/*t003*/, (%rsp/*t054*/)
   movq    $1, %rsp/*t058*/
   # movq    %rsp/*t058*/, %rsp/*t057*/
   addq    %rsp/*t001*/, %rsp/*t057*/
   # movq    %rsp/*t057*/, %rsp/*t001*/
_looptest_4:
   movq    $10, %rsp/*t059*/
   cmpq    %rsp/*t059*/, %rsp/*t001*/
   jl      _loopbody_3
_loopend_2:
   xorq    %rsp/*t060*/, %rsp/*t060*/
   movq    %rsp/*t060*/, %rax
_bail_1:
   movq    %rsp/*t004*/, %rbx
   movq    %rsp/*t005*/, %r12
   movq    %rsp/*t006*/, %r13
   movq    %rsp/*t007*/, %r14
   movq    %rsp/*t008*/, %r15
   jmp     _DONE_25
_boundsbad_6:
   movq    $1, %rsp/*t061*/
   movq    %rsp/*t061*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_1
_DONE_25:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Test_print
_Test_print:
   subq   $8, %rsp
_L_26:
   movq    %rbx, %rsp/*t012*/
   movq    %r12, %rsp/*t013*/
   movq    %r13, %rsp/*t014*/
   movq    %r14, %rsp/*t015*/
   movq    %r15, %rsp/*t016*/
   movq    %rdi, %rsp/*t009*/
   xorq    %rsp/*t062*/, %rsp/*t062*/
   # movq    %rsp/*t062*/, %rsp/*t010*/
   movq    $10, %rsp/*t063*/
   cmpq    %rsp/*t063*/, %rsp/*t010*/
   jge     _loopend_8
_loopbody_9:
   movq    (%rsp/*t009*/), %rsp/*t064*/
   # movq    %rsp/*t064*/, %rsp/*t011*/
   movq    $-8, %rsp/*t067*/
   # movq    %rsp/*t067*/, %rsp/*t066*/
   addq    %rsp/*t011*/, %rsp/*t066*/
   movq    (%rsp/*t066*/), %rsp/*t065*/
   cmpq    %rsp/*t065*/, %rsp/*t010*/
   jae     _boundsbad_12
_boundsok_11:
   movq    $8, %rsp/*t071*/
   # movq    %rsp/*t071*/, %rsp/*t070*/
   imulq   %rsp/*t010*/, %rsp/*t070*/
   # movq    %rsp/*t070*/, %rsp/*t069*/
   addq    %rsp/*t011*/, %rsp/*t069*/
   movq    (%rsp/*t069*/), %rsp/*t068*/
   movq    %rsp/*t068*/, %rdi
   call    _cs411println
   movq    $1, %rsp/*t073*/
   # movq    %rsp/*t073*/, %rsp/*t072*/
   addq    %rsp/*t010*/, %rsp/*t072*/
   # movq    %rsp/*t072*/, %rsp/*t010*/
_looptest_10:
   movq    $10, %rsp/*t074*/
   cmpq    %rsp/*t074*/, %rsp/*t010*/
   jl      _loopbody_9
_loopend_8:
   xorq    %rsp/*t075*/, %rsp/*t075*/
   movq    %rsp/*t075*/, %rax
_bail_7:
   movq    %rsp/*t012*/, %rbx
   movq    %rsp/*t013*/, %r12
   movq    %rsp/*t014*/, %r13
   movq    %rsp/*t015*/, %r14
   movq    %rsp/*t016*/, %r15
   jmp     _DONE_27
_boundsbad_12:
   movq    $1, %rsp/*t076*/
   movq    %rsp/*t076*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_7
_DONE_27:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Test_inspect
_Test_inspect:
   subq   $8, %rsp
_L_28:
   movq    %rbx, %rsp/*t027*/
   movq    %r12, %rsp/*t028*/
   movq    %r13, %rsp/*t029*/
   movq    %r14, %rsp/*t030*/
   movq    %r15, %rsp/*t031*/
   movq    %rdi, %rsp/*t017*/
   xorq    %rsp/*t081*/, %rsp/*t081*/
   # movq    %rsp/*t081*/, %rsp/*t019*/
   xorq    %rsp/*t082*/, %rsp/*t082*/
   # movq    %rsp/*t082*/, %rsp/*t020*/
   xorq    %rsp/*t083*/, %rsp/*t083*/
   # movq    %rsp/*t083*/, %rsp/*t021*/
   xorq    %rsp/*t084*/, %rsp/*t084*/
   # movq    %rsp/*t084*/, %rsp/*t022*/
   xorq    %rsp/*t085*/, %rsp/*t085*/
   # movq    %rsp/*t085*/, %rsp/*t018*/
   movq    $10, %rsp/*t086*/
   cmpq    %rsp/*t086*/, %rsp/*t018*/
   jge     _loopend_14
_loopbody_15:
   # movq    %rsp/*t019*/, %rsp/*t077*/
   movq    (%rsp/*t017*/), %rsp/*t087*/
   # movq    %rsp/*t087*/, %rsp/*t023*/
   movq    $-8, %rsp/*t090*/
   # movq    %rsp/*t090*/, %rsp/*t089*/
   addq    %rsp/*t023*/, %rsp/*t089*/
   movq    (%rsp/*t089*/), %rsp/*t088*/
   cmpq    %rsp/*t088*/, %rsp/*t018*/
   jae     _boundsbad_18
_boundsok_17:
   movq    $8, %rsp/*t095*/
   # movq    %rsp/*t095*/, %rsp/*t094*/
   imulq   %rsp/*t018*/, %rsp/*t094*/
   # movq    %rsp/*t094*/, %rsp/*t093*/
   addq    %rsp/*t023*/, %rsp/*t093*/
   movq    (%rsp/*t093*/), %rsp/*t092*/
   # movq    %rsp/*t092*/, %rsp/*t091*/
   addq    %rsp/*t077*/, %rsp/*t091*/
   # movq    %rsp/*t091*/, %rsp/*t019*/
   # movq    %rsp/*t020*/, %rsp/*t078*/
   movq    (%rsp/*t017*/), %rsp/*t096*/
   # movq    %rsp/*t096*/, %rsp/*t024*/
   movq    $-8, %rsp/*t099*/
   # movq    %rsp/*t099*/, %rsp/*t098*/
   addq    %rsp/*t024*/, %rsp/*t098*/
   movq    (%rsp/*t098*/), %rsp/*t097*/
   cmpq    %rsp/*t097*/, %rsp/*t018*/
   jae     _boundsbad_18
_boundsok_19:
   movq    $8, %rsp/*t104*/
   # movq    %rsp/*t104*/, %rsp/*t103*/
   imulq   %rsp/*t018*/, %rsp/*t103*/
   # movq    %rsp/*t103*/, %rsp/*t102*/
   addq    %rsp/*t024*/, %rsp/*t102*/
   movq    (%rsp/*t102*/), %rsp/*t101*/
   # movq    %rsp/*t101*/, %rsp/*t100*/
   addq    %rsp/*t078*/, %rsp/*t100*/
   # movq    %rsp/*t100*/, %rsp/*t020*/
   # movq    %rsp/*t021*/, %rsp/*t079*/
   movq    (%rsp/*t017*/), %rsp/*t105*/
   # movq    %rsp/*t105*/, %rsp/*t025*/
   movq    $-8, %rsp/*t108*/
   # movq    %rsp/*t108*/, %rsp/*t107*/
   addq    %rsp/*t025*/, %rsp/*t107*/
   movq    (%rsp/*t107*/), %rsp/*t106*/
   cmpq    %rsp/*t106*/, %rsp/*t018*/
   jae     _boundsbad_18
_boundsok_20:
   movq    $8, %rsp/*t113*/
   # movq    %rsp/*t113*/, %rsp/*t112*/
   imulq   %rsp/*t018*/, %rsp/*t112*/
   # movq    %rsp/*t112*/, %rsp/*t111*/
   addq    %rsp/*t025*/, %rsp/*t111*/
   movq    (%rsp/*t111*/), %rsp/*t110*/
   # movq    %rsp/*t110*/, %rsp/*t109*/
   addq    %rsp/*t079*/, %rsp/*t109*/
   # movq    %rsp/*t109*/, %rsp/*t021*/
   # movq    %rsp/*t022*/, %rsp/*t080*/
   movq    (%rsp/*t017*/), %rsp/*t114*/
   # movq    %rsp/*t114*/, %rsp/*t026*/
   movq    $-8, %rsp/*t117*/
   # movq    %rsp/*t117*/, %rsp/*t116*/
   addq    %rsp/*t026*/, %rsp/*t116*/
   movq    (%rsp/*t116*/), %rsp/*t115*/
   cmpq    %rsp/*t115*/, %rsp/*t018*/
   jae     _boundsbad_18
_boundsok_21:
   movq    $8, %rsp/*t122*/
   # movq    %rsp/*t122*/, %rsp/*t121*/
   imulq   %rsp/*t018*/, %rsp/*t121*/
   # movq    %rsp/*t121*/, %rsp/*t120*/
   addq    %rsp/*t026*/, %rsp/*t120*/
   movq    (%rsp/*t120*/), %rsp/*t119*/
   # movq    %rsp/*t119*/, %rsp/*t118*/
   addq    %rsp/*t080*/, %rsp/*t118*/
   # movq    %rsp/*t118*/, %rsp/*t022*/
   movq    $1, %rsp/*t124*/
   # movq    %rsp/*t124*/, %rsp/*t123*/
   addq    %rsp/*t018*/, %rsp/*t123*/
   # movq    %rsp/*t123*/, %rsp/*t018*/
_looptest_16:
   movq    $10, %rsp/*t125*/
   cmpq    %rsp/*t125*/, %rsp/*t018*/
   jl      _loopbody_15
_loopend_14:
   xorq    %rsp/*t126*/, %rsp/*t126*/
   movq    %rsp/*t126*/, %rax
_bail_13:
   movq    %rsp/*t027*/, %rbx
   movq    %rsp/*t028*/, %r12
   movq    %rsp/*t029*/, %r13
   movq    %rsp/*t030*/, %r14
   movq    %rsp/*t031*/, %r15
   jmp     _DONE_29
_boundsbad_18:
   movq    $1, %rsp/*t127*/
   movq    %rsp/*t127*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_13
_DONE_29:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Test_do
_Test_do:
   subq   $8, %rsp
_L_30:
   movq    %rbx, %rsp/*t034*/
   movq    %r12, %rsp/*t035*/
   movq    %r13, %rsp/*t036*/
   movq    %r14, %rsp/*t037*/
   movq    %r15, %rsp/*t038*/
   movq    %rdi, %rsp/*t032*/
   movq    %rsp/*t032*/, %rdi
   call    _Test_fill
   movq    %rax, %rsp/*t033*/
   movq    %rsp/*t032*/, %rdi
   call    _Test_inspect
   movq    %rax, %rsp/*t033*/
   movq    %rsp/*t032*/, %rdi
   call    _Test_print
   movq    %rax, %rsp/*t033*/
   xorq    %rsp/*t128*/, %rsp/*t128*/
   movq    %rsp/*t128*/, %rax
_bail_22:
   movq    %rsp/*t034*/, %rbx
   movq    %rsp/*t035*/, %r12
   movq    %rsp/*t036*/, %r13
   movq    %rsp/*t037*/, %r14
   movq    %rsp/*t038*/, %r15
_DONE_31:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_32:
   movq    %rbx, %rsp/*t039*/
   movq    %r12, %rsp/*t040*/
   movq    %r13, %rsp/*t041*/
   movq    %r14, %rsp/*t042*/
   movq    %r15, %rsp/*t043*/
   movq    $8, %rsp/*t131*/
   movq    %rsp/*t131*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t130*/
   movq    %rsp/*t130*/, %rdi
   call    _Test_do
   movq    %rax, %rsp/*t129*/
   movq    %rsp/*t129*/, %rdi
   call    _cs411println
_bail_23:
   movq    %rsp/*t039*/, %rbx
   movq    %rsp/*t040*/, %r12
   movq    %rsp/*t041*/, %r13
   movq    %rsp/*t042*/, %r14
   movq    %rsp/*t043*/, %r15
_DONE_33:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
