   .text
.globl _cs411main
_cs411main:
   pushq  %rbp
   movq   %rsp, %rbp
_L_1:
   # movq    %rbx, %rbx/*t000*/
   # movq    %r12, %r12/*t001*/
   # movq    %r13, %r13/*t002*/
   # movq    %r14, %r14/*t003*/
   # movq    %r15, %r15/*t004*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t063*/
   movq    %rax/*t063*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t062*/
   movq    %rax/*t062*/, %rdi
   call    _cs411println
   # movq    %rbx/*t000*/, %rbx
   # movq    %r12/*t001*/, %r12
   # movq    %r13/*t002*/, %r13
   # movq    %r14/*t003*/, %r14
   # movq    %r15/*t004*/, %r15
_DONE_2:
   #return sink
   leave
   ret

.globl _A_ainit
_A_ainit:
   pushq  %rbp
   movq   %rsp, %rbp
_L_3:
   # movq    %rbx, %rbx/*t008*/
   # movq    %r12, %r12/*t009*/
   # movq    %r13, %r13/*t010*/
   # movq    %r14, %r14/*t011*/
   # movq    %r15, %r15/*t012*/
   # movq    %rdi, %rdi/*t005*/
   # movq    %rsi, %rsi/*t006*/
   # movq    %rdx, %rdx/*t007*/
   movq    %rsi/*t006*/, (%rdi/*t005*/)
   movq    %rdx/*t007*/, 8(%rdi/*t005*/)
   movq    $0, %rax
   # movq    %rbx/*t008*/, %rbx
   # movq    %r12/*t009*/, %r12
   # movq    %r13/*t010*/, %r13
   # movq    %r14/*t011*/, %r14
   # movq    %r15/*t012*/, %r15
_DONE_4:
   #return sink
   leave
   ret

.globl _A_getX
_A_getX:
   pushq  %rbp
   movq   %rsp, %rbp
_L_5:
   # movq    %rbx, %rbx/*t014*/
   # movq    %r12, %r12/*t015*/
   # movq    %r13, %r13/*t016*/
   # movq    %r14, %r14/*t017*/
   # movq    %r15, %r15/*t018*/
   # movq    %rdi, %rdi/*t013*/
   movq    (%rdi/*t013*/), %rax/*t064*/
   # movq    %rax/*t064*/, %rax
   # movq    %rbx/*t014*/, %rbx
   # movq    %r12/*t015*/, %r12
   # movq    %r13/*t016*/, %r13
   # movq    %r14/*t017*/, %r14
   # movq    %r15/*t018*/, %r15
_DONE_6:
   #return sink
   leave
   ret

.globl _A_getY
_A_getY:
   pushq  %rbp
   movq   %rsp, %rbp
_L_7:
   # movq    %rbx, %rbx/*t020*/
   # movq    %r12, %r12/*t021*/
   # movq    %r13, %r13/*t022*/
   # movq    %r14, %r14/*t023*/
   # movq    %r15, %r15/*t024*/
   # movq    %rdi, %rdi/*t019*/
   movq    8(%rdi/*t019*/), %rax/*t065*/
   # movq    %rax/*t065*/, %rax
   # movq    %rbx/*t020*/, %rbx
   # movq    %r12/*t021*/, %r12
   # movq    %r13/*t022*/, %r13
   # movq    %r14/*t023*/, %r14
   # movq    %r15/*t024*/, %r15
_DONE_8:
   #return sink
   leave
   ret

.globl _A_sum
_A_sum:
   pushq  %rbp
   movq   %rsp, %rbp
_L_9:
   # movq    %rbx, %rbx/*t026*/
   # movq    %r12, %r12/*t027*/
   # movq    %r13, %r13/*t028*/
   # movq    %r14, %r14/*t029*/
   # movq    %r15, %r15/*t030*/
   # movq    %rdi, %rdi/*t025*/
   movq    (%rdi/*t025*/), %rax/*t067*/
   # movq    %rax/*t067*/, %rax/*t066*/
   movq    8(%rdi/*t025*/), %rdi/*t068*/
   addq    %rdi/*t068*/, %rax/*t066*/
   # movq    %rax/*t066*/, %rax
   # movq    %rbx/*t026*/, %rbx
   # movq    %r12/*t027*/, %r12
   # movq    %r13/*t028*/, %r13
   # movq    %r14/*t029*/, %r14
   # movq    %r15/*t030*/, %r15
_DONE_10:
   #return sink
   leave
   ret

.globl _B_binit
_B_binit:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_11:
   movq    %rbx, -16(%rbp)
   movq    %r12, -8(%rbp)
   # movq    %r13, %r13/*t038*/
   # movq    %r14, %r14/*t039*/
   # movq    %r15, %r15/*t040*/
   movq    %rdi, %r12/*t031*/
   # movq    %rsi, %rsi/*t032*/
   # movq    %rdx, %rdx/*t033*/
   movq    %rcx, %rbx/*t034*/
   # movq    %rdx/*t033*/, %rdx
   # movq    %rsi/*t032*/, %rsi
   movq    %r12/*t031*/, %rdi
   call    _A_ainit
   # movq    %rax, %rax/*t035*/
   movq    %rbx/*t034*/, 16(%r12/*t031*/)
   movq    $0, %rax
   movq    -16(%rbp), %rbx/*t095*/
   # movq    %rbx/*t095*/, %rbx
   movq    -8(%rbp), %r12/*t096*/
   # movq    %r12/*t096*/, %r12
   # movq    %r13/*t038*/, %r13
   # movq    %r14/*t039*/, %r14
   # movq    %r15/*t040*/, %r15
_DONE_12:
   #return sink
   leave
   ret

.globl _B_getZ
_B_getZ:
   pushq  %rbp
   movq   %rsp, %rbp
_L_13:
   # movq    %rbx, %rbx/*t042*/
   # movq    %r12, %r12/*t043*/
   # movq    %r13, %r13/*t044*/
   # movq    %r14, %r14/*t045*/
   # movq    %r15, %r15/*t046*/
   # movq    %rdi, %rdi/*t041*/
   movq    16(%rdi/*t041*/), %rax/*t069*/
   # movq    %rax/*t069*/, %rax
   # movq    %rbx/*t042*/, %rbx
   # movq    %r12/*t043*/, %r12
   # movq    %r13/*t044*/, %r13
   # movq    %r14/*t045*/, %r14
   # movq    %r15/*t046*/, %r15
_DONE_14:
   #return sink
   leave
   ret

.globl _B_sum
_B_sum:
   pushq  %rbp
   movq   %rsp, %rbp
_L_15:
   # movq    %rbx, %rbx/*t048*/
   # movq    %r12, %r12/*t049*/
   # movq    %r13, %r13/*t050*/
   # movq    %r14, %r14/*t051*/
   # movq    %r15, %r15/*t052*/
   # movq    %rdi, %rdi/*t047*/
   movq    (%rdi/*t047*/), %rax/*t072*/
   # movq    %rax/*t072*/, %rax/*t071*/
   movq    8(%rdi/*t047*/), %rsi/*t073*/
   addq    %rsi/*t073*/, %rax/*t071*/
   # movq    %rax/*t071*/, %rax/*t070*/
   movq    16(%rdi/*t047*/), %rdi/*t074*/
   addq    %rdi/*t074*/, %rax/*t070*/
   # movq    %rax/*t070*/, %rax
   # movq    %rbx/*t048*/, %rbx
   # movq    %r12/*t049*/, %r12
   # movq    %r13/*t050*/, %r13
   # movq    %r14/*t051*/, %r14
   # movq    %r15/*t052*/, %r15
_DONE_16:
   #return sink
   leave
   ret

.globl _Test_do
_Test_do:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_17:
   movq    %rbx, -16(%rbp)
   movq    %r12, -8(%rbp)
   # movq    %r13, %r13/*t059*/
   # movq    %r14, %r14/*t060*/
   # movq    %r15, %r15/*t061*/
   # movq    %rdi, %rdi/*t053*/
   movq    $16, %rdi
   call    _cs411newobject
   movq    %rax, %r12/*t054*/
   movq    $24, %rdi
   call    _cs411newobject
   movq    %rax, %rbx/*t055*/
   movq    $2, %rdx
   movq    $1, %rsi
   movq    %r12/*t054*/, %rdi
   call    _A_ainit
   # movq    %rax, %rax/*t056*/
   movq    $3, %rcx
   movq    $2, %rdx
   movq    $1, %rsi
   movq    %rbx/*t055*/, %rdi
   call    _B_binit
   # movq    %rax, %rax/*t056*/
   movq    %r12/*t054*/, %rdi
   call    _A_getX
   # movq    %rax, %rax/*t075*/
   movq    %rax/*t075*/, %rdi
   call    _cs411println
   movq    %r12/*t054*/, %rdi
   call    _A_getY
   # movq    %rax, %rax/*t076*/
   movq    %rax/*t076*/, %rdi
   call    _cs411println
   movq    %rbx/*t055*/, %rdi
   call    _B_getZ
   # movq    %rax, %rax/*t077*/
   movq    %rax/*t077*/, %rdi
   call    _cs411println
   movq    %r12/*t054*/, %rdi
   call    _A_sum
   # movq    %rax, %rax/*t078*/
   movq    %rax/*t078*/, %rdi
   call    _cs411println
   movq    %rbx/*t055*/, %rdi
   call    _B_sum
   # movq    %rax, %rax/*t079*/
   movq    %rax/*t079*/, %rdi
   call    _cs411println
   movq    $0, %rax
   movq    -16(%rbp), %rbx/*t113*/
   # movq    %rbx/*t113*/, %rbx
   movq    -8(%rbp), %r12/*t114*/
   # movq    %r12/*t114*/, %r12
   # movq    %r13/*t059*/, %r13
   # movq    %r14/*t060*/, %r14
   # movq    %r15/*t061*/, %r15
_DONE_18:
   #return sink
   leave
   ret

    .data
    .align 4
_A_vtable:
    .quad _A_ainit
    .quad _A_getX
    .quad _A_getY
    .quad _A_sum
_B_vtable:
    .quad _A_ainit
    .quad _A_getX
    .quad _A_getY
    .quad _B_sum
    .quad _B_binit
    .quad _B_getZ

    movq	$_B_vtable, %rdi

   .ident	"minijavac: cs411 course project 2011w2"
