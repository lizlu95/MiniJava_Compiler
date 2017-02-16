   .text
.globl _Test_do
_Test_do:
_L_1107:
   # movq    %rbx, %rbx/*t3590*/
   # movq    %r12, %r12/*t3591*/
   # movq    %r13, %r13/*t3592*/
   # movq    %r14, %r14/*t3593*/
   # movq    %r15, %r15/*t3594*/
   movq    $0, %rdi/*t3586*/
_looptest_1105:
   cmpq    $10, %rdi/*t3586*/
   jge     _loopend_1103
_loopbody_1104:
   # movq    %rdi/*t3586*/, %rdi/*t3604*/
   incq    %rdi/*t3604*/
   # movq    %rdi/*t3604*/, %rdi/*t3586*/
   jmp     _looptest_1105
_loopend_1103:
   movq    $-29, %rax
   # movq    %rbx/*t3590*/, %rbx
   # movq    %r12/*t3591*/, %r12
   # movq    %r13/*t3592*/, %r13
   # movq    %r14/*t3593*/, %r14
   # movq    %r15/*t3594*/, %r15
   # return sink
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_1109:
   # movq    %rbx, %rbx/*t3595*/
   # movq    %r12, %r12/*t3596*/
   # movq    %r13, %r13/*t3597*/
   # movq    %r14, %r14/*t3598*/
   # movq    %r15, %r15/*t3599*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3610*/
   movq    %rax/*t3610*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3609*/
   movq    %rax/*t3609*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3595*/, %rbx
   # movq    %r12/*t3596*/, %r12
   # movq    %r13/*t3597*/, %r13
   # movq    %r14/*t3598*/, %r14
   # movq    %r15/*t3599*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
