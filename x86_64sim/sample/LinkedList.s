   .text
.globl _Element_Init
_Element_Init:
_L_761:
   # movq    %rbx, %rbx/*t2019*/
   # movq    %r12, %r12/*t2020*/
   # movq    %r13, %r13/*t2021*/
   # movq    %r14, %r14/*t2022*/
   # movq    %r15, %r15/*t2023*/
   # movq    %rdi, %rdi/*t2015*/
   # movq    %rsi, %rsi/*t2016*/
   # movq    %rdx, %rdx/*t2017*/
   # movq    %rcx, %rcx/*t2018*/
   movq    %rsi/*t2016*/, (%rdi/*t2015*/)
   movq    %rdx/*t2017*/, 8(%rdi/*t2015*/)
   movq    %rcx/*t2018*/, 16(%rdi/*t2015*/)
   movq    $1, %rax
   # movq    %rbx/*t2019*/, %rbx
   # movq    %r12/*t2020*/, %r12
   # movq    %r13/*t2021*/, %r13
   # movq    %r14/*t2022*/, %r14
   # movq    %r15/*t2023*/, %r15
   # return sink
   ret

.globl _Element_GetAge
_Element_GetAge:
_L_763:
   # movq    %rbx, %rbx/*t2025*/
   # movq    %r12, %r12/*t2026*/
   # movq    %r13, %r13/*t2027*/
   # movq    %r14, %r14/*t2028*/
   # movq    %r15, %r15/*t2029*/
   # movq    %rdi, %rdi/*t2024*/
   movq    (%rdi/*t2024*/), %rax/*t2209*/
   # movq    %rax/*t2209*/, %rax
   # movq    %rbx/*t2025*/, %rbx
   # movq    %r12/*t2026*/, %r12
   # movq    %r13/*t2027*/, %r13
   # movq    %r14/*t2028*/, %r14
   # movq    %r15/*t2029*/, %r15
   # return sink
   ret

.globl _Element_GetSalary
_Element_GetSalary:
_L_765:
   # movq    %rbx, %rbx/*t2031*/
   # movq    %r12, %r12/*t2032*/
   # movq    %r13, %r13/*t2033*/
   # movq    %r14, %r14/*t2034*/
   # movq    %r15, %r15/*t2035*/
   # movq    %rdi, %rdi/*t2030*/
   movq    8(%rdi/*t2030*/), %rax/*t2210*/
   # movq    %rax/*t2210*/, %rax
   # movq    %rbx/*t2031*/, %rbx
   # movq    %r12/*t2032*/, %r12
   # movq    %r13/*t2033*/, %r13
   # movq    %r14/*t2034*/, %r14
   # movq    %r15/*t2035*/, %r15
   # return sink
   ret

.globl _Element_GetMarried
_Element_GetMarried:
_L_767:
   # movq    %rbx, %rbx/*t2037*/
   # movq    %r12, %r12/*t2038*/
   # movq    %r13, %r13/*t2039*/
   # movq    %r14, %r14/*t2040*/
   # movq    %r15, %r15/*t2041*/
   # movq    %rdi, %rdi/*t2036*/
   movq    16(%rdi/*t2036*/), %rax/*t2211*/
   # movq    %rax/*t2211*/, %rax
   # movq    %rbx/*t2037*/, %rbx
   # movq    %r12/*t2038*/, %r12
   # movq    %r13/*t2039*/, %r13
   # movq    %r14/*t2040*/, %r14
   # movq    %r15/*t2041*/, %r15
   # return sink
   ret

.globl _Element_Equal
_Element_Equal:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_769:
   movq    %rbx, -24(%rbp)
   movq    %r12, -16(%rbp)
   movq    %r13, -8(%rbp)
   # movq    %r14, %r14/*t2055*/
   # movq    %r15, %r15/*t2056*/
   movq    %rdi, %r13/*t2042*/
   movq    %rsi, %rbx/*t2043*/
   movq    $1, %r12/*t2044*/
   # movq    %rbx/*t2043*/, %rbx/*t2048*/
   cmpq    $0, %rbx/*t2048*/
   je      _L_658
_L_657:
   movq    %rbx/*t2048*/, %rdi
   call    _Element_GetAge
   # movq    %rax, %rax/*t2045*/
   movq    (%r13/*t2042*/), %rdx/*t2251*/
   # movq    %rdx/*t2251*/, %rdx
   movq    %rax/*t2045*/, %rsi
   movq    %r13/*t2042*/, %rdi
   call    _Element_Compare
   # movq    %rax, %rax/*t2212*/
   cmpq    $0, %rax/*t2212*/
   je      _L_659
_L_660:
   # movq    %rbx/*t2043*/, %rbx/*t2049*/
   cmpq    $0, %rbx/*t2049*/
   je      _L_658
_L_662:
   movq    %rbx/*t2049*/, %rdi
   call    _Element_GetSalary
   # movq    %rax, %rax/*t2046*/
   movq    8(%r13/*t2042*/), %rdx/*t2252*/
   # movq    %rdx/*t2252*/, %rdx
   movq    %rax/*t2046*/, %rsi
   movq    %r13/*t2042*/, %rdi
   call    _Element_Compare
   # movq    %rax, %rax/*t2213*/
   cmpq    $0, %rax/*t2213*/
   je      _L_663
_L_664:
   movq    16(%r13/*t2042*/), %r13/*t2253*/
   cmpq    $0, %r13/*t2253*/
   je      _L_667
_L_666:
   # movq    %rbx/*t2043*/, %rbx/*t2050*/
   cmpq    $0, %rbx/*t2050*/
   je      _L_658
_L_672:
   movq    %rbx/*t2050*/, %rdi
   call    _Element_GetMarried
   cmpq    $0, %rax
   je      _L_669
_L_670:
   movq    $0, %rbx/*t2047*/
_L_671:
_L_668:
_L_665:
_L_661:
   movq    %r12/*t2044*/, %rax
_bail_656:
   movq    -24(%rbp), %rbx/*t2254*/
   # movq    %rbx/*t2254*/, %rbx
   movq    -16(%rbp), %r12/*t2255*/
   # movq    %r12/*t2255*/, %r12
   movq    -8(%rbp), %r13/*t2256*/
   # movq    %r13/*t2256*/, %r13
   # movq    %r14/*t2055*/, %r14
   # movq    %r15/*t2056*/, %r15
   jmp     _DONE_770
_L_658:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_656
_L_659:
   movq    $0, %r12/*t2044*/
   jmp     _L_661
_L_663:
   movq    $0, %r12/*t2044*/
   jmp     _L_665
_L_669:
   movq    $0, %r12/*t2044*/
   jmp     _L_671
_L_667:
   # movq    %rbx/*t2043*/, %rbx/*t2051*/
   cmpq    $0, %rbx/*t2051*/
   je      _L_658
_L_676:
   movq    %rbx/*t2051*/, %rdi
   call    _Element_GetMarried
   cmpq    $0, %rax
   je      _L_674
_L_673:
   movq    $0, %r12/*t2044*/
_L_675:
   jmp     _L_668
_L_674:
   movq    $0, %rbx/*t2047*/
   jmp     _L_675
_DONE_770:
   # return sink
   leave
   ret

.globl _Element_Compare
_Element_Compare:
_L_771:
   # movq    %rbx, %rbx/*t2062*/
   # movq    %r12, %r12/*t2063*/
   # movq    %r13, %r13/*t2064*/
   # movq    %r14, %r14/*t2065*/
   # movq    %r15, %r15/*t2066*/
   # movq    %rsi, %rsi/*t2058*/
   # movq    %rdx, %rdx/*t2059*/
   movq    %rdx/*t2059*/, %rdi/*t2217*/
   incq    %rdi/*t2217*/
   # movq    %rdi/*t2217*/, %rdi/*t2061*/
   cmpq    %rdx/*t2059*/, %rsi/*t2058*/
   jge     _L_679
_L_678:
   movq    $0, %rax/*t2060*/
_L_680:
   # movq    %rax/*t2060*/, %rax
   # movq    %rbx/*t2062*/, %rbx
   # movq    %r12/*t2063*/, %r12
   # movq    %r13/*t2064*/, %r13
   # movq    %r14/*t2065*/, %r14
   # movq    %r15/*t2066*/, %r15
   jmp     _DONE_772
_L_679:
   cmpq    %rdi/*t2061*/, %rsi/*t2058*/
   jge     _L_681
_L_682:
   movq    $1, %rax/*t2060*/
   jmp     _L_680
_L_681:
   movq    $0, %rax/*t2060*/
   jmp     _L_680
_DONE_772:
   # return sink
   ret

.globl _List_Init
_List_Init:
_L_773:
   # movq    %rbx, %rbx/*t2068*/
   # movq    %r12, %r12/*t2069*/
   # movq    %r13, %r13/*t2070*/
   # movq    %r14, %r14/*t2071*/
   # movq    %r15, %r15/*t2072*/
   # movq    %rdi, %rdi/*t2067*/
   movq    $1, %rsi/*t2218*/
   movq    %rsi/*t2218*/, 16(%rdi/*t2067*/)
   movq    $1, %rax
   # movq    %rbx/*t2068*/, %rbx
   # movq    %r12/*t2069*/, %r12
   # movq    %r13/*t2070*/, %r13
   # movq    %r14/*t2071*/, %r14
   # movq    %r15/*t2072*/, %r15
   # return sink
   ret

.globl _List_InitNew
_List_InitNew:
_L_775:
   # movq    %rbx, %rbx/*t2077*/
   # movq    %r12, %r12/*t2078*/
   # movq    %r13, %r13/*t2079*/
   # movq    %r14, %r14/*t2080*/
   # movq    %r15, %r15/*t2081*/
   # movq    %rdi, %rdi/*t2073*/
   # movq    %rsi, %rsi/*t2074*/
   # movq    %rdx, %rdx/*t2075*/
   # movq    %rcx, %rcx/*t2076*/
   movq    %rcx/*t2076*/, 16(%rdi/*t2073*/)
   movq    %rsi/*t2074*/, (%rdi/*t2073*/)
   movq    %rdx/*t2075*/, 8(%rdi/*t2073*/)
   movq    $1, %rax
   # movq    %rbx/*t2077*/, %rbx
   # movq    %r12/*t2078*/, %r12
   # movq    %r13/*t2079*/, %r13
   # movq    %r14/*t2080*/, %r14
   # movq    %r15/*t2081*/, %r15
   # return sink
   ret

.globl _List_Insert
_List_Insert:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_777:
   movq    %rbx, -24(%rbp)
   movq    %r12, -16(%rbp)
   movq    %r13, -8(%rbp)
   # movq    %r14, %r14/*t2091*/
   # movq    %r15, %r15/*t2092*/
   # movq    %rdi, %rdi/*t2082*/
   movq    %rsi, %r13/*t2083*/
   movq    %rdi/*t2082*/, %r12/*t2085*/
   movq    $24, %rdi
   call    _cs411newobject
   movq    %rax, %rbx/*t2086*/
   # movq    %rbx/*t2086*/, %rbx/*t2087*/
   cmpq    $0, %rbx/*t2087*/
   je      _L_688
_L_687:
   movq    $0, %rcx
   movq    %r12/*t2085*/, %rdx
   movq    %r13/*t2083*/, %rsi
   movq    %rbx/*t2087*/, %rdi
   call    _List_InitNew
   # movq    %rax, %rax/*t2084*/
   movq    %rbx/*t2086*/, %rax
_bail_686:
   movq    -24(%rbp), %rbx/*t2278*/
   # movq    %rbx/*t2278*/, %rbx
   movq    -16(%rbp), %r12/*t2279*/
   # movq    %r12/*t2279*/, %r12
   movq    -8(%rbp), %r13/*t2280*/
   # movq    %r13/*t2280*/, %r13
   # movq    %r14/*t2091*/, %r14
   # movq    %r15/*t2092*/, %r15
   jmp     _DONE_778
_L_688:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_686
_DONE_778:
   # return sink
   leave
   ret

.globl _List_SetNext
_List_SetNext:
_L_779:
   # movq    %rbx, %rbx/*t2095*/
   # movq    %r12, %r12/*t2096*/
   # movq    %r13, %r13/*t2097*/
   # movq    %r14, %r14/*t2098*/
   # movq    %r15, %r15/*t2099*/
   # movq    %rdi, %rdi/*t2093*/
   # movq    %rsi, %rsi/*t2094*/
   movq    %rsi/*t2094*/, 8(%rdi/*t2093*/)
   movq    $1, %rax
   # movq    %rbx/*t2095*/, %rbx
   # movq    %r12/*t2096*/, %r12
   # movq    %r13/*t2097*/, %r13
   # movq    %r14/*t2098*/, %r14
   # movq    %r15/*t2099*/, %r15
   # return sink
   ret

.globl _List_Delete
_List_Delete:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $80, %rsp
_L_781:
   movq    %rbx, -72(%rbp)
   movq    %r12, -64(%rbp)
   movq    %r13, -56(%rbp)
   movq    %r14, -48(%rbp)
   movq    %r15, -40(%rbp)
   # movq    %rdi, %rdi/*t2100*/
   movq    %rsi, %r13/*t2101*/
   movq    %rdi/*t2100*/, -24(%rbp)
   movq    $0, %rbx/*t2296*/
   movq    %rbx/*t2296*/, -8(%rbp)
   movq    $-1, %rbx/*t2297*/
   movq    %rbx/*t2297*/, -16(%rbp)
   movq    %rdi/*t2100*/, %rbx/*t2105*/
   movq    %rdi/*t2100*/, %r12/*t2106*/
   movq    16(%rdi/*t2100*/), %r15/*t2298*/
   # movq    %r15/*t2298*/, %r15/*t2107*/
   movq    (%rdi/*t2100*/), %r14/*t2299*/
   # movq    %r14/*t2299*/, %r14/*t2108*/
_looptest_693:
   cmpq    $0, %r15/*t2107*/
   je      _L_694
_loopend_691:
   movq    -24(%rbp), %rax/*t2300*/
   # movq    %rax/*t2300*/, %rax
_bail_690:
   movq    -72(%rbp), %rbx/*t2301*/
   # movq    %rbx/*t2301*/, %rbx
   movq    -64(%rbp), %r12/*t2302*/
   # movq    %r12/*t2302*/, %r12
   movq    -56(%rbp), %r13/*t2303*/
   # movq    %r13/*t2303*/, %r13
   movq    -48(%rbp), %r14/*t2304*/
   # movq    %r14/*t2304*/, %r14
   movq    -40(%rbp), %r15/*t2305*/
   # movq    %r15/*t2305*/, %r15
   jmp     _DONE_782
_L_694:
   movq    -8(%rbp), %rdi/*t2306*/
   cmpq    $0, %rdi/*t2306*/
   jne     _loopend_691
_loopbody_692:
   # movq    %r13/*t2101*/, %r13/*t2111*/
   cmpq    $0, %r13/*t2111*/
   je      _L_699
_L_698:
   movq    %r14/*t2108*/, %rsi
   movq    %r13/*t2111*/, %rdi
   call    _Element_Equal
   cmpq    $0, %rax
   je      _L_696
_L_695:
   movq    $1, %rdi/*t2307*/
   movq    %rdi/*t2307*/, -8(%rbp)
   movq    -16(%rbp), %rdi/*t2308*/
   cmpq    $0, %rdi/*t2308*/
   jge     _L_701
_L_700:
   # movq    %rbx/*t2105*/, %rbx/*t2112*/
   cmpq    $0, %rbx/*t2112*/
   je      _L_699
_L_703:
   movq    %rbx/*t2112*/, %rdi
   call    _List_GetNext
   movq    %rax, -24(%rbp)
_L_702:
_L_697:
   movq    -8(%rbp), %rdi/*t2309*/
   cmpq    $0, %rdi/*t2309*/
   je      _L_706
_L_707:
   movq    $0, %rdi/*t2110*/
_L_708:
   jmp     _looptest_693
_L_699:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_690
_L_701:
   movq    $-555, %rdi
   call    _cs411println
   # movq    %r12/*t2106*/, %r12/*t2113*/
   cmpq    $0, %r12/*t2113*/
   je      _L_699
_L_704:
   movq    %r12/*t2113*/, -32(%rbp)
   # movq    %rbx/*t2105*/, %rbx/*t2114*/
   cmpq    $0, %rbx/*t2114*/
   je      _L_699
_L_705:
   movq    %rbx/*t2114*/, %rdi
   call    _List_GetNext
   movq    %rax, %rsi
   movq    -32(%rbp), %rdi/*t2310*/
   # movq    %rdi/*t2310*/, %rdi
   call    _List_SetNext
   # movq    %rax, %rax/*t2104*/
   movq    $-555, %rdi
   call    _cs411println
   jmp     _L_702
_L_696:
   movq    $0, %rdi/*t2110*/
   jmp     _L_697
_L_706:
   movq    %rbx/*t2105*/, %r12/*t2106*/
   # movq    %rbx/*t2105*/, %rbx/*t2115*/
   cmpq    $0, %rbx/*t2115*/
   je      _L_699
_L_709:
   movq    %rbx/*t2115*/, %rdi
   call    _List_GetNext
   movq    %rax, %rbx/*t2105*/
   # movq    %rbx/*t2105*/, %rbx/*t2116*/
   cmpq    $0, %rbx/*t2116*/
   je      _L_699
_L_710:
   movq    %rbx/*t2116*/, %rdi
   call    _List_GetEnd
   movq    %rax, %r15/*t2107*/
   # movq    %rbx/*t2105*/, %rbx/*t2117*/
   cmpq    $0, %rbx/*t2117*/
   je      _L_699
_L_711:
   movq    %rbx/*t2117*/, %rdi
   call    _List_GetElem
   movq    %rax, %r14/*t2108*/
   movq    $1, %rdi/*t2311*/
   movq    %rdi/*t2311*/, -16(%rbp)
   jmp     _L_708
_DONE_782:
   # return sink
   leave
   ret

.globl _List_Search
_List_Search:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_783:
   movq    %rbx, -32(%rbp)
   movq    %r12, -24(%rbp)
   movq    %r13, -16(%rbp)
   movq    %r14, -8(%rbp)
   # movq    %r15, %r15/*t2138*/
   # movq    %rdi, %rdi/*t2123*/
   movq    %rsi, %r12/*t2124*/
   movq    $0, %r14/*t2125*/
   movq    %rdi/*t2123*/, %rbx/*t2126*/
   movq    16(%rdi/*t2123*/), %r13/*t2333*/
   # movq    %r13/*t2333*/, %r13/*t2128*/
   movq    (%rdi/*t2123*/), %rsi/*t2334*/
   # movq    %rsi/*t2334*/, %rsi/*t2127*/
_looptest_715:
   cmpq    $0, %r13/*t2128*/
   je      _loopbody_714
_loopend_713:
   movq    %r14/*t2125*/, %rax
_bail_712:
   movq    -32(%rbp), %rbx/*t2335*/
   # movq    %rbx/*t2335*/, %rbx
   movq    -24(%rbp), %r12/*t2336*/
   # movq    %r12/*t2336*/, %r12
   movq    -16(%rbp), %r13/*t2337*/
   # movq    %r13/*t2337*/, %r13
   movq    -8(%rbp), %r14/*t2338*/
   # movq    %r14/*t2338*/, %r14
   # movq    %r15/*t2138*/, %r15
   jmp     _DONE_784
_loopbody_714:
   # movq    %r12/*t2124*/, %r12/*t2130*/
   cmpq    $0, %r12/*t2130*/
   je      _L_720
_L_719:
   # movq    %rsi/*t2127*/, %rsi
   movq    %r12/*t2130*/, %rdi
   call    _Element_Equal
   cmpq    $0, %rax
   je      _L_717
_L_716:
   movq    $1, %r14/*t2125*/
_L_718:
   # movq    %rbx/*t2126*/, %rbx/*t2131*/
   cmpq    $0, %rbx/*t2131*/
   je      _L_720
_L_721:
   movq    %rbx/*t2131*/, %rdi
   call    _List_GetNext
   movq    %rax, %rbx/*t2126*/
   # movq    %rbx/*t2126*/, %rbx/*t2132*/
   cmpq    $0, %rbx/*t2132*/
   je      _L_720
_L_722:
   movq    %rbx/*t2132*/, %rdi
   call    _List_GetEnd
   movq    %rax, %r13/*t2128*/
   # movq    %rbx/*t2126*/, %rbx/*t2133*/
   cmpq    $0, %rbx/*t2133*/
   je      _L_720
_L_723:
   movq    %rbx/*t2133*/, %rdi
   call    _List_GetElem
   movq    %rax, %rsi/*t2127*/
   jmp     _looptest_715
_L_720:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_712
_L_717:
   movq    $0, %r13/*t2129*/
   jmp     _L_718
_DONE_784:
   # return sink
   leave
   ret

.globl _List_GetEnd
_List_GetEnd:
_L_785:
   # movq    %rbx, %rbx/*t2140*/
   # movq    %r12, %r12/*t2141*/
   # movq    %r13, %r13/*t2142*/
   # movq    %r14, %r14/*t2143*/
   # movq    %r15, %r15/*t2144*/
   # movq    %rdi, %rdi/*t2139*/
   movq    16(%rdi/*t2139*/), %rax/*t2224*/
   # movq    %rax/*t2224*/, %rax
   # movq    %rbx/*t2140*/, %rbx
   # movq    %r12/*t2141*/, %r12
   # movq    %r13/*t2142*/, %r13
   # movq    %r14/*t2143*/, %r14
   # movq    %r15/*t2144*/, %r15
   # return sink
   ret

.globl _List_GetElem
_List_GetElem:
_L_787:
   # movq    %rbx, %rbx/*t2146*/
   # movq    %r12, %r12/*t2147*/
   # movq    %r13, %r13/*t2148*/
   # movq    %r14, %r14/*t2149*/
   # movq    %r15, %r15/*t2150*/
   # movq    %rdi, %rdi/*t2145*/
   movq    (%rdi/*t2145*/), %rax/*t2225*/
   # movq    %rax/*t2225*/, %rax
   # movq    %rbx/*t2146*/, %rbx
   # movq    %r12/*t2147*/, %r12
   # movq    %r13/*t2148*/, %r13
   # movq    %r14/*t2149*/, %r14
   # movq    %r15/*t2150*/, %r15
   # return sink
   ret

.globl _List_GetNext
_List_GetNext:
_L_789:
   # movq    %rbx, %rbx/*t2152*/
   # movq    %r12, %r12/*t2153*/
   # movq    %r13, %r13/*t2154*/
   # movq    %r14, %r14/*t2155*/
   # movq    %r15, %r15/*t2156*/
   # movq    %rdi, %rdi/*t2151*/
   movq    8(%rdi/*t2151*/), %rax/*t2226*/
   # movq    %rax/*t2226*/, %rax
   # movq    %rbx/*t2152*/, %rbx
   # movq    %r12/*t2153*/, %r12
   # movq    %r13/*t2154*/, %r13
   # movq    %r14/*t2155*/, %r14
   # movq    %r15/*t2156*/, %r15
   # return sink
   ret

.globl _List_Print
_List_Print:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_791:
   movq    %rbx, -16(%rbp)
   movq    %r12, -8(%rbp)
   # movq    %r13, %r13/*t2167*/
   # movq    %r14, %r14/*t2168*/
   # movq    %r15, %r15/*t2169*/
   # movq    %rdi, %rdi/*t2157*/
   movq    %rdi/*t2157*/, %rbx/*t2158*/
   movq    16(%rdi/*t2157*/), %r12/*t2361*/
   # movq    %r12/*t2361*/, %r12/*t2159*/
   movq    (%rdi/*t2157*/), %rdi/*t2362*/
   # movq    %rdi/*t2362*/, %rdi/*t2160*/
_looptest_730:
   cmpq    $0, %r12/*t2159*/
   je      _loopbody_729
_loopend_728:
   movq    $1, %rax
_bail_727:
   movq    -16(%rbp), %rbx/*t2363*/
   # movq    %rbx/*t2363*/, %rbx
   movq    -8(%rbp), %r12/*t2364*/
   # movq    %r12/*t2364*/, %r12
   # movq    %r13/*t2167*/, %r13
   # movq    %r14/*t2168*/, %r14
   # movq    %r15/*t2169*/, %r15
   jmp     _DONE_792
_loopbody_729:
   # movq    %rdi/*t2160*/, %rdi/*t2161*/
   cmpq    $0, %rdi/*t2161*/
   je      _L_732
_L_731:
   # movq    %rdi/*t2161*/, %rdi
   call    _Element_GetAge
   movq    %rax, %rdi
   call    _cs411println
   # movq    %rbx/*t2158*/, %rbx/*t2162*/
   cmpq    $0, %rbx/*t2162*/
   je      _L_732
_L_733:
   movq    %rbx/*t2162*/, %rdi
   call    _List_GetNext
   movq    %rax, %rbx/*t2158*/
   # movq    %rbx/*t2158*/, %rbx/*t2163*/
   cmpq    $0, %rbx/*t2163*/
   je      _L_732
_L_734:
   movq    %rbx/*t2163*/, %rdi
   call    _List_GetEnd
   movq    %rax, %r12/*t2159*/
   # movq    %rbx/*t2158*/, %rbx/*t2164*/
   cmpq    $0, %rbx/*t2164*/
   je      _L_732
_L_735:
   movq    %rbx/*t2164*/, %rdi
   call    _List_GetElem
   movq    %rax, %rdi/*t2160*/
   jmp     _looptest_730
_L_732:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_727
_DONE_792:
   # return sink
   leave
   ret

.globl _LL_Start
_LL_Start:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_793:
   movq    %rbx, -24(%rbp)
   movq    %r12, -16(%rbp)
   movq    %r13, -8(%rbp)
   # movq    %r14, %r14/*t2202*/
   # movq    %r15, %r15/*t2203*/
   # movq    %rdi, %rdi/*t2170*/
   movq    $24, %rdi
   call    _cs411newobject
   movq    %rax, %rbx/*t2172*/
   # movq    %rbx/*t2172*/, %rbx/*t2177*/
   cmpq    $0, %rbx/*t2177*/
   je      _L_738
_L_737:
   movq    %rbx/*t2177*/, %rdi
   call    _List_Init
   # movq    %rax, %rax/*t2173*/
   # movq    %rbx/*t2172*/, %rbx/*t2171*/
   # movq    %rbx/*t2171*/, %rbx/*t2178*/
   cmpq    $0, %rbx/*t2178*/
   je      _L_738
_L_739:
   movq    %rbx/*t2178*/, %rdi
   call    _List_Init
   # movq    %rax, %rax/*t2173*/
   # movq    %rbx/*t2171*/, %rbx/*t2179*/
   cmpq    $0, %rbx/*t2179*/
   je      _L_738
_L_740:
   movq    %rbx/*t2179*/, %rdi
   call    _List_Print
   # movq    %rax, %rax/*t2173*/
   movq    $24, %rdi
   call    _cs411newobject
   movq    %rax, %r12/*t2174*/
   # movq    %r12/*t2174*/, %r12/*t2180*/
   cmpq    $0, %r12/*t2180*/
   je      _L_738
_L_741:
   movq    $0, %rcx
   movq    $37000, %rdx
   movq    $25, %rsi
   movq    %r12/*t2180*/, %rdi
   call    _Element_Init
   # movq    %rax, %rax/*t2173*/
   # movq    %rbx/*t2171*/, %rbx/*t2181*/
   cmpq    $0, %rbx/*t2181*/
   je      _L_738
_L_742:
   movq    %r12/*t2174*/, %rsi
   movq    %rbx/*t2181*/, %rdi
   call    _List_Insert
   movq    %rax, %rbx/*t2171*/
   # movq    %rbx/*t2171*/, %rbx/*t2182*/
   cmpq    $0, %rbx/*t2182*/
   je      _L_738
_L_743:
   movq    %rbx/*t2182*/, %rdi
   call    _List_Print
   # movq    %rax, %rax/*t2173*/
   movq    $10000000, %rdi
   call    _cs411println
   movq    $24, %rdi
   call    _cs411newobject
   movq    %rax, %r12/*t2174*/
   # movq    %r12/*t2174*/, %r12/*t2183*/
   cmpq    $0, %r12/*t2183*/
   je      _L_738
_L_744:
   movq    $1, %rcx
   movq    $42000, %rdx
   movq    $39, %rsi
   movq    %r12/*t2183*/, %rdi
   call    _Element_Init
   # movq    %rax, %rax/*t2173*/
   movq    %r12/*t2174*/, %r13/*t2175*/
   # movq    %rbx/*t2171*/, %rbx/*t2184*/
   cmpq    $0, %rbx/*t2184*/
   je      _L_738
_L_745:
   movq    %r12/*t2174*/, %rsi
   movq    %rbx/*t2184*/, %rdi
   call    _List_Insert
   movq    %rax, %rbx/*t2171*/
   # movq    %rbx/*t2171*/, %rbx/*t2185*/
   cmpq    $0, %rbx/*t2185*/
   je      _L_738
_L_746:
   movq    %rbx/*t2185*/, %rdi
   call    _List_Print
   # movq    %rax, %rax/*t2173*/
   movq    $10000000, %rdi
   call    _cs411println
   movq    $24, %rdi
   call    _cs411newobject
   movq    %rax, %r12/*t2174*/
   # movq    %r12/*t2174*/, %r12/*t2186*/
   cmpq    $0, %r12/*t2186*/
   je      _L_738
_L_747:
   movq    $0, %rcx
   movq    $34000, %rdx
   movq    $22, %rsi
   movq    %r12/*t2186*/, %rdi
   call    _Element_Init
   # movq    %rax, %rax/*t2173*/
   # movq    %rbx/*t2171*/, %rbx/*t2187*/
   cmpq    $0, %rbx/*t2187*/
   je      _L_738
_L_748:
   movq    %r12/*t2174*/, %rsi
   movq    %rbx/*t2187*/, %rdi
   call    _List_Insert
   movq    %rax, %rbx/*t2171*/
   # movq    %rbx/*t2171*/, %rbx/*t2188*/
   cmpq    $0, %rbx/*t2188*/
   je      _L_738
_L_749:
   movq    %rbx/*t2188*/, %rdi
   call    _List_Print
   # movq    %rax, %rax/*t2173*/
   movq    $24, %rdi
   call    _cs411newobject
   movq    %rax, %r12/*t2176*/
   # movq    %r12/*t2176*/, %r12/*t2189*/
   cmpq    $0, %r12/*t2189*/
   je      _L_738
_L_750:
   movq    $0, %rcx
   movq    $34000, %rdx
   movq    $27, %rsi
   movq    %r12/*t2189*/, %rdi
   call    _Element_Init
   # movq    %rax, %rax/*t2173*/
   # movq    %rbx/*t2171*/, %rbx/*t2190*/
   cmpq    $0, %rbx/*t2190*/
   je      _L_738
_L_751:
   movq    %r13/*t2175*/, %rsi
   movq    %rbx/*t2190*/, %rdi
   call    _List_Search
   movq    %rax, %rdi
   call    _cs411println
   # movq    %rbx/*t2171*/, %rbx/*t2191*/
   cmpq    $0, %rbx/*t2191*/
   je      _L_738
_L_752:
   movq    %r12/*t2176*/, %rsi
   movq    %rbx/*t2191*/, %rdi
   call    _List_Search
   movq    %rax, %rdi
   call    _cs411println
   movq    $10000000, %rdi
   call    _cs411println
   movq    $24, %rdi
   call    _cs411newobject
   movq    %rax, %r12/*t2174*/
   # movq    %r12/*t2174*/, %r12/*t2192*/
   cmpq    $0, %r12/*t2192*/
   je      _L_738
_L_753:
   movq    $0, %rcx
   movq    $35000, %rdx
   movq    $28, %rsi
   movq    %r12/*t2192*/, %rdi
   call    _Element_Init
   # movq    %rax, %rax/*t2173*/
   # movq    %rbx/*t2171*/, %rbx/*t2193*/
   cmpq    $0, %rbx/*t2193*/
   je      _L_738
_L_754:
   movq    %r12/*t2174*/, %rsi
   movq    %rbx/*t2193*/, %rdi
   call    _List_Insert
   movq    %rax, %rbx/*t2171*/
   # movq    %rbx/*t2171*/, %rbx/*t2194*/
   cmpq    $0, %rbx/*t2194*/
   je      _L_738
_L_755:
   movq    %rbx/*t2194*/, %rdi
   call    _List_Print
   # movq    %rax, %rax/*t2173*/
   movq    $2220000, %rdi
   call    _cs411println
   # movq    %rbx/*t2171*/, %rbx/*t2195*/
   cmpq    $0, %rbx/*t2195*/
   je      _L_738
_L_756:
   movq    %r13/*t2175*/, %rsi
   movq    %rbx/*t2195*/, %rdi
   call    _List_Delete
   movq    %rax, %rbx/*t2171*/
   # movq    %rbx/*t2171*/, %rbx/*t2196*/
   cmpq    $0, %rbx/*t2196*/
   je      _L_738
_L_757:
   movq    %rbx/*t2196*/, %rdi
   call    _List_Print
   # movq    %rax, %rax/*t2173*/
   movq    $33300000, %rdi
   call    _cs411println
   # movq    %rbx/*t2171*/, %rbx/*t2197*/
   cmpq    $0, %rbx/*t2197*/
   je      _L_738
_L_758:
   movq    %r12/*t2174*/, %rsi
   movq    %rbx/*t2197*/, %rdi
   call    _List_Delete
   movq    %rax, %rbx/*t2171*/
   # movq    %rbx/*t2171*/, %rbx/*t2198*/
   cmpq    $0, %rbx/*t2198*/
   je      _L_738
_L_759:
   movq    %rbx/*t2198*/, %rdi
   call    _List_Print
   # movq    %rax, %rax/*t2173*/
   movq    $44440000, %rdi
   call    _cs411println
   movq    $0, %rax
_bail_736:
   movq    -24(%rbp), %rbx/*t2396*/
   # movq    %rbx/*t2396*/, %rbx
   movq    -16(%rbp), %r12/*t2397*/
   # movq    %r12/*t2397*/, %r12
   movq    -8(%rbp), %r13/*t2398*/
   # movq    %r13/*t2398*/, %r13
   # movq    %r14/*t2202*/, %r14
   # movq    %r15/*t2203*/, %r15
   jmp     _DONE_794
_L_738:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_736
_DONE_794:
   # return sink
   leave
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_795:
   # movq    %rbx, %rbx/*t2204*/
   # movq    %r12, %r12/*t2205*/
   # movq    %r13, %r13/*t2206*/
   # movq    %r14, %r14/*t2207*/
   # movq    %r15, %r15/*t2208*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t2230*/
   movq    %rax/*t2230*/, %rdi
   call    _LL_Start
   # movq    %rax, %rax/*t2229*/
   movq    %rax/*t2229*/, %rdi
   call    _cs411println
   # movq    %rbx/*t2204*/, %rbx
   # movq    %r12/*t2205*/, %r12
   # movq    %r13/*t2206*/, %r13
   # movq    %r14/*t2207*/, %r14
   # movq    %r15/*t2208*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
