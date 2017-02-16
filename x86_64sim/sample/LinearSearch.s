   .text
.globl _LS_Start
_LS_Start:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_642:
   movq    %rbx, -8(%rbp)
   # movq    %r12, %r12/*t1863*/
   # movq    %r13, %r13/*t1864*/
   # movq    %r14, %r14/*t1865*/
   # movq    %r15, %r15/*t1866*/
   movq    %rdi, %rbx/*t1858*/
   # movq    %rsi, %rsi/*t1859*/
   # movq    %rsi/*t1859*/, %rsi
   movq    %rbx/*t1858*/, %rdi
   call    _LS_Init
   # movq    %rax, %rax/*t1860*/
   movq    %rbx/*t1858*/, %rdi
   call    _LS_Print
   # movq    %rax, %rax/*t1861*/
   movq    $9999, %rdi
   call    _cs411println
   movq    $8, %rsi
   movq    %rbx/*t1858*/, %rdi
   call    _LS_Search
   # movq    %rax, %rax/*t1909*/
   movq    %rax/*t1909*/, %rdi
   call    _cs411println
   movq    $12, %rsi
   movq    %rbx/*t1858*/, %rdi
   call    _LS_Search
   # movq    %rax, %rax/*t1910*/
   movq    %rax/*t1910*/, %rdi
   call    _cs411println
   movq    $17, %rsi
   movq    %rbx/*t1858*/, %rdi
   call    _LS_Search
   # movq    %rax, %rax/*t1911*/
   movq    %rax/*t1911*/, %rdi
   call    _cs411println
   movq    $50, %rsi
   movq    %rbx/*t1858*/, %rdi
   call    _LS_Search
   # movq    %rax, %rax/*t1912*/
   movq    %rax/*t1912*/, %rdi
   call    _cs411println
   movq    $55, %rax
_bail_616:
   movq    -8(%rbp), %rbx/*t1947*/
   # movq    %rbx/*t1947*/, %rbx
   # movq    %r12/*t1863*/, %r12
   # movq    %r13/*t1864*/, %r13
   # movq    %r14/*t1865*/, %r14
   # movq    %r15/*t1866*/, %r15
_DONE_643:
   # return sink
   leave
   ret

.globl _LS_Print
_LS_Print:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_644:
   movq    %rbx, -16(%rbp)
   movq    %r12, -8(%rbp)
   # movq    %r13, %r13/*t1873*/
   # movq    %r14, %r14/*t1874*/
   # movq    %r15, %r15/*t1875*/
   movq    %rdi, %r12/*t1867*/
   movq    $1, %rbx/*t1868*/
_looptest_620:
   movq    8(%r12/*t1867*/), %rdi/*t1959*/
   cmpq    %rdi/*t1959*/, %rbx/*t1868*/
   jge     _loopend_618
_loopbody_619:
   # movq    %rbx/*t1868*/, %rbx/*t1870*/
   movq    %rbx/*t1870*/, %rdx/*t1913*/
   movq    (%r12/*t1867*/), %rdi/*t1960*/
   # movq    %rdi/*t1960*/, %rdi/*t1869*/
   movq    -8(%rdi/*t1869*/), %rsi/*t1961*/
   cmpq    %rsi/*t1961*/, %rdx/*t1913*/
   jae     _boundsbad_622
_boundsok_621:
   movq    (%rdi/*t1869*/, %rbx/*t1870*/, 8), %rdi/*t1962*/
   # movq    %rdi/*t1962*/, %rdi
   call    _cs411println
   # movq    %rbx/*t1868*/, %rbx/*t1963*/
   incq    %rbx/*t1963*/
   # movq    %rbx/*t1963*/, %rbx/*t1868*/
   jmp     _looptest_620
_boundsbad_622:
   movq    $1, %rdi
   call    _cs411error
_bail_617:
   movq    -16(%rbp), %rbx/*t1964*/
   # movq    %rbx/*t1964*/, %rbx
   movq    -8(%rbp), %r12/*t1965*/
   # movq    %r12/*t1965*/, %r12
   # movq    %r13/*t1873*/, %r13
   # movq    %r14/*t1874*/, %r14
   # movq    %r15/*t1875*/, %r15
   jmp     _DONE_645
_loopend_618:
   movq    $0, %rax
   jmp     _bail_617
_DONE_645:
   # return sink
   leave
   ret

.globl _LS_Search
_LS_Search:
   subq   $8, %rsp
_L_646:
   # movq    %rbx, %rbx/*t1886*/
   # movq    %r12, %r12/*t1887*/
   # movq    %r13, %r13/*t1888*/
   # movq    %r14, %r14/*t1889*/
   # movq    %r15, %r15/*t1890*/
   # movq    %rdi, %rdi/*t1876*/
   # movq    %rsi, %rsi/*t1877*/
   movq    $1, %rdx/*t1878*/
   movq    $0, %rax/*t1880*/
_looptest_626:
   movq    8(%rdi/*t1876*/), %rcx/*t1920*/
   cmpq    %rcx/*t1920*/, %rdx/*t1878*/
   jge     _loopend_624
_loopbody_625:
   # movq    %rdx/*t1878*/, %rdx/*t1885*/
   movq    %rdx/*t1885*/, %r9/*t1919*/
   movq    (%rdi/*t1876*/), %rcx/*t1921*/
   # movq    %rcx/*t1921*/, %rcx/*t1884*/
   movq    -8(%rcx/*t1884*/), %r8/*t1922*/
   cmpq    %r8/*t1922*/, %r9/*t1919*/
   jae     _boundsbad_628
_boundsok_627:
   movq    (%rcx/*t1884*/, %rdx/*t1885*/, 8), %r8/*t1923*/
   # movq    %r8/*t1923*/, %r8/*t1881*/
   movq    %rsi/*t1877*/, %rcx/*t1924*/
   incq    %rcx/*t1924*/
   # movq    %rcx/*t1924*/, %rcx/*t1882*/
   cmpq    %rsi/*t1877*/, %r8/*t1881*/
   jge     _L_630
_L_629:
_L_631:
   # movq    %rdx/*t1878*/, %rdx/*t1925*/
   incq    %rdx/*t1925*/
   # movq    %rdx/*t1925*/, %rdx/*t1878*/
   jmp     _looptest_626
_boundsbad_628:
   movq    $1, %rdi
   call    _cs411error
_bail_623:
   # movq    %rbx/*t1886*/, %rbx
   # movq    %r12/*t1887*/, %r12
   # movq    %r13/*t1888*/, %r13
   # movq    %r14/*t1889*/, %r14
   # movq    %r15/*t1890*/, %r15
   jmp     _DONE_647
_L_630:
   cmpq    %rcx/*t1882*/, %r8/*t1881*/
   jge     _L_632
_L_633:
   movq    $1, %rax/*t1880*/
   movq    8(%rdi/*t1876*/), %rdx/*t1926*/
   # movq    %rdx/*t1926*/, %rdx/*t1878*/
   jmp     _L_631
_L_632:
   jmp     _L_631
_loopend_624:
   # movq    %rax/*t1880*/, %rax
   jmp     _bail_623
_DONE_647:
   # return sink
   addq   $8, %rsp
   ret

.globl _LS_Init
_LS_Init:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_648:
   movq    %rbx, -16(%rbp)
   movq    %r12, -8(%rbp)
   # movq    %r13, %r13/*t1901*/
   # movq    %r14, %r14/*t1902*/
   # movq    %r15, %r15/*t1903*/
   movq    %rdi, %rbx/*t1891*/
   movq    %rsi, %r12/*t1892*/
   movq    %r12/*t1892*/, 8(%rbx/*t1891*/)
   # movq    %rbx/*t1891*/, %rbx/*t1928*/
   movq    %r12/*t1892*/, %rdi
   call    _cs411newarray
   # movq    %rax, %rax/*t1927*/
   movq    %rax/*t1927*/, (%rbx/*t1928*/)
   movq    $1, %rsi/*t1893*/
   movq    8(%rbx/*t1891*/), %rdi/*t1991*/
   # movq    %rdi/*t1991*/, %rdi/*t1990*/
   incq    %rdi/*t1990*/
   # movq    %rdi/*t1990*/, %rdi/*t1894*/
_looptest_638:
   cmpq    %r12/*t1892*/, %rsi/*t1893*/
   jge     _loopend_636
_loopbody_637:
   imulq   $2, %rsi/*t1893*/, %rdx/*t1992*/
   # movq    %rdx/*t1992*/, %rdx/*t1895*/
   movq    %rdi/*t1894*/, %r8/*t1993*/
   movq    $3, %rcx/*t1994*/
   subq    %rcx/*t1994*/, %r8/*t1993*/
   # movq    %r8/*t1993*/, %r8/*t1896*/
   # movq    %rsi/*t1893*/, %rsi/*t1898*/
   movq    %rsi/*t1898*/, %rax/*t1929*/
   movq    (%rbx/*t1891*/), %rcx/*t1995*/
   # movq    %rcx/*t1995*/, %rcx/*t1897*/
   movq    -8(%rcx/*t1897*/), %r9/*t1996*/
   cmpq    %r9/*t1996*/, %rax/*t1929*/
   jae     _boundsbad_640
_boundsok_639:
   # movq    %rdx/*t1895*/, %rdx/*t1997*/
   addq    %r8/*t1896*/, %rdx/*t1997*/
   movq    %rdx/*t1997*/, (%rcx/*t1897*/, %rsi/*t1898*/, 8)
   # movq    %rsi/*t1893*/, %rsi/*t1998*/
   incq    %rsi/*t1998*/
   # movq    %rsi/*t1998*/, %rsi/*t1893*/
   # movq    %rdi/*t1894*/, %rdi/*t1999*/
   decq    %rdi/*t1999*/
   # movq    %rdi/*t1999*/, %rdi/*t1894*/
   jmp     _looptest_638
_boundsbad_640:
   movq    $1, %rdi
   call    _cs411error
_bail_635:
   movq    -16(%rbp), %rbx/*t2000*/
   # movq    %rbx/*t2000*/, %rbx
   movq    -8(%rbp), %r12/*t2001*/
   # movq    %r12/*t2001*/, %r12
   # movq    %r13/*t1901*/, %r13
   # movq    %r14/*t1902*/, %r14
   # movq    %r15/*t1903*/, %r15
   jmp     _DONE_649
_loopend_636:
   movq    $0, %rax
   jmp     _bail_635
_DONE_649:
   # return sink
   leave
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_650:
   # movq    %rbx, %rbx/*t1904*/
   # movq    %r12, %r12/*t1905*/
   # movq    %r13, %r13/*t1906*/
   # movq    %r14, %r14/*t1907*/
   # movq    %r15, %r15/*t1908*/
   movq    $16, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t1941*/
   movq    $10, %rsi
   movq    %rax/*t1941*/, %rdi
   call    _LS_Start
   # movq    %rax, %rax/*t1940*/
   movq    %rax/*t1940*/, %rdi
   call    _cs411println
   # movq    %rbx/*t1904*/, %rbx
   # movq    %r12/*t1905*/, %r12
   # movq    %r13/*t1906*/, %r13
   # movq    %r14/*t1907*/, %r14
   # movq    %r15/*t1908*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
