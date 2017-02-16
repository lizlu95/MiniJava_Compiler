   .text
.globl _Test_do
_Test_do:
_L_972:
   # movq    %rbx, %rbx/*t3253*/
   # movq    %r12, %r12/*t3254*/
   # movq    %r13, %r13/*t3255*/
   # movq    %r14, %r14/*t3256*/
   # movq    %r15, %r15/*t3257*/
   movq    $0, %rdi/*t3249*/
_looptest_970:
   cmpq    $10, %rdi/*t3249*/
   jge     _loopend_968
_loopbody_969:
   # movq    %rdi/*t3249*/, %rdi/*t3264*/
   incq    %rdi/*t3264*/
   # movq    %rdi/*t3264*/, %rdi/*t3249*/
   jmp     _looptest_970
_loopend_968:
   movq    $-24, %rax
   # movq    %rbx/*t3253*/, %rbx
   # movq    %r12/*t3254*/, %r12
   # movq    %r13/*t3255*/, %r13
   # movq    %r14/*t3256*/, %r14
   # movq    %r15/*t3257*/, %r15
   # return sink
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_974:
   # movq    %rbx, %rbx/*t3258*/
   # movq    %r12, %r12/*t3259*/
   # movq    %r13, %r13/*t3260*/
   # movq    %r14, %r14/*t3261*/
   # movq    %r15, %r15/*t3262*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3270*/
   movq    %rax/*t3270*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3269*/
   movq    %rax/*t3269*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3258*/, %rbx
   # movq    %r12/*t3259*/, %r12
   # movq    %r13/*t3260*/, %r13
   # movq    %r14/*t3261*/, %r14
   # movq    %r15/*t3262*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
