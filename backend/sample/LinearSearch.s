.text
.globl _LS_Start
_LS_Start:
   subq   $8, %rsp
_L_27:
   movq    %rbx, %rsp/*t004*/
   movq    %r12, %rsp/*t005*/
   movq    %r13, %rsp/*t006*/
   movq    %r14, %rsp/*t007*/
   movq    %r15, %rsp/*t008*/
   movq    %rdi, %rsp/*t000*/
   movq    %rsi, %rsp/*t001*/
   movq    %rsp/*t001*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _LS_Init
   movq    %rax, %rsp/*t002*/
   movq    %rsp/*t000*/, %rdi
   call    _LS_Print
   movq    %rax, %rsp/*t003*/
   movq    $9999, %rsp/*t053*/
   movq    %rsp/*t053*/, %rdi
   call    _cs411println
   movq    $8, %rsp/*t054*/
   movq    %rsp/*t054*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _LS_Search
   movq    %rax, %rsp/*t049*/
   movq    %rsp/*t049*/, %rdi
   call    _cs411println
   movq    $12, %rsp/*t055*/
   movq    %rsp/*t055*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _LS_Search
   movq    %rax, %rsp/*t050*/
   movq    %rsp/*t050*/, %rdi
   call    _cs411println
   movq    $17, %rsp/*t056*/
   movq    %rsp/*t056*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _LS_Search
   movq    %rax, %rsp/*t051*/
   movq    %rsp/*t051*/, %rdi
   call    _cs411println
   movq    $50, %rsp/*t057*/
   movq    %rsp/*t057*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _LS_Search
   movq    %rax, %rsp/*t052*/
   movq    %rsp/*t052*/, %rdi
   call    _cs411println
   movq    $55, %rsp/*t058*/
   movq    %rsp/*t058*/, %rax
_bail_1:
   movq    %rsp/*t004*/, %rbx
   movq    %rsp/*t005*/, %r12
   movq    %rsp/*t006*/, %r13
   movq    %rsp/*t007*/, %r14
   movq    %rsp/*t008*/, %r15
_DONE_28:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _LS_Print
_LS_Print:
   subq   $8, %rsp
_L_29:
   movq    %rbx, %rsp/*t012*/
   movq    %r12, %rsp/*t013*/
   movq    %r13, %rsp/*t014*/
   movq    %r14, %rsp/*t015*/
   movq    %r15, %rsp/*t016*/
   movq    %rdi, %rsp/*t009*/
   movq    $1, %rsp/*t059*/
   # movq    %rsp/*t059*/, %rsp/*t010*/
   movq    $8, %rsp/*t062*/
   # movq    %rsp/*t062*/, %rsp/*t061*/
   addq    %rsp/*t009*/, %rsp/*t061*/
   movq    (%rsp/*t061*/), %rsp/*t060*/
   cmpq    %rsp/*t060*/, %rsp/*t010*/
   jge     _loopend_3
_loopbody_4:
   movq    (%rsp/*t009*/), %rsp/*t063*/
   # movq    %rsp/*t063*/, %rsp/*t011*/
   movq    $-8, %rsp/*t066*/
   # movq    %rsp/*t066*/, %rsp/*t065*/
   addq    %rsp/*t011*/, %rsp/*t065*/
   movq    (%rsp/*t065*/), %rsp/*t064*/
   cmpq    %rsp/*t064*/, %rsp/*t010*/
   jae     _boundsbad_7
_boundsok_6:
   movq    $8, %rsp/*t070*/
   # movq    %rsp/*t070*/, %rsp/*t069*/
   imulq   %rsp/*t010*/, %rsp/*t069*/
   # movq    %rsp/*t069*/, %rsp/*t068*/
   addq    %rsp/*t011*/, %rsp/*t068*/
   movq    (%rsp/*t068*/), %rsp/*t067*/
   movq    %rsp/*t067*/, %rdi
   call    _cs411println
   movq    $1, %rsp/*t072*/
   # movq    %rsp/*t072*/, %rsp/*t071*/
   addq    %rsp/*t010*/, %rsp/*t071*/
   # movq    %rsp/*t071*/, %rsp/*t010*/
_looptest_5:
   movq    $8, %rsp/*t075*/
   # movq    %rsp/*t075*/, %rsp/*t074*/
   addq    %rsp/*t009*/, %rsp/*t074*/
   movq    (%rsp/*t074*/), %rsp/*t073*/
   cmpq    %rsp/*t073*/, %rsp/*t010*/
   jl      _loopbody_4
_loopend_3:
   xorq    %rsp/*t076*/, %rsp/*t076*/
   movq    %rsp/*t076*/, %rax
_bail_2:
   movq    %rsp/*t012*/, %rbx
   movq    %rsp/*t013*/, %r12
   movq    %rsp/*t014*/, %r13
   movq    %rsp/*t015*/, %r14
   movq    %rsp/*t016*/, %r15
   jmp     _DONE_30
_boundsbad_7:
   movq    $1, %rsp/*t077*/
   movq    %rsp/*t077*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_2
_DONE_30:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _LS_Search
_LS_Search:
   subq   $8, %rsp
_L_31:
   movq    %rbx, %rsp/*t026*/
   movq    %r12, %rsp/*t027*/
   movq    %r13, %rsp/*t028*/
   movq    %r14, %rsp/*t029*/
   movq    %r15, %rsp/*t030*/
   movq    %rdi, %rsp/*t017*/
   movq    %rsi, %rsp/*t018*/
   movq    $1, %rsp/*t078*/
   # movq    %rsp/*t078*/, %rsp/*t019*/
   xorq    %rsp/*t079*/, %rsp/*t079*/
   # movq    %rsp/*t079*/, %rsp/*t020*/
   xorq    %rsp/*t080*/, %rsp/*t080*/
   # movq    %rsp/*t080*/, %rsp/*t021*/
   movq    $8, %rsp/*t083*/
   # movq    %rsp/*t083*/, %rsp/*t082*/
   addq    %rsp/*t017*/, %rsp/*t082*/
   movq    (%rsp/*t082*/), %rsp/*t081*/
   cmpq    %rsp/*t081*/, %rsp/*t019*/
   jge     _loopend_9
_loopbody_10:
   movq    (%rsp/*t017*/), %rsp/*t084*/
   # movq    %rsp/*t084*/, %rsp/*t025*/
   movq    $-8, %rsp/*t087*/
   # movq    %rsp/*t087*/, %rsp/*t086*/
   addq    %rsp/*t025*/, %rsp/*t086*/
   movq    (%rsp/*t086*/), %rsp/*t085*/
   cmpq    %rsp/*t085*/, %rsp/*t019*/
   jae     _boundsbad_13
_boundsok_12:
   movq    $8, %rsp/*t091*/
   # movq    %rsp/*t091*/, %rsp/*t090*/
   imulq   %rsp/*t019*/, %rsp/*t090*/
   # movq    %rsp/*t090*/, %rsp/*t089*/
   addq    %rsp/*t025*/, %rsp/*t089*/
   movq    (%rsp/*t089*/), %rsp/*t088*/
   # movq    %rsp/*t088*/, %rsp/*t022*/
   movq    $1, %rsp/*t093*/
   # movq    %rsp/*t093*/, %rsp/*t092*/
   addq    %rsp/*t018*/, %rsp/*t092*/
   # movq    %rsp/*t092*/, %rsp/*t023*/
   cmpq    %rsp/*t018*/, %rsp/*t022*/
   jge     _L_15
_L_14:
   xorq    %rsp/*t094*/, %rsp/*t094*/
   # movq    %rsp/*t094*/, %rsp/*t024*/
_L_16:
   movq    $1, %rsp/*t096*/
   # movq    %rsp/*t096*/, %rsp/*t095*/
   addq    %rsp/*t019*/, %rsp/*t095*/
   # movq    %rsp/*t095*/, %rsp/*t019*/
_looptest_11:
   movq    $8, %rsp/*t099*/
   # movq    %rsp/*t099*/, %rsp/*t098*/
   addq    %rsp/*t017*/, %rsp/*t098*/
   movq    (%rsp/*t098*/), %rsp/*t097*/
   cmpq    %rsp/*t097*/, %rsp/*t019*/
   jl      _loopbody_10
_loopend_9:
   movq    %rsp/*t021*/, %rax
_bail_8:
   movq    %rsp/*t026*/, %rbx
   movq    %rsp/*t027*/, %r12
   movq    %rsp/*t028*/, %r13
   movq    %rsp/*t029*/, %r14
   movq    %rsp/*t030*/, %r15
   jmp     _DONE_32
_boundsbad_13:
   movq    $1, %rsp/*t100*/
   movq    %rsp/*t100*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_8
_L_15:
   cmpq    %rsp/*t023*/, %rsp/*t022*/
   jge     _L_17
_L_18:
   movq    $1, %rsp/*t101*/
   # movq    %rsp/*t101*/, %rsp/*t020*/
   movq    $1, %rsp/*t102*/
   # movq    %rsp/*t102*/, %rsp/*t021*/
   movq    $8, %rsp/*t105*/
   # movq    %rsp/*t105*/, %rsp/*t104*/
   addq    %rsp/*t017*/, %rsp/*t104*/
   movq    (%rsp/*t104*/), %rsp/*t103*/
   # movq    %rsp/*t103*/, %rsp/*t019*/
_L_19:
   jmp     _L_16
_L_17:
   xorq    %rsp/*t106*/, %rsp/*t106*/
   # movq    %rsp/*t106*/, %rsp/*t024*/
   jmp     _L_19
_DONE_32:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _LS_Init
_LS_Init:
   subq   $8, %rsp
_L_33:
   movq    %rbx, %rsp/*t039*/
   movq    %r12, %rsp/*t040*/
   movq    %r13, %rsp/*t041*/
   movq    %r14, %rsp/*t042*/
   movq    %r15, %rsp/*t043*/
   movq    %rdi, %rsp/*t031*/
   movq    %rsi, %rsp/*t032*/
   movq    $8, %rsp/*t110*/
   # movq    %rsp/*t110*/, %rsp/*t109*/
   addq    %rsp/*t031*/, %rsp/*t109*/
   movq    %rsp/*t032*/, (%rsp/*t109*/)
   # movq    %rsp/*t031*/, %rsp/*t108*/
   movq    %rsp/*t032*/, %rdi
   call    _cs411newarray
   movq    %rax, %rsp/*t107*/
   movq    %rsp/*t107*/, (%rsp/*t108*/)
   movq    $1, %rsp/*t111*/
   # movq    %rsp/*t111*/, %rsp/*t033*/
   movq    $1, %rsp/*t113*/
   # movq    %rsp/*t113*/, %rsp/*t112*/
   movq    $8, %rsp/*t116*/
   # movq    %rsp/*t116*/, %rsp/*t115*/
   addq    %rsp/*t031*/, %rsp/*t115*/
   movq    (%rsp/*t115*/), %rsp/*t114*/
   addq    %rsp/*t114*/, %rsp/*t112*/
   # movq    %rsp/*t112*/, %rsp/*t034*/
   cmpq    %rsp/*t032*/, %rsp/*t033*/
   jge     _loopend_21
_loopbody_22:
   # movq    %rsp/*t033*/, %rsp/*t117*/
   movq    $2, %rsp/*t118*/
   imulq   %rsp/*t118*/, %rsp/*t117*/
   # movq    %rsp/*t117*/, %rsp/*t035*/
   # movq    %rsp/*t034*/, %rsp/*t119*/
   movq    $3, %rsp/*t120*/
   subq    %rsp/*t120*/, %rsp/*t119*/
   # movq    %rsp/*t119*/, %rsp/*t036*/
   movq    (%rsp/*t031*/), %rsp/*t121*/
   # movq    %rsp/*t121*/, %rsp/*t037*/
   movq    $-8, %rsp/*t124*/
   # movq    %rsp/*t124*/, %rsp/*t123*/
   addq    %rsp/*t037*/, %rsp/*t123*/
   movq    (%rsp/*t123*/), %rsp/*t122*/
   cmpq    %rsp/*t122*/, %rsp/*t033*/
   jae     _boundsbad_25
_boundsok_24:
   # movq    %rsp/*t036*/, %rsp/*t125*/
   addq    %rsp/*t035*/, %rsp/*t125*/
   # movq    %rsp/*t125*/, %rsp/*t038*/
   movq    $8, %rsp/*t128*/
   # movq    %rsp/*t128*/, %rsp/*t127*/
   imulq   %rsp/*t033*/, %rsp/*t127*/
   # movq    %rsp/*t127*/, %rsp/*t126*/
   addq    %rsp/*t037*/, %rsp/*t126*/
   movq    %rsp/*t038*/, (%rsp/*t126*/)
   movq    $1, %rsp/*t130*/
   # movq    %rsp/*t130*/, %rsp/*t129*/
   addq    %rsp/*t033*/, %rsp/*t129*/
   # movq    %rsp/*t129*/, %rsp/*t033*/
   # movq    %rsp/*t034*/, %rsp/*t131*/
   movq    $1, %rsp/*t132*/
   subq    %rsp/*t132*/, %rsp/*t131*/
   # movq    %rsp/*t131*/, %rsp/*t034*/
_looptest_23:
   cmpq    %rsp/*t032*/, %rsp/*t033*/
   jl      _loopbody_22
_loopend_21:
   xorq    %rsp/*t133*/, %rsp/*t133*/
   movq    %rsp/*t133*/, %rax
_bail_20:
   movq    %rsp/*t039*/, %rbx
   movq    %rsp/*t040*/, %r12
   movq    %rsp/*t041*/, %r13
   movq    %rsp/*t042*/, %r14
   movq    %rsp/*t043*/, %r15
   jmp     _DONE_34
_boundsbad_25:
   movq    $1, %rsp/*t134*/
   movq    %rsp/*t134*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_20
_DONE_34:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_35:
   movq    %rbx, %rsp/*t044*/
   movq    %r12, %rsp/*t045*/
   movq    %r13, %rsp/*t046*/
   movq    %r14, %rsp/*t047*/
   movq    %r15, %rsp/*t048*/
   movq    $16, %rsp/*t137*/
   movq    %rsp/*t137*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t136*/
   movq    $10, %rsp/*t138*/
   movq    %rsp/*t138*/, %rsi
   movq    %rsp/*t136*/, %rdi
   call    _LS_Start
   movq    %rax, %rsp/*t135*/
   movq    %rsp/*t135*/, %rdi
   call    _cs411println
_bail_26:
   movq    %rsp/*t044*/, %rbx
   movq    %rsp/*t045*/, %r12
   movq    %rsp/*t046*/, %r13
   movq    %rsp/*t047*/, %r14
   movq    %rsp/*t048*/, %r15
_DONE_36:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
