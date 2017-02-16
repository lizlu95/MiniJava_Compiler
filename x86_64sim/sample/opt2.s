   .text
.globl _Test_do
_Test_do:
_L_1089:
   # movq    %rbx, %rbx/*t3538*/
   # movq    %r12, %r12/*t3539*/
   # movq    %r13, %r13/*t3540*/
   # movq    %r14, %r14/*t3541*/
   # movq    %r15, %r15/*t3542*/
   movq    $0, %rdi/*t3536*/
   movq    $0, %rax/*t3537*/
_looptest_1087:
   cmpq    $10, %rdi/*t3536*/
   jge     _loopend_1085
_loopbody_1086:
   # movq    %rdi/*t3536*/, %rdi/*t3548*/
   incq    %rdi/*t3548*/
   # movq    %rdi/*t3548*/, %rdi/*t3536*/
   # movq    %rax/*t3537*/, %rax/*t3549*/
   addq    %rdi/*t3536*/, %rax/*t3549*/
   # movq    %rax/*t3549*/, %rax/*t3537*/
   jmp     _looptest_1087
_loopend_1085:
   # movq    %rax/*t3537*/, %rax
   # movq    %rbx/*t3538*/, %rbx
   # movq    %r12/*t3539*/, %r12
   # movq    %r13/*t3540*/, %r13
   # movq    %r14/*t3541*/, %r14
   # movq    %r15/*t3542*/, %r15
   # return sink
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_1091:
   # movq    %rbx, %rbx/*t3543*/
   # movq    %r12, %r12/*t3544*/
   # movq    %r13, %r13/*t3545*/
   # movq    %r14, %r14/*t3546*/
   # movq    %r15, %r15/*t3547*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3551*/
   movq    %rax/*t3551*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3550*/
   movq    %rax/*t3550*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3543*/, %rbx
   # movq    %r12/*t3544*/, %r12
   # movq    %r13/*t3545*/, %r13
   # movq    %r14/*t3546*/, %r14
   # movq    %r15/*t3547*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
