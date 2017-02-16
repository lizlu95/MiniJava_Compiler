   .text
.globl _Test_do
_Test_do:
_L_1098:
   # movq    %rbx, %rbx/*t3562*/
   # movq    %r12, %r12/*t3563*/
   # movq    %r13, %r13/*t3564*/
   # movq    %r14, %r14/*t3565*/
   # movq    %r15, %r15/*t3566*/
   movq    $0, %rdi/*t3558*/
_looptest_1096:
   cmpq    $10, %rdi/*t3558*/
   jge     _loopend_1094
_loopbody_1095:
   # movq    %rdi/*t3558*/, %rdi/*t3575*/
   incq    %rdi/*t3575*/
   # movq    %rdi/*t3575*/, %rdi/*t3558*/
   jmp     _looptest_1096
_loopend_1094:
   movq    $-24, %rax
   # movq    %rbx/*t3562*/, %rbx
   # movq    %r12/*t3563*/, %r12
   # movq    %r13/*t3564*/, %r13
   # movq    %r14/*t3565*/, %r14
   # movq    %r15/*t3566*/, %r15
   # return sink
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_1100:
   # movq    %rbx, %rbx/*t3567*/
   # movq    %r12, %r12/*t3568*/
   # movq    %r13, %r13/*t3569*/
   # movq    %r14, %r14/*t3570*/
   # movq    %r15, %r15/*t3571*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3581*/
   movq    %rax/*t3581*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3580*/
   movq    %rax/*t3580*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3567*/, %rbx
   # movq    %r12/*t3568*/, %r12
   # movq    %r13/*t3569*/, %r13
   # movq    %r14/*t3570*/, %r14
   # movq    %r15/*t3571*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
