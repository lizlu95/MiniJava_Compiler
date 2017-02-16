   .text
.globl _Foo_doit
_Foo_doit:
   subq   $8, %rsp
_L_803:
   # movq    %rbx, %rbx/*t2428*/
   # movq    %r12, %r12/*t2429*/
   # movq    %r13, %r13/*t2430*/
   # movq    %r14, %r14/*t2431*/
   # movq    %r15, %r15/*t2432*/
   # movq    %rdi, %rdi/*t2426*/
   movq    $10, %rsi/*t2451*/
   movq    %rsi/*t2451*/, (%rdi/*t2426*/)
   movq    %rdi/*t2426*/, %rsi
   # movq    %rdi/*t2426*/, %rdi
   call    _Foo_ident
   # movq    %rax, %rax/*t2427*/
   cmpq    $0, %rax/*t2427*/
   je      _L_799
_L_798:
   movq    %rax/*t2427*/, %rdi
   call    _Foo_getField
   # movq    %rax, %rax
_bail_797:
   # movq    %rbx/*t2428*/, %rbx
   # movq    %r12/*t2429*/, %r12
   # movq    %r13/*t2430*/, %r13
   # movq    %r14/*t2431*/, %r14
   # movq    %r15/*t2432*/, %r15
   jmp     _DONE_804
_L_799:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_797
_DONE_804:
   # return sink
   addq   $8, %rsp
   ret

.globl _Foo_ident
_Foo_ident:
_L_805:
   # movq    %rbx, %rbx/*t2435*/
   # movq    %r12, %r12/*t2436*/
   # movq    %r13, %r13/*t2437*/
   # movq    %r14, %r14/*t2438*/
   # movq    %r15, %r15/*t2439*/
   # movq    %rsi, %rsi/*t2434*/
   movq    %rsi/*t2434*/, %rax
   # movq    %rbx/*t2435*/, %rbx
   # movq    %r12/*t2436*/, %r12
   # movq    %r13/*t2437*/, %r13
   # movq    %r14/*t2438*/, %r14
   # movq    %r15/*t2439*/, %r15
   # return sink
   ret

.globl _Foo_getField
_Foo_getField:
_L_807:
   # movq    %rbx, %rbx/*t2441*/
   # movq    %r12, %r12/*t2442*/
   # movq    %r13, %r13/*t2443*/
   # movq    %r14, %r14/*t2444*/
   # movq    %r15, %r15/*t2445*/
   # movq    %rdi, %rdi/*t2440*/
   movq    (%rdi/*t2440*/), %rax/*t2452*/
   # movq    %rax/*t2452*/, %rax
   # movq    %rbx/*t2441*/, %rbx
   # movq    %r12/*t2442*/, %r12
   # movq    %r13/*t2443*/, %r13
   # movq    %r14/*t2444*/, %r14
   # movq    %r15/*t2445*/, %r15
   # return sink
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_809:
   # movq    %rbx, %rbx/*t2446*/
   # movq    %r12, %r12/*t2447*/
   # movq    %r13, %r13/*t2448*/
   # movq    %r14, %r14/*t2449*/
   # movq    %r15, %r15/*t2450*/
   movq    $8, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t2454*/
   movq    %rax/*t2454*/, %rdi
   call    _Foo_doit
   # movq    %rax, %rax/*t2453*/
   movq    %rax/*t2453*/, %rdi
   call    _cs411println
   # movq    %rbx/*t2446*/, %rbx
   # movq    %r12/*t2447*/, %r12
   # movq    %r13/*t2448*/, %r13
   # movq    %r14/*t2449*/, %r14
   # movq    %r15/*t2450*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
