   .text
.globl _Test_do
_Test_do:
_L_1071:
   # movq    %rbx, %rbx/*t3492*/
   # movq    %r12, %r12/*t3493*/
   # movq    %r13, %r13/*t3494*/
   # movq    %r14, %r14/*t3495*/
   # movq    %r15, %r15/*t3496*/
   movq    $4, %rax
   # movq    %rbx/*t3492*/, %rbx
   # movq    %r12/*t3493*/, %r12
   # movq    %r13/*t3494*/, %r13
   # movq    %r14/*t3495*/, %r14
   # movq    %r15/*t3496*/, %r15
   # return sink
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_1073:
   # movq    %rbx, %rbx/*t3497*/
   # movq    %r12, %r12/*t3498*/
   # movq    %r13, %r13/*t3499*/
   # movq    %r14, %r14/*t3500*/
   # movq    %r15, %r15/*t3501*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3506*/
   movq    %rax/*t3506*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3505*/
   movq    %rax/*t3505*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3497*/, %rbx
   # movq    %r12/*t3498*/, %r12
   # movq    %r13/*t3499*/, %r13
   # movq    %r14/*t3500*/, %r14
   # movq    %r15/*t3501*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
