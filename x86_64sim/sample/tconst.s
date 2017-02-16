   .text
.globl _Test_do
_Test_do:
_L_1167:
   # movq    %rbx, %rbx/*t3788*/
   # movq    %r12, %r12/*t3789*/
   # movq    %r13, %r13/*t3790*/
   # movq    %r14, %r14/*t3791*/
   # movq    %r15, %r15/*t3792*/
   movq    $0, %rdi/*t3786*/
_looptest_1165:
   cmpq    $10, %rdi/*t3786*/
   jge     _loopend_1163
_loopbody_1164:
   # movq    %rdi/*t3786*/, %rdi/*t3798*/
   incq    %rdi/*t3798*/
   # movq    %rdi/*t3798*/, %rdi/*t3786*/
   jmp     _looptest_1165
_loopend_1163:
   movq    $72, %rax
   # movq    %rbx/*t3788*/, %rbx
   # movq    %r12/*t3789*/, %r12
   # movq    %r13/*t3790*/, %r13
   # movq    %r14/*t3791*/, %r14
   # movq    %r15/*t3792*/, %r15
   # return sink
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_1169:
   # movq    %rbx, %rbx/*t3793*/
   # movq    %r12, %r12/*t3794*/
   # movq    %r13, %r13/*t3795*/
   # movq    %r14, %r14/*t3796*/
   # movq    %r15, %r15/*t3797*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3802*/
   movq    %rax/*t3802*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3801*/
   movq    %rax/*t3801*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3793*/, %rbx
   # movq    %r12/*t3794*/, %r12
   # movq    %r13/*t3795*/, %r13
   # movq    %r14/*t3796*/, %r14
   # movq    %r15/*t3797*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
