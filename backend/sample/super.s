.text
.globl _A_ainit
_A_ainit:
_L_10:
   movq    %rbx, %rsp/*t003*/
   movq    %r12, %rsp/*t004*/
   movq    %r13, %rsp/*t005*/
   movq    %r14, %rsp/*t006*/
   movq    %r15, %rsp/*t007*/
   movq    %rdi, %rsp/*t000*/
   movq    %rsi, %rsp/*t001*/
   movq    %rdx, %rsp/*t002*/
   movq    %rsp/*t001*/, (%rsp/*t000*/)
   movq    $8, %rsp/*t064*/
   # movq    %rsp/*t064*/, %rsp/*t063*/
   addq    %rsp/*t000*/, %rsp/*t063*/
   movq    %rsp/*t002*/, (%rsp/*t063*/)
   xorq    %rsp/*t065*/, %rsp/*t065*/
   movq    %rsp/*t065*/, %rax
_bail_1:
   movq    %rsp/*t003*/, %rbx
   movq    %rsp/*t004*/, %r12
   movq    %rsp/*t005*/, %r13
   movq    %rsp/*t006*/, %r14
   movq    %rsp/*t007*/, %r15
_DONE_11:
   # return sink
   ret

.text
.globl _A_getX
_A_getX:
_L_12:
   movq    %rbx, %rsp/*t009*/
   movq    %r12, %rsp/*t010*/
   movq    %r13, %rsp/*t011*/
   movq    %r14, %rsp/*t012*/
   movq    %r15, %rsp/*t013*/
   movq    %rdi, %rsp/*t008*/
   movq    (%rsp/*t008*/), %rsp/*t066*/
   movq    %rsp/*t066*/, %rax
_bail_2:
   movq    %rsp/*t009*/, %rbx
   movq    %rsp/*t010*/, %r12
   movq    %rsp/*t011*/, %r13
   movq    %rsp/*t012*/, %r14
   movq    %rsp/*t013*/, %r15
_DONE_13:
   # return sink
   ret

.text
.globl _A_getY
_A_getY:
_L_14:
   movq    %rbx, %rsp/*t015*/
   movq    %r12, %rsp/*t016*/
   movq    %r13, %rsp/*t017*/
   movq    %r14, %rsp/*t018*/
   movq    %r15, %rsp/*t019*/
   movq    %rdi, %rsp/*t014*/
   movq    $8, %rsp/*t069*/
   # movq    %rsp/*t069*/, %rsp/*t068*/
   addq    %rsp/*t014*/, %rsp/*t068*/
   movq    (%rsp/*t068*/), %rsp/*t067*/
   movq    %rsp/*t067*/, %rax
_bail_3:
   movq    %rsp/*t015*/, %rbx
   movq    %rsp/*t016*/, %r12
   movq    %rsp/*t017*/, %r13
   movq    %rsp/*t018*/, %r14
   movq    %rsp/*t019*/, %r15
_DONE_15:
   # return sink
   ret

.text
.globl _A_sum
_A_sum:
_L_16:
   movq    %rbx, %rsp/*t021*/
   movq    %r12, %rsp/*t022*/
   movq    %r13, %rsp/*t023*/
   movq    %r14, %rsp/*t024*/
   movq    %r15, %rsp/*t025*/
   movq    %rdi, %rsp/*t020*/
   movq    $8, %rsp/*t073*/
   # movq    %rsp/*t073*/, %rsp/*t072*/
   addq    %rsp/*t020*/, %rsp/*t072*/
   movq    (%rsp/*t072*/), %rsp/*t071*/
   # movq    %rsp/*t071*/, %rsp/*t070*/
   movq    (%rsp/*t020*/), %rsp/*t074*/
   addq    %rsp/*t074*/, %rsp/*t070*/
   movq    %rsp/*t070*/, %rax
_bail_4:
   movq    %rsp/*t021*/, %rbx
   movq    %rsp/*t022*/, %r12
   movq    %rsp/*t023*/, %r13
   movq    %rsp/*t024*/, %r14
   movq    %rsp/*t025*/, %r15
_DONE_17:
   # return sink
   ret

.text
.globl _B_binit
_B_binit:
   subq   $8, %rsp
_L_18:
   movq    %rbx, %rsp/*t031*/
   movq    %r12, %rsp/*t032*/
   movq    %r13, %rsp/*t033*/
   movq    %r14, %rsp/*t034*/
   movq    %r15, %rsp/*t035*/
   movq    %rdi, %rsp/*t026*/
   movq    %rsi, %rsp/*t027*/
   movq    %rdx, %rsp/*t028*/
   movq    %rcx, %rsp/*t029*/
   movq    %rsp/*t028*/, %rdx
   movq    %rsp/*t027*/, %rsi
   movq    %rsp/*t026*/, %rdi
   call    _A_ainit
   movq    %rax, %rsp/*t030*/
   movq    $16, %rsp/*t076*/
   # movq    %rsp/*t076*/, %rsp/*t075*/
   addq    %rsp/*t026*/, %rsp/*t075*/
   movq    %rsp/*t029*/, (%rsp/*t075*/)
   xorq    %rsp/*t077*/, %rsp/*t077*/
   movq    %rsp/*t077*/, %rax
_bail_5:
   movq    %rsp/*t031*/, %rbx
   movq    %rsp/*t032*/, %r12
   movq    %rsp/*t033*/, %r13
   movq    %rsp/*t034*/, %r14
   movq    %rsp/*t035*/, %r15
_DONE_19:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _B_getZ
_B_getZ:
_L_20:
   movq    %rbx, %rsp/*t037*/
   movq    %r12, %rsp/*t038*/
   movq    %r13, %rsp/*t039*/
   movq    %r14, %rsp/*t040*/
   movq    %r15, %rsp/*t041*/
   movq    %rdi, %rsp/*t036*/
   movq    $16, %rsp/*t080*/
   # movq    %rsp/*t080*/, %rsp/*t079*/
   addq    %rsp/*t036*/, %rsp/*t079*/
   movq    (%rsp/*t079*/), %rsp/*t078*/
   movq    %rsp/*t078*/, %rax
_bail_6:
   movq    %rsp/*t037*/, %rbx
   movq    %rsp/*t038*/, %r12
   movq    %rsp/*t039*/, %r13
   movq    %rsp/*t040*/, %r14
   movq    %rsp/*t041*/, %r15
_DONE_21:
   # return sink
   ret

.text
.globl _B_sum
_B_sum:
_L_22:
   movq    %rbx, %rsp/*t043*/
   movq    %r12, %rsp/*t044*/
   movq    %r13, %rsp/*t045*/
   movq    %r14, %rsp/*t046*/
   movq    %r15, %rsp/*t047*/
   movq    %rdi, %rsp/*t042*/
   movq    $16, %rsp/*t084*/
   # movq    %rsp/*t084*/, %rsp/*t083*/
   addq    %rsp/*t042*/, %rsp/*t083*/
   movq    (%rsp/*t083*/), %rsp/*t082*/
   # movq    %rsp/*t082*/, %rsp/*t081*/
   movq    $8, %rsp/*t088*/
   # movq    %rsp/*t088*/, %rsp/*t087*/
   addq    %rsp/*t042*/, %rsp/*t087*/
   movq    (%rsp/*t087*/), %rsp/*t086*/
   # movq    %rsp/*t086*/, %rsp/*t085*/
   movq    (%rsp/*t042*/), %rsp/*t089*/
   addq    %rsp/*t089*/, %rsp/*t085*/
   addq    %rsp/*t085*/, %rsp/*t081*/
   movq    %rsp/*t081*/, %rax
_bail_7:
   movq    %rsp/*t043*/, %rbx
   movq    %rsp/*t044*/, %r12
   movq    %rsp/*t045*/, %r13
   movq    %rsp/*t046*/, %r14
   movq    %rsp/*t047*/, %r15
_DONE_23:
   # return sink
   ret

.text
.globl _Test_do
_Test_do:
   subq   $8, %rsp
_L_24:
   movq    %rbx, %rsp/*t053*/
   movq    %r12, %rsp/*t054*/
   movq    %r13, %rsp/*t055*/
   movq    %r14, %rsp/*t056*/
   movq    %r15, %rsp/*t057*/
   movq    %rdi, %rsp/*t048*/
   xorq    %rsp/*t096*/, %rsp/*t096*/
   # movq    %rsp/*t096*/, %rsp/*t049*/
   xorq    %rsp/*t097*/, %rsp/*t097*/
   # movq    %rsp/*t097*/, %rsp/*t050*/
   xorq    %rsp/*t098*/, %rsp/*t098*/
   # movq    %rsp/*t098*/, %rsp/*t051*/
   movq    $16, %rsp/*t099*/
   movq    %rsp/*t099*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t049*/
   movq    $24, %rsp/*t100*/
   movq    %rsp/*t100*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t050*/
   # movq    %rsp/*t050*/, %rsp/*t051*/
   movq    $2, %rsp/*t101*/
   movq    %rsp/*t101*/, %rdx
   movq    $1, %rsp/*t102*/
   movq    %rsp/*t102*/, %rsi
   movq    %rsp/*t049*/, %rdi
   call    _A_ainit
   movq    %rax, %rsp/*t052*/
   movq    $3, %rsp/*t103*/
   movq    %rsp/*t103*/, %rcx
   movq    $2, %rsp/*t104*/
   movq    %rsp/*t104*/, %rdx
   movq    $1, %rsp/*t105*/
   movq    %rsp/*t105*/, %rsi
   movq    %rsp/*t050*/, %rdi
   call    _B_binit
   movq    %rax, %rsp/*t052*/
   movq    %rsp/*t049*/, %rdi
   call    _A_getX
   movq    %rax, %rsp/*t090*/
   movq    %rsp/*t090*/, %rdi
   call    _cs411println
   movq    %rsp/*t049*/, %rdi
   call    _A_getY
   movq    %rax, %rsp/*t091*/
   movq    %rsp/*t091*/, %rdi
   call    _cs411println
   movq    %rsp/*t050*/, %rdi
   call    _B_getZ
   movq    %rax, %rsp/*t092*/
   movq    %rsp/*t092*/, %rdi
   call    _cs411println
   movq    %rsp/*t049*/, %rdi
   call    _A_sum
   movq    %rax, %rsp/*t093*/
   movq    %rsp/*t093*/, %rdi
   call    _cs411println
   movq    %rsp/*t050*/, %rdi
   call    _B_sum
   movq    %rax, %rsp/*t094*/
   movq    %rsp/*t094*/, %rdi
   call    _cs411println
   movq    %rsp/*t051*/, %rdi
   call    _A_sum
   movq    %rax, %rsp/*t095*/
   movq    %rsp/*t095*/, %rdi
   call    _cs411println
   xorq    %rsp/*t106*/, %rsp/*t106*/
   movq    %rsp/*t106*/, %rax
_bail_8:
   movq    %rsp/*t053*/, %rbx
   movq    %rsp/*t054*/, %r12
   movq    %rsp/*t055*/, %r13
   movq    %rsp/*t056*/, %r14
   movq    %rsp/*t057*/, %r15
_DONE_25:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_26:
   movq    %rbx, %rsp/*t058*/
   movq    %r12, %rsp/*t059*/
   movq    %r13, %rsp/*t060*/
   movq    %r14, %rsp/*t061*/
   movq    %r15, %rsp/*t062*/
   xorq    %rsp/*t109*/, %rsp/*t109*/
   movq    %rsp/*t109*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t108*/
   movq    %rsp/*t108*/, %rdi
   call    _Test_do
   movq    %rax, %rsp/*t107*/
   movq    %rsp/*t107*/, %rdi
   call    _cs411println
_bail_9:
   movq    %rsp/*t058*/, %rbx
   movq    %rsp/*t059*/, %r12
   movq    %rsp/*t060*/, %r13
   movq    %rsp/*t061*/, %r14
   movq    %rsp/*t062*/, %r15
_DONE_27:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
