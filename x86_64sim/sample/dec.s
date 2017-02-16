   .text
.globl _Test_do
_Test_do:
_L_1019:
   # movq    %rbx, %rbx/*t3339*/
   # movq    %r12, %r12/*t3340*/
   # movq    %r13, %r13/*t3341*/
   # movq    %r14, %r14/*t3342*/
   # movq    %r15, %r15/*t3343*/
   # movq    %rdi, %rdi/*t3335*/
   movq    $0, %rcx/*t3337*/
   movq    $0, %rsi/*t3336*/
_looptest_1012:
   cmpq    $10, %rsi/*t3336*/
   jge     _loopend_1010
_loopbody_1011:
   cmpq    $0, %rcx/*t3337*/
   je      _L_1014
_L_1013:
   movq    (%rdi/*t3335*/), %rdx/*t3350*/
   # movq    %rdx/*t3350*/, %rdx/*t3349*/
   decq    %rdx/*t3349*/
   movq    %rdx/*t3349*/, (%rdi/*t3335*/)
_L_1015:
   movq    $1, %rdx/*t3338*/
   cmpq    $0, %rcx/*t3337*/
   je      _L_1016
_L_1017:
   movq    $0, %rdx/*t3338*/
_L_1016:
   movq    %rdx/*t3338*/, %rcx/*t3337*/
   # movq    %rsi/*t3336*/, %rsi/*t3351*/
   incq    %rsi/*t3351*/
   # movq    %rsi/*t3351*/, %rsi/*t3336*/
   jmp     _looptest_1012
_L_1014:
   movq    (%rdi/*t3335*/), %rdx/*t3353*/
   imulq   $2, %rdx/*t3353*/, %rdx/*t3352*/
   movq    %rdx/*t3352*/, (%rdi/*t3335*/)
   jmp     _L_1015
_loopend_1010:
   movq    (%rdi/*t3335*/), %rax/*t3354*/
   # movq    %rax/*t3354*/, %rax
   # movq    %rbx/*t3339*/, %rbx
   # movq    %r12/*t3340*/, %r12
   # movq    %r13/*t3341*/, %r13
   # movq    %r14/*t3342*/, %r14
   # movq    %r15/*t3343*/, %r15
   # return sink
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_1021:
   # movq    %rbx, %rbx/*t3344*/
   # movq    %r12, %r12/*t3345*/
   # movq    %r13, %r13/*t3346*/
   # movq    %r14, %r14/*t3347*/
   # movq    %r15, %r15/*t3348*/
   movq    $8, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3356*/
   movq    %rax/*t3356*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3355*/
   movq    %rax/*t3355*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3344*/, %rbx
   # movq    %r12/*t3345*/, %r12
   # movq    %r13/*t3346*/, %r13
   # movq    %r14/*t3347*/, %r14
   # movq    %r15/*t3348*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
