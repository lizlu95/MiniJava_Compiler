   .text
.globl _Foo_doit
_Foo_doit:
   subq   $8, %rsp
_L_915:
   # movq    %rbx, %rbx/*t3030*/
   # movq    %r12, %r12/*t3031*/
   # movq    %r13, %r13/*t3032*/
   # movq    %r14, %r14/*t3033*/
   # movq    %r15, %r15/*t3034*/
   movq    $2, %rdi
   call    _cs411newarray
   # movq    %rax, %rax/*t3023*/
   movq    $0, %rdx/*t3025*/
   movq    $0, %rsi/*t3040*/
   # movq    %rax/*t3023*/, %rax/*t3024*/
   movq    -8(%rax/*t3024*/), %rdi/*t3043*/
   cmpq    %rdi/*t3043*/, %rsi/*t3040*/
   jae     _boundsbad_911
_boundsok_910:
   movq    $0, %rdi/*t3044*/
   movq    %rdi/*t3044*/, (%rax/*t3024*/, %rdx/*t3025*/, 8)
   movq    $1, %rdx/*t3027*/
   movq    $1, %rsi/*t3041*/
   # movq    %rax/*t3023*/, %rax/*t3026*/
   movq    -8(%rax/*t3026*/), %rdi/*t3045*/
   cmpq    %rdi/*t3045*/, %rsi/*t3041*/
   jae     _boundsbad_911
_boundsok_912:
   movq    $1, %rdi/*t3046*/
   movq    %rdi/*t3046*/, (%rax/*t3026*/, %rdx/*t3027*/, 8)
   movq    $2, %rdx/*t3029*/
   movq    $2, %rsi/*t3042*/
   # movq    %rax/*t3023*/, %rax/*t3028*/
   movq    -8(%rax/*t3028*/), %rdi/*t3047*/
   cmpq    %rdi/*t3047*/, %rsi/*t3042*/
   jae     _boundsbad_911
_boundsok_913:
   movq    $2, %rdi/*t3048*/
   movq    %rdi/*t3048*/, (%rax/*t3028*/, %rdx/*t3029*/, 8)
   movq    $0, %rax
_bail_909:
   # movq    %rbx/*t3030*/, %rbx
   # movq    %r12/*t3031*/, %r12
   # movq    %r13/*t3032*/, %r13
   # movq    %r14/*t3033*/, %r14
   # movq    %r15/*t3034*/, %r15
   jmp     _DONE_916
_boundsbad_911:
   movq    $1, %rdi
   call    _cs411error
   jmp     _bail_909
_DONE_916:
   # return sink
   addq   $8, %rsp
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_917:
   # movq    %rbx, %rbx/*t3035*/
   # movq    %r12, %r12/*t3036*/
   # movq    %r13, %r13/*t3037*/
   # movq    %r14, %r14/*t3038*/
   # movq    %r15, %r15/*t3039*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3050*/
   movq    %rax/*t3050*/, %rdi
   call    _Foo_doit
   # movq    %rax, %rax/*t3049*/
   movq    %rax/*t3049*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3035*/, %rbx
   # movq    %r12/*t3036*/, %r12
   # movq    %r13/*t3037*/, %r13
   # movq    %r14/*t3038*/, %r14
   # movq    %r15/*t3039*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
