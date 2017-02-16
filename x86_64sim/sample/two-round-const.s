   .text
.globl _Test_do
_Test_do:
   subq   $8, %rsp
_L_1177:
   # movq    %rbx, %rbx/*t3809*/
   # movq    %r12, %r12/*t3810*/
   # movq    %r13, %r13/*t3811*/
   # movq    %r14, %r14/*t3812*/
   # movq    %r15, %r15/*t3813*/
   # movq    %rdi, %rdi/*t3806*/
   # movq    %rdi/*t3806*/, %rdi
   call    _Test_something
   movq    $2, %rax
   # movq    %rbx/*t3809*/, %rbx
   # movq    %r12/*t3810*/, %r12
   # movq    %r13/*t3811*/, %r13
   # movq    %r14/*t3812*/, %r14
   # movq    %r15/*t3813*/, %r15
   # return sink
   addq   $8, %rsp
   ret

.globl _Test_something
_Test_something:
_L_1179:
   # movq    %rbx, %rbx/*t3815*/
   # movq    %r12, %r12/*t3816*/
   # movq    %r13, %r13/*t3817*/
   # movq    %r14, %r14/*t3818*/
   # movq    %r15, %r15/*t3819*/
   movq    $3, %rax
   # movq    %rbx/*t3815*/, %rbx
   # movq    %r12/*t3816*/, %r12
   # movq    %r13/*t3817*/, %r13
   # movq    %r14/*t3818*/, %r14
   # movq    %r15/*t3819*/, %r15
   # return sink
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_1181:
   # movq    %rbx, %rbx/*t3820*/
   # movq    %r12, %r12/*t3821*/
   # movq    %r13, %r13/*t3822*/
   # movq    %r14, %r14/*t3823*/
   # movq    %r15, %r15/*t3824*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3828*/
   movq    %rax/*t3828*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3827*/
   movq    %rax/*t3827*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3820*/, %rbx
   # movq    %r12/*t3821*/, %r12
   # movq    %r13/*t3822*/, %r13
   # movq    %r14/*t3823*/, %r14
   # movq    %r15/*t3824*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
