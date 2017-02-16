.text
.globl _BT_Start
_BT_Start:
   subq   $8, %rsp
_L_99:
   movq    %rbx, %rsp/*t004*/
   movq    %r12, %rsp/*t005*/
   movq    %r13, %rsp/*t006*/
   movq    %r14, %rsp/*t007*/
   movq    %r15, %rsp/*t008*/
   movq    %rdi, %rsp/*t000*/
   xorq    %rsp/*t184*/, %rsp/*t184*/
   # movq    %rsp/*t184*/, %rsp/*t001*/
   movq    $48, %rsp/*t185*/
   movq    %rsp/*t185*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t001*/
   movq    $16, %rsp/*t186*/
   movq    %rsp/*t186*/, %rsi
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Init
   movq    %rax, %rsp/*t002*/
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Print
   movq    %rax, %rsp/*t002*/
   movq    $100000000, %rsp/*t187*/
   movq    %rsp/*t187*/, %rdi
   call    _cs411println
   movq    $8, %rsp/*t188*/
   movq    %rsp/*t188*/, %rsi
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Insert
   movq    %rax, %rsp/*t002*/
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Print
   movq    %rax, %rsp/*t002*/
   movq    $24, %rsp/*t189*/
   movq    %rsp/*t189*/, %rsi
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Insert
   movq    %rax, %rsp/*t002*/
   movq    $4, %rsp/*t190*/
   movq    %rsp/*t190*/, %rsi
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Insert
   movq    %rax, %rsp/*t002*/
   movq    $12, %rsp/*t191*/
   movq    %rsp/*t191*/, %rsi
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Insert
   movq    %rax, %rsp/*t002*/
   movq    $20, %rsp/*t192*/
   movq    %rsp/*t192*/, %rsi
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Insert
   movq    %rax, %rsp/*t002*/
   movq    $28, %rsp/*t193*/
   movq    %rsp/*t193*/, %rsi
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Insert
   movq    %rax, %rsp/*t002*/
   movq    $14, %rsp/*t194*/
   movq    %rsp/*t194*/, %rsi
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Insert
   movq    %rax, %rsp/*t002*/
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Print
   movq    %rax, %rsp/*t002*/
   movq    $24, %rsp/*t195*/
   movq    %rsp/*t195*/, %rsi
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Search
   movq    %rax, %rsp/*t178*/
   movq    %rsp/*t178*/, %rdi
   call    _cs411println
   movq    $12, %rsp/*t196*/
   movq    %rsp/*t196*/, %rsi
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Search
   movq    %rax, %rsp/*t179*/
   movq    %rsp/*t179*/, %rdi
   call    _cs411println
   movq    $16, %rsp/*t197*/
   movq    %rsp/*t197*/, %rsi
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Search
   movq    %rax, %rsp/*t180*/
   movq    %rsp/*t180*/, %rdi
   call    _cs411println
   movq    $50, %rsp/*t198*/
   movq    %rsp/*t198*/, %rsi
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Search
   movq    %rax, %rsp/*t181*/
   movq    %rsp/*t181*/, %rdi
   call    _cs411println
   movq    $12, %rsp/*t199*/
   movq    %rsp/*t199*/, %rsi
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Search
   movq    %rax, %rsp/*t182*/
   movq    %rsp/*t182*/, %rdi
   call    _cs411println
   movq    $12, %rsp/*t200*/
   movq    %rsp/*t200*/, %rsi
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Delete
   movq    %rax, %rsp/*t002*/
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Print
   movq    %rax, %rsp/*t002*/
   movq    $12, %rsp/*t201*/
   movq    %rsp/*t201*/, %rsi
   movq    %rsp/*t001*/, %rdi
   call    _Tree_Search
   movq    %rax, %rsp/*t183*/
   movq    %rsp/*t183*/, %rdi
   call    _cs411println
   xorq    %rsp/*t202*/, %rsp/*t202*/
   movq    %rsp/*t202*/, %rax
_bail_1:
   movq    %rsp/*t004*/, %rbx
   movq    %rsp/*t005*/, %r12
   movq    %rsp/*t006*/, %r13
   movq    %rsp/*t007*/, %r14
   movq    %rsp/*t008*/, %r15
_DONE_100:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Tree_Init
_Tree_Init:
_L_101:
   movq    %rbx, %rsp/*t011*/
   movq    %r12, %rsp/*t012*/
   movq    %r13, %rsp/*t013*/
   movq    %r14, %rsp/*t014*/
   movq    %r15, %rsp/*t015*/
   movq    %rdi, %rsp/*t009*/
   movq    %rsi, %rsp/*t010*/
   movq    $16, %rsp/*t204*/
   # movq    %rsp/*t204*/, %rsp/*t203*/
   addq    %rsp/*t009*/, %rsp/*t203*/
   movq    %rsp/*t010*/, (%rsp/*t203*/)
   movq    $24, %rsp/*t206*/
   # movq    %rsp/*t206*/, %rsp/*t205*/
   addq    %rsp/*t009*/, %rsp/*t205*/
   xorq    %rsp/*t207*/, %rsp/*t207*/
   movq    %rsp/*t207*/, (%rsp/*t205*/)
   movq    $32, %rsp/*t209*/
   # movq    %rsp/*t209*/, %rsp/*t208*/
   addq    %rsp/*t009*/, %rsp/*t208*/
   xorq    %rsp/*t210*/, %rsp/*t210*/
   movq    %rsp/*t210*/, (%rsp/*t208*/)
   movq    $1, %rsp/*t211*/
   movq    %rsp/*t211*/, %rax
_bail_2:
   movq    %rsp/*t011*/, %rbx
   movq    %rsp/*t012*/, %r12
   movq    %rsp/*t013*/, %r13
   movq    %rsp/*t014*/, %r14
   movq    %rsp/*t015*/, %r15
_DONE_102:
   # return sink
   ret

.text
.globl _Tree_SetRight
_Tree_SetRight:
_L_103:
   movq    %rbx, %rsp/*t018*/
   movq    %r12, %rsp/*t019*/
   movq    %r13, %rsp/*t020*/
   movq    %r14, %rsp/*t021*/
   movq    %r15, %rsp/*t022*/
   movq    %rdi, %rsp/*t016*/
   movq    %rsi, %rsp/*t017*/
   movq    $8, %rsp/*t213*/
   # movq    %rsp/*t213*/, %rsp/*t212*/
   addq    %rsp/*t016*/, %rsp/*t212*/
   movq    %rsp/*t017*/, (%rsp/*t212*/)
   movq    $1, %rsp/*t214*/
   movq    %rsp/*t214*/, %rax
_bail_3:
   movq    %rsp/*t018*/, %rbx
   movq    %rsp/*t019*/, %r12
   movq    %rsp/*t020*/, %r13
   movq    %rsp/*t021*/, %r14
   movq    %rsp/*t022*/, %r15
_DONE_104:
   # return sink
   ret

.text
.globl _Tree_SetLeft
_Tree_SetLeft:
_L_105:
   movq    %rbx, %rsp/*t025*/
   movq    %r12, %rsp/*t026*/
   movq    %r13, %rsp/*t027*/
   movq    %r14, %rsp/*t028*/
   movq    %r15, %rsp/*t029*/
   movq    %rdi, %rsp/*t023*/
   movq    %rsi, %rsp/*t024*/
   movq    %rsp/*t024*/, (%rsp/*t023*/)
   movq    $1, %rsp/*t215*/
   movq    %rsp/*t215*/, %rax
_bail_4:
   movq    %rsp/*t025*/, %rbx
   movq    %rsp/*t026*/, %r12
   movq    %rsp/*t027*/, %r13
   movq    %rsp/*t028*/, %r14
   movq    %rsp/*t029*/, %r15
_DONE_106:
   # return sink
   ret

.text
.globl _Tree_GetRight
_Tree_GetRight:
_L_107:
   movq    %rbx, %rsp/*t031*/
   movq    %r12, %rsp/*t032*/
   movq    %r13, %rsp/*t033*/
   movq    %r14, %rsp/*t034*/
   movq    %r15, %rsp/*t035*/
   movq    %rdi, %rsp/*t030*/
   movq    $8, %rsp/*t218*/
   # movq    %rsp/*t218*/, %rsp/*t217*/
   addq    %rsp/*t030*/, %rsp/*t217*/
   movq    (%rsp/*t217*/), %rsp/*t216*/
   movq    %rsp/*t216*/, %rax
_bail_5:
   movq    %rsp/*t031*/, %rbx
   movq    %rsp/*t032*/, %r12
   movq    %rsp/*t033*/, %r13
   movq    %rsp/*t034*/, %r14
   movq    %rsp/*t035*/, %r15
_DONE_108:
   # return sink
   ret

.text
.globl _Tree_GetLeft
_Tree_GetLeft:
_L_109:
   movq    %rbx, %rsp/*t037*/
   movq    %r12, %rsp/*t038*/
   movq    %r13, %rsp/*t039*/
   movq    %r14, %rsp/*t040*/
   movq    %r15, %rsp/*t041*/
   movq    %rdi, %rsp/*t036*/
   movq    (%rsp/*t036*/), %rsp/*t219*/
   movq    %rsp/*t219*/, %rax
_bail_6:
   movq    %rsp/*t037*/, %rbx
   movq    %rsp/*t038*/, %r12
   movq    %rsp/*t039*/, %r13
   movq    %rsp/*t040*/, %r14
   movq    %rsp/*t041*/, %r15
_DONE_110:
   # return sink
   ret

.text
.globl _Tree_GetKey
_Tree_GetKey:
_L_111:
   movq    %rbx, %rsp/*t043*/
   movq    %r12, %rsp/*t044*/
   movq    %r13, %rsp/*t045*/
   movq    %r14, %rsp/*t046*/
   movq    %r15, %rsp/*t047*/
   movq    %rdi, %rsp/*t042*/
   movq    $16, %rsp/*t222*/
   # movq    %rsp/*t222*/, %rsp/*t221*/
   addq    %rsp/*t042*/, %rsp/*t221*/
   movq    (%rsp/*t221*/), %rsp/*t220*/
   movq    %rsp/*t220*/, %rax
_bail_7:
   movq    %rsp/*t043*/, %rbx
   movq    %rsp/*t044*/, %r12
   movq    %rsp/*t045*/, %r13
   movq    %rsp/*t046*/, %r14
   movq    %rsp/*t047*/, %r15
_DONE_112:
   # return sink
   ret

.text
.globl _Tree_SetKey
_Tree_SetKey:
_L_113:
   movq    %rbx, %rsp/*t050*/
   movq    %r12, %rsp/*t051*/
   movq    %r13, %rsp/*t052*/
   movq    %r14, %rsp/*t053*/
   movq    %r15, %rsp/*t054*/
   movq    %rdi, %rsp/*t048*/
   movq    %rsi, %rsp/*t049*/
   movq    $16, %rsp/*t224*/
   # movq    %rsp/*t224*/, %rsp/*t223*/
   addq    %rsp/*t048*/, %rsp/*t223*/
   movq    %rsp/*t049*/, (%rsp/*t223*/)
   movq    $1, %rsp/*t225*/
   movq    %rsp/*t225*/, %rax
_bail_8:
   movq    %rsp/*t050*/, %rbx
   movq    %rsp/*t051*/, %r12
   movq    %rsp/*t052*/, %r13
   movq    %rsp/*t053*/, %r14
   movq    %rsp/*t054*/, %r15
_DONE_114:
   # return sink
   ret

.text
.globl _Tree_GetHas_Right
_Tree_GetHas_Right:
_L_115:
   movq    %rbx, %rsp/*t056*/
   movq    %r12, %rsp/*t057*/
   movq    %r13, %rsp/*t058*/
   movq    %r14, %rsp/*t059*/
   movq    %r15, %rsp/*t060*/
   movq    %rdi, %rsp/*t055*/
   movq    $32, %rsp/*t228*/
   # movq    %rsp/*t228*/, %rsp/*t227*/
   addq    %rsp/*t055*/, %rsp/*t227*/
   movq    (%rsp/*t227*/), %rsp/*t226*/
   movq    %rsp/*t226*/, %rax
_bail_9:
   movq    %rsp/*t056*/, %rbx
   movq    %rsp/*t057*/, %r12
   movq    %rsp/*t058*/, %r13
   movq    %rsp/*t059*/, %r14
   movq    %rsp/*t060*/, %r15
_DONE_116:
   # return sink
   ret

.text
.globl _Tree_GetHas_Left
_Tree_GetHas_Left:
_L_117:
   movq    %rbx, %rsp/*t062*/
   movq    %r12, %rsp/*t063*/
   movq    %r13, %rsp/*t064*/
   movq    %r14, %rsp/*t065*/
   movq    %r15, %rsp/*t066*/
   movq    %rdi, %rsp/*t061*/
   movq    $24, %rsp/*t231*/
   # movq    %rsp/*t231*/, %rsp/*t230*/
   addq    %rsp/*t061*/, %rsp/*t230*/
   movq    (%rsp/*t230*/), %rsp/*t229*/
   movq    %rsp/*t229*/, %rax
_bail_10:
   movq    %rsp/*t062*/, %rbx
   movq    %rsp/*t063*/, %r12
   movq    %rsp/*t064*/, %r13
   movq    %rsp/*t065*/, %r14
   movq    %rsp/*t066*/, %r15
_DONE_118:
   # return sink
   ret

.text
.globl _Tree_SetHas_Left
_Tree_SetHas_Left:
_L_119:
   movq    %rbx, %rsp/*t069*/
   movq    %r12, %rsp/*t070*/
   movq    %r13, %rsp/*t071*/
   movq    %r14, %rsp/*t072*/
   movq    %r15, %rsp/*t073*/
   movq    %rdi, %rsp/*t067*/
   movq    %rsi, %rsp/*t068*/
   movq    $24, %rsp/*t233*/
   # movq    %rsp/*t233*/, %rsp/*t232*/
   addq    %rsp/*t067*/, %rsp/*t232*/
   movq    %rsp/*t068*/, (%rsp/*t232*/)
   movq    $1, %rsp/*t234*/
   movq    %rsp/*t234*/, %rax
_bail_11:
   movq    %rsp/*t069*/, %rbx
   movq    %rsp/*t070*/, %r12
   movq    %rsp/*t071*/, %r13
   movq    %rsp/*t072*/, %r14
   movq    %rsp/*t073*/, %r15
_DONE_120:
   # return sink
   ret

.text
.globl _Tree_SetHas_Right
_Tree_SetHas_Right:
_L_121:
   movq    %rbx, %rsp/*t076*/
   movq    %r12, %rsp/*t077*/
   movq    %r13, %rsp/*t078*/
   movq    %r14, %rsp/*t079*/
   movq    %r15, %rsp/*t080*/
   movq    %rdi, %rsp/*t074*/
   movq    %rsi, %rsp/*t075*/
   movq    $32, %rsp/*t236*/
   # movq    %rsp/*t236*/, %rsp/*t235*/
   addq    %rsp/*t074*/, %rsp/*t235*/
   movq    %rsp/*t075*/, (%rsp/*t235*/)
   movq    $1, %rsp/*t237*/
   movq    %rsp/*t237*/, %rax
_bail_12:
   movq    %rsp/*t076*/, %rbx
   movq    %rsp/*t077*/, %r12
   movq    %rsp/*t078*/, %r13
   movq    %rsp/*t079*/, %r14
   movq    %rsp/*t080*/, %r15
_DONE_122:
   # return sink
   ret

.text
.globl _Tree_Compare
_Tree_Compare:
_L_123:
   movq    %rbx, %rsp/*t086*/
   movq    %r12, %rsp/*t087*/
   movq    %r13, %rsp/*t088*/
   movq    %r14, %rsp/*t089*/
   movq    %r15, %rsp/*t090*/
   movq    %rdi, %rsp/*t081*/
   movq    %rsi, %rsp/*t082*/
   movq    %rdx, %rsp/*t083*/
   xorq    %rsp/*t238*/, %rsp/*t238*/
   # movq    %rsp/*t238*/, %rsp/*t084*/
   movq    $1, %rsp/*t240*/
   # movq    %rsp/*t240*/, %rsp/*t239*/
   addq    %rsp/*t083*/, %rsp/*t239*/
   # movq    %rsp/*t239*/, %rsp/*t085*/
   cmpq    %rsp/*t083*/, %rsp/*t082*/
   jge     _L_15
_L_14:
   xorq    %rsp/*t241*/, %rsp/*t241*/
   # movq    %rsp/*t241*/, %rsp/*t084*/
_L_16:
   movq    %rsp/*t084*/, %rax
_bail_13:
   movq    %rsp/*t086*/, %rbx
   movq    %rsp/*t087*/, %r12
   movq    %rsp/*t088*/, %r13
   movq    %rsp/*t089*/, %r14
   movq    %rsp/*t090*/, %r15
   jmp     _DONE_124
_L_15:
   cmpq    %rsp/*t085*/, %rsp/*t082*/
   jge     _L_17
_L_18:
   movq    $1, %rsp/*t242*/
   # movq    %rsp/*t242*/, %rsp/*t084*/
_L_19:
   jmp     _L_16
_L_17:
   xorq    %rsp/*t243*/, %rsp/*t243*/
   # movq    %rsp/*t243*/, %rsp/*t084*/
   jmp     _L_19
_DONE_124:
   # return sink
   ret

.text
.globl _Tree_Insert
_Tree_Insert:
   subq   $8, %rsp
_L_125:
   movq    %rbx, %rsp/*t098*/
   movq    %r12, %rsp/*t099*/
   movq    %r13, %rsp/*t100*/
   movq    %r14, %rsp/*t101*/
   movq    %r15, %rsp/*t102*/
   movq    %rdi, %rsp/*t091*/
   movq    %rsi, %rsp/*t092*/
   xorq    %rsp/*t246*/, %rsp/*t246*/
   # movq    %rsp/*t246*/, %rsp/*t093*/
   xorq    %rsp/*t247*/, %rsp/*t247*/
   # movq    %rsp/*t247*/, %rsp/*t097*/
   movq    $48, %rsp/*t248*/
   movq    %rsp/*t248*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t093*/
   movq    %rsp/*t092*/, %rsi
   movq    %rsp/*t093*/, %rdi
   call    _Tree_Init
   movq    %rax, %rsp/*t094*/
   # movq    %rsp/*t091*/, %rsp/*t097*/
   movq    $1, %rsp/*t249*/
   # movq    %rsp/*t249*/, %rsp/*t095*/
   xorq    %rsp/*t250*/, %rsp/*t250*/
   cmpq    %rsp/*t250*/, %rsp/*t095*/
   je      _loopend_21
_loopbody_22:
   movq    %rsp/*t097*/, %rdi
   call    _Tree_GetKey
   movq    %rax, %rsp/*t096*/
   cmpq    %rsp/*t096*/, %rsp/*t092*/
   jge     _L_25
_L_24:
   movq    %rsp/*t097*/, %rdi
   call    _Tree_GetHas_Left
   movq    %rax, %rsp/*t244*/
   xorq    %rsp/*t251*/, %rsp/*t251*/
   cmpq    %rsp/*t251*/, %rsp/*t244*/
   je      _L_28
_L_27:
   movq    %rsp/*t097*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, %rsp/*t097*/
_L_29:
_L_26:
_looptest_23:
   xorq    %rsp/*t252*/, %rsp/*t252*/
   cmpq    %rsp/*t252*/, %rsp/*t095*/
   jne     _loopbody_22
_loopend_21:
   movq    $1, %rsp/*t253*/
   movq    %rsp/*t253*/, %rax
_bail_20:
   movq    %rsp/*t098*/, %rbx
   movq    %rsp/*t099*/, %r12
   movq    %rsp/*t100*/, %r13
   movq    %rsp/*t101*/, %r14
   movq    %rsp/*t102*/, %r15
   jmp     _DONE_126
_L_28:
   xorq    %rsp/*t254*/, %rsp/*t254*/
   # movq    %rsp/*t254*/, %rsp/*t095*/
   movq    $1, %rsp/*t255*/
   movq    %rsp/*t255*/, %rsi
   movq    %rsp/*t097*/, %rdi
   call    _Tree_SetHas_Left
   movq    %rax, %rsp/*t094*/
   movq    %rsp/*t093*/, %rsi
   movq    %rsp/*t097*/, %rdi
   call    _Tree_SetLeft
   movq    %rax, %rsp/*t094*/
   jmp     _L_29
_L_25:
   movq    %rsp/*t097*/, %rdi
   call    _Tree_GetHas_Right
   movq    %rax, %rsp/*t245*/
   xorq    %rsp/*t256*/, %rsp/*t256*/
   cmpq    %rsp/*t256*/, %rsp/*t245*/
   je      _L_31
_L_30:
   movq    %rsp/*t097*/, %rdi
   call    _Tree_GetRight
   movq    %rax, %rsp/*t097*/
_L_32:
   jmp     _L_26
_L_31:
   xorq    %rsp/*t257*/, %rsp/*t257*/
   # movq    %rsp/*t257*/, %rsp/*t095*/
   movq    $1, %rsp/*t258*/
   movq    %rsp/*t258*/, %rsi
   movq    %rsp/*t097*/, %rdi
   call    _Tree_SetHas_Right
   movq    %rax, %rsp/*t094*/
   movq    %rsp/*t093*/, %rsi
   movq    %rsp/*t097*/, %rdi
   call    _Tree_SetRight
   movq    %rax, %rsp/*t094*/
   jmp     _L_32
_DONE_126:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Tree_Delete
_Tree_Delete:
   subq   $8, %rsp
_L_127:
   movq    %rbx, %rsp/*t112*/
   movq    %r12, %rsp/*t113*/
   movq    %r13, %rsp/*t114*/
   movq    %r14, %rsp/*t115*/
   movq    %r15, %rsp/*t116*/
   movq    %rdi, %rsp/*t103*/
   movq    %rsi, %rsp/*t104*/
   xorq    %rsp/*t263*/, %rsp/*t263*/
   # movq    %rsp/*t263*/, %rsp/*t105*/
   xorq    %rsp/*t264*/, %rsp/*t264*/
   # movq    %rsp/*t264*/, %rsp/*t106*/
   # movq    %rsp/*t103*/, %rsp/*t105*/
   # movq    %rsp/*t103*/, %rsp/*t106*/
   movq    $1, %rsp/*t265*/
   # movq    %rsp/*t265*/, %rsp/*t107*/
   xorq    %rsp/*t266*/, %rsp/*t266*/
   # movq    %rsp/*t266*/, %rsp/*t108*/
   movq    $1, %rsp/*t267*/
   # movq    %rsp/*t267*/, %rsp/*t109*/
   xorq    %rsp/*t268*/, %rsp/*t268*/
   cmpq    %rsp/*t268*/, %rsp/*t107*/
   je      _loopend_34
_loopbody_35:
   movq    %rsp/*t105*/, %rdi
   call    _Tree_GetKey
   movq    %rax, %rsp/*t110*/
   cmpq    %rsp/*t110*/, %rsp/*t104*/
   jge     _L_38
_L_37:
   movq    %rsp/*t105*/, %rdi
   call    _Tree_GetHas_Left
   movq    %rax, %rsp/*t259*/
   xorq    %rsp/*t269*/, %rsp/*t269*/
   cmpq    %rsp/*t269*/, %rsp/*t259*/
   je      _L_41
_L_40:
   # movq    %rsp/*t105*/, %rsp/*t106*/
   movq    %rsp/*t105*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, %rsp/*t105*/
_L_42:
_L_39:
   xorq    %rsp/*t270*/, %rsp/*t270*/
   # movq    %rsp/*t270*/, %rsp/*t109*/
_looptest_36:
   xorq    %rsp/*t271*/, %rsp/*t271*/
   cmpq    %rsp/*t271*/, %rsp/*t107*/
   jne     _loopbody_35
_loopend_34:
   movq    %rsp/*t108*/, %rax
_bail_33:
   movq    %rsp/*t112*/, %rbx
   movq    %rsp/*t113*/, %r12
   movq    %rsp/*t114*/, %r13
   movq    %rsp/*t115*/, %r14
   movq    %rsp/*t116*/, %r15
   jmp     _DONE_128
_L_41:
   xorq    %rsp/*t272*/, %rsp/*t272*/
   # movq    %rsp/*t272*/, %rsp/*t107*/
   jmp     _L_42
_L_38:
   cmpq    %rsp/*t104*/, %rsp/*t110*/
   jge     _L_44
_L_43:
   movq    %rsp/*t105*/, %rdi
   call    _Tree_GetHas_Right
   movq    %rax, %rsp/*t260*/
   xorq    %rsp/*t273*/, %rsp/*t273*/
   cmpq    %rsp/*t273*/, %rsp/*t260*/
   je      _L_47
_L_46:
   # movq    %rsp/*t105*/, %rsp/*t106*/
   movq    %rsp/*t105*/, %rdi
   call    _Tree_GetRight
   movq    %rax, %rsp/*t105*/
_L_48:
_L_45:
   jmp     _L_39
_L_47:
   xorq    %rsp/*t274*/, %rsp/*t274*/
   # movq    %rsp/*t274*/, %rsp/*t107*/
   jmp     _L_48
_L_44:
   xorq    %rsp/*t275*/, %rsp/*t275*/
   cmpq    %rsp/*t275*/, %rsp/*t109*/
   je      _L_50
_L_49:
   movq    %rsp/*t105*/, %rdi
   call    _Tree_GetHas_Right
   movq    %rax, %rsp/*t261*/
   xorq    %rsp/*t276*/, %rsp/*t276*/
   cmpq    %rsp/*t276*/, %rsp/*t261*/
   je      _L_55
_L_53:
   movq    %rsp/*t105*/, %rdx
   movq    %rsp/*t106*/, %rsi
   movq    %rsp/*t103*/, %rdi
   call    _Tree_Remove
   movq    %rax, %rsp/*t111*/
_L_54:
_L_51:
   movq    $1, %rsp/*t277*/
   # movq    %rsp/*t277*/, %rsp/*t108*/
   xorq    %rsp/*t278*/, %rsp/*t278*/
   # movq    %rsp/*t278*/, %rsp/*t107*/
   jmp     _L_45
_L_55:
   movq    %rsp/*t105*/, %rdi
   call    _Tree_GetHas_Left
   movq    %rax, %rsp/*t262*/
   xorq    %rsp/*t279*/, %rsp/*t279*/
   cmpq    %rsp/*t279*/, %rsp/*t262*/
   jne     _L_53
_L_52:
   movq    $1, %rsp/*t280*/
   # movq    %rsp/*t280*/, %rsp/*t111*/
   jmp     _L_54
_L_50:
   movq    %rsp/*t105*/, %rdx
   movq    %rsp/*t106*/, %rsi
   movq    %rsp/*t103*/, %rdi
   call    _Tree_Remove
   movq    %rax, %rsp/*t111*/
   jmp     _L_51
_DONE_128:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Tree_Remove
_Tree_Remove:
   subq   $8, %rsp
_L_129:
   movq    %rbx, %rsp/*t123*/
   movq    %r12, %rsp/*t124*/
   movq    %r13, %rsp/*t125*/
   movq    %r14, %rsp/*t126*/
   movq    %r15, %rsp/*t127*/
   movq    %rdi, %rsp/*t117*/
   movq    %rsi, %rsp/*t118*/
   movq    %rdx, %rsp/*t119*/
   movq    %rsp/*t119*/, %rdi
   call    _Tree_GetHas_Left
   movq    %rax, %rsp/*t281*/
   xorq    %rsp/*t285*/, %rsp/*t285*/
   cmpq    %rsp/*t285*/, %rsp/*t281*/
   je      _L_58
_L_57:
   movq    %rsp/*t119*/, %rdx
   movq    %rsp/*t118*/, %rsi
   movq    %rsp/*t117*/, %rdi
   call    _Tree_RemoveLeft
   movq    %rax, %rsp/*t120*/
_L_59:
   movq    $1, %rsp/*t286*/
   movq    %rsp/*t286*/, %rax
_bail_56:
   movq    %rsp/*t123*/, %rbx
   movq    %rsp/*t124*/, %r12
   movq    %rsp/*t125*/, %r13
   movq    %rsp/*t126*/, %r14
   movq    %rsp/*t127*/, %r15
   jmp     _DONE_130
_L_58:
   movq    %rsp/*t119*/, %rdi
   call    _Tree_GetHas_Right
   movq    %rax, %rsp/*t282*/
   xorq    %rsp/*t287*/, %rsp/*t287*/
   cmpq    %rsp/*t287*/, %rsp/*t282*/
   je      _L_61
_L_60:
   movq    %rsp/*t119*/, %rdx
   movq    %rsp/*t118*/, %rsi
   movq    %rsp/*t117*/, %rdi
   call    _Tree_RemoveRight
   movq    %rax, %rsp/*t120*/
_L_62:
   jmp     _L_59
_L_61:
   movq    %rsp/*t119*/, %rdi
   call    _Tree_GetKey
   movq    %rax, %rsp/*t121*/
   movq    %rsp/*t118*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, %rsp/*t283*/
   movq    %rsp/*t283*/, %rdi
   call    _Tree_GetKey
   movq    %rax, %rsp/*t122*/
   movq    %rsp/*t122*/, %rdx
   movq    %rsp/*t121*/, %rsi
   movq    %rsp/*t117*/, %rdi
   call    _Tree_Compare
   movq    %rax, %rsp/*t284*/
   xorq    %rsp/*t288*/, %rsp/*t288*/
   cmpq    %rsp/*t288*/, %rsp/*t284*/
   je      _L_64
_L_63:
   movq    $40, %rsp/*t291*/
   # movq    %rsp/*t291*/, %rsp/*t290*/
   addq    %rsp/*t117*/, %rsp/*t290*/
   movq    (%rsp/*t290*/), %rsp/*t289*/
   movq    %rsp/*t289*/, %rsi
   movq    %rsp/*t118*/, %rdi
   call    _Tree_SetLeft
   movq    %rax, %rsp/*t120*/
   xorq    %rsp/*t292*/, %rsp/*t292*/
   movq    %rsp/*t292*/, %rsi
   movq    %rsp/*t118*/, %rdi
   call    _Tree_SetHas_Left
   movq    %rax, %rsp/*t120*/
_L_65:
   jmp     _L_62
_L_64:
   movq    $40, %rsp/*t295*/
   # movq    %rsp/*t295*/, %rsp/*t294*/
   addq    %rsp/*t117*/, %rsp/*t294*/
   movq    (%rsp/*t294*/), %rsp/*t293*/
   movq    %rsp/*t293*/, %rsi
   movq    %rsp/*t118*/, %rdi
   call    _Tree_SetRight
   movq    %rax, %rsp/*t120*/
   xorq    %rsp/*t296*/, %rsp/*t296*/
   movq    %rsp/*t296*/, %rsi
   movq    %rsp/*t118*/, %rdi
   call    _Tree_SetHas_Right
   movq    %rax, %rsp/*t120*/
   jmp     _L_65
_DONE_130:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Tree_RemoveRight
_Tree_RemoveRight:
   subq   $8, %rsp
_L_131:
   movq    %rbx, %rsp/*t132*/
   movq    %r12, %rsp/*t133*/
   movq    %r13, %rsp/*t134*/
   movq    %r14, %rsp/*t135*/
   movq    %r15, %rsp/*t136*/
   movq    %rdi, %rsp/*t128*/
   movq    %rsi, %rsp/*t129*/
   movq    %rdx, %rsp/*t130*/
   movq    %rsp/*t130*/, %rdi
   call    _Tree_GetHas_Right
   movq    %rax, %rsp/*t297*/
   xorq    %rsp/*t302*/, %rsp/*t302*/
   cmpq    %rsp/*t302*/, %rsp/*t297*/
   je      _loopend_67
_loopbody_68:
   # movq    %rsp/*t130*/, %rsp/*t300*/
   movq    %rsp/*t130*/, %rdi
   call    _Tree_GetRight
   movq    %rax, %rsp/*t299*/
   movq    %rsp/*t299*/, %rdi
   call    _Tree_GetKey
   movq    %rax, %rsp/*t298*/
   movq    %rsp/*t298*/, %rsi
   movq    %rsp/*t300*/, %rdi
   call    _Tree_SetKey
   movq    %rax, %rsp/*t131*/
   # movq    %rsp/*t130*/, %rsp/*t129*/
   movq    %rsp/*t130*/, %rdi
   call    _Tree_GetRight
   movq    %rax, %rsp/*t130*/
_looptest_69:
   movq    %rsp/*t130*/, %rdi
   call    _Tree_GetHas_Right
   movq    %rax, %rsp/*t301*/
   xorq    %rsp/*t303*/, %rsp/*t303*/
   cmpq    %rsp/*t303*/, %rsp/*t301*/
   jne     _loopbody_68
_loopend_67:
   movq    $40, %rsp/*t306*/
   # movq    %rsp/*t306*/, %rsp/*t305*/
   addq    %rsp/*t128*/, %rsp/*t305*/
   movq    (%rsp/*t305*/), %rsp/*t304*/
   movq    %rsp/*t304*/, %rsi
   movq    %rsp/*t129*/, %rdi
   call    _Tree_SetRight
   movq    %rax, %rsp/*t131*/
   xorq    %rsp/*t307*/, %rsp/*t307*/
   movq    %rsp/*t307*/, %rsi
   movq    %rsp/*t129*/, %rdi
   call    _Tree_SetHas_Right
   movq    %rax, %rsp/*t131*/
   movq    $1, %rsp/*t308*/
   movq    %rsp/*t308*/, %rax
_bail_66:
   movq    %rsp/*t132*/, %rbx
   movq    %rsp/*t133*/, %r12
   movq    %rsp/*t134*/, %r13
   movq    %rsp/*t135*/, %r14
   movq    %rsp/*t136*/, %r15
_DONE_132:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Tree_RemoveLeft
_Tree_RemoveLeft:
   subq   $8, %rsp
_L_133:
   movq    %rbx, %rsp/*t141*/
   movq    %r12, %rsp/*t142*/
   movq    %r13, %rsp/*t143*/
   movq    %r14, %rsp/*t144*/
   movq    %r15, %rsp/*t145*/
   movq    %rdi, %rsp/*t137*/
   movq    %rsi, %rsp/*t138*/
   movq    %rdx, %rsp/*t139*/
   movq    %rsp/*t139*/, %rdi
   call    _Tree_GetHas_Left
   movq    %rax, %rsp/*t309*/
   xorq    %rsp/*t314*/, %rsp/*t314*/
   cmpq    %rsp/*t314*/, %rsp/*t309*/
   je      _loopend_71
_loopbody_72:
   # movq    %rsp/*t139*/, %rsp/*t312*/
   movq    %rsp/*t139*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, %rsp/*t311*/
   movq    %rsp/*t311*/, %rdi
   call    _Tree_GetKey
   movq    %rax, %rsp/*t310*/
   movq    %rsp/*t310*/, %rsi
   movq    %rsp/*t312*/, %rdi
   call    _Tree_SetKey
   movq    %rax, %rsp/*t140*/
   # movq    %rsp/*t139*/, %rsp/*t138*/
   movq    %rsp/*t139*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, %rsp/*t139*/
_looptest_73:
   movq    %rsp/*t139*/, %rdi
   call    _Tree_GetHas_Left
   movq    %rax, %rsp/*t313*/
   xorq    %rsp/*t315*/, %rsp/*t315*/
   cmpq    %rsp/*t315*/, %rsp/*t313*/
   jne     _loopbody_72
_loopend_71:
   movq    $40, %rsp/*t318*/
   # movq    %rsp/*t318*/, %rsp/*t317*/
   addq    %rsp/*t137*/, %rsp/*t317*/
   movq    (%rsp/*t317*/), %rsp/*t316*/
   movq    %rsp/*t316*/, %rsi
   movq    %rsp/*t138*/, %rdi
   call    _Tree_SetLeft
   movq    %rax, %rsp/*t140*/
   xorq    %rsp/*t319*/, %rsp/*t319*/
   movq    %rsp/*t319*/, %rsi
   movq    %rsp/*t138*/, %rdi
   call    _Tree_SetHas_Left
   movq    %rax, %rsp/*t140*/
   movq    $1, %rsp/*t320*/
   movq    %rsp/*t320*/, %rax
_bail_70:
   movq    %rsp/*t141*/, %rbx
   movq    %rsp/*t142*/, %r12
   movq    %rsp/*t143*/, %r13
   movq    %rsp/*t144*/, %r14
   movq    %rsp/*t145*/, %r15
_DONE_134:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Tree_Search
_Tree_Search:
   subq   $8, %rsp
_L_135:
   movq    %rbx, %rsp/*t152*/
   movq    %r12, %rsp/*t153*/
   movq    %r13, %rsp/*t154*/
   movq    %r14, %rsp/*t155*/
   movq    %r15, %rsp/*t156*/
   movq    %rdi, %rsp/*t146*/
   movq    %rsi, %rsp/*t147*/
   xorq    %rsp/*t323*/, %rsp/*t323*/
   # movq    %rsp/*t323*/, %rsp/*t150*/
   # movq    %rsp/*t146*/, %rsp/*t150*/
   movq    $1, %rsp/*t324*/
   # movq    %rsp/*t324*/, %rsp/*t148*/
   xorq    %rsp/*t325*/, %rsp/*t325*/
   # movq    %rsp/*t325*/, %rsp/*t149*/
   xorq    %rsp/*t326*/, %rsp/*t326*/
   cmpq    %rsp/*t326*/, %rsp/*t148*/
   je      _loopend_75
_loopbody_76:
   movq    %rsp/*t150*/, %rdi
   call    _Tree_GetKey
   movq    %rax, %rsp/*t151*/
   cmpq    %rsp/*t151*/, %rsp/*t147*/
   jge     _L_79
_L_78:
   movq    %rsp/*t150*/, %rdi
   call    _Tree_GetHas_Left
   movq    %rax, %rsp/*t321*/
   xorq    %rsp/*t327*/, %rsp/*t327*/
   cmpq    %rsp/*t327*/, %rsp/*t321*/
   je      _L_82
_L_81:
   movq    %rsp/*t150*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, %rsp/*t150*/
_L_83:
_L_80:
_looptest_77:
   xorq    %rsp/*t328*/, %rsp/*t328*/
   cmpq    %rsp/*t328*/, %rsp/*t148*/
   jne     _loopbody_76
_loopend_75:
   movq    %rsp/*t149*/, %rax
_bail_74:
   movq    %rsp/*t152*/, %rbx
   movq    %rsp/*t153*/, %r12
   movq    %rsp/*t154*/, %r13
   movq    %rsp/*t155*/, %r14
   movq    %rsp/*t156*/, %r15
   jmp     _DONE_136
_L_82:
   xorq    %rsp/*t329*/, %rsp/*t329*/
   # movq    %rsp/*t329*/, %rsp/*t148*/
   jmp     _L_83
_L_79:
   cmpq    %rsp/*t147*/, %rsp/*t151*/
   jge     _L_85
_L_84:
   movq    %rsp/*t150*/, %rdi
   call    _Tree_GetHas_Right
   movq    %rax, %rsp/*t322*/
   xorq    %rsp/*t330*/, %rsp/*t330*/
   cmpq    %rsp/*t330*/, %rsp/*t322*/
   je      _L_88
_L_87:
   movq    %rsp/*t150*/, %rdi
   call    _Tree_GetRight
   movq    %rax, %rsp/*t150*/
_L_89:
_L_86:
   jmp     _L_80
_L_88:
   xorq    %rsp/*t331*/, %rsp/*t331*/
   # movq    %rsp/*t331*/, %rsp/*t148*/
   jmp     _L_89
_L_85:
   movq    $1, %rsp/*t332*/
   # movq    %rsp/*t332*/, %rsp/*t149*/
   xorq    %rsp/*t333*/, %rsp/*t333*/
   # movq    %rsp/*t333*/, %rsp/*t148*/
   jmp     _L_86
_DONE_136:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Tree_Print
_Tree_Print:
   subq   $8, %rsp
_L_137:
   movq    %rbx, %rsp/*t160*/
   movq    %r12, %rsp/*t161*/
   movq    %r13, %rsp/*t162*/
   movq    %r14, %rsp/*t163*/
   movq    %r15, %rsp/*t164*/
   movq    %rdi, %rsp/*t157*/
   xorq    %rsp/*t334*/, %rsp/*t334*/
   # movq    %rsp/*t334*/, %rsp/*t158*/
   # movq    %rsp/*t157*/, %rsp/*t158*/
   movq    %rsp/*t158*/, %rsi
   movq    %rsp/*t157*/, %rdi
   call    _Tree_RecPrint
   movq    %rax, %rsp/*t159*/
   movq    $1, %rsp/*t335*/
   movq    %rsp/*t335*/, %rax
_bail_90:
   movq    %rsp/*t160*/, %rbx
   movq    %rsp/*t161*/, %r12
   movq    %rsp/*t162*/, %r13
   movq    %rsp/*t163*/, %r14
   movq    %rsp/*t164*/, %r15
_DONE_138:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _Tree_RecPrint
_Tree_RecPrint:
   subq   $8, %rsp
_L_139:
   movq    %rbx, %rsp/*t168*/
   movq    %r12, %rsp/*t169*/
   movq    %r13, %rsp/*t170*/
   movq    %r14, %rsp/*t171*/
   movq    %r15, %rsp/*t172*/
   movq    %rdi, %rsp/*t165*/
   movq    %rsi, %rsp/*t166*/
   movq    %rsp/*t166*/, %rdi
   call    _Tree_GetHas_Left
   movq    %rax, %rsp/*t336*/
   xorq    %rsp/*t343*/, %rsp/*t343*/
   cmpq    %rsp/*t343*/, %rsp/*t336*/
   je      _L_93
_L_92:
   # movq    %rsp/*t165*/, %rsp/*t338*/
   movq    %rsp/*t166*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, %rsp/*t337*/
   movq    %rsp/*t337*/, %rsi
   movq    %rsp/*t338*/, %rdi
   call    _Tree_RecPrint
   movq    %rax, %rsp/*t167*/
_L_94:
   movq    %rsp/*t166*/, %rdi
   call    _Tree_GetKey
   movq    %rax, %rsp/*t339*/
   movq    %rsp/*t339*/, %rdi
   call    _cs411println
   movq    %rsp/*t166*/, %rdi
   call    _Tree_GetHas_Right
   movq    %rax, %rsp/*t340*/
   xorq    %rsp/*t344*/, %rsp/*t344*/
   cmpq    %rsp/*t344*/, %rsp/*t340*/
   je      _L_96
_L_95:
   # movq    %rsp/*t165*/, %rsp/*t342*/
   movq    %rsp/*t166*/, %rdi
   call    _Tree_GetRight
   movq    %rax, %rsp/*t341*/
   movq    %rsp/*t341*/, %rsi
   movq    %rsp/*t342*/, %rdi
   call    _Tree_RecPrint
   movq    %rax, %rsp/*t167*/
_L_97:
   movq    $1, %rsp/*t345*/
   movq    %rsp/*t345*/, %rax
_bail_91:
   movq    %rsp/*t168*/, %rbx
   movq    %rsp/*t169*/, %r12
   movq    %rsp/*t170*/, %r13
   movq    %rsp/*t171*/, %r14
   movq    %rsp/*t172*/, %r15
   jmp     _DONE_140
_L_93:
   movq    $1, %rsp/*t346*/
   # movq    %rsp/*t346*/, %rsp/*t167*/
   jmp     _L_94
_L_96:
   movq    $1, %rsp/*t347*/
   # movq    %rsp/*t347*/, %rsp/*t167*/
   jmp     _L_97
_DONE_140:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_141:
   movq    %rbx, %rsp/*t173*/
   movq    %r12, %rsp/*t174*/
   movq    %r13, %rsp/*t175*/
   movq    %r14, %rsp/*t176*/
   movq    %r15, %rsp/*t177*/
   xorq    %rsp/*t350*/, %rsp/*t350*/
   movq    %rsp/*t350*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t349*/
   movq    %rsp/*t349*/, %rdi
   call    _BT_Start
   movq    %rax, %rsp/*t348*/
   movq    %rsp/*t348*/, %rdi
   call    _cs411println
_bail_98:
   movq    %rsp/*t173*/, %rbx
   movq    %rsp/*t174*/, %r12
   movq    %rsp/*t175*/, %r13
   movq    %rsp/*t176*/, %r14
   movq    %rsp/*t177*/, %r15
_DONE_142:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
