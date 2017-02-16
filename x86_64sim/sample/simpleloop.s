   .text
.globl _Test_do
_Test_do:
_L_1122:
   # movq    %rbx, %rbx/*t3635*/
   # movq    %r12, %r12/*t3636*/
   # movq    %r13, %r13/*t3637*/
   # movq    %r14, %r14/*t3638*/
   # movq    %r15, %r15/*t3639*/
   movq    $0, %rax/*t3633*/
_looptest_1120:
   cmpq    $10, %rax/*t3633*/
   jge     _loopend_1118
_loopbody_1119:
   # movq    %rax/*t3633*/, %rax/*t3645*/
   incq    %rax/*t3645*/
   # movq    %rax/*t3645*/, %rax/*t3633*/
   jmp     _looptest_1120
_loopend_1118:
   # movq    %rax/*t3633*/, %rax/*t3646*/
   imulq    $5, %rax/*t3646*/
   # movq    %rax/*t3646*/, %rax
   # movq    %rbx/*t3635*/, %rbx
   # movq    %r12/*t3636*/, %r12
   # movq    %r13/*t3637*/, %r13
   # movq    %r14/*t3638*/, %r14
   # movq    %r15/*t3639*/, %r15
   # return sink
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_1124:
   # movq    %rbx, %rbx/*t3640*/
   # movq    %r12, %r12/*t3641*/
   # movq    %r13, %r13/*t3642*/
   # movq    %r14, %r14/*t3643*/
   # movq    %r15, %r15/*t3644*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3648*/
   movq    %rax/*t3648*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3647*/
   movq    %rax/*t3647*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3640*/, %rbx
   # movq    %r12/*t3641*/, %r12
   # movq    %r13/*t3642*/, %r13
   # movq    %r14/*t3643*/, %r14
   # movq    %r15/*t3644*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
