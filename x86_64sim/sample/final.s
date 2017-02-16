   .text
.globl _O_m
_O_m:
_L_1034:
   # movq    %rbx, %rbx/*t3366*/
   # movq    %r12, %r12/*t3367*/
   # movq    %r13, %r13/*t3368*/
   # movq    %r14, %r14/*t3369*/
   # movq    %r15, %r15/*t3370*/
   movq    $3, %rax
   # movq    %rbx/*t3366*/, %rbx
   # movq    %r12/*t3367*/, %r12
   # movq    %r13/*t3368*/, %r13
   # movq    %r14/*t3369*/, %r14
   # movq    %r15/*t3370*/, %r15
   # return sink
   ret

.globl _Test_do
_Test_do:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_1036:
   movq    %rbx, -8(%rbp)
   movq    %r12, -24(%rbp)
   movq    %r13, -16(%rbp)
   # movq    %r14, %r14/*t3384*/
   # movq    %r15, %r15/*t3385*/
   # movq    %rdi, %rdi/*t3371*/
   movq    $4, %rdi
   call    _cs411newarray
   movq    %rax, %rbx/*t3372*/
   movq    $3, %r12/*t3376*/
   # movq    %r12/*t3376*/, %r12/*t3391*/
   # movq    %rbx/*t3372*/, %rbx/*t3375*/
   movq    -8(%rbx/*t3375*/), %r13/*t3418*/
   cmpq    %r13/*t3418*/, %r12/*t3391*/
   jae     _boundsbad_1026
_boundsok_1025:
   movq    $11, %r13/*t3419*/
   movq    %r13/*t3419*/, (%rbx/*t3375*/, %r12/*t3376*/, 8)
   movq    $1, %r13/*t3373*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3374*/
   movq    $1, %r12/*t3380*/
   movq    $3, %rdi/*t3378*/
   # movq    %rdi/*t3378*/, %rdi/*t3392*/
   # movq    %rbx/*t3372*/, %rbx/*t3377*/
   movq    -8(%rbx/*t3377*/), %rsi/*t3420*/
   cmpq    %rsi/*t3420*/, %rdi/*t3392*/
   jae     _boundsbad_1026
_boundsok_1027:
   movq    (%rbx/*t3377*/, %rdi/*t3378*/, 8), %rbx/*t3421*/
   # movq    %rbx/*t3421*/, %rbx/*t3393*/
   # movq    %rax/*t3374*/, %rax/*t3379*/
   cmpq    $0, %rax/*t3379*/
   je      _L_1029
_L_1028:
   movq    $1, %rdx
   movq    $6, %rsi
   movq    %rax/*t3379*/, %rdi
   call    _O_m
   cmpq    %rax, %rbx/*t3393*/
   jge     _L_1032
_L_1030:
   cmpq    $0, %r13/*t3373*/
   je      _L_1032
_L_1031:
   movq    %r12/*t3380*/, %r13/*t3373*/
   movq    $2, %rax
_bail_1024:
   movq    -8(%rbp), %rbx/*t3422*/
   # movq    %rbx/*t3422*/, %rbx
   movq    -24(%rbp), %r12/*t3423*/
   # movq    %r12/*t3423*/, %r12
   movq    -16(%rbp), %r13/*t3424*/
   # movq    %r13/*t3424*/, %r13
   # movq    %r14/*t3384*/, %r14
   # movq    %r15/*t3385*/, %r15
   jmp     _DONE_1037
_boundsbad_1026:
   movq    $1, %rdi
   call    _cs411error
   jmp     _bail_1024
_L_1029:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1024
_L_1032:
   movq    $0, %r12/*t3380*/
   jmp     _L_1031
_DONE_1037:
   # return sink
   leave
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_1038:
   # movq    %rbx, %rbx/*t3386*/
   # movq    %r12, %r12/*t3387*/
   # movq    %r13, %r13/*t3388*/
   # movq    %r14, %r14/*t3389*/
   # movq    %r15, %r15/*t3390*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3399*/
   movq    %rax/*t3399*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3398*/
   movq    %rax/*t3398*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3386*/, %rbx
   # movq    %r12/*t3387*/, %r12
   # movq    %r13/*t3388*/, %r13
   # movq    %r14/*t3389*/, %r14
   # movq    %r15/*t3390*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
