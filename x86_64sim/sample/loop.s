   .text
.globl _Test_do
_Test_do:
_L_1062:
   # movq    %rbx, %rbx/*t3466*/
   # movq    %r12, %r12/*t3467*/
   # movq    %r13, %r13/*t3468*/
   # movq    %r14, %r14/*t3469*/
   # movq    %r15, %r15/*t3470*/
   movq    $0, %rax/*t3464*/
_looptest_1057:
   cmpq    $10, %rax/*t3464*/
   jge     _loopend_1055
_loopbody_1056:
   movq    $0, %rdi/*t3465*/
_looptest_1060:
   cmpq    $10, %rdi/*t3465*/
   jge     _loopend_1058
_loopbody_1059:
   # movq    %rdi/*t3465*/, %rdi/*t3476*/
   incq    %rdi/*t3476*/
   # movq    %rdi/*t3476*/, %rdi/*t3465*/
   jmp     _looptest_1060
_loopend_1058:
   # movq    %rax/*t3464*/, %rax/*t3477*/
   incq    %rax/*t3477*/
   # movq    %rax/*t3477*/, %rax/*t3464*/
   jmp     _looptest_1057
_loopend_1055:
   # movq    %rax/*t3464*/, %rax/*t3478*/
   imulq   %rdi/*t3465*/, %rax/*t3478*/
   # movq    %rax/*t3478*/, %rax
   # movq    %rbx/*t3466*/, %rbx
   # movq    %r12/*t3467*/, %r12
   # movq    %r13/*t3468*/, %r13
   # movq    %r14/*t3469*/, %r14
   # movq    %r15/*t3470*/, %r15
   # return sink
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_1064:
   # movq    %rbx, %rbx/*t3471*/
   # movq    %r12, %r12/*t3472*/
   # movq    %r13, %r13/*t3473*/
   # movq    %r14, %r14/*t3474*/
   # movq    %r15, %r15/*t3475*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3480*/
   movq    %rax/*t3480*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3479*/
   movq    %rax/*t3479*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3471*/, %rbx
   # movq    %r12/*t3472*/, %r12
   # movq    %r13/*t3473*/, %r13
   # movq    %r14/*t3474*/, %r14
   # movq    %r15/*t3475*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
