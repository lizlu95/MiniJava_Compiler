.text
.globl _BS_Start
_BS_Start:
   subq   $8, %rsp
_L_68:
   movq    %rbx, %rsp/*t004*/
   movq    %r12, %rsp/*t005*/
   movq    %r13, %rsp/*t006*/
   movq    %r14, %rsp/*t007*/
   movq    %r15, %rsp/*t008*/
   movq    %rdi, %rsp/*t000*/
   movq    %rsi, %rsp/*t001*/
   movq    %rsp/*t001*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _BS_Init
   movq    %rax, %rsp/*t002*/
   movq    %rsp/*t000*/, %rdi
   call    _BS_Print
   movq    %rax, %rsp/*t003*/
   movq    $8, %rsp/*t078*/
   movq    %rsp/*t078*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _BS_Search
   movq    %rax, %rsp/*t070*/
   xorq    %rsp/*t079*/, %rsp/*t079*/
   cmpq    %rsp/*t079*/, %rsp/*t070*/
   je      _L_3
_L_2:
   movq    $1, %rsp/*t080*/
   movq    %rsp/*t080*/, %rdi
   call    _cs411println
_L_4:
   movq    $19, %rsp/*t081*/
   movq    %rsp/*t081*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _BS_Search
   movq    %rax, %rsp/*t071*/
   xorq    %rsp/*t082*/, %rsp/*t082*/
   cmpq    %rsp/*t082*/, %rsp/*t071*/
   je      _L_6
_L_5:
   movq    $1, %rsp/*t083*/
   movq    %rsp/*t083*/, %rdi
   call    _cs411println
_L_7:
   movq    $20, %rsp/*t084*/
   movq    %rsp/*t084*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _BS_Search
   movq    %rax, %rsp/*t072*/
   xorq    %rsp/*t085*/, %rsp/*t085*/
   cmpq    %rsp/*t085*/, %rsp/*t072*/
   je      _L_9
_L_8:
   movq    $1, %rsp/*t086*/
   movq    %rsp/*t086*/, %rdi
   call    _cs411println
_L_10:
   movq    $21, %rsp/*t087*/
   movq    %rsp/*t087*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _BS_Search
   movq    %rax, %rsp/*t073*/
   xorq    %rsp/*t088*/, %rsp/*t088*/
   cmpq    %rsp/*t088*/, %rsp/*t073*/
   je      _L_12
_L_11:
   movq    $1, %rsp/*t089*/
   movq    %rsp/*t089*/, %rdi
   call    _cs411println
_L_13:
   movq    $37, %rsp/*t090*/
   movq    %rsp/*t090*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _BS_Search
   movq    %rax, %rsp/*t074*/
   xorq    %rsp/*t091*/, %rsp/*t091*/
   cmpq    %rsp/*t091*/, %rsp/*t074*/
   je      _L_15
_L_14:
   movq    $1, %rsp/*t092*/
   movq    %rsp/*t092*/, %rdi
   call    _cs411println
_L_16:
   movq    $38, %rsp/*t093*/
   movq    %rsp/*t093*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _BS_Search
   movq    %rax, %rsp/*t075*/
   xorq    %rsp/*t094*/, %rsp/*t094*/
   cmpq    %rsp/*t094*/, %rsp/*t075*/
   je      _L_18
_L_17:
   movq    $1, %rsp/*t095*/
   movq    %rsp/*t095*/, %rdi
   call    _cs411println
_L_19:
   movq    $39, %rsp/*t096*/
   movq    %rsp/*t096*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _BS_Search
   movq    %rax, %rsp/*t076*/
   xorq    %rsp/*t097*/, %rsp/*t097*/
   cmpq    %rsp/*t097*/, %rsp/*t076*/
   je      _L_21
_L_20:
   movq    $1, %rsp/*t098*/
   movq    %rsp/*t098*/, %rdi
   call    _cs411println
_L_22:
   movq    $50, %rsp/*t099*/
   movq    %rsp/*t099*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _BS_Search
   movq    %rax, %rsp/*t077*/
   xorq    %rsp/*t100*/, %rsp/*t100*/
   cmpq    %rsp/*t100*/, %rsp/*t077*/
   je      _L_24
_L_23:
   movq    $1, %rsp/*t101*/
   movq    %rsp/*t101*/, %rdi
   call    _cs411println
_L_25:
   movq    $999, %rsp/*t102*/
   movq    %rsp/*t102*/, %rax
_bail_1:
   movq    %rsp/*t004*/, %rbx
   movq    %rsp/*t005*/, %r12
   movq    %rsp/*t006*/, %r13
   movq    %rsp/*t007*/, %r14
   movq    %rsp/*t008*/, %r15
   jmp     _DONE_69
_L_3:
   xorq    %rsp/*t103*/, %rsp/*t103*/
   movq    %rsp/*t103*/, %rdi
   call    _cs411println
   jmp     _L_4
_L_6:
   xorq    %rsp/*t104*/, %rsp/*t104*/
   movq    %rsp/*t104*/, %rdi
   call    _cs411println
   jmp     _L_7
_L_9:
   xorq    %rsp/*t105*/, %rsp/*t105*/
   movq    %rsp/*t105*/, %rdi
   call    _cs411println
   jmp     _L_10
_L_12:
   xorq    %rsp/*t106*/, %rsp/*t106*/
   movq    %rsp/*t106*/, %rdi
   call    _cs411println
   jmp     _L_13
_L_15:
   xorq    %rsp/*t107*/, %rsp/*t107*/
   movq    %rsp/*t107*/, %rdi
   call    _cs411println
   jmp     _L_16
_L_18:
   xorq    %rsp/*t108*/, %rsp/*t108*/
   movq    %rsp/*t108*/, %rdi
   call    _cs411println
   jmp     _L_19
_L_21:
   xorq    %rsp/*t109*/, %rsp/*t109*/
   movq    %rsp/*t109*/, %rdi
   call    _cs411println
   jmp     _L_22
_L_24:
   xorq    %rsp/*t110*/, %rsp/*t110*/
   movq    %rsp/*t110*/, %rdi
   call    _cs411println
   jmp     _L_25
_DONE_69:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _BS_Search
_BS_Search:
   subq   $8, %rsp
_L_70:
   movq    %rbx, %rsp/*t019*/
   movq    %r12, %rsp/*t020*/
   movq    %r13, %rsp/*t021*/
   movq    %r14, %rsp/*t022*/
   movq    %r15, %rsp/*t023*/
   movq    %rdi, %rsp/*t009*/
   movq    %rsi, %rsp/*t010*/
   xorq    %rsp/*t113*/, %rsp/*t113*/
   # movq    %rsp/*t113*/, %rsp/*t016*/
   xorq    %rsp/*t114*/, %rsp/*t114*/
   # movq    %rsp/*t114*/, %rsp/*t011*/
   movq    $-8, %rsp/*t117*/
   # movq    %rsp/*t117*/, %rsp/*t116*/
   movq    (%rsp/*t009*/), %rsp/*t118*/
   addq    %rsp/*t118*/, %rsp/*t116*/
   movq    (%rsp/*t116*/), %rsp/*t115*/
   # movq    %rsp/*t115*/, %rsp/*t012*/
   # movq    %rsp/*t012*/, %rsp/*t119*/
   movq    $1, %rsp/*t120*/
   subq    %rsp/*t120*/, %rsp/*t119*/
   # movq    %rsp/*t119*/, %rsp/*t012*/
   xorq    %rsp/*t121*/, %rsp/*t121*/
   # movq    %rsp/*t121*/, %rsp/*t013*/
   movq    $1, %rsp/*t122*/
   # movq    %rsp/*t122*/, %rsp/*t014*/
   xorq    %rsp/*t123*/, %rsp/*t123*/
   cmpq    %rsp/*t123*/, %rsp/*t014*/
   je      _loopend_27
_loopbody_28:
   # movq    %rsp/*t012*/, %rsp/*t124*/
   addq    %rsp/*t013*/, %rsp/*t124*/
   # movq    %rsp/*t124*/, %rsp/*t015*/
   movq    %rsp/*t015*/, %rsi
   movq    %rsp/*t009*/, %rdi
   call    _BS_Div
   movq    %rax, %rsp/*t015*/
   movq    (%rsp/*t009*/), %rsp/*t125*/
   # movq    %rsp/*t125*/, %rsp/*t018*/
   movq    $-8, %rsp/*t128*/
   # movq    %rsp/*t128*/, %rsp/*t127*/
   addq    %rsp/*t018*/, %rsp/*t127*/
   movq    (%rsp/*t127*/), %rsp/*t126*/
   cmpq    %rsp/*t126*/, %rsp/*t015*/
   jae     _boundsbad_31
_boundsok_30:
   movq    $8, %rsp/*t132*/
   # movq    %rsp/*t132*/, %rsp/*t131*/
   imulq   %rsp/*t015*/, %rsp/*t131*/
   # movq    %rsp/*t131*/, %rsp/*t130*/
   addq    %rsp/*t018*/, %rsp/*t130*/
   movq    (%rsp/*t130*/), %rsp/*t129*/
   # movq    %rsp/*t129*/, %rsp/*t016*/
   cmpq    %rsp/*t016*/, %rsp/*t010*/
   jge     _L_33
_L_32:
   # movq    %rsp/*t015*/, %rsp/*t133*/
   movq    $1, %rsp/*t134*/
   subq    %rsp/*t134*/, %rsp/*t133*/
   # movq    %rsp/*t133*/, %rsp/*t012*/
_L_34:
   movq    %rsp/*t010*/, %rdx
   movq    %rsp/*t016*/, %rsi
   movq    %rsp/*t009*/, %rdi
   call    _BS_Compare
   movq    %rax, %rsp/*t111*/
   xorq    %rsp/*t135*/, %rsp/*t135*/
   cmpq    %rsp/*t135*/, %rsp/*t111*/
   je      _L_36
_L_35:
   xorq    %rsp/*t136*/, %rsp/*t136*/
   # movq    %rsp/*t136*/, %rsp/*t014*/
_L_37:
   cmpq    %rsp/*t013*/, %rsp/*t012*/
   jge     _L_39
_L_38:
   xorq    %rsp/*t137*/, %rsp/*t137*/
   # movq    %rsp/*t137*/, %rsp/*t014*/
_L_40:
_looptest_29:
   xorq    %rsp/*t138*/, %rsp/*t138*/
   cmpq    %rsp/*t138*/, %rsp/*t014*/
   jne     _loopbody_28
_loopend_27:
   movq    %rsp/*t010*/, %rdx
   movq    %rsp/*t016*/, %rsi
   movq    %rsp/*t009*/, %rdi
   call    _BS_Compare
   movq    %rax, %rsp/*t112*/
   xorq    %rsp/*t139*/, %rsp/*t139*/
   cmpq    %rsp/*t139*/, %rsp/*t112*/
   je      _L_42
_L_41:
   movq    $1, %rsp/*t140*/
   # movq    %rsp/*t140*/, %rsp/*t011*/
_L_43:
   movq    %rsp/*t011*/, %rax
_bail_26:
   movq    %rsp/*t019*/, %rbx
   movq    %rsp/*t020*/, %r12
   movq    %rsp/*t021*/, %r13
   movq    %rsp/*t022*/, %r14
   movq    %rsp/*t023*/, %r15
   jmp     _DONE_71
_boundsbad_31:
   movq    $1, %rsp/*t141*/
   movq    %rsp/*t141*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_26
_L_33:
   movq    $1, %rsp/*t143*/
   # movq    %rsp/*t143*/, %rsp/*t142*/
   addq    %rsp/*t015*/, %rsp/*t142*/
   # movq    %rsp/*t142*/, %rsp/*t013*/
   jmp     _L_34
_L_36:
   movq    $1, %rsp/*t144*/
   # movq    %rsp/*t144*/, %rsp/*t014*/
   jmp     _L_37
_L_39:
   xorq    %rsp/*t145*/, %rsp/*t145*/
   # movq    %rsp/*t145*/, %rsp/*t017*/
   jmp     _L_40
_L_42:
   xorq    %rsp/*t146*/, %rsp/*t146*/
   # movq    %rsp/*t146*/, %rsp/*t011*/
   jmp     _L_43
_DONE_71:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _BS_Div
_BS_Div:
_L_72:
   movq    %rbx, %rsp/*t029*/
   movq    %r12, %rsp/*t030*/
   movq    %r13, %rsp/*t031*/
   movq    %r14, %rsp/*t032*/
   movq    %r15, %rsp/*t033*/
   movq    %rdi, %rsp/*t024*/
   movq    %rsi, %rsp/*t025*/
   xorq    %rsp/*t147*/, %rsp/*t147*/
   # movq    %rsp/*t147*/, %rsp/*t026*/
   xorq    %rsp/*t148*/, %rsp/*t148*/
   # movq    %rsp/*t148*/, %rsp/*t027*/
   # movq    %rsp/*t025*/, %rsp/*t149*/
   movq    $1, %rsp/*t150*/
   subq    %rsp/*t150*/, %rsp/*t149*/
   # movq    %rsp/*t149*/, %rsp/*t028*/
   cmpq    %rsp/*t028*/, %rsp/*t027*/
   jge     _loopend_45
_loopbody_46:
   movq    $1, %rsp/*t152*/
   # movq    %rsp/*t152*/, %rsp/*t151*/
   addq    %rsp/*t026*/, %rsp/*t151*/
   # movq    %rsp/*t151*/, %rsp/*t026*/
   movq    $2, %rsp/*t154*/
   # movq    %rsp/*t154*/, %rsp/*t153*/
   addq    %rsp/*t027*/, %rsp/*t153*/
   # movq    %rsp/*t153*/, %rsp/*t027*/
_looptest_47:
   cmpq    %rsp/*t028*/, %rsp/*t027*/
   jl      _loopbody_46
_loopend_45:
   movq    %rsp/*t026*/, %rax
_bail_44:
   movq    %rsp/*t029*/, %rbx
   movq    %rsp/*t030*/, %r12
   movq    %rsp/*t031*/, %r13
   movq    %rsp/*t032*/, %r14
   movq    %rsp/*t033*/, %r15
_DONE_73:
   # return sink
   ret

.text
.globl _BS_Compare
_BS_Compare:
_L_74:
   movq    %rbx, %rsp/*t039*/
   movq    %r12, %rsp/*t040*/
   movq    %r13, %rsp/*t041*/
   movq    %r14, %rsp/*t042*/
   movq    %r15, %rsp/*t043*/
   movq    %rdi, %rsp/*t034*/
   movq    %rsi, %rsp/*t035*/
   movq    %rdx, %rsp/*t036*/
   xorq    %rsp/*t155*/, %rsp/*t155*/
   # movq    %rsp/*t155*/, %rsp/*t037*/
   movq    $1, %rsp/*t157*/
   # movq    %rsp/*t157*/, %rsp/*t156*/
   addq    %rsp/*t036*/, %rsp/*t156*/
   # movq    %rsp/*t156*/, %rsp/*t038*/
   cmpq    %rsp/*t036*/, %rsp/*t035*/
   jge     _L_50
_L_49:
   xorq    %rsp/*t158*/, %rsp/*t158*/
   # movq    %rsp/*t158*/, %rsp/*t037*/
_L_51:
   movq    %rsp/*t037*/, %rax
_bail_48:
   movq    %rsp/*t039*/, %rbx
   movq    %rsp/*t040*/, %r12
   movq    %rsp/*t041*/, %r13
   movq    %rsp/*t042*/, %r14
   movq    %rsp/*t043*/, %r15
   jmp     _DONE_75
_L_50:
   cmpq    %rsp/*t038*/, %rsp/*t035*/
   jge     _L_52
_L_53:
   movq    $1, %rsp/*t159*/
   # movq    %rsp/*t159*/, %rsp/*t037*/
_L_54:
   jmp     _L_51
_L_52:
   xorq    %rsp/*t160*/, %rsp/*t160*/
   # movq    %rsp/*t160*/, %rsp/*t037*/
   jmp     _L_54
_DONE_75:
   # return sink
   ret

.text
.globl _BS_Print
_BS_Print:
   subq   $8, %rsp
_L_76:
   movq    %rbx, %rsp/*t047*/
   movq    %r12, %rsp/*t048*/
   movq    %r13, %rsp/*t049*/
   movq    %r14, %rsp/*t050*/
   movq    %r15, %rsp/*t051*/
   movq    %rdi, %rsp/*t044*/
   movq    $1, %rsp/*t161*/
   # movq    %rsp/*t161*/, %rsp/*t045*/
   movq    $8, %rsp/*t164*/
   # movq    %rsp/*t164*/, %rsp/*t163*/
   addq    %rsp/*t044*/, %rsp/*t163*/
   movq    (%rsp/*t163*/), %rsp/*t162*/
   cmpq    %rsp/*t162*/, %rsp/*t045*/
   jge     _loopend_56
_loopbody_57:
   movq    (%rsp/*t044*/), %rsp/*t165*/
   # movq    %rsp/*t165*/, %rsp/*t046*/
   movq    $-8, %rsp/*t168*/
   # movq    %rsp/*t168*/, %rsp/*t167*/
   addq    %rsp/*t046*/, %rsp/*t167*/
   movq    (%rsp/*t167*/), %rsp/*t166*/
   cmpq    %rsp/*t166*/, %rsp/*t045*/
   jae     _boundsbad_60
_boundsok_59:
   movq    $8, %rsp/*t172*/
   # movq    %rsp/*t172*/, %rsp/*t171*/
   imulq   %rsp/*t045*/, %rsp/*t171*/
   # movq    %rsp/*t171*/, %rsp/*t170*/
   addq    %rsp/*t046*/, %rsp/*t170*/
   movq    (%rsp/*t170*/), %rsp/*t169*/
   movq    %rsp/*t169*/, %rdi
   call    _cs411println
   movq    $1, %rsp/*t174*/
   # movq    %rsp/*t174*/, %rsp/*t173*/
   addq    %rsp/*t045*/, %rsp/*t173*/
   # movq    %rsp/*t173*/, %rsp/*t045*/
_looptest_58:
   movq    $8, %rsp/*t177*/
   # movq    %rsp/*t177*/, %rsp/*t176*/
   addq    %rsp/*t044*/, %rsp/*t176*/
   movq    (%rsp/*t176*/), %rsp/*t175*/
   cmpq    %rsp/*t175*/, %rsp/*t045*/
   jl      _loopbody_57
_loopend_56:
   movq    $99999, %rsp/*t178*/
   movq    %rsp/*t178*/, %rdi
   call    _cs411println
   xorq    %rsp/*t179*/, %rsp/*t179*/
   movq    %rsp/*t179*/, %rax
_bail_55:
   movq    %rsp/*t047*/, %rbx
   movq    %rsp/*t048*/, %r12
   movq    %rsp/*t049*/, %r13
   movq    %rsp/*t050*/, %r14
   movq    %rsp/*t051*/, %r15
   jmp     _DONE_77
_boundsbad_60:
   movq    $1, %rsp/*t180*/
   movq    %rsp/*t180*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_55
_DONE_77:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _BS_Init
_BS_Init:
   subq   $8, %rsp
_L_78:
   movq    %rbx, %rsp/*t060*/
   movq    %r12, %rsp/*t061*/
   movq    %r13, %rsp/*t062*/
   movq    %r14, %rsp/*t063*/
   movq    %r15, %rsp/*t064*/
   movq    %rdi, %rsp/*t052*/
   movq    %rsi, %rsp/*t053*/
   movq    $8, %rsp/*t184*/
   # movq    %rsp/*t184*/, %rsp/*t183*/
   addq    %rsp/*t052*/, %rsp/*t183*/
   movq    %rsp/*t053*/, (%rsp/*t183*/)
   # movq    %rsp/*t052*/, %rsp/*t182*/
   movq    %rsp/*t053*/, %rdi
   call    _cs411newarray
   movq    %rax, %rsp/*t181*/
   movq    %rsp/*t181*/, (%rsp/*t182*/)
   movq    $1, %rsp/*t185*/
   # movq    %rsp/*t185*/, %rsp/*t054*/
   movq    $1, %rsp/*t187*/
   # movq    %rsp/*t187*/, %rsp/*t186*/
   movq    $8, %rsp/*t190*/
   # movq    %rsp/*t190*/, %rsp/*t189*/
   addq    %rsp/*t052*/, %rsp/*t189*/
   movq    (%rsp/*t189*/), %rsp/*t188*/
   addq    %rsp/*t188*/, %rsp/*t186*/
   # movq    %rsp/*t186*/, %rsp/*t055*/
   movq    $8, %rsp/*t193*/
   # movq    %rsp/*t193*/, %rsp/*t192*/
   addq    %rsp/*t052*/, %rsp/*t192*/
   movq    (%rsp/*t192*/), %rsp/*t191*/
   cmpq    %rsp/*t191*/, %rsp/*t054*/
   jge     _loopend_62
_loopbody_63:
   # movq    %rsp/*t054*/, %rsp/*t194*/
   movq    $2, %rsp/*t195*/
   imulq   %rsp/*t195*/, %rsp/*t194*/
   # movq    %rsp/*t194*/, %rsp/*t057*/
   # movq    %rsp/*t055*/, %rsp/*t196*/
   movq    $3, %rsp/*t197*/
   subq    %rsp/*t197*/, %rsp/*t196*/
   # movq    %rsp/*t196*/, %rsp/*t056*/
   movq    (%rsp/*t052*/), %rsp/*t198*/
   # movq    %rsp/*t198*/, %rsp/*t058*/
   movq    $-8, %rsp/*t201*/
   # movq    %rsp/*t201*/, %rsp/*t200*/
   addq    %rsp/*t058*/, %rsp/*t200*/
   movq    (%rsp/*t200*/), %rsp/*t199*/
   cmpq    %rsp/*t199*/, %rsp/*t054*/
   jae     _boundsbad_66
_boundsok_65:
   # movq    %rsp/*t056*/, %rsp/*t202*/
   addq    %rsp/*t057*/, %rsp/*t202*/
   # movq    %rsp/*t202*/, %rsp/*t059*/
   movq    $8, %rsp/*t205*/
   # movq    %rsp/*t205*/, %rsp/*t204*/
   imulq   %rsp/*t054*/, %rsp/*t204*/
   # movq    %rsp/*t204*/, %rsp/*t203*/
   addq    %rsp/*t058*/, %rsp/*t203*/
   movq    %rsp/*t059*/, (%rsp/*t203*/)
   movq    $1, %rsp/*t207*/
   # movq    %rsp/*t207*/, %rsp/*t206*/
   addq    %rsp/*t054*/, %rsp/*t206*/
   # movq    %rsp/*t206*/, %rsp/*t054*/
   # movq    %rsp/*t055*/, %rsp/*t208*/
   movq    $1, %rsp/*t209*/
   subq    %rsp/*t209*/, %rsp/*t208*/
   # movq    %rsp/*t208*/, %rsp/*t055*/
_looptest_64:
   movq    $8, %rsp/*t212*/
   # movq    %rsp/*t212*/, %rsp/*t211*/
   addq    %rsp/*t052*/, %rsp/*t211*/
   movq    (%rsp/*t211*/), %rsp/*t210*/
   cmpq    %rsp/*t210*/, %rsp/*t054*/
   jl      _loopbody_63
_loopend_62:
   xorq    %rsp/*t213*/, %rsp/*t213*/
   movq    %rsp/*t213*/, %rax
_bail_61:
   movq    %rsp/*t060*/, %rbx
   movq    %rsp/*t061*/, %r12
   movq    %rsp/*t062*/, %r13
   movq    %rsp/*t063*/, %r14
   movq    %rsp/*t064*/, %r15
   jmp     _DONE_79
_boundsbad_66:
   movq    $1, %rsp/*t214*/
   movq    %rsp/*t214*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_61
_DONE_79:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_80:
   movq    %rbx, %rsp/*t065*/
   movq    %r12, %rsp/*t066*/
   movq    %r13, %rsp/*t067*/
   movq    %r14, %rsp/*t068*/
   movq    %r15, %rsp/*t069*/
   movq    $16, %rsp/*t217*/
   movq    %rsp/*t217*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t216*/
   movq    $20, %rsp/*t218*/
   movq    %rsp/*t218*/, %rsi
   movq    %rsp/*t216*/, %rdi
   call    _BS_Start
   movq    %rax, %rsp/*t215*/
   movq    %rsp/*t215*/, %rdi
   call    _cs411println
_bail_67:
   movq    %rsp/*t065*/, %rbx
   movq    %rsp/*t066*/, %r12
   movq    %rsp/*t067*/, %r13
   movq    %rsp/*t068*/, %r14
   movq    %rsp/*t069*/, %r15
_DONE_81:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
