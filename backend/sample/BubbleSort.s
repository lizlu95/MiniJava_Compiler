.text
.globl _BBS_Start
_BBS_Start:
   subq   $8, %rsp
_L_38:
   movq    %rbx, %rsp/*t003*/
   movq    %r12, %rsp/*t004*/
   movq    %r13, %rsp/*t005*/
   movq    %r14, %rsp/*t006*/
   movq    %r15, %rsp/*t007*/
   movq    %rdi, %rsp/*t000*/
   movq    %rsi, %rsp/*t001*/
   movq    %rsp/*t001*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _BBS_Init
   movq    %rax, %rsp/*t002*/
   movq    %rsp/*t000*/, %rdi
   call    _BBS_Print
   movq    %rax, %rsp/*t002*/
   movq    $99999, %rsp/*t060*/
   movq    %rsp/*t060*/, %rdi
   call    _cs411println
   movq    %rsp/*t000*/, %rdi
   call    _BBS_Sort
   movq    %rax, %rsp/*t002*/
   movq    %rsp/*t000*/, %rdi
   call    _BBS_Print
   movq    %rax, %rsp/*t002*/
   xorq    %rsp/*t061*/, %rsp/*t061*/
   movq    %rsp/*t061*/, %rax
_bail_1:
   movq    %rsp/*t003*/, %rbx
   movq    %rsp/*t004*/, %r12
   movq    %rsp/*t005*/, %r13
   movq    %rsp/*t006*/, %r14
   movq    %rsp/*t007*/, %r15
_DONE_39:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _BBS_Sort
_BBS_Sort:
   subq   $8, %rsp
_L_40:
   movq    %rbx, %rsp/*t025*/
   movq    %r12, %rsp/*t026*/
   movq    %r13, %rsp/*t027*/
   movq    %r14, %rsp/*t028*/
   movq    %r15, %rsp/*t029*/
   movq    %rdi, %rsp/*t008*/
   movq    $8, %rsp/*t065*/
   # movq    %rsp/*t065*/, %rsp/*t064*/
   addq    %rsp/*t008*/, %rsp/*t064*/
   movq    (%rsp/*t064*/), %rsp/*t063*/
   # movq    %rsp/*t063*/, %rsp/*t062*/
   movq    $1, %rsp/*t066*/
   subq    %rsp/*t066*/, %rsp/*t062*/
   # movq    %rsp/*t062*/, %rsp/*t010*/
   movq    $-1, %rsp/*t067*/
   # movq    %rsp/*t067*/, %rsp/*t011*/
   cmpq    %rsp/*t010*/, %rsp/*t011*/
   jge     _loopend_3
_loopbody_4:
   movq    $1, %rsp/*t068*/
   # movq    %rsp/*t068*/, %rsp/*t016*/
   movq    $1, %rsp/*t070*/
   # movq    %rsp/*t070*/, %rsp/*t069*/
   addq    %rsp/*t010*/, %rsp/*t069*/
   cmpq    %rsp/*t069*/, %rsp/*t016*/
   jge     _loopend_6
_loopbody_7:
   # movq    %rsp/*t016*/, %rsp/*t071*/
   movq    $1, %rsp/*t072*/
   subq    %rsp/*t072*/, %rsp/*t071*/
   # movq    %rsp/*t071*/, %rsp/*t015*/
   movq    (%rsp/*t008*/), %rsp/*t073*/
   # movq    %rsp/*t073*/, %rsp/*t018*/
   movq    $-8, %rsp/*t076*/
   # movq    %rsp/*t076*/, %rsp/*t075*/
   addq    %rsp/*t018*/, %rsp/*t075*/
   movq    (%rsp/*t075*/), %rsp/*t074*/
   cmpq    %rsp/*t074*/, %rsp/*t015*/
   jae     _boundsbad_10
_boundsok_9:
   movq    $8, %rsp/*t080*/
   # movq    %rsp/*t080*/, %rsp/*t079*/
   imulq   %rsp/*t015*/, %rsp/*t079*/
   # movq    %rsp/*t079*/, %rsp/*t078*/
   addq    %rsp/*t018*/, %rsp/*t078*/
   movq    (%rsp/*t078*/), %rsp/*t077*/
   # movq    %rsp/*t077*/, %rsp/*t012*/
   movq    (%rsp/*t008*/), %rsp/*t081*/
   # movq    %rsp/*t081*/, %rsp/*t019*/
   movq    $-8, %rsp/*t084*/
   # movq    %rsp/*t084*/, %rsp/*t083*/
   addq    %rsp/*t019*/, %rsp/*t083*/
   movq    (%rsp/*t083*/), %rsp/*t082*/
   cmpq    %rsp/*t082*/, %rsp/*t016*/
   jae     _boundsbad_10
_boundsok_11:
   movq    $8, %rsp/*t088*/
   # movq    %rsp/*t088*/, %rsp/*t087*/
   imulq   %rsp/*t016*/, %rsp/*t087*/
   # movq    %rsp/*t087*/, %rsp/*t086*/
   addq    %rsp/*t019*/, %rsp/*t086*/
   movq    (%rsp/*t086*/), %rsp/*t085*/
   # movq    %rsp/*t085*/, %rsp/*t013*/
   cmpq    %rsp/*t012*/, %rsp/*t013*/
   jge     _L_13
_L_12:
   # movq    %rsp/*t016*/, %rsp/*t089*/
   movq    $1, %rsp/*t090*/
   subq    %rsp/*t090*/, %rsp/*t089*/
   # movq    %rsp/*t089*/, %rsp/*t014*/
   movq    (%rsp/*t008*/), %rsp/*t091*/
   # movq    %rsp/*t091*/, %rsp/*t020*/
   movq    $-8, %rsp/*t094*/
   # movq    %rsp/*t094*/, %rsp/*t093*/
   addq    %rsp/*t020*/, %rsp/*t093*/
   movq    (%rsp/*t093*/), %rsp/*t092*/
   cmpq    %rsp/*t092*/, %rsp/*t014*/
   jae     _boundsbad_10
_boundsok_15:
   movq    $8, %rsp/*t098*/
   # movq    %rsp/*t098*/, %rsp/*t097*/
   imulq   %rsp/*t014*/, %rsp/*t097*/
   # movq    %rsp/*t097*/, %rsp/*t096*/
   addq    %rsp/*t020*/, %rsp/*t096*/
   movq    (%rsp/*t096*/), %rsp/*t095*/
   # movq    %rsp/*t095*/, %rsp/*t017*/
   movq    (%rsp/*t008*/), %rsp/*t099*/
   # movq    %rsp/*t099*/, %rsp/*t022*/
   movq    $-8, %rsp/*t102*/
   # movq    %rsp/*t102*/, %rsp/*t101*/
   addq    %rsp/*t022*/, %rsp/*t101*/
   movq    (%rsp/*t101*/), %rsp/*t100*/
   cmpq    %rsp/*t100*/, %rsp/*t014*/
   jae     _boundsbad_10
_boundsok_17:
   movq    (%rsp/*t008*/), %rsp/*t103*/
   # movq    %rsp/*t103*/, %rsp/*t021*/
   movq    $-8, %rsp/*t106*/
   # movq    %rsp/*t106*/, %rsp/*t105*/
   addq    %rsp/*t021*/, %rsp/*t105*/
   movq    (%rsp/*t105*/), %rsp/*t104*/
   cmpq    %rsp/*t104*/, %rsp/*t016*/
   jae     _boundsbad_10
_boundsok_16:
   movq    $8, %rsp/*t110*/
   # movq    %rsp/*t110*/, %rsp/*t109*/
   imulq   %rsp/*t016*/, %rsp/*t109*/
   # movq    %rsp/*t109*/, %rsp/*t108*/
   addq    %rsp/*t021*/, %rsp/*t108*/
   movq    (%rsp/*t108*/), %rsp/*t107*/
   # movq    %rsp/*t107*/, %rsp/*t023*/
   movq    $8, %rsp/*t113*/
   # movq    %rsp/*t113*/, %rsp/*t112*/
   imulq   %rsp/*t014*/, %rsp/*t112*/
   # movq    %rsp/*t112*/, %rsp/*t111*/
   addq    %rsp/*t022*/, %rsp/*t111*/
   movq    %rsp/*t023*/, (%rsp/*t111*/)
   movq    (%rsp/*t008*/), %rsp/*t114*/
   # movq    %rsp/*t114*/, %rsp/*t024*/
   movq    $-8, %rsp/*t117*/
   # movq    %rsp/*t117*/, %rsp/*t116*/
   addq    %rsp/*t024*/, %rsp/*t116*/
   movq    (%rsp/*t116*/), %rsp/*t115*/
   cmpq    %rsp/*t115*/, %rsp/*t016*/
   jae     _boundsbad_10
_boundsok_18:
   movq    $8, %rsp/*t120*/
   # movq    %rsp/*t120*/, %rsp/*t119*/
   imulq   %rsp/*t016*/, %rsp/*t119*/
   # movq    %rsp/*t119*/, %rsp/*t118*/
   addq    %rsp/*t024*/, %rsp/*t118*/
   movq    %rsp/*t017*/, (%rsp/*t118*/)
_L_14:
   movq    $1, %rsp/*t122*/
   # movq    %rsp/*t122*/, %rsp/*t121*/
   addq    %rsp/*t016*/, %rsp/*t121*/
   # movq    %rsp/*t121*/, %rsp/*t016*/
_looptest_8:
   movq    $1, %rsp/*t124*/
   # movq    %rsp/*t124*/, %rsp/*t123*/
   addq    %rsp/*t010*/, %rsp/*t123*/
   cmpq    %rsp/*t123*/, %rsp/*t016*/
   jl      _loopbody_7
_loopend_6:
   # movq    %rsp/*t010*/, %rsp/*t125*/
   movq    $1, %rsp/*t126*/
   subq    %rsp/*t126*/, %rsp/*t125*/
   # movq    %rsp/*t125*/, %rsp/*t010*/
_looptest_5:
   cmpq    %rsp/*t010*/, %rsp/*t011*/
   jl      _loopbody_4
_loopend_3:
   xorq    %rsp/*t127*/, %rsp/*t127*/
   movq    %rsp/*t127*/, %rax
_bail_2:
   movq    %rsp/*t025*/, %rbx
   movq    %rsp/*t026*/, %r12
   movq    %rsp/*t027*/, %r13
   movq    %rsp/*t028*/, %r14
   movq    %rsp/*t029*/, %r15
   jmp     _DONE_41
_boundsbad_10:
   movq    $1, %rsp/*t128*/
   movq    %rsp/*t128*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_2
_L_13:
   xorq    %rsp/*t129*/, %rsp/*t129*/
   # movq    %rsp/*t129*/, %rsp/*t009*/
   jmp     _L_14
_DONE_41:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _BBS_Print
_BBS_Print:
   subq   $8, %rsp
_L_42:
   movq    %rbx, %rsp/*t033*/
   movq    %r12, %rsp/*t034*/
   movq    %r13, %rsp/*t035*/
   movq    %r14, %rsp/*t036*/
   movq    %r15, %rsp/*t037*/
   movq    %rdi, %rsp/*t030*/
   xorq    %rsp/*t130*/, %rsp/*t130*/
   # movq    %rsp/*t130*/, %rsp/*t031*/
   movq    $8, %rsp/*t133*/
   # movq    %rsp/*t133*/, %rsp/*t132*/
   addq    %rsp/*t030*/, %rsp/*t132*/
   movq    (%rsp/*t132*/), %rsp/*t131*/
   cmpq    %rsp/*t131*/, %rsp/*t031*/
   jge     _loopend_20
_loopbody_21:
   movq    (%rsp/*t030*/), %rsp/*t134*/
   # movq    %rsp/*t134*/, %rsp/*t032*/
   movq    $-8, %rsp/*t137*/
   # movq    %rsp/*t137*/, %rsp/*t136*/
   addq    %rsp/*t032*/, %rsp/*t136*/
   movq    (%rsp/*t136*/), %rsp/*t135*/
   cmpq    %rsp/*t135*/, %rsp/*t031*/
   jae     _boundsbad_24
_boundsok_23:
   movq    $8, %rsp/*t141*/
   # movq    %rsp/*t141*/, %rsp/*t140*/
   imulq   %rsp/*t031*/, %rsp/*t140*/
   # movq    %rsp/*t140*/, %rsp/*t139*/
   addq    %rsp/*t032*/, %rsp/*t139*/
   movq    (%rsp/*t139*/), %rsp/*t138*/
   movq    %rsp/*t138*/, %rdi
   call    _cs411println
   movq    $1, %rsp/*t143*/
   # movq    %rsp/*t143*/, %rsp/*t142*/
   addq    %rsp/*t031*/, %rsp/*t142*/
   # movq    %rsp/*t142*/, %rsp/*t031*/
_looptest_22:
   movq    $8, %rsp/*t146*/
   # movq    %rsp/*t146*/, %rsp/*t145*/
   addq    %rsp/*t030*/, %rsp/*t145*/
   movq    (%rsp/*t145*/), %rsp/*t144*/
   cmpq    %rsp/*t144*/, %rsp/*t031*/
   jl      _loopbody_21
_loopend_20:
   xorq    %rsp/*t147*/, %rsp/*t147*/
   movq    %rsp/*t147*/, %rax
_bail_19:
   movq    %rsp/*t033*/, %rbx
   movq    %rsp/*t034*/, %r12
   movq    %rsp/*t035*/, %r13
   movq    %rsp/*t036*/, %r14
   movq    %rsp/*t037*/, %r15
   jmp     _DONE_43
_boundsbad_24:
   movq    $1, %rsp/*t148*/
   movq    %rsp/*t148*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_19
_DONE_43:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _BBS_Init
_BBS_Init:
   subq   $8, %rsp
_L_44:
   movq    %rbx, %rsp/*t050*/
   movq    %r12, %rsp/*t051*/
   movq    %r13, %rsp/*t052*/
   movq    %r14, %rsp/*t053*/
   movq    %r15, %rsp/*t054*/
   movq    %rdi, %rsp/*t038*/
   movq    %rsi, %rsp/*t039*/
   movq    $8, %rsp/*t152*/
   # movq    %rsp/*t152*/, %rsp/*t151*/
   addq    %rsp/*t038*/, %rsp/*t151*/
   movq    %rsp/*t039*/, (%rsp/*t151*/)
   # movq    %rsp/*t038*/, %rsp/*t150*/
   movq    %rsp/*t039*/, %rdi
   call    _cs411newarray
   movq    %rax, %rsp/*t149*/
   movq    %rsp/*t149*/, (%rsp/*t150*/)
   movq    (%rsp/*t038*/), %rsp/*t153*/
   # movq    %rsp/*t153*/, %rsp/*t040*/
   xorq    %rsp/*t154*/, %rsp/*t154*/
   movq    $-8, %rsp/*t157*/
   # movq    %rsp/*t157*/, %rsp/*t156*/
   addq    %rsp/*t040*/, %rsp/*t156*/
   movq    (%rsp/*t156*/), %rsp/*t155*/
   cmpq    %rsp/*t155*/, %rsp/*t154*/
   jae     _boundsbad_27
_boundsok_26:
   movq    $20, %rsp/*t158*/
   movq    %rsp/*t158*/, (%rsp/*t040*/)
   movq    (%rsp/*t038*/), %rsp/*t159*/
   # movq    %rsp/*t159*/, %rsp/*t041*/
   movq    $1, %rsp/*t160*/
   movq    $-8, %rsp/*t163*/
   # movq    %rsp/*t163*/, %rsp/*t162*/
   addq    %rsp/*t041*/, %rsp/*t162*/
   movq    (%rsp/*t162*/), %rsp/*t161*/
   cmpq    %rsp/*t161*/, %rsp/*t160*/
   jae     _boundsbad_27
_boundsok_28:
   movq    $8, %rsp/*t165*/
   # movq    %rsp/*t165*/, %rsp/*t164*/
   addq    %rsp/*t041*/, %rsp/*t164*/
   movq    $7, %rsp/*t166*/
   movq    %rsp/*t166*/, (%rsp/*t164*/)
   movq    (%rsp/*t038*/), %rsp/*t167*/
   # movq    %rsp/*t167*/, %rsp/*t042*/
   movq    $2, %rsp/*t168*/
   movq    $-8, %rsp/*t171*/
   # movq    %rsp/*t171*/, %rsp/*t170*/
   addq    %rsp/*t042*/, %rsp/*t170*/
   movq    (%rsp/*t170*/), %rsp/*t169*/
   cmpq    %rsp/*t169*/, %rsp/*t168*/
   jae     _boundsbad_27
_boundsok_29:
   movq    $16, %rsp/*t173*/
   # movq    %rsp/*t173*/, %rsp/*t172*/
   addq    %rsp/*t042*/, %rsp/*t172*/
   movq    $12, %rsp/*t174*/
   movq    %rsp/*t174*/, (%rsp/*t172*/)
   movq    (%rsp/*t038*/), %rsp/*t175*/
   # movq    %rsp/*t175*/, %rsp/*t043*/
   movq    $3, %rsp/*t176*/
   movq    $-8, %rsp/*t179*/
   # movq    %rsp/*t179*/, %rsp/*t178*/
   addq    %rsp/*t043*/, %rsp/*t178*/
   movq    (%rsp/*t178*/), %rsp/*t177*/
   cmpq    %rsp/*t177*/, %rsp/*t176*/
   jae     _boundsbad_27
_boundsok_30:
   movq    $24, %rsp/*t181*/
   # movq    %rsp/*t181*/, %rsp/*t180*/
   addq    %rsp/*t043*/, %rsp/*t180*/
   movq    $18, %rsp/*t182*/
   movq    %rsp/*t182*/, (%rsp/*t180*/)
   movq    (%rsp/*t038*/), %rsp/*t183*/
   # movq    %rsp/*t183*/, %rsp/*t044*/
   movq    $4, %rsp/*t184*/
   movq    $-8, %rsp/*t187*/
   # movq    %rsp/*t187*/, %rsp/*t186*/
   addq    %rsp/*t044*/, %rsp/*t186*/
   movq    (%rsp/*t186*/), %rsp/*t185*/
   cmpq    %rsp/*t185*/, %rsp/*t184*/
   jae     _boundsbad_27
_boundsok_31:
   movq    $32, %rsp/*t189*/
   # movq    %rsp/*t189*/, %rsp/*t188*/
   addq    %rsp/*t044*/, %rsp/*t188*/
   movq    $2, %rsp/*t190*/
   movq    %rsp/*t190*/, (%rsp/*t188*/)
   movq    (%rsp/*t038*/), %rsp/*t191*/
   # movq    %rsp/*t191*/, %rsp/*t045*/
   movq    $5, %rsp/*t192*/
   movq    $-8, %rsp/*t195*/
   # movq    %rsp/*t195*/, %rsp/*t194*/
   addq    %rsp/*t045*/, %rsp/*t194*/
   movq    (%rsp/*t194*/), %rsp/*t193*/
   cmpq    %rsp/*t193*/, %rsp/*t192*/
   jae     _boundsbad_27
_boundsok_32:
   movq    $40, %rsp/*t197*/
   # movq    %rsp/*t197*/, %rsp/*t196*/
   addq    %rsp/*t045*/, %rsp/*t196*/
   movq    $11, %rsp/*t198*/
   movq    %rsp/*t198*/, (%rsp/*t196*/)
   movq    (%rsp/*t038*/), %rsp/*t199*/
   # movq    %rsp/*t199*/, %rsp/*t046*/
   movq    $6, %rsp/*t200*/
   movq    $-8, %rsp/*t203*/
   # movq    %rsp/*t203*/, %rsp/*t202*/
   addq    %rsp/*t046*/, %rsp/*t202*/
   movq    (%rsp/*t202*/), %rsp/*t201*/
   cmpq    %rsp/*t201*/, %rsp/*t200*/
   jae     _boundsbad_27
_boundsok_33:
   movq    $48, %rsp/*t205*/
   # movq    %rsp/*t205*/, %rsp/*t204*/
   addq    %rsp/*t046*/, %rsp/*t204*/
   movq    $6, %rsp/*t206*/
   movq    %rsp/*t206*/, (%rsp/*t204*/)
   movq    (%rsp/*t038*/), %rsp/*t207*/
   # movq    %rsp/*t207*/, %rsp/*t047*/
   movq    $7, %rsp/*t208*/
   movq    $-8, %rsp/*t211*/
   # movq    %rsp/*t211*/, %rsp/*t210*/
   addq    %rsp/*t047*/, %rsp/*t210*/
   movq    (%rsp/*t210*/), %rsp/*t209*/
   cmpq    %rsp/*t209*/, %rsp/*t208*/
   jae     _boundsbad_27
_boundsok_34:
   movq    $56, %rsp/*t213*/
   # movq    %rsp/*t213*/, %rsp/*t212*/
   addq    %rsp/*t047*/, %rsp/*t212*/
   movq    $9, %rsp/*t214*/
   movq    %rsp/*t214*/, (%rsp/*t212*/)
   movq    (%rsp/*t038*/), %rsp/*t215*/
   # movq    %rsp/*t215*/, %rsp/*t048*/
   movq    $8, %rsp/*t216*/
   movq    $-8, %rsp/*t219*/
   # movq    %rsp/*t219*/, %rsp/*t218*/
   addq    %rsp/*t048*/, %rsp/*t218*/
   movq    (%rsp/*t218*/), %rsp/*t217*/
   cmpq    %rsp/*t217*/, %rsp/*t216*/
   jae     _boundsbad_27
_boundsok_35:
   movq    $64, %rsp/*t221*/
   # movq    %rsp/*t221*/, %rsp/*t220*/
   addq    %rsp/*t048*/, %rsp/*t220*/
   movq    $19, %rsp/*t222*/
   movq    %rsp/*t222*/, (%rsp/*t220*/)
   movq    (%rsp/*t038*/), %rsp/*t223*/
   # movq    %rsp/*t223*/, %rsp/*t049*/
   movq    $9, %rsp/*t224*/
   movq    $-8, %rsp/*t227*/
   # movq    %rsp/*t227*/, %rsp/*t226*/
   addq    %rsp/*t049*/, %rsp/*t226*/
   movq    (%rsp/*t226*/), %rsp/*t225*/
   cmpq    %rsp/*t225*/, %rsp/*t224*/
   jae     _boundsbad_27
_boundsok_36:
   movq    $72, %rsp/*t229*/
   # movq    %rsp/*t229*/, %rsp/*t228*/
   addq    %rsp/*t049*/, %rsp/*t228*/
   movq    $5, %rsp/*t230*/
   movq    %rsp/*t230*/, (%rsp/*t228*/)
   xorq    %rsp/*t231*/, %rsp/*t231*/
   movq    %rsp/*t231*/, %rax
_bail_25:
   movq    %rsp/*t050*/, %rbx
   movq    %rsp/*t051*/, %r12
   movq    %rsp/*t052*/, %r13
   movq    %rsp/*t053*/, %r14
   movq    %rsp/*t054*/, %r15
   jmp     _DONE_45
_boundsbad_27:
   movq    $1, %rsp/*t232*/
   movq    %rsp/*t232*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_25
_DONE_45:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_46:
   movq    %rbx, %rsp/*t055*/
   movq    %r12, %rsp/*t056*/
   movq    %r13, %rsp/*t057*/
   movq    %r14, %rsp/*t058*/
   movq    %r15, %rsp/*t059*/
   movq    $16, %rsp/*t235*/
   movq    %rsp/*t235*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t234*/
   movq    $10, %rsp/*t236*/
   movq    %rsp/*t236*/, %rsi
   movq    %rsp/*t234*/, %rdi
   call    _BBS_Start
   movq    %rax, %rsp/*t233*/
   movq    %rsp/*t233*/, %rdi
   call    _cs411println
_bail_37:
   movq    %rsp/*t055*/, %rbx
   movq    %rsp/*t056*/, %r12
   movq    %rsp/*t057*/, %r13
   movq    %rsp/*t058*/, %r14
   movq    %rsp/*t059*/, %r15
_DONE_47:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
