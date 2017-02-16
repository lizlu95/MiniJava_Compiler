   .text
.globl _Test_fill
_Test_fill:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_24:
   movq    %rbx, -8(%rbp)
   # movq    %r12, %r12/*t005*/
   # movq    %r13, %r13/*t006*/
   # movq    %r14, %r14/*t007*/
   # movq    %r15, %r15/*t008*/
   movq    %rdi, %rbx/*t000*/
   # movq    %rbx/*t000*/, %rbx/*t050*/
   movq    $10, %rdi
   call    _cs411newarray
   # movq    %rax, %rax/*t049*/
   movq    %rax/*t049*/, (%rbx/*t050*/)
   movq    $0, %rdi/*t001*/
_looptest_4:
   cmpq    $10, %rdi/*t001*/
   jge     _loopend_2
_loopbody_3:
   # movq    %rdi/*t001*/, %rdi/*t003*/
   movq    %rdi/*t003*/, %rcx/*t051*/
   movq    (%rbx/*t000*/), %rsi/*t093*/
   # movq    %rsi/*t093*/, %rsi/*t002*/
   movq    -8(%rsi/*t002*/), %rdx/*t094*/
   cmpq    %rdx/*t094*/, %rcx/*t051*/
   jae     _boundsbad_6
_boundsok_5:
   movq    %rdi/*t001*/, %rdx/*t095*/
   imulq   %rdi/*t001*/, %rdx/*t095*/
   movq    %rdx/*t095*/, (%rsi/*t002*/, %rdi/*t003*/, 8)
   # movq    %rdi/*t001*/, %rdi/*t096*/
   incq    %rdi/*t096*/
   # movq    %rdi/*t096*/, %rdi/*t001*/
   jmp     _looptest_4
_boundsbad_6:
   movq    $1, %rdi
   call    _cs411error
_bail_1:
   movq    -8(%rbp), %rbx/*t097*/
   # movq    %rbx/*t097*/, %rbx
   # movq    %r12/*t005*/, %r12
   # movq    %r13/*t006*/, %r13
   # movq    %r14/*t007*/, %r14
   # movq    %r15/*t008*/, %r15
   jmp     _DONE_25
_loopend_2:
   movq    $0, %rax
   jmp     _bail_1
_DONE_25:
   # return sink
   leave
   ret

.globl _Test_print
_Test_print:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_26:
   movq    %rbx, -16(%rbp)
   movq    %r12, -8(%rbp)
   # movq    %r13, %r13/*t015*/
   # movq    %r14, %r14/*t016*/
   # movq    %r15, %r15/*t017*/
   movq    %rdi, %r12/*t009*/
   movq    $0, %rbx/*t010*/
_looptest_10:
   cmpq    $10, %rbx/*t010*/
   jge     _loopend_8
_loopbody_9:
   # movq    %rbx/*t010*/, %rbx/*t012*/
   movq    %rbx/*t012*/, %rdx/*t056*/
   movq    (%r12/*t009*/), %rdi/*t107*/
   # movq    %rdi/*t107*/, %rdi/*t011*/
   movq    -8(%rdi/*t011*/), %rsi/*t108*/
   cmpq    %rsi/*t108*/, %rdx/*t056*/
   jae     _boundsbad_12
_boundsok_11:
   movq    (%rdi/*t011*/, %rbx/*t012*/, 8), %rdi/*t109*/
   # movq    %rdi/*t109*/, %rdi
   call    _cs411println
   # movq    %rbx/*t010*/, %rbx/*t110*/
   incq    %rbx/*t110*/
   # movq    %rbx/*t110*/, %rbx/*t010*/
   jmp     _looptest_10
_boundsbad_12:
   movq    $1, %rdi
   call    _cs411error
_bail_7:
   movq    -16(%rbp), %rbx/*t111*/
   # movq    %rbx/*t111*/, %rbx
   movq    -8(%rbp), %r12/*t112*/
   # movq    %r12/*t112*/, %r12
   # movq    %r13/*t015*/, %r13
   # movq    %r14/*t016*/, %r14
   # movq    %r15/*t017*/, %r15
   jmp     _DONE_27
_loopend_8:
   movq    $0, %rax
   jmp     _bail_7
_DONE_27:
   # return sink
   leave
   ret

.globl _Test_inspect
_Test_inspect:
   subq   $8, %rsp
_L_28:
   # movq    %rbx, %rbx/*t032*/
   # movq    %r12, %r12/*t033*/
   # movq    %r13, %r13/*t034*/
   # movq    %r14, %r14/*t035*/
   # movq    %r15, %r15/*t036*/
   # movq    %rdi, %rdi/*t018*/
   movq    $0, %rax/*t020*/
   movq    $0, %r9/*t021*/
   movq    $0, %r8/*t022*/
   movq    $0, %rdx/*t023*/
   movq    $0, %rsi/*t019*/
_looptest_16:
   cmpq    $10, %rsi/*t019*/
   jge     _loopend_14
_loopbody_15:
   # movq    %rax/*t020*/, %rax/*t062*/
   # movq    %rsi/*t019*/, %rsi/*t025*/
   movq    %rsi/*t025*/, %r11/*t061*/
   movq    (%rdi/*t018*/), %rcx/*t069*/
   # movq    %rcx/*t069*/, %rcx/*t024*/
   movq    -8(%rcx/*t024*/), %r10/*t070*/
   cmpq    %r10/*t070*/, %r11/*t061*/
   jae     _boundsbad_18
_boundsok_17:
   # movq    %rax/*t062*/, %rax/*t071*/
   movq    (%rcx/*t024*/, %rsi/*t025*/, 8), %rcx/*t072*/
   addq    %rcx/*t072*/, %rax/*t071*/
   # movq    %rax/*t071*/, %rax/*t020*/
   # movq    %r9/*t021*/, %r9/*t064*/
   # movq    %rsi/*t019*/, %rsi/*t027*/
   movq    %rsi/*t027*/, %r11/*t063*/
   movq    (%rdi/*t018*/), %rcx/*t073*/
   # movq    %rcx/*t073*/, %rcx/*t026*/
   movq    -8(%rcx/*t026*/), %r10/*t074*/
   cmpq    %r10/*t074*/, %r11/*t063*/
   jae     _boundsbad_18
_boundsok_19:
   # movq    %r9/*t064*/, %r9/*t075*/
   movq    (%rcx/*t026*/, %rsi/*t027*/, 8), %rcx/*t076*/
   addq    %rcx/*t076*/, %r9/*t075*/
   # movq    %r9/*t075*/, %r9/*t021*/
   # movq    %r8/*t022*/, %r8/*t066*/
   # movq    %rsi/*t019*/, %rsi/*t029*/
   movq    %rsi/*t029*/, %r11/*t065*/
   movq    (%rdi/*t018*/), %rcx/*t077*/
   # movq    %rcx/*t077*/, %rcx/*t028*/
   movq    -8(%rcx/*t028*/), %r10/*t078*/
   cmpq    %r10/*t078*/, %r11/*t065*/
   jae     _boundsbad_18
_boundsok_20:
   # movq    %r8/*t066*/, %r8/*t079*/
   movq    (%rcx/*t028*/, %rsi/*t029*/, 8), %rcx/*t080*/
   addq    %rcx/*t080*/, %r8/*t079*/
   # movq    %r8/*t079*/, %r8/*t022*/
   # movq    %rdx/*t023*/, %rdx/*t068*/
   # movq    %rsi/*t019*/, %rsi/*t031*/
   movq    %rsi/*t031*/, %r11/*t067*/
   movq    (%rdi/*t018*/), %rcx/*t081*/
   # movq    %rcx/*t081*/, %rcx/*t030*/
   movq    -8(%rcx/*t030*/), %r10/*t082*/
   cmpq    %r10/*t082*/, %r11/*t067*/
   jae     _boundsbad_18
_boundsok_21:
   # movq    %rdx/*t068*/, %rdx/*t083*/
   movq    (%rcx/*t030*/, %rsi/*t031*/, 8), %rcx/*t084*/
   addq    %rcx/*t084*/, %rdx/*t083*/
   # movq    %rdx/*t083*/, %rdx/*t023*/
   # movq    %rsi/*t019*/, %rsi/*t085*/
   incq    %rsi/*t085*/
   # movq    %rsi/*t085*/, %rsi/*t019*/
   jmp     _looptest_16
_boundsbad_18:
   movq    $1, %rdi
   call    _cs411error
_bail_13:
   # movq    %rbx/*t032*/, %rbx
   # movq    %r12/*t033*/, %r12
   # movq    %r13/*t034*/, %r13
   # movq    %r14/*t035*/, %r14
   # movq    %r15/*t036*/, %r15
   jmp     _DONE_29
_loopend_14:
   movq    $0, %rax
   jmp     _bail_13
_DONE_29:
   # return sink
   addq   $8, %rsp
   ret

.globl _Test_do
_Test_do:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_30:
   movq    %rbx, -8(%rbp)
   # movq    %r12, %r12/*t040*/
   # movq    %r13, %r13/*t041*/
   # movq    %r14, %r14/*t042*/
   # movq    %r15, %r15/*t043*/
   movq    %rdi, %rbx/*t037*/
   movq    %rbx/*t037*/, %rdi
   call    _Test_fill
   # movq    %rax, %rax/*t038*/
   movq    %rbx/*t037*/, %rdi
   call    _Test_inspect
   # movq    %rax, %rax/*t038*/
   movq    %rbx/*t037*/, %rdi
   call    _Test_print
   # movq    %rax, %rax/*t038*/
   movq    $0, %rax
_bail_22:
   movq    -8(%rbp), %rbx/*t135*/
   # movq    %rbx/*t135*/, %rbx
   # movq    %r12/*t040*/, %r12
   # movq    %r13/*t041*/, %r13
   # movq    %r14/*t042*/, %r14
   # movq    %r15/*t043*/, %r15
_DONE_31:
   # return sink
   leave
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_32:
   # movq    %rbx, %rbx/*t044*/
   # movq    %r12, %r12/*t045*/
   # movq    %r13, %r13/*t046*/
   # movq    %r14, %r14/*t047*/
   # movq    %r15, %r15/*t048*/
   movq    $8, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t087*/
   movq    %rax/*t087*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t086*/
   movq    %rax/*t086*/, %rdi
   call    _cs411println
   # movq    %rbx/*t044*/, %rbx
   # movq    %r12/*t045*/, %r12
   # movq    %r13/*t046*/, %r13
   # movq    %r14/*t047*/, %r14
   # movq    %r15/*t048*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
