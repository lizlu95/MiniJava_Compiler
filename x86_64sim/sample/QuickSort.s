   .text
.globl _QS_Start
_QS_Start:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_866:
   movq    %rbx, -8(%rbp)
   # movq    %r12, %r12/*t2466*/
   # movq    %r13, %r13/*t2467*/
   # movq    %r14, %r14/*t2468*/
   # movq    %r15, %r15/*t2469*/
   movq    %rdi, %rbx/*t2462*/
   # movq    %rsi, %rsi/*t2463*/
   # movq    %rsi/*t2463*/, %rsi
   movq    %rbx/*t2462*/, %rdi
   call    _QS_Init
   movq    %rax, %rdx/*t2464*/
   movq    %rbx/*t2462*/, %rdi
   call    _QS_Print
   movq    %rax, %rdx/*t2464*/
   movq    $9999, %rdi
   call    _cs411println
   movq    8(%rbx/*t2462*/), %rdx/*t2666*/
   # movq    %rdx/*t2666*/, %rdx/*t2665*/
   decq    %rdx/*t2665*/
   # movq    %rdx/*t2665*/, %rdx/*t2464*/
   # movq    %rdx/*t2464*/, %rdx
   movq    $0, %rsi
   movq    %rbx/*t2462*/, %rdi
   call    _QS_Sort
   movq    %rax, %rdx/*t2464*/
   movq    %rbx/*t2462*/, %rdi
   call    _QS_Print
   movq    %rax, %rdx/*t2464*/
   movq    $0, %rax
_bail_811:
   movq    -8(%rbp), %rbx/*t2667*/
   # movq    %rbx/*t2667*/, %rbx
   # movq    %r12/*t2466*/, %r12
   # movq    %r13/*t2467*/, %r13
   # movq    %r14/*t2468*/, %r14
   # movq    %r15/*t2469*/, %r15
_DONE_867:
   # return sink
   leave
   ret

.globl _QS_Sort
_QS_Sort:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_868:
   movq    %rbx, -24(%rbp)
   movq    %r12, -16(%rbp)
   movq    %r13, -8(%rbp)
   # movq    %r14, %r14/*t2508*/
   # movq    %r15, %r15/*t2509*/
   movq    %rdi, %r13/*t2470*/
   # movq    %rsi, %rsi/*t2471*/
   movq    %rdx, %r12/*t2472*/
   movq    $0, %r8/*t2477*/
   cmpq    %r12/*t2472*/, %rsi/*t2471*/
   jge     _L_814
_L_813:
   # movq    %r12/*t2472*/, %r12/*t2482*/
   movq    %r12/*t2482*/, %rdx/*t2553*/
   movq    (%r13/*t2470*/), %rbx/*t2711*/
   # movq    %rbx/*t2711*/, %rbx/*t2481*/
   movq    -8(%rbx/*t2481*/), %rdi/*t2712*/
   cmpq    %rdi/*t2712*/, %rdx/*t2553*/
   jae     _boundsbad_817
_boundsok_816:
   movq    (%rbx/*t2481*/, %r12/*t2482*/, 8), %r9/*t2713*/
   # movq    %r9/*t2713*/, %r9/*t2473*/
   movq    %rsi/*t2471*/, %rbx/*t2714*/
   decq    %rbx/*t2714*/
   # movq    %rbx/*t2714*/, %rbx/*t2474*/
   movq    %r12/*t2472*/, %rdi/*t2475*/
   movq    $1, %rdx/*t2478*/
_looptest_820:
   cmpq    $0, %rdx/*t2478*/
   je      _loopend_818
_loopbody_819:
   movq    $1, %rdx/*t2479*/
_looptest_823:
   cmpq    $0, %rdx/*t2479*/
   je      _loopend_821
_loopbody_822:
   # movq    %rbx/*t2474*/, %rbx/*t2715*/
   incq    %rbx/*t2715*/
   # movq    %rbx/*t2715*/, %rbx/*t2474*/
   # movq    %rbx/*t2474*/, %rbx/*t2484*/
   movq    %rbx/*t2484*/, %r8/*t2554*/
   movq    (%r13/*t2470*/), %rdx/*t2716*/
   # movq    %rdx/*t2716*/, %rdx/*t2483*/
   movq    -8(%rdx/*t2483*/), %rcx/*t2717*/
   cmpq    %rcx/*t2717*/, %r8/*t2554*/
   jae     _boundsbad_817
_boundsok_824:
   movq    (%rdx/*t2483*/, %rbx/*t2484*/, 8), %rdx/*t2718*/
   # movq    %rdx/*t2718*/, %rdx/*t2480*/
   cmpq    %r9/*t2473*/, %rdx/*t2480*/
   jge     _L_825
_L_826:
   movq    $1, %rdx/*t2479*/
_L_827:
   jmp     _looptest_823
_boundsbad_817:
   movq    $1, %rdi
   call    _cs411error
_bail_812:
   movq    -24(%rbp), %rbx/*t2719*/
   # movq    %rbx/*t2719*/, %rbx
   movq    -16(%rbp), %r12/*t2720*/
   # movq    %r12/*t2720*/, %r12
   movq    -8(%rbp), %r13/*t2721*/
   # movq    %r13/*t2721*/, %r13
   # movq    %r14/*t2508*/, %r14
   # movq    %r15/*t2509*/, %r15
   jmp     _DONE_869
_L_825:
   movq    $0, %rdx/*t2479*/
   jmp     _L_827
_loopend_821:
   movq    $1, %rdx/*t2479*/
_looptest_830:
   cmpq    $0, %rdx/*t2479*/
   je      _loopend_828
_loopbody_829:
   # movq    %rdi/*t2475*/, %rdi/*t2722*/
   decq    %rdi/*t2722*/
   # movq    %rdi/*t2722*/, %rdi/*t2475*/
   # movq    %rdi/*t2475*/, %rdi/*t2486*/
   movq    %rdi/*t2486*/, %r8/*t2555*/
   movq    (%r13/*t2470*/), %rdx/*t2723*/
   # movq    %rdx/*t2723*/, %rdx/*t2485*/
   movq    -8(%rdx/*t2485*/), %rcx/*t2724*/
   cmpq    %rcx/*t2724*/, %r8/*t2555*/
   jae     _boundsbad_817
_boundsok_831:
   movq    (%rdx/*t2485*/, %rdi/*t2486*/, 8), %rdx/*t2725*/
   # movq    %rdx/*t2725*/, %rdx/*t2480*/
   cmpq    %rdx/*t2480*/, %r9/*t2473*/
   jge     _L_832
_L_833:
   movq    $1, %rdx/*t2479*/
_L_834:
   jmp     _looptest_830
_L_832:
   movq    $0, %rdx/*t2479*/
   jmp     _L_834
_loopend_828:
   # movq    %rbx/*t2474*/, %rbx/*t2488*/
   movq    %rbx/*t2488*/, %r8/*t2556*/
   movq    (%r13/*t2470*/), %rdx/*t2726*/
   # movq    %rdx/*t2726*/, %rdx/*t2487*/
   movq    -8(%rdx/*t2487*/), %rcx/*t2727*/
   cmpq    %rcx/*t2727*/, %r8/*t2556*/
   jae     _boundsbad_817
_boundsok_835:
   movq    (%rdx/*t2487*/, %rbx/*t2488*/, 8), %r8/*t2728*/
   # movq    %r8/*t2728*/, %r8/*t2477*/
   # movq    %rbx/*t2474*/, %rbx/*t2492*/
   movq    %rbx/*t2492*/, %rax/*t2557*/
   movq    (%r13/*t2470*/), %rcx/*t2729*/
   # movq    %rcx/*t2729*/, %rcx/*t2491*/
   movq    -8(%rcx/*t2491*/), %rdx/*t2730*/
   cmpq    %rdx/*t2730*/, %rax/*t2557*/
   jae     _boundsbad_817
_boundsok_837:
   # movq    %rcx/*t2491*/, %rcx/*t2731*/
   imulq   $8, %rbx/*t2492*/, %rdx/*t2732*/
   addq    %rdx/*t2732*/, %rcx/*t2731*/
   # movq    %rcx/*t2731*/, %rcx/*t2559*/
   # movq    %rdi/*t2475*/, %rdi/*t2490*/
   movq    %rdi/*t2490*/, %r10/*t2558*/
   movq    (%r13/*t2470*/), %rdx/*t2733*/
   # movq    %rdx/*t2733*/, %rdx/*t2489*/
   movq    -8(%rdx/*t2489*/), %rax/*t2734*/
   cmpq    %rax/*t2734*/, %r10/*t2558*/
   jae     _boundsbad_817
_boundsok_836:
   movq    (%rdx/*t2489*/, %rdi/*t2490*/, 8), %rdx/*t2735*/
   movq    %rdx/*t2735*/, (%rcx/*t2559*/)
   # movq    %rdi/*t2475*/, %rdi/*t2494*/
   movq    %rdi/*t2494*/, %rax/*t2560*/
   movq    (%r13/*t2470*/), %rdx/*t2736*/
   # movq    %rdx/*t2736*/, %rdx/*t2493*/
   movq    -8(%rdx/*t2493*/), %rcx/*t2737*/
   cmpq    %rcx/*t2737*/, %rax/*t2560*/
   jae     _boundsbad_817
_boundsok_838:
   movq    %r8/*t2477*/, (%rdx/*t2493*/, %rdi/*t2494*/, 8)
   movq    %rbx/*t2474*/, %rdx/*t2738*/
   incq    %rdx/*t2738*/
   cmpq    %rdx/*t2738*/, %rdi/*t2475*/
   jge     _L_840
_L_839:
   movq    $0, %rdx/*t2478*/
_L_841:
   jmp     _looptest_820
_L_840:
   movq    $1, %rdx/*t2478*/
   jmp     _L_841
_loopend_818:
   # movq    %rdi/*t2475*/, %rdi/*t2498*/
   # movq    %rdi/*t2498*/, %rdi/*t2561*/
   movq    (%r13/*t2470*/), %rdx/*t2739*/
   # movq    %rdx/*t2739*/, %rdx/*t2497*/
   movq    -8(%rdx/*t2497*/), %rcx/*t2740*/
   cmpq    %rcx/*t2740*/, %rdi/*t2561*/
   jae     _boundsbad_817
_boundsok_843:
   # movq    %rdx/*t2497*/, %rdx/*t2741*/
   imulq   $8, %rdi/*t2498*/, %rdi/*t2742*/
   addq    %rdi/*t2742*/, %rdx/*t2741*/
   # movq    %rdx/*t2741*/, %rdx/*t2563*/
   # movq    %rbx/*t2474*/, %rbx/*t2496*/
   movq    %rbx/*t2496*/, %r9/*t2562*/
   movq    (%r13/*t2470*/), %rdi/*t2743*/
   # movq    %rdi/*t2743*/, %rdi/*t2495*/
   movq    -8(%rdi/*t2495*/), %rcx/*t2744*/
   cmpq    %rcx/*t2744*/, %r9/*t2562*/
   jae     _boundsbad_817
_boundsok_842:
   movq    (%rdi/*t2495*/, %rbx/*t2496*/, 8), %rdi/*t2745*/
   movq    %rdi/*t2745*/, (%rdx/*t2563*/)
   # movq    %rbx/*t2474*/, %rbx/*t2502*/
   movq    %rbx/*t2502*/, %rcx/*t2564*/
   movq    (%r13/*t2470*/), %rdx/*t2746*/
   # movq    %rdx/*t2746*/, %rdx/*t2501*/
   movq    -8(%rdx/*t2501*/), %rdi/*t2747*/
   cmpq    %rdi/*t2747*/, %rcx/*t2564*/
   jae     _boundsbad_817
_boundsok_845:
   # movq    %rdx/*t2501*/, %rdx/*t2748*/
   imulq   $8, %rbx/*t2502*/, %rdi/*t2749*/
   addq    %rdi/*t2749*/, %rdx/*t2748*/
   # movq    %rdx/*t2748*/, %rdx/*t2566*/
   # movq    %r12/*t2472*/, %r12/*t2500*/
   movq    %r12/*t2500*/, %r9/*t2565*/
   movq    (%r13/*t2470*/), %rdi/*t2750*/
   # movq    %rdi/*t2750*/, %rdi/*t2499*/
   movq    -8(%rdi/*t2499*/), %rcx/*t2751*/
   cmpq    %rcx/*t2751*/, %r9/*t2565*/
   jae     _boundsbad_817
_boundsok_844:
   movq    (%rdi/*t2499*/, %r12/*t2500*/, 8), %rdi/*t2752*/
   movq    %rdi/*t2752*/, (%rdx/*t2566*/)
   # movq    %r12/*t2472*/, %r12/*t2504*/
   movq    %r12/*t2504*/, %rcx/*t2567*/
   movq    (%r13/*t2470*/), %rdi/*t2753*/
   # movq    %rdi/*t2753*/, %rdi/*t2503*/
   movq    -8(%rdi/*t2503*/), %rdx/*t2754*/
   cmpq    %rdx/*t2754*/, %rcx/*t2567*/
   jae     _boundsbad_817
_boundsok_846:
   movq    %r8/*t2477*/, (%rdi/*t2503*/, %r12/*t2504*/, 8)
   movq    %rbx/*t2474*/, %rdx/*t2755*/
   decq    %rdx/*t2755*/
   # movq    %rdx/*t2755*/, %rdx
   # movq    %rsi/*t2471*/, %rsi
   movq    %r13/*t2470*/, %rdi
   call    _QS_Sort
   # movq    %rax, %rax/*t2476*/
   movq    %r12/*t2472*/, %rdx
   # movq    %rbx/*t2474*/, %rbx/*t2756*/
   incq    %rbx/*t2756*/
   movq    %rbx/*t2756*/, %rsi
   movq    %r13/*t2470*/, %rdi
   call    _QS_Sort
   # movq    %rax, %rax/*t2476*/
_L_815:
   movq    $0, %rax
   jmp     _bail_812
_L_814:
   movq    $0, %rax/*t2476*/
   jmp     _L_815
_DONE_869:
   # return sink
   leave
   ret

.globl _QS_Print
_QS_Print:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_870:
   movq    %rbx, -16(%rbp)
   movq    %r12, -8(%rbp)
   # movq    %r13, %r13/*t2516*/
   # movq    %r14, %r14/*t2517*/
   # movq    %r15, %r15/*t2518*/
   movq    %rdi, %r12/*t2510*/
   movq    $0, %rbx/*t2511*/
_looptest_850:
   movq    8(%r12/*t2510*/), %rdi/*t2803*/
   cmpq    %rdi/*t2803*/, %rbx/*t2511*/
   jge     _loopend_848
_loopbody_849:
   # movq    %rbx/*t2511*/, %rbx/*t2513*/
   movq    %rbx/*t2513*/, %rdx/*t2611*/
   movq    (%r12/*t2510*/), %rdi/*t2804*/
   # movq    %rdi/*t2804*/, %rdi/*t2512*/
   movq    -8(%rdi/*t2512*/), %rsi/*t2805*/
   cmpq    %rsi/*t2805*/, %rdx/*t2611*/
   jae     _boundsbad_852
_boundsok_851:
   movq    (%rdi/*t2512*/, %rbx/*t2513*/, 8), %rdi/*t2806*/
   # movq    %rdi/*t2806*/, %rdi
   call    _cs411println
   # movq    %rbx/*t2511*/, %rbx/*t2807*/
   incq    %rbx/*t2807*/
   # movq    %rbx/*t2807*/, %rbx/*t2511*/
   jmp     _looptest_850
_boundsbad_852:
   movq    $1, %rdi
   call    _cs411error
_bail_847:
   movq    -16(%rbp), %rbx/*t2808*/
   # movq    %rbx/*t2808*/, %rbx
   movq    -8(%rbp), %r12/*t2809*/
   # movq    %r12/*t2809*/, %r12
   # movq    %r13/*t2516*/, %r13
   # movq    %r14/*t2517*/, %r14
   # movq    %r15/*t2518*/, %r15
   jmp     _DONE_871
_loopend_848:
   movq    $0, %rax
   jmp     _bail_847
_DONE_871:
   # return sink
   leave
   ret

.globl _QS_Init
_QS_Init:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_872:
   movq    %rbx, -8(%rbp)
   # movq    %r12, %r12/*t2542*/
   # movq    %r13, %r13/*t2543*/
   # movq    %r14, %r14/*t2544*/
   # movq    %r15, %r15/*t2545*/
   movq    %rdi, %rbx/*t2519*/
   # movq    %rsi, %rsi/*t2520*/
   movq    %rsi/*t2520*/, 8(%rbx/*t2519*/)
   # movq    %rbx/*t2519*/, %rbx/*t2618*/
   movq    %rsi/*t2520*/, %rdi
   call    _cs411newarray
   # movq    %rax, %rax/*t2617*/
   movq    %rax/*t2617*/, (%rbx/*t2618*/)
   movq    $0, %rsi/*t2522*/
   # movq    %rsi/*t2522*/, %rsi/*t2619*/
   movq    (%rbx/*t2519*/), %rdi/*t2827*/
   # movq    %rdi/*t2827*/, %rdi/*t2521*/
   movq    -8(%rdi/*t2521*/), %rdx/*t2828*/
   cmpq    %rdx/*t2828*/, %rsi/*t2619*/
   jae     _boundsbad_855
_boundsok_854:
   movq    $20, %rdx/*t2829*/
   movq    %rdx/*t2829*/, (%rdi/*t2521*/, %rsi/*t2522*/, 8)
   movq    $1, %rsi/*t2524*/
   # movq    %rsi/*t2524*/, %rsi/*t2620*/
   movq    (%rbx/*t2519*/), %rdi/*t2830*/
   # movq    %rdi/*t2830*/, %rdi/*t2523*/
   movq    -8(%rdi/*t2523*/), %rdx/*t2831*/
   cmpq    %rdx/*t2831*/, %rsi/*t2620*/
   jae     _boundsbad_855
_boundsok_856:
   movq    $7, %rdx/*t2832*/
   movq    %rdx/*t2832*/, (%rdi/*t2523*/, %rsi/*t2524*/, 8)
   movq    $2, %rsi/*t2526*/
   # movq    %rsi/*t2526*/, %rsi/*t2621*/
   movq    (%rbx/*t2519*/), %rdi/*t2833*/
   # movq    %rdi/*t2833*/, %rdi/*t2525*/
   movq    -8(%rdi/*t2525*/), %rdx/*t2834*/
   cmpq    %rdx/*t2834*/, %rsi/*t2621*/
   jae     _boundsbad_855
_boundsok_857:
   movq    $12, %rdx/*t2835*/
   movq    %rdx/*t2835*/, (%rdi/*t2525*/, %rsi/*t2526*/, 8)
   movq    $3, %rsi/*t2528*/
   # movq    %rsi/*t2528*/, %rsi/*t2622*/
   movq    (%rbx/*t2519*/), %rdi/*t2836*/
   # movq    %rdi/*t2836*/, %rdi/*t2527*/
   movq    -8(%rdi/*t2527*/), %rdx/*t2837*/
   cmpq    %rdx/*t2837*/, %rsi/*t2622*/
   jae     _boundsbad_855
_boundsok_858:
   movq    $18, %rdx/*t2838*/
   movq    %rdx/*t2838*/, (%rdi/*t2527*/, %rsi/*t2528*/, 8)
   movq    $4, %rsi/*t2530*/
   # movq    %rsi/*t2530*/, %rsi/*t2623*/
   movq    (%rbx/*t2519*/), %rdi/*t2839*/
   # movq    %rdi/*t2839*/, %rdi/*t2529*/
   movq    -8(%rdi/*t2529*/), %rdx/*t2840*/
   cmpq    %rdx/*t2840*/, %rsi/*t2623*/
   jae     _boundsbad_855
_boundsok_859:
   movq    $2, %rdx/*t2841*/
   movq    %rdx/*t2841*/, (%rdi/*t2529*/, %rsi/*t2530*/, 8)
   movq    $5, %rsi/*t2532*/
   # movq    %rsi/*t2532*/, %rsi/*t2624*/
   movq    (%rbx/*t2519*/), %rdi/*t2842*/
   # movq    %rdi/*t2842*/, %rdi/*t2531*/
   movq    -8(%rdi/*t2531*/), %rdx/*t2843*/
   cmpq    %rdx/*t2843*/, %rsi/*t2624*/
   jae     _boundsbad_855
_boundsok_860:
   movq    $11, %rdx/*t2844*/
   movq    %rdx/*t2844*/, (%rdi/*t2531*/, %rsi/*t2532*/, 8)
   movq    $6, %rsi/*t2534*/
   # movq    %rsi/*t2534*/, %rsi/*t2625*/
   movq    (%rbx/*t2519*/), %rdi/*t2845*/
   # movq    %rdi/*t2845*/, %rdi/*t2533*/
   movq    -8(%rdi/*t2533*/), %rdx/*t2846*/
   cmpq    %rdx/*t2846*/, %rsi/*t2625*/
   jae     _boundsbad_855
_boundsok_861:
   movq    $6, %rdx/*t2847*/
   movq    %rdx/*t2847*/, (%rdi/*t2533*/, %rsi/*t2534*/, 8)
   movq    $7, %rsi/*t2536*/
   # movq    %rsi/*t2536*/, %rsi/*t2626*/
   movq    (%rbx/*t2519*/), %rdi/*t2848*/
   # movq    %rdi/*t2848*/, %rdi/*t2535*/
   movq    -8(%rdi/*t2535*/), %rdx/*t2849*/
   cmpq    %rdx/*t2849*/, %rsi/*t2626*/
   jae     _boundsbad_855
_boundsok_862:
   movq    $9, %rdx/*t2850*/
   movq    %rdx/*t2850*/, (%rdi/*t2535*/, %rsi/*t2536*/, 8)
   movq    $8, %rsi/*t2538*/
   # movq    %rsi/*t2538*/, %rsi/*t2627*/
   movq    (%rbx/*t2519*/), %rdi/*t2851*/
   # movq    %rdi/*t2851*/, %rdi/*t2537*/
   movq    -8(%rdi/*t2537*/), %rdx/*t2852*/
   cmpq    %rdx/*t2852*/, %rsi/*t2627*/
   jae     _boundsbad_855
_boundsok_863:
   movq    $19, %rdx/*t2853*/
   movq    %rdx/*t2853*/, (%rdi/*t2537*/, %rsi/*t2538*/, 8)
   movq    $9, %rdi/*t2540*/
   # movq    %rdi/*t2540*/, %rdi/*t2628*/
   movq    (%rbx/*t2519*/), %rbx/*t2854*/
   # movq    %rbx/*t2854*/, %rbx/*t2539*/
   movq    -8(%rbx/*t2539*/), %rsi/*t2855*/
   cmpq    %rsi/*t2855*/, %rdi/*t2628*/
   jae     _boundsbad_855
_boundsok_864:
   movq    $5, %rsi/*t2856*/
   movq    %rsi/*t2856*/, (%rbx/*t2539*/, %rdi/*t2540*/, 8)
   movq    $0, %rax
_bail_853:
   movq    -8(%rbp), %rbx/*t2857*/
   # movq    %rbx/*t2857*/, %rbx
   # movq    %r12/*t2542*/, %r12
   # movq    %r13/*t2543*/, %r13
   # movq    %r14/*t2544*/, %r14
   # movq    %r15/*t2545*/, %r15
   jmp     _DONE_873
_boundsbad_855:
   movq    $1, %rdi
   call    _cs411error
   jmp     _bail_853
_DONE_873:
   # return sink
   leave
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_874:
   # movq    %rbx, %rbx/*t2546*/
   # movq    %r12, %r12/*t2547*/
   # movq    %r13, %r13/*t2548*/
   # movq    %r14, %r14/*t2549*/
   # movq    %r15, %r15/*t2550*/
   movq    $16, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t2660*/
   movq    $10, %rsi
   movq    %rax/*t2660*/, %rdi
   call    _QS_Start
   # movq    %rax, %rax/*t2659*/
   movq    %rax/*t2659*/, %rdi
   call    _cs411println
   # movq    %rbx/*t2546*/, %rbx
   # movq    %r12/*t2547*/, %r12
   # movq    %r13/*t2548*/, %r13
   # movq    %r14/*t2549*/, %r14
   # movq    %r15/*t2550*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
