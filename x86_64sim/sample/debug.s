   .text
.globl _Test_do
_Test_do:
   subq   $8, %rsp
_L_996:
   # movq    %rbx, %rbx/*t3303*/
   # movq    %r12, %r12/*t3304*/
   # movq    %r13, %r13/*t3305*/
   # movq    %r14, %r14/*t3306*/
   # movq    %r15, %r15/*t3307*/
   movq    $1, %rdi
   call    _cs411println
   movq    $529, %rax
   # movq    %rbx/*t3303*/, %rbx
   # movq    %r12/*t3304*/, %r12
   # movq    %r13/*t3305*/, %r13
   # movq    %r14/*t3306*/, %r14
   # movq    %r15/*t3307*/, %r15
   # return sink
   addq   $8, %rsp
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_998:
   # movq    %rbx, %rbx/*t3308*/
   # movq    %r12, %r12/*t3309*/
   # movq    %r13, %r13/*t3310*/
   # movq    %r14, %r14/*t3311*/
   # movq    %r15, %r15/*t3312*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3315*/
   movq    %rax/*t3315*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3314*/
   movq    %rax/*t3314*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3308*/, %rbx
   # movq    %r12/*t3309*/, %r12
   # movq    %r13/*t3310*/, %r13
   # movq    %r14/*t3311*/, %r14
   # movq    %r15/*t3312*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
