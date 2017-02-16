.text
.globl _QS_Start
_QS_Start:
   subq   $8, %rsp
_L_56:
   movq    %rbx, %rsp/*t003*/
   movq    %r12, %rsp/*t004*/
   movq    %r13, %rsp/*t005*/
   movq    %r14, %rsp/*t006*/
   movq    %r15, %rsp/*t007*/
   movq    %rdi, %rsp/*t000*/
   movq    %rsi, %rsp/*t001*/
   movq    %rsp/*t001*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _QS_Init
   movq    %rax, %rsp/*t002*/
   movq    %rsp/*t000*/, %rdi
   call    _QS_Print
   movq    %rax, %rsp/*t002*/
   movq    $9999, %rsp/*t069*/
   movq    %rsp/*t069*/, %rdi
   call    _cs411println
   movq    $8, %rsp/*t073*/
   # movq    %rsp/*t073*/, %rsp/*t072*/
   addq    %rsp/*t000*/, %rsp/*t072*/
   movq    (%rsp/*t072*/), %rsp/*t071*/
   # movq    %rsp/*t071*/, %rsp/*t070*/
   movq    $1, %rsp/*t074*/
   subq    %rsp/*t074*/, %rsp/*t070*/
   # movq    %rsp/*t070*/, %rsp/*t002*/
   movq    %rsp/*t002*/, %rdx
   xorq    %rsp/*t075*/, %rsp/*t075*/
   movq    %rsp/*t075*/, %rsi
   movq    %rsp/*t000*/, %rdi
   call    _QS_Sort
   movq    %rax, %rsp/*t002*/
   movq    %rsp/*t000*/, %rdi
   call    _QS_Print
   movq    %rax, %rsp/*t002*/
   xorq    %rsp/*t076*/, %rsp/*t076*/
   movq    %rsp/*t076*/, %rax
_bail_1:
   movq    %rsp/*t003*/, %rbx
   movq    %rsp/*t004*/, %r12
   movq    %rsp/*t005*/, %r13
   movq    %rsp/*t006*/, %r14
   movq    %rsp/*t007*/, %r15
_DONE_57:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _QS_Sort
_QS_Sort:
   subq   $8, %rsp
_L_58:
   movq    %rbx, %rsp/*t034*/
   movq    %r12, %rsp/*t035*/
   movq    %r13, %rsp/*t036*/
   movq    %r14, %rsp/*t037*/
   movq    %r15, %rsp/*t038*/
   movq    %rdi, %rsp/*t008*/
   movq    %rsi, %rsp/*t009*/
   movq    %rdx, %rsp/*t010*/
   xorq    %rsp/*t077*/, %rsp/*t077*/
   # movq    %rsp/*t077*/, %rsp/*t015*/
   cmpq    %rsp/*t010*/, %rsp/*t009*/
   jge     _L_4
_L_3:
   movq    (%rsp/*t008*/), %rsp/*t078*/
   # movq    %rsp/*t078*/, %rsp/*t019*/
   movq    $-8, %rsp/*t081*/
   # movq    %rsp/*t081*/, %rsp/*t080*/
   addq    %rsp/*t019*/, %rsp/*t080*/
   movq    (%rsp/*t080*/), %rsp/*t079*/
   cmpq    %rsp/*t079*/, %rsp/*t010*/
   jae     _boundsbad_7
_boundsok_6:
   movq    $8, %rsp/*t085*/
   # movq    %rsp/*t085*/, %rsp/*t084*/
   imulq   %rsp/*t010*/, %rsp/*t084*/
   # movq    %rsp/*t084*/, %rsp/*t083*/
   addq    %rsp/*t019*/, %rsp/*t083*/
   movq    (%rsp/*t083*/), %rsp/*t082*/
   # movq    %rsp/*t082*/, %rsp/*t011*/
   # movq    %rsp/*t009*/, %rsp/*t086*/
   movq    $1, %rsp/*t087*/
   subq    %rsp/*t087*/, %rsp/*t086*/
   # movq    %rsp/*t086*/, %rsp/*t012*/
   # movq    %rsp/*t010*/, %rsp/*t013*/
   movq    $1, %rsp/*t088*/
   # movq    %rsp/*t088*/, %rsp/*t016*/
   xorq    %rsp/*t089*/, %rsp/*t089*/
   cmpq    %rsp/*t089*/, %rsp/*t016*/
   je      _loopend_8
_loopbody_9:
   movq    $1, %rsp/*t090*/
   # movq    %rsp/*t090*/, %rsp/*t017*/
   xorq    %rsp/*t091*/, %rsp/*t091*/
   cmpq    %rsp/*t091*/, %rsp/*t017*/
   je      _loopend_11
_loopbody_12:
   movq    $1, %rsp/*t093*/
   # movq    %rsp/*t093*/, %rsp/*t092*/
   addq    %rsp/*t012*/, %rsp/*t092*/
   # movq    %rsp/*t092*/, %rsp/*t012*/
   movq    (%rsp/*t008*/), %rsp/*t094*/
   # movq    %rsp/*t094*/, %rsp/*t020*/
   movq    $-8, %rsp/*t097*/
   # movq    %rsp/*t097*/, %rsp/*t096*/
   addq    %rsp/*t020*/, %rsp/*t096*/
   movq    (%rsp/*t096*/), %rsp/*t095*/
   cmpq    %rsp/*t095*/, %rsp/*t012*/
   jae     _boundsbad_7
_boundsok_14:
   movq    $8, %rsp/*t101*/
   # movq    %rsp/*t101*/, %rsp/*t100*/
   imulq   %rsp/*t012*/, %rsp/*t100*/
   # movq    %rsp/*t100*/, %rsp/*t099*/
   addq    %rsp/*t020*/, %rsp/*t099*/
   movq    (%rsp/*t099*/), %rsp/*t098*/
   # movq    %rsp/*t098*/, %rsp/*t018*/
   cmpq    %rsp/*t011*/, %rsp/*t018*/
   jge     _L_15
_L_16:
   movq    $1, %rsp/*t102*/
   # movq    %rsp/*t102*/, %rsp/*t017*/
_L_17:
_looptest_13:
   xorq    %rsp/*t103*/, %rsp/*t103*/
   cmpq    %rsp/*t103*/, %rsp/*t017*/
   jne     _loopbody_12
_loopend_11:
   movq    $1, %rsp/*t104*/
   # movq    %rsp/*t104*/, %rsp/*t017*/
   xorq    %rsp/*t105*/, %rsp/*t105*/
   cmpq    %rsp/*t105*/, %rsp/*t017*/
   je      _loopend_18
_loopbody_19:
   # movq    %rsp/*t013*/, %rsp/*t106*/
   movq    $1, %rsp/*t107*/
   subq    %rsp/*t107*/, %rsp/*t106*/
   # movq    %rsp/*t106*/, %rsp/*t013*/
   movq    (%rsp/*t008*/), %rsp/*t108*/
   # movq    %rsp/*t108*/, %rsp/*t021*/
   movq    $-8, %rsp/*t111*/
   # movq    %rsp/*t111*/, %rsp/*t110*/
   addq    %rsp/*t021*/, %rsp/*t110*/
   movq    (%rsp/*t110*/), %rsp/*t109*/
   cmpq    %rsp/*t109*/, %rsp/*t013*/
   jae     _boundsbad_7
_boundsok_21:
   movq    $8, %rsp/*t115*/
   # movq    %rsp/*t115*/, %rsp/*t114*/
   imulq   %rsp/*t013*/, %rsp/*t114*/
   # movq    %rsp/*t114*/, %rsp/*t113*/
   addq    %rsp/*t021*/, %rsp/*t113*/
   movq    (%rsp/*t113*/), %rsp/*t112*/
   # movq    %rsp/*t112*/, %rsp/*t018*/
   cmpq    %rsp/*t018*/, %rsp/*t011*/
   jge     _L_22
_L_23:
   movq    $1, %rsp/*t116*/
   # movq    %rsp/*t116*/, %rsp/*t017*/
_L_24:
_looptest_20:
   xorq    %rsp/*t117*/, %rsp/*t117*/
   cmpq    %rsp/*t117*/, %rsp/*t017*/
   jne     _loopbody_19
_loopend_18:
   movq    (%rsp/*t008*/), %rsp/*t118*/
   # movq    %rsp/*t118*/, %rsp/*t022*/
   movq    $-8, %rsp/*t121*/
   # movq    %rsp/*t121*/, %rsp/*t120*/
   addq    %rsp/*t022*/, %rsp/*t120*/
   movq    (%rsp/*t120*/), %rsp/*t119*/
   cmpq    %rsp/*t119*/, %rsp/*t012*/
   jae     _boundsbad_7
_boundsok_25:
   movq    $8, %rsp/*t125*/
   # movq    %rsp/*t125*/, %rsp/*t124*/
   imulq   %rsp/*t012*/, %rsp/*t124*/
   # movq    %rsp/*t124*/, %rsp/*t123*/
   addq    %rsp/*t022*/, %rsp/*t123*/
   movq    (%rsp/*t123*/), %rsp/*t122*/
   # movq    %rsp/*t122*/, %rsp/*t015*/
   movq    (%rsp/*t008*/), %rsp/*t126*/
   # movq    %rsp/*t126*/, %rsp/*t024*/
   movq    $-8, %rsp/*t129*/
   # movq    %rsp/*t129*/, %rsp/*t128*/
   addq    %rsp/*t024*/, %rsp/*t128*/
   movq    (%rsp/*t128*/), %rsp/*t127*/
   cmpq    %rsp/*t127*/, %rsp/*t012*/
   jae     _boundsbad_7
_boundsok_27:
   movq    (%rsp/*t008*/), %rsp/*t130*/
   # movq    %rsp/*t130*/, %rsp/*t023*/
   movq    $-8, %rsp/*t133*/
   # movq    %rsp/*t133*/, %rsp/*t132*/
   addq    %rsp/*t023*/, %rsp/*t132*/
   movq    (%rsp/*t132*/), %rsp/*t131*/
   cmpq    %rsp/*t131*/, %rsp/*t013*/
   jae     _boundsbad_7
_boundsok_26:
   movq    $8, %rsp/*t137*/
   # movq    %rsp/*t137*/, %rsp/*t136*/
   imulq   %rsp/*t013*/, %rsp/*t136*/
   # movq    %rsp/*t136*/, %rsp/*t135*/
   addq    %rsp/*t023*/, %rsp/*t135*/
   movq    (%rsp/*t135*/), %rsp/*t134*/
   # movq    %rsp/*t134*/, %rsp/*t025*/
   movq    $8, %rsp/*t140*/
   # movq    %rsp/*t140*/, %rsp/*t139*/
   imulq   %rsp/*t012*/, %rsp/*t139*/
   # movq    %rsp/*t139*/, %rsp/*t138*/
   addq    %rsp/*t024*/, %rsp/*t138*/
   movq    %rsp/*t025*/, (%rsp/*t138*/)
   movq    (%rsp/*t008*/), %rsp/*t141*/
   # movq    %rsp/*t141*/, %rsp/*t026*/
   movq    $-8, %rsp/*t144*/
   # movq    %rsp/*t144*/, %rsp/*t143*/
   addq    %rsp/*t026*/, %rsp/*t143*/
   movq    (%rsp/*t143*/), %rsp/*t142*/
   cmpq    %rsp/*t142*/, %rsp/*t013*/
   jae     _boundsbad_7
_boundsok_28:
   movq    $8, %rsp/*t147*/
   # movq    %rsp/*t147*/, %rsp/*t146*/
   imulq   %rsp/*t013*/, %rsp/*t146*/
   # movq    %rsp/*t146*/, %rsp/*t145*/
   addq    %rsp/*t026*/, %rsp/*t145*/
   movq    %rsp/*t015*/, (%rsp/*t145*/)
   movq    $1, %rsp/*t149*/
   # movq    %rsp/*t149*/, %rsp/*t148*/
   addq    %rsp/*t012*/, %rsp/*t148*/
   cmpq    %rsp/*t148*/, %rsp/*t013*/
   jge     _L_30
_L_29:
   xorq    %rsp/*t150*/, %rsp/*t150*/
   # movq    %rsp/*t150*/, %rsp/*t016*/
_L_31:
_looptest_10:
   xorq    %rsp/*t151*/, %rsp/*t151*/
   cmpq    %rsp/*t151*/, %rsp/*t016*/
   jne     _loopbody_9
_loopend_8:
   movq    (%rsp/*t008*/), %rsp/*t152*/
   # movq    %rsp/*t152*/, %rsp/*t028*/
   movq    $-8, %rsp/*t155*/
   # movq    %rsp/*t155*/, %rsp/*t154*/
   addq    %rsp/*t028*/, %rsp/*t154*/
   movq    (%rsp/*t154*/), %rsp/*t153*/
   cmpq    %rsp/*t153*/, %rsp/*t013*/
   jae     _boundsbad_7
_boundsok_33:
   movq    (%rsp/*t008*/), %rsp/*t156*/
   # movq    %rsp/*t156*/, %rsp/*t027*/
   movq    $-8, %rsp/*t159*/
   # movq    %rsp/*t159*/, %rsp/*t158*/
   addq    %rsp/*t027*/, %rsp/*t158*/
   movq    (%rsp/*t158*/), %rsp/*t157*/
   cmpq    %rsp/*t157*/, %rsp/*t012*/
   jae     _boundsbad_7
_boundsok_32:
   movq    $8, %rsp/*t163*/
   # movq    %rsp/*t163*/, %rsp/*t162*/
   imulq   %rsp/*t012*/, %rsp/*t162*/
   # movq    %rsp/*t162*/, %rsp/*t161*/
   addq    %rsp/*t027*/, %rsp/*t161*/
   movq    (%rsp/*t161*/), %rsp/*t160*/
   # movq    %rsp/*t160*/, %rsp/*t029*/
   movq    $8, %rsp/*t166*/
   # movq    %rsp/*t166*/, %rsp/*t165*/
   imulq   %rsp/*t013*/, %rsp/*t165*/
   # movq    %rsp/*t165*/, %rsp/*t164*/
   addq    %rsp/*t028*/, %rsp/*t164*/
   movq    %rsp/*t029*/, (%rsp/*t164*/)
   movq    (%rsp/*t008*/), %rsp/*t167*/
   # movq    %rsp/*t167*/, %rsp/*t031*/
   movq    $-8, %rsp/*t170*/
   # movq    %rsp/*t170*/, %rsp/*t169*/
   addq    %rsp/*t031*/, %rsp/*t169*/
   movq    (%rsp/*t169*/), %rsp/*t168*/
   cmpq    %rsp/*t168*/, %rsp/*t012*/
   jae     _boundsbad_7
_boundsok_35:
   movq    (%rsp/*t008*/), %rsp/*t171*/
   # movq    %rsp/*t171*/, %rsp/*t030*/
   movq    $-8, %rsp/*t174*/
   # movq    %rsp/*t174*/, %rsp/*t173*/
   addq    %rsp/*t030*/, %rsp/*t173*/
   movq    (%rsp/*t173*/), %rsp/*t172*/
   cmpq    %rsp/*t172*/, %rsp/*t010*/
   jae     _boundsbad_7
_boundsok_34:
   movq    $8, %rsp/*t178*/
   # movq    %rsp/*t178*/, %rsp/*t177*/
   imulq   %rsp/*t010*/, %rsp/*t177*/
   # movq    %rsp/*t177*/, %rsp/*t176*/
   addq    %rsp/*t030*/, %rsp/*t176*/
   movq    (%rsp/*t176*/), %rsp/*t175*/
   # movq    %rsp/*t175*/, %rsp/*t032*/
   movq    $8, %rsp/*t181*/
   # movq    %rsp/*t181*/, %rsp/*t180*/
   imulq   %rsp/*t012*/, %rsp/*t180*/
   # movq    %rsp/*t180*/, %rsp/*t179*/
   addq    %rsp/*t031*/, %rsp/*t179*/
   movq    %rsp/*t032*/, (%rsp/*t179*/)
   movq    (%rsp/*t008*/), %rsp/*t182*/
   # movq    %rsp/*t182*/, %rsp/*t033*/
   movq    $-8, %rsp/*t185*/
   # movq    %rsp/*t185*/, %rsp/*t184*/
   addq    %rsp/*t033*/, %rsp/*t184*/
   movq    (%rsp/*t184*/), %rsp/*t183*/
   cmpq    %rsp/*t183*/, %rsp/*t010*/
   jae     _boundsbad_7
_boundsok_36:
   movq    $8, %rsp/*t188*/
   # movq    %rsp/*t188*/, %rsp/*t187*/
   imulq   %rsp/*t010*/, %rsp/*t187*/
   # movq    %rsp/*t187*/, %rsp/*t186*/
   addq    %rsp/*t033*/, %rsp/*t186*/
   movq    %rsp/*t015*/, (%rsp/*t186*/)
   # movq    %rsp/*t012*/, %rsp/*t189*/
   movq    $1, %rsp/*t190*/
   subq    %rsp/*t190*/, %rsp/*t189*/
   movq    %rsp/*t189*/, %rdx
   movq    %rsp/*t009*/, %rsi
   movq    %rsp/*t008*/, %rdi
   call    _QS_Sort
   movq    %rax, %rsp/*t014*/
   movq    %rsp/*t010*/, %rdx
   movq    $1, %rsp/*t192*/
   # movq    %rsp/*t192*/, %rsp/*t191*/
   addq    %rsp/*t012*/, %rsp/*t191*/
   movq    %rsp/*t191*/, %rsi
   movq    %rsp/*t008*/, %rdi
   call    _QS_Sort
   movq    %rax, %rsp/*t014*/
_L_5:
   xorq    %rsp/*t193*/, %rsp/*t193*/
   movq    %rsp/*t193*/, %rax
_bail_2:
   movq    %rsp/*t034*/, %rbx
   movq    %rsp/*t035*/, %r12
   movq    %rsp/*t036*/, %r13
   movq    %rsp/*t037*/, %r14
   movq    %rsp/*t038*/, %r15
   jmp     _DONE_59
_boundsbad_7:
   movq    $1, %rsp/*t194*/
   movq    %rsp/*t194*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_2
_L_15:
   xorq    %rsp/*t195*/, %rsp/*t195*/
   # movq    %rsp/*t195*/, %rsp/*t017*/
   jmp     _L_17
_L_22:
   xorq    %rsp/*t196*/, %rsp/*t196*/
   # movq    %rsp/*t196*/, %rsp/*t017*/
   jmp     _L_24
_L_30:
   movq    $1, %rsp/*t197*/
   # movq    %rsp/*t197*/, %rsp/*t016*/
   jmp     _L_31
_L_4:
   xorq    %rsp/*t198*/, %rsp/*t198*/
   # movq    %rsp/*t198*/, %rsp/*t014*/
   jmp     _L_5
_DONE_59:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _QS_Print
_QS_Print:
   subq   $8, %rsp
_L_60:
   movq    %rbx, %rsp/*t042*/
   movq    %r12, %rsp/*t043*/
   movq    %r13, %rsp/*t044*/
   movq    %r14, %rsp/*t045*/
   movq    %r15, %rsp/*t046*/
   movq    %rdi, %rsp/*t039*/
   xorq    %rsp/*t199*/, %rsp/*t199*/
   # movq    %rsp/*t199*/, %rsp/*t040*/
   movq    $8, %rsp/*t202*/
   # movq    %rsp/*t202*/, %rsp/*t201*/
   addq    %rsp/*t039*/, %rsp/*t201*/
   movq    (%rsp/*t201*/), %rsp/*t200*/
   cmpq    %rsp/*t200*/, %rsp/*t040*/
   jge     _loopend_38
_loopbody_39:
   movq    (%rsp/*t039*/), %rsp/*t203*/
   # movq    %rsp/*t203*/, %rsp/*t041*/
   movq    $-8, %rsp/*t206*/
   # movq    %rsp/*t206*/, %rsp/*t205*/
   addq    %rsp/*t041*/, %rsp/*t205*/
   movq    (%rsp/*t205*/), %rsp/*t204*/
   cmpq    %rsp/*t204*/, %rsp/*t040*/
   jae     _boundsbad_42
_boundsok_41:
   movq    $8, %rsp/*t210*/
   # movq    %rsp/*t210*/, %rsp/*t209*/
   imulq   %rsp/*t040*/, %rsp/*t209*/
   # movq    %rsp/*t209*/, %rsp/*t208*/
   addq    %rsp/*t041*/, %rsp/*t208*/
   movq    (%rsp/*t208*/), %rsp/*t207*/
   movq    %rsp/*t207*/, %rdi
   call    _cs411println
   movq    $1, %rsp/*t212*/
   # movq    %rsp/*t212*/, %rsp/*t211*/
   addq    %rsp/*t040*/, %rsp/*t211*/
   # movq    %rsp/*t211*/, %rsp/*t040*/
_looptest_40:
   movq    $8, %rsp/*t215*/
   # movq    %rsp/*t215*/, %rsp/*t214*/
   addq    %rsp/*t039*/, %rsp/*t214*/
   movq    (%rsp/*t214*/), %rsp/*t213*/
   cmpq    %rsp/*t213*/, %rsp/*t040*/
   jl      _loopbody_39
_loopend_38:
   xorq    %rsp/*t216*/, %rsp/*t216*/
   movq    %rsp/*t216*/, %rax
_bail_37:
   movq    %rsp/*t042*/, %rbx
   movq    %rsp/*t043*/, %r12
   movq    %rsp/*t044*/, %r13
   movq    %rsp/*t045*/, %r14
   movq    %rsp/*t046*/, %r15
   jmp     _DONE_61
_boundsbad_42:
   movq    $1, %rsp/*t217*/
   movq    %rsp/*t217*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_37
_DONE_61:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _QS_Init
_QS_Init:
   subq   $8, %rsp
_L_62:
   movq    %rbx, %rsp/*t059*/
   movq    %r12, %rsp/*t060*/
   movq    %r13, %rsp/*t061*/
   movq    %r14, %rsp/*t062*/
   movq    %r15, %rsp/*t063*/
   movq    %rdi, %rsp/*t047*/
   movq    %rsi, %rsp/*t048*/
   movq    $8, %rsp/*t221*/
   # movq    %rsp/*t221*/, %rsp/*t220*/
   addq    %rsp/*t047*/, %rsp/*t220*/
   movq    %rsp/*t048*/, (%rsp/*t220*/)
   # movq    %rsp/*t047*/, %rsp/*t219*/
   movq    %rsp/*t048*/, %rdi
   call    _cs411newarray
   movq    %rax, %rsp/*t218*/
   movq    %rsp/*t218*/, (%rsp/*t219*/)
   movq    (%rsp/*t047*/), %rsp/*t222*/
   # movq    %rsp/*t222*/, %rsp/*t049*/
   xorq    %rsp/*t223*/, %rsp/*t223*/
   movq    $-8, %rsp/*t226*/
   # movq    %rsp/*t226*/, %rsp/*t225*/
   addq    %rsp/*t049*/, %rsp/*t225*/
   movq    (%rsp/*t225*/), %rsp/*t224*/
   cmpq    %rsp/*t224*/, %rsp/*t223*/
   jae     _boundsbad_45
_boundsok_44:
   movq    $20, %rsp/*t227*/
   movq    %rsp/*t227*/, (%rsp/*t049*/)
   movq    (%rsp/*t047*/), %rsp/*t228*/
   # movq    %rsp/*t228*/, %rsp/*t050*/
   movq    $1, %rsp/*t229*/
   movq    $-8, %rsp/*t232*/
   # movq    %rsp/*t232*/, %rsp/*t231*/
   addq    %rsp/*t050*/, %rsp/*t231*/
   movq    (%rsp/*t231*/), %rsp/*t230*/
   cmpq    %rsp/*t230*/, %rsp/*t229*/
   jae     _boundsbad_45
_boundsok_46:
   movq    $8, %rsp/*t234*/
   # movq    %rsp/*t234*/, %rsp/*t233*/
   addq    %rsp/*t050*/, %rsp/*t233*/
   movq    $7, %rsp/*t235*/
   movq    %rsp/*t235*/, (%rsp/*t233*/)
   movq    (%rsp/*t047*/), %rsp/*t236*/
   # movq    %rsp/*t236*/, %rsp/*t051*/
   movq    $2, %rsp/*t237*/
   movq    $-8, %rsp/*t240*/
   # movq    %rsp/*t240*/, %rsp/*t239*/
   addq    %rsp/*t051*/, %rsp/*t239*/
   movq    (%rsp/*t239*/), %rsp/*t238*/
   cmpq    %rsp/*t238*/, %rsp/*t237*/
   jae     _boundsbad_45
_boundsok_47:
   movq    $16, %rsp/*t242*/
   # movq    %rsp/*t242*/, %rsp/*t241*/
   addq    %rsp/*t051*/, %rsp/*t241*/
   movq    $12, %rsp/*t243*/
   movq    %rsp/*t243*/, (%rsp/*t241*/)
   movq    (%rsp/*t047*/), %rsp/*t244*/
   # movq    %rsp/*t244*/, %rsp/*t052*/
   movq    $3, %rsp/*t245*/
   movq    $-8, %rsp/*t248*/
   # movq    %rsp/*t248*/, %rsp/*t247*/
   addq    %rsp/*t052*/, %rsp/*t247*/
   movq    (%rsp/*t247*/), %rsp/*t246*/
   cmpq    %rsp/*t246*/, %rsp/*t245*/
   jae     _boundsbad_45
_boundsok_48:
   movq    $24, %rsp/*t250*/
   # movq    %rsp/*t250*/, %rsp/*t249*/
   addq    %rsp/*t052*/, %rsp/*t249*/
   movq    $18, %rsp/*t251*/
   movq    %rsp/*t251*/, (%rsp/*t249*/)
   movq    (%rsp/*t047*/), %rsp/*t252*/
   # movq    %rsp/*t252*/, %rsp/*t053*/
   movq    $4, %rsp/*t253*/
   movq    $-8, %rsp/*t256*/
   # movq    %rsp/*t256*/, %rsp/*t255*/
   addq    %rsp/*t053*/, %rsp/*t255*/
   movq    (%rsp/*t255*/), %rsp/*t254*/
   cmpq    %rsp/*t254*/, %rsp/*t253*/
   jae     _boundsbad_45
_boundsok_49:
   movq    $32, %rsp/*t258*/
   # movq    %rsp/*t258*/, %rsp/*t257*/
   addq    %rsp/*t053*/, %rsp/*t257*/
   movq    $2, %rsp/*t259*/
   movq    %rsp/*t259*/, (%rsp/*t257*/)
   movq    (%rsp/*t047*/), %rsp/*t260*/
   # movq    %rsp/*t260*/, %rsp/*t054*/
   movq    $5, %rsp/*t261*/
   movq    $-8, %rsp/*t264*/
   # movq    %rsp/*t264*/, %rsp/*t263*/
   addq    %rsp/*t054*/, %rsp/*t263*/
   movq    (%rsp/*t263*/), %rsp/*t262*/
   cmpq    %rsp/*t262*/, %rsp/*t261*/
   jae     _boundsbad_45
_boundsok_50:
   movq    $40, %rsp/*t266*/
   # movq    %rsp/*t266*/, %rsp/*t265*/
   addq    %rsp/*t054*/, %rsp/*t265*/
   movq    $11, %rsp/*t267*/
   movq    %rsp/*t267*/, (%rsp/*t265*/)
   movq    (%rsp/*t047*/), %rsp/*t268*/
   # movq    %rsp/*t268*/, %rsp/*t055*/
   movq    $6, %rsp/*t269*/
   movq    $-8, %rsp/*t272*/
   # movq    %rsp/*t272*/, %rsp/*t271*/
   addq    %rsp/*t055*/, %rsp/*t271*/
   movq    (%rsp/*t271*/), %rsp/*t270*/
   cmpq    %rsp/*t270*/, %rsp/*t269*/
   jae     _boundsbad_45
_boundsok_51:
   movq    $48, %rsp/*t274*/
   # movq    %rsp/*t274*/, %rsp/*t273*/
   addq    %rsp/*t055*/, %rsp/*t273*/
   movq    $6, %rsp/*t275*/
   movq    %rsp/*t275*/, (%rsp/*t273*/)
   movq    (%rsp/*t047*/), %rsp/*t276*/
   # movq    %rsp/*t276*/, %rsp/*t056*/
   movq    $7, %rsp/*t277*/
   movq    $-8, %rsp/*t280*/
   # movq    %rsp/*t280*/, %rsp/*t279*/
   addq    %rsp/*t056*/, %rsp/*t279*/
   movq    (%rsp/*t279*/), %rsp/*t278*/
   cmpq    %rsp/*t278*/, %rsp/*t277*/
   jae     _boundsbad_45
_boundsok_52:
   movq    $56, %rsp/*t282*/
   # movq    %rsp/*t282*/, %rsp/*t281*/
   addq    %rsp/*t056*/, %rsp/*t281*/
   movq    $9, %rsp/*t283*/
   movq    %rsp/*t283*/, (%rsp/*t281*/)
   movq    (%rsp/*t047*/), %rsp/*t284*/
   # movq    %rsp/*t284*/, %rsp/*t057*/
   movq    $8, %rsp/*t285*/
   movq    $-8, %rsp/*t288*/
   # movq    %rsp/*t288*/, %rsp/*t287*/
   addq    %rsp/*t057*/, %rsp/*t287*/
   movq    (%rsp/*t287*/), %rsp/*t286*/
   cmpq    %rsp/*t286*/, %rsp/*t285*/
   jae     _boundsbad_45
_boundsok_53:
   movq    $64, %rsp/*t290*/
   # movq    %rsp/*t290*/, %rsp/*t289*/
   addq    %rsp/*t057*/, %rsp/*t289*/
   movq    $19, %rsp/*t291*/
   movq    %rsp/*t291*/, (%rsp/*t289*/)
   movq    (%rsp/*t047*/), %rsp/*t292*/
   # movq    %rsp/*t292*/, %rsp/*t058*/
   movq    $9, %rsp/*t293*/
   movq    $-8, %rsp/*t296*/
   # movq    %rsp/*t296*/, %rsp/*t295*/
   addq    %rsp/*t058*/, %rsp/*t295*/
   movq    (%rsp/*t295*/), %rsp/*t294*/
   cmpq    %rsp/*t294*/, %rsp/*t293*/
   jae     _boundsbad_45
_boundsok_54:
   movq    $72, %rsp/*t298*/
   # movq    %rsp/*t298*/, %rsp/*t297*/
   addq    %rsp/*t058*/, %rsp/*t297*/
   movq    $5, %rsp/*t299*/
   movq    %rsp/*t299*/, (%rsp/*t297*/)
   xorq    %rsp/*t300*/, %rsp/*t300*/
   movq    %rsp/*t300*/, %rax
_bail_43:
   movq    %rsp/*t059*/, %rbx
   movq    %rsp/*t060*/, %r12
   movq    %rsp/*t061*/, %r13
   movq    %rsp/*t062*/, %r14
   movq    %rsp/*t063*/, %r15
   jmp     _DONE_63
_boundsbad_45:
   movq    $1, %rsp/*t301*/
   movq    %rsp/*t301*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_43
_DONE_63:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_64:
   movq    %rbx, %rsp/*t064*/
   movq    %r12, %rsp/*t065*/
   movq    %r13, %rsp/*t066*/
   movq    %r14, %rsp/*t067*/
   movq    %r15, %rsp/*t068*/
   movq    $16, %rsp/*t304*/
   movq    %rsp/*t304*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t303*/
   movq    $10, %rsp/*t305*/
   movq    %rsp/*t305*/, %rsi
   movq    %rsp/*t303*/, %rdi
   call    _QS_Start
   movq    %rax, %rsp/*t302*/
   movq    %rsp/*t302*/, %rdi
   call    _cs411println
_bail_55:
   movq    %rsp/*t064*/, %rbx
   movq    %rsp/*t065*/, %r12
   movq    %rsp/*t066*/, %r13
   movq    %rsp/*t067*/, %r14
   movq    %rsp/*t068*/, %r15
_DONE_65:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
