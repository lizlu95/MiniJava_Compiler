   .text
.globl _Fac_ComputeFac
_Fac_ComputeFac:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_612:
   movq    %rbx, -8(%rbp)
   # movq    %r12, %r12/*t1826*/
   # movq    %r13, %r13/*t1827*/
   # movq    %r14, %r14/*t1828*/
   # movq    %r15, %r15/*t1829*/
   # movq    %rdi, %rdi/*t1822*/
   # movq    %rsi, %rsi/*t1823*/
   cmpq    $1, %rsi/*t1823*/
   jge     _L_609
_L_608:
   movq    $1, %rax/*t1824*/
_L_610:
   # movq    %rax/*t1824*/, %rax
_bail_607:
   movq    -8(%rbp), %rbx/*t1847*/
   # movq    %rbx/*t1847*/, %rbx
   # movq    %r12/*t1826*/, %r12
   # movq    %r13/*t1827*/, %r13
   # movq    %r14/*t1828*/, %r14
   # movq    %r15/*t1829*/, %r15
   jmp     _DONE_613
_L_609:
   movq    %rsi/*t1823*/, %rbx/*t1836*/
   # movq    %rsi/*t1823*/, %rsi/*t1848*/
   decq    %rsi/*t1848*/
   # movq    %rsi/*t1848*/, %rsi
   # movq    %rdi/*t1822*/, %rdi
   call    _Fac_ComputeFac
   # movq    %rax, %rax/*t1835*/
   # movq    %rbx/*t1836*/, %rbx/*t1849*/
   imulq   %rax/*t1835*/, %rbx/*t1849*/
   movq    %rbx/*t1849*/, %rax/*t1824*/
   jmp     _L_610
_DONE_613:
   # return sink
   leave
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_614:
   # movq    %rbx, %rbx/*t1830*/
   # movq    %r12, %r12/*t1831*/
   # movq    %r13, %r13/*t1832*/
   # movq    %r14, %r14/*t1833*/
   # movq    %r15, %r15/*t1834*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t1840*/
   movq    $10, %rsi
   movq    %rax/*t1840*/, %rdi
   call    _Fac_ComputeFac
   # movq    %rax, %rax/*t1839*/
   movq    %rax/*t1839*/, %rdi
   call    _cs411println
   # movq    %rbx/*t1830*/, %rbx
   # movq    %r12/*t1831*/, %r12
   # movq    %r13/*t1832*/, %r13
   # movq    %r14/*t1833*/, %r14
   # movq    %r15/*t1834*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
