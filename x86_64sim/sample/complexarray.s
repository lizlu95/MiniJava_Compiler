   .text
.globl _Foo_do
_Foo_do:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_961:
   movq    %rbx, -32(%rbp)
   movq    %r12, -24(%rbp)
   movq    %r13, -16(%rbp)
   movq    %r14, -8(%rbp)
   # movq    %r15, %r15/*t3181*/
   movq    %rdi, %r13/*t3171*/
   # movq    %rsi, %rsi/*t3172*/
   movq    $0, %rbx/*t3174*/
   # movq    %rbx/*t3174*/, %rbx/*t3196*/
   movq    $5, %rsi
   movq    %r13/*t3171*/, %rdi
   call    _Foo_n
   # movq    %rax, %rax/*t3173*/
   movq    -8(%rax/*t3173*/), %r12/*t3216*/
   cmpq    %r12/*t3216*/, %rbx/*t3196*/
   jae     _boundsbad_955
_boundsok_954:
   movq    (%rax/*t3173*/, %rbx/*t3174*/, 8), %rbx/*t3217*/
   # movq    %rbx/*t3217*/, %rbx/*t3198*/
   movq    $0, %r12/*t3176*/
   # movq    %r12/*t3176*/, %r12/*t3197*/
   movq    $15, %rsi
   movq    %r13/*t3171*/, %rdi
   call    _Foo_n
   # movq    %rax, %rax/*t3175*/
   movq    -8(%rax/*t3175*/), %r13/*t3218*/
   cmpq    %r13/*t3218*/, %r12/*t3197*/
   jae     _boundsbad_955
_boundsok_956:
   # movq    %rbx/*t3198*/, %rbx/*t3219*/
   movq    (%rax/*t3175*/, %r12/*t3176*/, 8), %r12/*t3220*/
   addq    %r12/*t3220*/, %rbx/*t3219*/
   movq    %rbx/*t3219*/, %rax
_bail_953:
   movq    -32(%rbp), %rbx/*t3221*/
   # movq    %rbx/*t3221*/, %rbx
   movq    -24(%rbp), %r12/*t3222*/
   # movq    %r12/*t3222*/, %r12
   movq    -16(%rbp), %r13/*t3223*/
   # movq    %r13/*t3223*/, %r13
   movq    -8(%rbp), %r14/*t3224*/
   # movq    %r14/*t3224*/, %r14
   # movq    %r15/*t3181*/, %r15
   jmp     _DONE_962
_boundsbad_955:
   movq    $1, %rdi
   call    _cs411error
   jmp     _bail_953
_DONE_962:
   # return sink
   leave
   ret

.globl _Foo_n
_Foo_n:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_963:
   movq    %rbx, -16(%rbp)
   movq    %r12, -8(%rbp)
   # movq    %r13, %r13/*t3188*/
   # movq    %r14, %r14/*t3189*/
   # movq    %r15, %r15/*t3190*/
   movq    %rdi, %rbx/*t3182*/
   movq    %rsi, %r12/*t3183*/
   # movq    %rbx/*t3182*/, %rbx/*t3205*/
   movq    %r12/*t3183*/, %rdi
   call    _cs411newarray
   # movq    %rax, %rax/*t3204*/
   movq    %rax/*t3204*/, (%rbx/*t3205*/)
   movq    $0, %rsi/*t3185*/
   # movq    %rsi/*t3185*/, %rsi/*t3206*/
   movq    (%rbx/*t3182*/), %rdi/*t3236*/
   # movq    %rdi/*t3236*/, %rdi/*t3184*/
   movq    -8(%rdi/*t3184*/), %rdx/*t3237*/
   cmpq    %rdx/*t3237*/, %rsi/*t3206*/
   jae     _boundsbad_959
_boundsok_958:
   movq    %r12/*t3183*/, (%rdi/*t3184*/, %rsi/*t3185*/, 8)
   movq    (%rbx/*t3182*/), %rax/*t3238*/
   # movq    %rax/*t3238*/, %rax
_bail_957:
   movq    -16(%rbp), %rbx/*t3239*/
   # movq    %rbx/*t3239*/, %rbx
   movq    -8(%rbp), %r12/*t3240*/
   # movq    %r12/*t3240*/, %r12
   # movq    %r13/*t3188*/, %r13
   # movq    %r14/*t3189*/, %r14
   # movq    %r15/*t3190*/, %r15
   jmp     _DONE_964
_boundsbad_959:
   movq    $1, %rdi
   call    _cs411error
   jmp     _bail_957
_DONE_964:
   # return sink
   leave
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_965:
   # movq    %rbx, %rbx/*t3191*/
   # movq    %r12, %r12/*t3192*/
   # movq    %r13, %r13/*t3193*/
   # movq    %r14, %r14/*t3194*/
   # movq    %r15, %r15/*t3195*/
   movq    $8, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3211*/
   movq    $2, %rsi
   movq    %rax/*t3211*/, %rdi
   call    _Foo_do
   # movq    %rax, %rax/*t3210*/
   movq    %rax/*t3210*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3191*/, %rbx
   # movq    %r12/*t3192*/, %r12
   # movq    %r13/*t3193*/, %r13
   # movq    %r14/*t3194*/, %r14
   # movq    %r15/*t3195*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
