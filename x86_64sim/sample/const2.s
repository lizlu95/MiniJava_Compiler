   .text
.globl _Test_do
_Test_do:
_L_987:
   # movq    %rbx, %rbx/*t3279*/
   # movq    %r12, %r12/*t3280*/
   # movq    %r13, %r13/*t3281*/
   # movq    %r14, %r14/*t3282*/
   # movq    %r15, %r15/*t3283*/
   movq    $0, %rdi/*t3275*/
_looptest_979:
   cmpq    $10, %rdi/*t3275*/
   jge     _loopend_977
_loopbody_978:
   # movq    %rdi/*t3275*/, %rdi/*t3290*/
   incq    %rdi/*t3290*/
   # movq    %rdi/*t3290*/, %rdi/*t3275*/
   jmp     _looptest_979
_loopend_977:
   movq    $-24, %rax
   # movq    %rbx/*t3279*/, %rbx
   # movq    %r12/*t3280*/, %r12
   # movq    %r13/*t3281*/, %r13
   # movq    %r14/*t3282*/, %r14
   # movq    %r15/*t3283*/, %r15
   # return sink
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_989:
   # movq    %rbx, %rbx/*t3284*/
   # movq    %r12, %r12/*t3285*/
   # movq    %r13, %r13/*t3286*/
   # movq    %r14, %r14/*t3287*/
   # movq    %r15, %r15/*t3288*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3296*/
   movq    %rax/*t3296*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3295*/
   movq    %rax/*t3295*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3284*/, %rbx
   # movq    %r12/*t3285*/, %r12
   # movq    %r13/*t3286*/, %r13
   # movq    %r14/*t3287*/, %r14
   # movq    %r15/*t3288*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
