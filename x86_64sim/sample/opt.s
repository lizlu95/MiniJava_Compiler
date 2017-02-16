   .text
.globl _Test_do
_Test_do:
_L_1080:
   # movq    %rbx, %rbx/*t3514*/
   # movq    %r12, %r12/*t3515*/
   # movq    %r13, %r13/*t3516*/
   # movq    %r14, %r14/*t3517*/
   # movq    %r15, %r15/*t3518*/
   movq    $0, %rdi/*t3510*/
   movq    $0, %rax/*t3512*/
_looptest_1078:
   cmpq    $10, %rdi/*t3510*/
   jge     _loopend_1076
_loopbody_1077:
   # movq    %rax/*t3512*/, %rax/*t3525*/
   movq    %rdi/*t3510*/, %rsi/*t3526*/
   incq    %rsi/*t3526*/
   addq    %rsi/*t3526*/, %rax/*t3525*/
   # movq    %rax/*t3525*/, %rax/*t3512*/
   # movq    %rdi/*t3510*/, %rdi/*t3527*/
   incq    %rdi/*t3527*/
   # movq    %rdi/*t3527*/, %rdi/*t3510*/
   jmp     _looptest_1078
_loopend_1076:
   # movq    %rax/*t3512*/, %rax
   # movq    %rbx/*t3514*/, %rbx
   # movq    %r12/*t3515*/, %r12
   # movq    %r13/*t3516*/, %r13
   # movq    %r14/*t3517*/, %r14
   # movq    %r15/*t3518*/, %r15
   # return sink
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_1082:
   # movq    %rbx, %rbx/*t3519*/
   # movq    %r12, %r12/*t3520*/
   # movq    %r13, %r13/*t3521*/
   # movq    %r14, %r14/*t3522*/
   # movq    %r15, %r15/*t3523*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3529*/
   movq    %rax/*t3529*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3528*/
   movq    %rax/*t3528*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3519*/, %rbx
   # movq    %r12/*t3520*/, %r12
   # movq    %r13/*t3521*/, %r13
   # movq    %r14/*t3522*/, %r14
   # movq    %r15/*t3523*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
