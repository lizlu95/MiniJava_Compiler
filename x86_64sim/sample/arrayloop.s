   .text
.globl _Foo_doit
_Foo_doit:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_933:
   movq    %rbx, -16(%rbp)
   movq    %r12, -8(%rbp)
   # movq    %r13, %r13/*t3062*/
   # movq    %r14, %r14/*t3063*/
   # movq    %r15, %r15/*t3064*/
   movq    %rdi, %r12/*t3057*/
   movq    %rsi, %rbx/*t3058*/
   movq    %rbx/*t3058*/, %rsi
   movq    %r12/*t3057*/, %rdi
   call    _Foo_init
   # movq    %rax, %rax/*t3059*/
   movq    %rbx/*t3058*/, %rsi
   movq    %r12/*t3057*/, %rdi
   call    _Foo_sum
   # movq    %rax, %rax
_bail_919:
   movq    -16(%rbp), %rbx/*t3108*/
   # movq    %rbx/*t3108*/, %rbx
   movq    -8(%rbp), %r12/*t3109*/
   # movq    %r12/*t3109*/, %r12
   # movq    %r13/*t3062*/, %r13
   # movq    %r14/*t3063*/, %r14
   # movq    %r15/*t3064*/, %r15
_DONE_934:
   # return sink
   leave
   ret

.globl _Foo_init
_Foo_init:
   subq   $8, %rsp
_L_935:
   # movq    %rbx, %rbx/*t3070*/
   # movq    %r12, %r12/*t3071*/
   # movq    %r13, %r13/*t3072*/
   # movq    %r14, %r14/*t3073*/
   # movq    %r15, %r15/*t3074*/
   # movq    %rsi, %rsi/*t3066*/
   movq    $0, %rdi/*t3067*/
_looptest_923:
   movq    -8(%rsi/*t3066*/), %rdx/*t3093*/
   cmpq    %rdx/*t3093*/, %rdi/*t3067*/
   jge     _loopend_921
_loopbody_922:
   # movq    %rdi/*t3067*/, %rdi/*t3069*/
   movq    %rdi/*t3069*/, %rcx/*t3092*/
   # movq    %rsi/*t3066*/, %rsi/*t3068*/
   movq    -8(%rsi/*t3068*/), %rdx/*t3094*/
   cmpq    %rdx/*t3094*/, %rcx/*t3092*/
   jae     _boundsbad_925
_boundsok_924:
   movq    %rdi/*t3067*/, %rdx/*t3095*/
   incq    %rdx/*t3095*/
   movq    %rdx/*t3095*/, (%rsi/*t3068*/, %rdi/*t3069*/, 8)
   # movq    %rdi/*t3067*/, %rdi/*t3096*/
   incq    %rdi/*t3096*/
   # movq    %rdi/*t3096*/, %rdi/*t3067*/
   jmp     _looptest_923
_boundsbad_925:
   movq    $1, %rdi
   call    _cs411error
_bail_920:
   # movq    %rbx/*t3070*/, %rbx
   # movq    %r12/*t3071*/, %r12
   # movq    %r13/*t3072*/, %r13
   # movq    %r14/*t3073*/, %r14
   # movq    %r15/*t3074*/, %r15
   jmp     _DONE_936
_loopend_921:
   movq    $0, %rax
   jmp     _bail_920
_DONE_936:
   # return sink
   addq   $8, %rsp
   ret

.globl _Foo_sum
_Foo_sum:
   subq   $8, %rsp
_L_937:
   # movq    %rbx, %rbx/*t3082*/
   # movq    %r12, %r12/*t3083*/
   # movq    %r13, %r13/*t3084*/
   # movq    %r14, %r14/*t3085*/
   # movq    %r15, %r15/*t3086*/
   # movq    %rsi, %rsi/*t3076*/
   movq    $0, %rdi/*t3077*/
   movq    $0, %rax/*t3078*/
   movq    -8(%rsi/*t3076*/), %rdx/*t3099*/
   # movq    %rdx/*t3099*/, %rdx/*t3079*/
_looptest_929:
   cmpq    %rdx/*t3079*/, %rdi/*t3077*/
   jge     _loopend_927
_loopbody_928:
   # movq    %rax/*t3078*/, %rax/*t3098*/
   # movq    %rdi/*t3077*/, %rdi/*t3081*/
   movq    %rdi/*t3081*/, %r8/*t3097*/
   # movq    %rsi/*t3076*/, %rsi/*t3080*/
   movq    -8(%rsi/*t3080*/), %rcx/*t3100*/
   cmpq    %rcx/*t3100*/, %r8/*t3097*/
   jae     _boundsbad_931
_boundsok_930:
   # movq    %rax/*t3098*/, %rax/*t3101*/
   movq    (%rsi/*t3080*/, %rdi/*t3081*/, 8), %rcx/*t3102*/
   addq    %rcx/*t3102*/, %rax/*t3101*/
   # movq    %rax/*t3101*/, %rax/*t3078*/
   # movq    %rdi/*t3077*/, %rdi/*t3103*/
   incq    %rdi/*t3103*/
   # movq    %rdi/*t3103*/, %rdi/*t3077*/
   jmp     _looptest_929
_boundsbad_931:
   movq    $1, %rdi
   call    _cs411error
_bail_926:
   # movq    %rbx/*t3082*/, %rbx
   # movq    %r12/*t3083*/, %r12
   # movq    %r13/*t3084*/, %r13
   # movq    %r14/*t3085*/, %r14
   # movq    %r15/*t3086*/, %r15
   jmp     _DONE_938
_loopend_927:
   # movq    %rax/*t3078*/, %rax
   jmp     _bail_926
_DONE_938:
   # return sink
   addq   $8, %rsp
   ret

.globl _cs411main
_cs411main:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_939:
   movq    %rbx, -8(%rbp)
   # movq    %r12, %r12/*t3088*/
   # movq    %r13, %r13/*t3089*/
   # movq    %r14, %r14/*t3090*/
   # movq    %r15, %r15/*t3091*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3105*/
   movq    %rax/*t3105*/, %rbx/*t3107*/
   movq    $10, %rdi
   call    _cs411newarray
   # movq    %rax, %rax/*t3106*/
   movq    %rax/*t3106*/, %rsi
   movq    %rbx/*t3107*/, %rdi
   call    _Foo_doit
   # movq    %rax, %rax/*t3104*/
   movq    %rax/*t3104*/, %rdi
   call    _cs411println
_bail_932:
   movq    -8(%rbp), %rbx/*t3126*/
   # movq    %rbx/*t3126*/, %rbx
   # movq    %r12/*t3088*/, %r12
   # movq    %r13/*t3089*/, %r13
   # movq    %r14/*t3090*/, %r14
   # movq    %r15/*t3091*/, %r15
_DONE_940:
   # return sink
   leave
   ret

   .ident	"minijavac: cs411 course project 2011w2"
