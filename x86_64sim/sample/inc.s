   .text
.globl _Test_do
_Test_do:
_L_1050:
   # movq    %rbx, %rbx/*t3439*/
   # movq    %r12, %r12/*t3440*/
   # movq    %r13, %r13/*t3441*/
   # movq    %r14, %r14/*t3442*/
   # movq    %r15, %r15/*t3443*/
   # movq    %rdi, %rdi/*t3435*/
   movq    $0, %rcx/*t3437*/
   movq    $0, %rsi/*t3436*/
_looptest_1043:
   cmpq    $10, %rsi/*t3436*/
   jge     _loopend_1041
_loopbody_1042:
   cmpq    $0, %rcx/*t3437*/
   je      _L_1045
_L_1044:
   movq    (%rdi/*t3435*/), %rdx/*t3450*/
   # movq    %rdx/*t3450*/, %rdx/*t3449*/
   incq    %rdx/*t3449*/
   movq    %rdx/*t3449*/, (%rdi/*t3435*/)
_L_1046:
   movq    $1, %rdx/*t3438*/
   cmpq    $0, %rcx/*t3437*/
   je      _L_1047
_L_1048:
   movq    $0, %rdx/*t3438*/
_L_1047:
   movq    %rdx/*t3438*/, %rcx/*t3437*/
   # movq    %rsi/*t3436*/, %rsi/*t3451*/
   incq    %rsi/*t3451*/
   # movq    %rsi/*t3451*/, %rsi/*t3436*/
   jmp     _looptest_1043
_L_1045:
   movq    (%rdi/*t3435*/), %rdx/*t3453*/
   imulq   $2, %rdx/*t3453*/, %rdx/*t3452*/
   movq    %rdx/*t3452*/, (%rdi/*t3435*/)
   jmp     _L_1046
_loopend_1041:
   movq    (%rdi/*t3435*/), %rax/*t3454*/
   # movq    %rax/*t3454*/, %rax
   # movq    %rbx/*t3439*/, %rbx
   # movq    %r12/*t3440*/, %r12
   # movq    %r13/*t3441*/, %r13
   # movq    %r14/*t3442*/, %r14
   # movq    %r15/*t3443*/, %r15
   # return sink
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_1052:
   # movq    %rbx, %rbx/*t3444*/
   # movq    %r12, %r12/*t3445*/
   # movq    %r13, %r13/*t3446*/
   # movq    %r14, %r14/*t3447*/
   # movq    %r15, %r15/*t3448*/
   movq    $8, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3456*/
   movq    %rax/*t3456*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3455*/
   movq    %rax/*t3455*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3444*/, %rbx
   # movq    %r12/*t3445*/, %r12
   # movq    %r13/*t3446*/, %r13
   # movq    %r14/*t3447*/, %r14
   # movq    %r15/*t3448*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
