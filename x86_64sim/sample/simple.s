   .text
.globl _Test_do
_Test_do:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_1113:
   movq    %rbx, -8(%rbp)
   # movq    %r12, %r12/*t3617*/
   # movq    %r13, %r13/*t3618*/
   # movq    %r14, %r14/*t3619*/
   # movq    %r15, %r15/*t3620*/
   # movq    %rdi, %rdi/*t3614*/
   movq    %rsi, %rbx/*t3615*/
   movq    %rbx/*t3615*/, %rdi
   call    _cs411println
   movq    %rbx/*t3615*/, %rax
_bail_1111:
   movq    -8(%rbp), %rbx/*t3628*/
   # movq    %rbx/*t3628*/, %rbx
   # movq    %r12/*t3617*/, %r12
   # movq    %r13/*t3618*/, %r13
   # movq    %r14/*t3619*/, %r14
   # movq    %r15/*t3620*/, %r15
_DONE_1114:
   # return sink
   leave
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_1115:
   # movq    %rbx, %rbx/*t3621*/
   # movq    %r12, %r12/*t3622*/
   # movq    %r13, %r13/*t3623*/
   # movq    %r14, %r14/*t3624*/
   # movq    %r15, %r15/*t3625*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3627*/
   movq    $6, %rsi
   movq    %rax/*t3627*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3626*/
   movq    %rax/*t3626*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3621*/, %rbx
   # movq    %r12/*t3622*/, %r12
   # movq    %r13/*t3623*/, %r13
   # movq    %r14/*t3624*/, %r14
   # movq    %r15/*t3625*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
