   .text
.globl _Test_do
_Test_do:
   subq   $8, %rsp
_L_1005:
   # movq    %rbx, %rbx/*t3321*/
   # movq    %r12, %r12/*t3322*/
   # movq    %r13, %r13/*t3323*/
   # movq    %r14, %r14/*t3324*/
   # movq    %r15, %r15/*t3325*/
   movq    $1, %rdi
   call    _cs411println
   movq    $23, %rax
   # movq    %rbx/*t3321*/, %rbx
   # movq    %r12/*t3322*/, %r12
   # movq    %r13/*t3323*/, %r13
   # movq    %r14/*t3324*/, %r14
   # movq    %r15/*t3325*/, %r15
   # return sink
   addq   $8, %rsp
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_1007:
   # movq    %rbx, %rbx/*t3326*/
   # movq    %r12, %r12/*t3327*/
   # movq    %r13, %r13/*t3328*/
   # movq    %r14, %r14/*t3329*/
   # movq    %r15, %r15/*t3330*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3332*/
   movq    %rax/*t3332*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3331*/
   movq    %rax/*t3331*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3326*/, %rbx
   # movq    %r12/*t3327*/, %r12
   # movq    %r13/*t3328*/, %r13
   # movq    %r14/*t3329*/, %r14
   # movq    %r15/*t3330*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
