   .text
.globl _Test_do
_Test_do:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_947:
   movq    %rbx, -16(%rbp)
   movq    %r12, -8(%rbp)
   # movq    %r13, %r13/*t3137*/
   # movq    %r14, %r14/*t3138*/
   # movq    %r15, %r15/*t3139*/
   movq    %rdi, %r12/*t3130*/
   movq    $1, %rsi
   movq    %r12/*t3130*/, %rdi
   call    _Test_id
   movq    %rax, %rbx/*t3131*/
   movq    $2, %rsi
   movq    %r12/*t3130*/, %rdi
   call    _Test_id
   # movq    %rax, %rax/*t3132*/
   cmpq    %rax/*t3132*/, %rbx/*t3131*/
   jge     _L_943
_L_942:
   movq    %rbx/*t3131*/, %r12/*t3159*/
   imulq   %rax/*t3132*/, %r12/*t3159*/
   # movq    %r12/*t3159*/, %r12/*t3133*/
_L_944:
   # movq    %rbx/*t3131*/, %rbx/*t3160*/
   imulq   %rax/*t3132*/, %rbx/*t3160*/
   movq    %rbx/*t3160*/, %rax
_bail_941:
   movq    -16(%rbp), %rbx/*t3161*/
   # movq    %rbx/*t3161*/, %rbx
   movq    -8(%rbp), %r12/*t3162*/
   # movq    %r12/*t3162*/, %r12
   # movq    %r13/*t3137*/, %r13
   # movq    %r14/*t3138*/, %r14
   # movq    %r15/*t3139*/, %r15
   jmp     _DONE_948
_L_943:
   movq    %rbx/*t3131*/, %r12/*t3163*/
   imulq   %rax/*t3132*/, %r12/*t3163*/
   # movq    %r12/*t3163*/, %r12/*t3134*/
   jmp     _L_944
_DONE_948:
   # return sink
   leave
   ret

.globl _Test_id
_Test_id:
_L_949:
   # movq    %rbx, %rbx/*t3142*/
   # movq    %r12, %r12/*t3143*/
   # movq    %r13, %r13/*t3144*/
   # movq    %r14, %r14/*t3145*/
   # movq    %r15, %r15/*t3146*/
   # movq    %rsi, %rsi/*t3141*/
   movq    %rsi/*t3141*/, %rax
   # movq    %rbx/*t3142*/, %rbx
   # movq    %r12/*t3143*/, %r12
   # movq    %r13/*t3144*/, %r13
   # movq    %r14/*t3145*/, %r14
   # movq    %r15/*t3146*/, %r15
   # return sink
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_951:
   # movq    %rbx, %rbx/*t3147*/
   # movq    %r12, %r12/*t3148*/
   # movq    %r13, %r13/*t3149*/
   # movq    %r14, %r14/*t3150*/
   # movq    %r15, %r15/*t3151*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3156*/
   movq    %rax/*t3156*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3155*/
   movq    %rax/*t3155*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3147*/, %rbx
   # movq    %r12/*t3148*/, %r12
   # movq    %r13/*t3149*/, %r13
   # movq    %r14/*t3150*/, %r14
   # movq    %r15/*t3151*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
