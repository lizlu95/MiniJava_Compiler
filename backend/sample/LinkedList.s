.text
.globl _Element_Init
_Element_Init:
_L_63:
   movq    %rbx, %rsp/*t004*/
   movq    %r12, %rsp/*t005*/
   movq    %r13, %rsp/*t006*/
   movq    %r14, %rsp/*t007*/
   movq    %r15, %rsp/*t008*/
   movq    %rdi, %rsp/*t000*/
   movq    %rsi, %rsp/*t001*/
   movq    %rdx, %rsp/*t002*/
   movq    %rcx, %rsp/*t003*/
   movq    %rsp/*t001*/, (%rsp/*t000*/)
   movq    $8, %rsp/*t153*/
   # movq    %rsp/*t153*/, %rsp/*t152*/
   addq    %rsp/*t000*/, %rsp/*t152*/
   movq    %rsp/*t002*/, (%rsp/*t152*/)
   movq    $16, %rsp/*t155*/
   # movq    %rsp/*t155*/, %rsp/*t154*/
   addq    %rsp/*t000*/, %rsp/*t154*/
   movq    %rsp/*t003*/, (%rsp/*t154*/)
   movq    $1, %rsp/*t156*/
   movq    %rsp/*t156*/, %rax
_bail_1:
   movq    %rsp/*t004*/, %rbx
   movq    %rsp/*t005*/, %r12
   movq    %rsp/*t006*/, %r13
   movq    %rsp/*t007*/, %r14
   movq    %rsp/*t008*/, %r15
_DONE_64:
   # return sink
   ret

.text
.globl _Element_GetAge
_Element_GetAge:
_L_65:
   movq    %rbx, %rsp/*t010*/
   movq    %r12, %rsp/*t011*/
   movq    %r13, %rsp/*t012*/
   movq    %r14, %rsp/*t013*/
   movq    %r15, %rsp/*t014*/
   movq    %rdi, %rsp/*t009*/
   movq    (%rsp/*t009*/), %rsp/*t157*/
   movq    %rsp/*t157*/, %rax
_bail_2:
   movq    %rsp/*t010*/, %rbx
   movq    %rsp/*t011*/, %r12
   movq    %rsp/*t012*/, %r13
   movq    %rsp/*t013*/, %r14
   movq    %rsp/*t014*/, %r15
_DONE_66:
   # return sink
   ret

.text
.globl _Element_GetSalary
_Element_GetSalary:
_L_67:
   movq    %rbx, %rsp/*t016*/
   movq    %r12, %rsp/*t017*/
   movq    %r13, %rsp/*t018*/
   movq    %r14, %rsp/*t019*/
   movq    %r15, %rsp/*t020*/
   movq    %rdi, %rsp/*t015*/
   movq    $8, %rsp/*t160*/
   # movq    %rsp/*t160*/, %rsp/*t159*/
   addq    %rsp/*t015*/, %rsp/*t159*/
   movq    (%rsp/*t159*/), %rsp/*t158*/
   movq    %rsp/*t158*/, %rax
_bail_3:
   movq    %rsp/*t016*/, %rbx
   movq    %rsp/*t017*/, %r12
   movq    %rsp/*t018*/, %r13
   movq    %rsp/*t019*/, %r14
   movq    %rsp/*t020*/, %r15
_DONE_68:
   # return sink
   ret

.text
.globl _Element_GetMarried
_Element_GetMarried:
_L_69:
   movq    %rbx, %rsp/*t022*/
   movq    %r12, %rsp/*t023*/
   movq    %r13, %rsp/*t024*/
   movq    %r14, %rsp/*t025*/
   movq    %r15, %rsp/*t026*/
   movq    %rdi, %rsp/*t021*/
   movq    $16, %rsp/*t163*/
   # movq    %rsp/*t163*/, %rsp/*t162*/
   addq    %rsp/*t021*/, %rsp/*t162*/
   movq    (%rsp/*t162*/), %rsp/*t161*/
   movq    %rsp/*t161*/, %rax
_bail_4:
   movq    %rsp/*t022*/, %rbx
   movq    %rsp/*t023*/, %r12
   movq    %rsp/*t024*/, %r13
   movq    %rsp/*t025*/, %r14
   movq    %rsp/*t026*/, %r15
_DONE_70:
   # return sink
   ret

.text
.globl _Element_Equal
_Element_Equal:
   subq   $8, %rsp
_L_71:
   movq    %rbx, %rsp/*t033*/
   movq    %r12, %rsp/*t034*/
   movq    %r13, %rsp/*t035*/
   movq    %r14, %rsp/*t036*/
   movq    %r15, %rsp/*t037*/
   movq    %rdi, %rsp/*t027*/
   movq    %rsi, %rsp/*t028*/
   movq    $1, %rsp/*t168*/
   # movq    %rsp/*t168*/, %rsp/*t029*/
   movq    %rsp/*t028*/, %rdi
   call    _Element_GetAge
   movq    %rax, %rsp/*t030*/
   movq    (%rsp/*t027*/), %rsp/*t169*/
   movq    %rsp/*t169*/, %rdx
   movq    %rsp/*t030*/, %rsi
   movq    %rsp/*t027*/, %rdi
   call    _Element_Compare
   movq    %rax, %rsp/*t164*/
   xorq    %rsp/*t170*/, %rsp/*t170*/
   cmpq    %rsp/*t170*/, %rsp/*t164*/
   je      _L_6
_L_7:
   movq    %rsp/*t028*/, %rdi
   call    _Element_GetSalary
   movq    %rax, %rsp/*t031*/
   movq    $8, %rsp/*t173*/
   # movq    %rsp/*t173*/, %rsp/*t172*/
   addq    %rsp/*t027*/, %rsp/*t172*/
   movq    (%rsp/*t172*/), %rsp/*t171*/
   movq    %rsp/*t171*/, %rdx
   movq    %rsp/*t031*/, %rsi
   movq    %rsp/*t027*/, %rdi
   call    _Element_Compare
   movq    %rax, %rsp/*t165*/
   xorq    %rsp/*t174*/, %rsp/*t174*/
   cmpq    %rsp/*t174*/, %rsp/*t165*/
   je      _L_9
_L_10:
   movq    $16, %rsp/*t177*/
   # movq    %rsp/*t177*/, %rsp/*t176*/
   addq    %rsp/*t027*/, %rsp/*t176*/
   movq    (%rsp/*t176*/), %rsp/*t175*/
   xorq    %rsp/*t178*/, %rsp/*t178*/
   cmpq    %rsp/*t178*/, %rsp/*t175*/
   je      _L_13
_L_12:
   movq    %rsp/*t028*/, %rdi
   call    _Element_GetMarried
   movq    %rax, %rsp/*t166*/
   xorq    %rsp/*t179*/, %rsp/*t179*/
   cmpq    %rsp/*t179*/, %rsp/*t166*/
   je      _L_15
_L_16:
   xorq    %rsp/*t180*/, %rsp/*t180*/
   # movq    %rsp/*t180*/, %rsp/*t032*/
_L_17:
_L_14:
_L_11:
_L_8:
   movq    %rsp/*t029*/, %rax
_bail_5:
   movq    %rsp/*t033*/, %rbx
   movq    %rsp/*t034*/, %r12
   movq    %rsp/*t035*/, %r13
   movq    %rsp/*t036*/, %r14
   movq    %rsp/*t037*/, %r15
   jmp     _DONE_72
_L_6:
   xorq    %rsp/*t181*/, %rsp/*t181*/
   # movq    %rsp/*t181*/, %rsp/*t029*/
   jmp     _L_8
_L_9:
   xorq    %rsp/*t182*/, %rsp/*t182*/
   # movq    %rsp/*t182*/, %rsp/*t029*/
   jmp     _L_11
_L_15:
   xorq    %rsp/*t183*/, %rsp/*t183*/
   # movq    %rsp/*t183*/, %rsp/*t029*/
   jmp     _L_17
_L_13:
   movq    %rsp/*t028*/, %rdi
   call    _Element_GetMarried
   movq    %rax, %rsp/*t167*/
   xorq    %rsp/*t184*/, %rsp/*t184*/
   cmpq    %rsp/*t184*/, %rsp/*t167*/
   je      _L_19
_L_18:
   xorq    %rsp/*t185*/, %rsp/*t185*/
   # movq    %rsp/*t185*/, %rsp/*t029*/
_L_20:
   jmp     _L_14
_L_19:
   xorq    %rsp/*t186*/, %rsp/*t186*/
   # movq    %rsp/*t186*/, %rsp/*t032*/
   jmp     _L_20
_DONE_72:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Element_Compare
_Element_Compare:
_L_73:
   movq    %rbx, %rsp/*t043*/
   movq    %r12, %rsp/*t044*/
   movq    %r13, %rsp/*t045*/
   movq    %r14, %rsp/*t046*/
   movq    %r15, %rsp/*t047*/
   movq    %rdi, %rsp/*t038*/
   movq    %rsi, %rsp/*t039*/
   movq    %rdx, %rsp/*t040*/
   xorq    %rsp/*t187*/, %rsp/*t187*/
   # movq    %rsp/*t187*/, %rsp/*t041*/
   movq    $1, %rsp/*t189*/
   # movq    %rsp/*t189*/, %rsp/*t188*/
   addq    %rsp/*t040*/, %rsp/*t188*/
   # movq    %rsp/*t188*/, %rsp/*t042*/
   cmpq    %rsp/*t040*/, %rsp/*t039*/
   jge     _L_23
_L_22:
   xorq    %rsp/*t190*/, %rsp/*t190*/
   # movq    %rsp/*t190*/, %rsp/*t041*/
_L_24:
   movq    %rsp/*t041*/, %rax
_bail_21:
   movq    %rsp/*t043*/, %rbx
   movq    %rsp/*t044*/, %r12
   movq    %rsp/*t045*/, %r13
   movq    %rsp/*t046*/, %r14
   movq    %rsp/*t047*/, %r15
   jmp     _DONE_74
_L_23:
   cmpq    %rsp/*t042*/, %rsp/*t039*/
   jge     _L_25
_L_26:
   movq    $1, %rsp/*t191*/
   # movq    %rsp/*t191*/, %rsp/*t041*/
_L_27:
   jmp     _L_24
_L_25:
   xorq    %rsp/*t192*/, %rsp/*t192*/
   # movq    %rsp/*t192*/, %rsp/*t041*/
   jmp     _L_27
_DONE_74:
   # return sink
   ret

.text
.globl _List_Init
_List_Init:
_L_75:
   movq    %rbx, %rsp/*t049*/
   movq    %r12, %rsp/*t050*/
   movq    %r13, %rsp/*t051*/
   movq    %r14, %rsp/*t052*/
   movq    %r15, %rsp/*t053*/
   movq    %rdi, %rsp/*t048*/
   movq    $16, %rsp/*t194*/
   # movq    %rsp/*t194*/, %rsp/*t193*/
   addq    %rsp/*t048*/, %rsp/*t193*/
   movq    $1, %rsp/*t195*/
   movq    %rsp/*t195*/, (%rsp/*t193*/)
   movq    $1, %rsp/*t196*/
   movq    %rsp/*t196*/, %rax
_bail_28:
   movq    %rsp/*t049*/, %rbx
   movq    %rsp/*t050*/, %r12
   movq    %rsp/*t051*/, %r13
   movq    %rsp/*t052*/, %r14
   movq    %rsp/*t053*/, %r15
_DONE_76:
   # return sink
   ret

.text
.globl _List_InitNew
_List_InitNew:
_L_77:
   movq    %rbx, %rsp/*t058*/
   movq    %r12, %rsp/*t059*/
   movq    %r13, %rsp/*t060*/
   movq    %r14, %rsp/*t061*/
   movq    %r15, %rsp/*t062*/
   movq    %rdi, %rsp/*t054*/
   movq    %rsi, %rsp/*t055*/
   movq    %rdx, %rsp/*t056*/
   movq    %rcx, %rsp/*t057*/
   movq    $16, %rsp/*t198*/
   # movq    %rsp/*t198*/, %rsp/*t197*/
   addq    %rsp/*t054*/, %rsp/*t197*/
   movq    %rsp/*t057*/, (%rsp/*t197*/)
   movq    %rsp/*t055*/, (%rsp/*t054*/)
   movq    $8, %rsp/*t200*/
   # movq    %rsp/*t200*/, %rsp/*t199*/
   addq    %rsp/*t054*/, %rsp/*t199*/
   movq    %rsp/*t056*/, (%rsp/*t199*/)
   movq    $1, %rsp/*t201*/
   movq    %rsp/*t201*/, %rax
_bail_29:
   movq    %rsp/*t058*/, %rbx
   movq    %rsp/*t059*/, %r12
   movq    %rsp/*t060*/, %r13
   movq    %rsp/*t061*/, %r14
   movq    %rsp/*t062*/, %r15
_DONE_78:
   # return sink
   ret

.text
.globl _List_Insert
_List_Insert:
   subq   $8, %rsp
_L_79:
   movq    %rbx, %rsp/*t068*/
   movq    %r12, %rsp/*t069*/
   movq    %r13, %rsp/*t070*/
   movq    %r14, %rsp/*t071*/
   movq    %r15, %rsp/*t072*/
   movq    %rdi, %rsp/*t063*/
   movq    %rsi, %rsp/*t064*/
   xorq    %rsp/*t202*/, %rsp/*t202*/
   # movq    %rsp/*t202*/, %rsp/*t066*/
   xorq    %rsp/*t203*/, %rsp/*t203*/
   # movq    %rsp/*t203*/, %rsp/*t067*/
   # movq    %rsp/*t063*/, %rsp/*t066*/
   movq    $24, %rsp/*t204*/
   movq    %rsp/*t204*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t067*/
   xorq    %rsp/*t205*/, %rsp/*t205*/
   movq    %rsp/*t205*/, %rcx
   movq    %rsp/*t066*/, %rdx
   movq    %rsp/*t064*/, %rsi
   movq    %rsp/*t067*/, %rdi
   call    _List_InitNew
   movq    %rax, %rsp/*t065*/
   movq    %rsp/*t067*/, %rax
_bail_30:
   movq    %rsp/*t068*/, %rbx
   movq    %rsp/*t069*/, %r12
   movq    %rsp/*t070*/, %r13
   movq    %rsp/*t071*/, %r14
   movq    %rsp/*t072*/, %r15
_DONE_80:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _List_SetNext
_List_SetNext:
_L_81:
   movq    %rbx, %rsp/*t075*/
   movq    %r12, %rsp/*t076*/
   movq    %r13, %rsp/*t077*/
   movq    %r14, %rsp/*t078*/
   movq    %r15, %rsp/*t079*/
   movq    %rdi, %rsp/*t073*/
   movq    %rsi, %rsp/*t074*/
   movq    $8, %rsp/*t207*/
   # movq    %rsp/*t207*/, %rsp/*t206*/
   addq    %rsp/*t073*/, %rsp/*t206*/
   movq    %rsp/*t074*/, (%rsp/*t206*/)
   movq    $1, %rsp/*t208*/
   movq    %rsp/*t208*/, %rax
_bail_31:
   movq    %rsp/*t075*/, %rbx
   movq    %rsp/*t076*/, %r12
   movq    %rsp/*t077*/, %r13
   movq    %rsp/*t078*/, %r14
   movq    %rsp/*t079*/, %r15
_DONE_82:
   # return sink
   ret

.text
.globl _List_Delete
_List_Delete:
   subq   $8, %rsp
_L_83:
   movq    %rbx, %rsp/*t091*/
   movq    %r12, %rsp/*t092*/
   movq    %r13, %rsp/*t093*/
   movq    %r14, %rsp/*t094*/
   movq    %r15, %rsp/*t095*/
   movq    %rdi, %rsp/*t080*/
   movq    %rsi, %rsp/*t081*/
   xorq    %rsp/*t212*/, %rsp/*t212*/
   # movq    %rsp/*t212*/, %rsp/*t082*/
   xorq    %rsp/*t213*/, %rsp/*t213*/
   # movq    %rsp/*t213*/, %rsp/*t085*/
   xorq    %rsp/*t214*/, %rsp/*t214*/
   # movq    %rsp/*t214*/, %rsp/*t086*/
   xorq    %rsp/*t215*/, %rsp/*t215*/
   # movq    %rsp/*t215*/, %rsp/*t088*/
   # movq    %rsp/*t080*/, %rsp/*t082*/
   xorq    %rsp/*t216*/, %rsp/*t216*/
   # movq    %rsp/*t216*/, %rsp/*t083*/
   movq    $-1, %rsp/*t217*/
   # movq    %rsp/*t217*/, %rsp/*t089*/
   # movq    %rsp/*t080*/, %rsp/*t085*/
   # movq    %rsp/*t080*/, %rsp/*t086*/
   movq    $16, %rsp/*t220*/
   # movq    %rsp/*t220*/, %rsp/*t219*/
   addq    %rsp/*t080*/, %rsp/*t219*/
   movq    (%rsp/*t219*/), %rsp/*t218*/
   # movq    %rsp/*t218*/, %rsp/*t087*/
   movq    (%rsp/*t080*/), %rsp/*t221*/
   # movq    %rsp/*t221*/, %rsp/*t088*/
   xorq    %rsp/*t222*/, %rsp/*t222*/
   cmpq    %rsp/*t222*/, %rsp/*t087*/
   je      _L_36
_loopend_33:
   movq    %rsp/*t082*/, %rax
_bail_32:
   movq    %rsp/*t091*/, %rbx
   movq    %rsp/*t092*/, %r12
   movq    %rsp/*t093*/, %r13
   movq    %rsp/*t094*/, %r14
   movq    %rsp/*t095*/, %r15
   jmp     _DONE_84
_L_36:
   xorq    %rsp/*t223*/, %rsp/*t223*/
   cmpq    %rsp/*t223*/, %rsp/*t083*/
   jne     _loopend_33
_loopbody_34:
   movq    %rsp/*t088*/, %rsi
   movq    %rsp/*t081*/, %rdi
   call    _Element_Equal
   movq    %rax, %rsp/*t209*/
   xorq    %rsp/*t224*/, %rsp/*t224*/
   cmpq    %rsp/*t224*/, %rsp/*t209*/
   je      _L_38
_L_37:
   movq    $1, %rsp/*t225*/
   # movq    %rsp/*t225*/, %rsp/*t083*/
   xorq    %rsp/*t226*/, %rsp/*t226*/
   cmpq    %rsp/*t226*/, %rsp/*t089*/
   jge     _L_41
_L_40:
   movq    %rsp/*t085*/, %rdi
   call    _List_GetNext
   movq    %rax, %rsp/*t082*/
_L_42:
_L_39:
   xorq    %rsp/*t227*/, %rsp/*t227*/
   cmpq    %rsp/*t227*/, %rsp/*t083*/
   je      _L_43
_L_44:
   xorq    %rsp/*t228*/, %rsp/*t228*/
   # movq    %rsp/*t228*/, %rsp/*t090*/
_L_45:
_looptest_35:
   xorq    %rsp/*t229*/, %rsp/*t229*/
   cmpq    %rsp/*t229*/, %rsp/*t087*/
   jne     _loopend_33
_L_46:
   xorq    %rsp/*t230*/, %rsp/*t230*/
   cmpq    %rsp/*t230*/, %rsp/*t083*/
   jne     _loopend_33
_L_85:
   jmp     _loopbody_34
_L_41:
   movq    $-555, %rsp/*t231*/
   movq    %rsp/*t231*/, %rdi
   call    _cs411println
   # movq    %rsp/*t086*/, %rsp/*t211*/
   movq    %rsp/*t085*/, %rdi
   call    _List_GetNext
   movq    %rax, %rsp/*t210*/
   movq    %rsp/*t210*/, %rsi
   movq    %rsp/*t211*/, %rdi
   call    _List_SetNext
   movq    %rax, %rsp/*t084*/
   movq    $-555, %rsp/*t232*/
   movq    %rsp/*t232*/, %rdi
   call    _cs411println
   jmp     _L_42
_L_38:
   xorq    %rsp/*t233*/, %rsp/*t233*/
   # movq    %rsp/*t233*/, %rsp/*t090*/
   jmp     _L_39
_L_43:
   # movq    %rsp/*t085*/, %rsp/*t086*/
   movq    %rsp/*t085*/, %rdi
   call    _List_GetNext
   movq    %rax, %rsp/*t085*/
   movq    %rsp/*t085*/, %rdi
   call    _List_GetEnd
   movq    %rax, %rsp/*t087*/
   movq    %rsp/*t085*/, %rdi
   call    _List_GetElem
   movq    %rax, %rsp/*t088*/
   movq    $1, %rsp/*t234*/
   # movq    %rsp/*t234*/, %rsp/*t089*/
   jmp     _L_45
_DONE_84:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _List_Search
_List_Search:
   subq   $8, %rsp
_L_86:
   movq    %rbx, %rsp/*t103*/
   movq    %r12, %rsp/*t104*/
   movq    %r13, %rsp/*t105*/
   movq    %r14, %rsp/*t106*/
   movq    %r15, %rsp/*t107*/
   movq    %rdi, %rsp/*t096*/
   movq    %rsi, %rsp/*t097*/
   xorq    %rsp/*t236*/, %rsp/*t236*/
   # movq    %rsp/*t236*/, %rsp/*t099*/
   xorq    %rsp/*t237*/, %rsp/*t237*/
   # movq    %rsp/*t237*/, %rsp/*t100*/
   xorq    %rsp/*t238*/, %rsp/*t238*/
   # movq    %rsp/*t238*/, %rsp/*t098*/
   # movq    %rsp/*t096*/, %rsp/*t099*/
   movq    $16, %rsp/*t241*/
   # movq    %rsp/*t241*/, %rsp/*t240*/
   addq    %rsp/*t096*/, %rsp/*t240*/
   movq    (%rsp/*t240*/), %rsp/*t239*/
   # movq    %rsp/*t239*/, %rsp/*t101*/
   movq    (%rsp/*t096*/), %rsp/*t242*/
   # movq    %rsp/*t242*/, %rsp/*t100*/
   xorq    %rsp/*t243*/, %rsp/*t243*/
   cmpq    %rsp/*t243*/, %rsp/*t101*/
   je      _loopbody_49
_loopend_48:
   movq    %rsp/*t098*/, %rax
_bail_47:
   movq    %rsp/*t103*/, %rbx
   movq    %rsp/*t104*/, %r12
   movq    %rsp/*t105*/, %r13
   movq    %rsp/*t106*/, %r14
   movq    %rsp/*t107*/, %r15
   jmp     _DONE_87
_loopbody_49:
   movq    %rsp/*t100*/, %rsi
   movq    %rsp/*t097*/, %rdi
   call    _Element_Equal
   movq    %rax, %rsp/*t235*/
   xorq    %rsp/*t244*/, %rsp/*t244*/
   cmpq    %rsp/*t244*/, %rsp/*t235*/
   je      _L_52
_L_51:
   movq    $1, %rsp/*t245*/
   # movq    %rsp/*t245*/, %rsp/*t098*/
_L_53:
   movq    %rsp/*t099*/, %rdi
   call    _List_GetNext
   movq    %rax, %rsp/*t099*/
   movq    %rsp/*t099*/, %rdi
   call    _List_GetEnd
   movq    %rax, %rsp/*t101*/
   movq    %rsp/*t099*/, %rdi
   call    _List_GetElem
   movq    %rax, %rsp/*t100*/
_looptest_50:
   xorq    %rsp/*t246*/, %rsp/*t246*/
   cmpq    %rsp/*t246*/, %rsp/*t101*/
   jne     _loopend_48
_L_88:
   jmp     _loopbody_49
_L_52:
   xorq    %rsp/*t247*/, %rsp/*t247*/
   # movq    %rsp/*t247*/, %rsp/*t102*/
   jmp     _L_53
_DONE_87:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _List_GetEnd
_List_GetEnd:
_L_89:
   movq    %rbx, %rsp/*t109*/
   movq    %r12, %rsp/*t110*/
   movq    %r13, %rsp/*t111*/
   movq    %r14, %rsp/*t112*/
   movq    %r15, %rsp/*t113*/
   movq    %rdi, %rsp/*t108*/
   movq    $16, %rsp/*t250*/
   # movq    %rsp/*t250*/, %rsp/*t249*/
   addq    %rsp/*t108*/, %rsp/*t249*/
   movq    (%rsp/*t249*/), %rsp/*t248*/
   movq    %rsp/*t248*/, %rax
_bail_54:
   movq    %rsp/*t109*/, %rbx
   movq    %rsp/*t110*/, %r12
   movq    %rsp/*t111*/, %r13
   movq    %rsp/*t112*/, %r14
   movq    %rsp/*t113*/, %r15
_DONE_90:
   # return sink
   ret

.text
.globl _List_GetElem
_List_GetElem:
_L_91:
   movq    %rbx, %rsp/*t115*/
   movq    %r12, %rsp/*t116*/
   movq    %r13, %rsp/*t117*/
   movq    %r14, %rsp/*t118*/
   movq    %r15, %rsp/*t119*/
   movq    %rdi, %rsp/*t114*/
   movq    (%rsp/*t114*/), %rsp/*t251*/
   movq    %rsp/*t251*/, %rax
_bail_55:
   movq    %rsp/*t115*/, %rbx
   movq    %rsp/*t116*/, %r12
   movq    %rsp/*t117*/, %r13
   movq    %rsp/*t118*/, %r14
   movq    %rsp/*t119*/, %r15
_DONE_92:
   # return sink
   ret

.text
.globl _List_GetNext
_List_GetNext:
_L_93:
   movq    %rbx, %rsp/*t121*/
   movq    %r12, %rsp/*t122*/
   movq    %r13, %rsp/*t123*/
   movq    %r14, %rsp/*t124*/
   movq    %r15, %rsp/*t125*/
   movq    %rdi, %rsp/*t120*/
   movq    $8, %rsp/*t254*/
   # movq    %rsp/*t254*/, %rsp/*t253*/
   addq    %rsp/*t120*/, %rsp/*t253*/
   movq    (%rsp/*t253*/), %rsp/*t252*/
   movq    %rsp/*t252*/, %rax
_bail_56:
   movq    %rsp/*t121*/, %rbx
   movq    %rsp/*t122*/, %r12
   movq    %rsp/*t123*/, %r13
   movq    %rsp/*t124*/, %r14
   movq    %rsp/*t125*/, %r15
_DONE_94:
   # return sink
   ret

.text
.globl _List_Print
_List_Print:
   subq   $8, %rsp
_L_95:
   movq    %rbx, %rsp/*t130*/
   movq    %r12, %rsp/*t131*/
   movq    %r13, %rsp/*t132*/
   movq    %r14, %rsp/*t133*/
   movq    %r15, %rsp/*t134*/
   movq    %rdi, %rsp/*t126*/
   xorq    %rsp/*t256*/, %rsp/*t256*/
   # movq    %rsp/*t256*/, %rsp/*t127*/
   xorq    %rsp/*t257*/, %rsp/*t257*/
   # movq    %rsp/*t257*/, %rsp/*t129*/
   # movq    %rsp/*t126*/, %rsp/*t127*/
   movq    $16, %rsp/*t260*/
   # movq    %rsp/*t260*/, %rsp/*t259*/
   addq    %rsp/*t126*/, %rsp/*t259*/
   movq    (%rsp/*t259*/), %rsp/*t258*/
   # movq    %rsp/*t258*/, %rsp/*t128*/
   movq    (%rsp/*t126*/), %rsp/*t261*/
   # movq    %rsp/*t261*/, %rsp/*t129*/
   xorq    %rsp/*t262*/, %rsp/*t262*/
   cmpq    %rsp/*t262*/, %rsp/*t128*/
   je      _loopbody_59
_loopend_58:
   movq    $1, %rsp/*t263*/
   movq    %rsp/*t263*/, %rax
_bail_57:
   movq    %rsp/*t130*/, %rbx
   movq    %rsp/*t131*/, %r12
   movq    %rsp/*t132*/, %r13
   movq    %rsp/*t133*/, %r14
   movq    %rsp/*t134*/, %r15
   jmp     _DONE_96
_loopbody_59:
   movq    %rsp/*t129*/, %rdi
   call    _Element_GetAge
   movq    %rax, %rsp/*t255*/
   movq    %rsp/*t255*/, %rdi
   call    _cs411println
   movq    %rsp/*t127*/, %rdi
   call    _List_GetNext
   movq    %rax, %rsp/*t127*/
   movq    %rsp/*t127*/, %rdi
   call    _List_GetEnd
   movq    %rax, %rsp/*t128*/
   movq    %rsp/*t127*/, %rdi
   call    _List_GetElem
   movq    %rax, %rsp/*t129*/
_looptest_60:
   xorq    %rsp/*t264*/, %rsp/*t264*/
   cmpq    %rsp/*t264*/, %rsp/*t128*/
   jne     _loopend_58
_L_97:
   jmp     _loopbody_59
_DONE_96:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _LL_Start
_LL_Start:
   subq   $8, %rsp
_L_98:
   movq    %rbx, %rsp/*t142*/
   movq    %r12, %rsp/*t143*/
   movq    %r13, %rsp/*t144*/
   movq    %r14, %rsp/*t145*/
   movq    %r15, %rsp/*t146*/
   movq    %rdi, %rsp/*t135*/
   xorq    %rsp/*t267*/, %rsp/*t267*/
   # movq    %rsp/*t267*/, %rsp/*t136*/
   xorq    %rsp/*t268*/, %rsp/*t268*/
   # movq    %rsp/*t268*/, %rsp/*t137*/
   xorq    %rsp/*t269*/, %rsp/*t269*/
   # movq    %rsp/*t269*/, %rsp/*t139*/
   xorq    %rsp/*t270*/, %rsp/*t270*/
   # movq    %rsp/*t270*/, %rsp/*t140*/
   xorq    %rsp/*t271*/, %rsp/*t271*/
   # movq    %rsp/*t271*/, %rsp/*t141*/
   movq    $24, %rsp/*t272*/
   movq    %rsp/*t272*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t137*/
   movq    %rsp/*t137*/, %rdi
   call    _List_Init
   movq    %rax, %rsp/*t138*/
   # movq    %rsp/*t137*/, %rsp/*t136*/
   movq    %rsp/*t136*/, %rdi
   call    _List_Init
   movq    %rax, %rsp/*t138*/
   movq    %rsp/*t136*/, %rdi
   call    _List_Print
   movq    %rax, %rsp/*t138*/
   movq    $24, %rsp/*t273*/
   movq    %rsp/*t273*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t139*/
   xorq    %rsp/*t274*/, %rsp/*t274*/
   movq    %rsp/*t274*/, %rcx
   movq    $37000, %rsp/*t275*/
   movq    %rsp/*t275*/, %rdx
   movq    $25, %rsp/*t276*/
   movq    %rsp/*t276*/, %rsi
   movq    %rsp/*t139*/, %rdi
   call    _Element_Init
   movq    %rax, %rsp/*t138*/
   movq    %rsp/*t139*/, %rsi
   movq    %rsp/*t136*/, %rdi
   call    _List_Insert
   movq    %rax, %rsp/*t136*/
   movq    %rsp/*t136*/, %rdi
   call    _List_Print
   movq    %rax, %rsp/*t138*/
   movq    $10000000, %rsp/*t277*/
   movq    %rsp/*t277*/, %rdi
   call    _cs411println
   movq    $24, %rsp/*t278*/
   movq    %rsp/*t278*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t139*/
   movq    $1, %rsp/*t279*/
   movq    %rsp/*t279*/, %rcx
   movq    $42000, %rsp/*t280*/
   movq    %rsp/*t280*/, %rdx
   movq    $39, %rsp/*t281*/
   movq    %rsp/*t281*/, %rsi
   movq    %rsp/*t139*/, %rdi
   call    _Element_Init
   movq    %rax, %rsp/*t138*/
   # movq    %rsp/*t139*/, %rsp/*t140*/
   movq    %rsp/*t139*/, %rsi
   movq    %rsp/*t136*/, %rdi
   call    _List_Insert
   movq    %rax, %rsp/*t136*/
   movq    %rsp/*t136*/, %rdi
   call    _List_Print
   movq    %rax, %rsp/*t138*/
   movq    $10000000, %rsp/*t282*/
   movq    %rsp/*t282*/, %rdi
   call    _cs411println
   movq    $24, %rsp/*t283*/
   movq    %rsp/*t283*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t139*/
   xorq    %rsp/*t284*/, %rsp/*t284*/
   movq    %rsp/*t284*/, %rcx
   movq    $34000, %rsp/*t285*/
   movq    %rsp/*t285*/, %rdx
   movq    $22, %rsp/*t286*/
   movq    %rsp/*t286*/, %rsi
   movq    %rsp/*t139*/, %rdi
   call    _Element_Init
   movq    %rax, %rsp/*t138*/
   movq    %rsp/*t139*/, %rsi
   movq    %rsp/*t136*/, %rdi
   call    _List_Insert
   movq    %rax, %rsp/*t136*/
   movq    %rsp/*t136*/, %rdi
   call    _List_Print
   movq    %rax, %rsp/*t138*/
   movq    $24, %rsp/*t287*/
   movq    %rsp/*t287*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t141*/
   xorq    %rsp/*t288*/, %rsp/*t288*/
   movq    %rsp/*t288*/, %rcx
   movq    $34000, %rsp/*t289*/
   movq    %rsp/*t289*/, %rdx
   movq    $27, %rsp/*t290*/
   movq    %rsp/*t290*/, %rsi
   movq    %rsp/*t141*/, %rdi
   call    _Element_Init
   movq    %rax, %rsp/*t138*/
   movq    %rsp/*t140*/, %rsi
   movq    %rsp/*t136*/, %rdi
   call    _List_Search
   movq    %rax, %rsp/*t265*/
   movq    %rsp/*t265*/, %rdi
   call    _cs411println
   movq    %rsp/*t141*/, %rsi
   movq    %rsp/*t136*/, %rdi
   call    _List_Search
   movq    %rax, %rsp/*t266*/
   movq    %rsp/*t266*/, %rdi
   call    _cs411println
   movq    $10000000, %rsp/*t291*/
   movq    %rsp/*t291*/, %rdi
   call    _cs411println
   movq    $24, %rsp/*t292*/
   movq    %rsp/*t292*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t139*/
   xorq    %rsp/*t293*/, %rsp/*t293*/
   movq    %rsp/*t293*/, %rcx
   movq    $35000, %rsp/*t294*/
   movq    %rsp/*t294*/, %rdx
   movq    $28, %rsp/*t295*/
   movq    %rsp/*t295*/, %rsi
   movq    %rsp/*t139*/, %rdi
   call    _Element_Init
   movq    %rax, %rsp/*t138*/
   movq    %rsp/*t139*/, %rsi
   movq    %rsp/*t136*/, %rdi
   call    _List_Insert
   movq    %rax, %rsp/*t136*/
   movq    %rsp/*t136*/, %rdi
   call    _List_Print
   movq    %rax, %rsp/*t138*/
   movq    $2220000, %rsp/*t296*/
   movq    %rsp/*t296*/, %rdi
   call    _cs411println
   movq    %rsp/*t140*/, %rsi
   movq    %rsp/*t136*/, %rdi
   call    _List_Delete
   movq    %rax, %rsp/*t136*/
   movq    %rsp/*t136*/, %rdi
   call    _List_Print
   movq    %rax, %rsp/*t138*/
   movq    $33300000, %rsp/*t297*/
   movq    %rsp/*t297*/, %rdi
   call    _cs411println
   movq    %rsp/*t139*/, %rsi
   movq    %rsp/*t136*/, %rdi
   call    _List_Delete
   movq    %rax, %rsp/*t136*/
   movq    %rsp/*t136*/, %rdi
   call    _List_Print
   movq    %rax, %rsp/*t138*/
   movq    $44440000, %rsp/*t298*/
   movq    %rsp/*t298*/, %rdi
   call    _cs411println
   xorq    %rsp/*t299*/, %rsp/*t299*/
   movq    %rsp/*t299*/, %rax
_bail_61:
   movq    %rsp/*t142*/, %rbx
   movq    %rsp/*t143*/, %r12
   movq    %rsp/*t144*/, %r13
   movq    %rsp/*t145*/, %r14
   movq    %rsp/*t146*/, %r15
_DONE_99:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_100:
   movq    %rbx, %rsp/*t147*/
   movq    %r12, %rsp/*t148*/
   movq    %r13, %rsp/*t149*/
   movq    %r14, %rsp/*t150*/
   movq    %r15, %rsp/*t151*/
   xorq    %rsp/*t302*/, %rsp/*t302*/
   movq    %rsp/*t302*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t301*/
   movq    %rsp/*t301*/, %rdi
   call    _LL_Start
   movq    %rax, %rsp/*t300*/
   movq    %rsp/*t300*/, %rdi
   call    _cs411println
_bail_62:
   movq    %rsp/*t147*/, %rbx
   movq    %rsp/*t148*/, %r12
   movq    %rsp/*t149*/, %r13
   movq    %rsp/*t150*/, %r14
   movq    %rsp/*t151*/, %r15
_DONE_101:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
