   .text
.text
.globl _Test_do
_Test_do:
_L_6:
   movq    %rbx, t003
   movq    %r12, t004
   movq    %r13, t005
   movq    %r14, t006
   movq    %r15, t007
   movq    %rdi, t000
   movq    $0, t001
   movq    $5, t002
   cmpq    $10, t001
   jge     _loopend_2
_loopbody_3:
   movq    1, t001
   addq    t001, t001
_looptest_4:
   cmpq    $10, t001
   jl      _loopbody_3
_loopend_2:
   movq    t002, t013
   imulq   t001, t013
   movq    t013, %rax
_bail_1:
   movq    t003, %rbx
   movq    t004, %r12
   movq    t005, %r13
   movq    t006, %r14
   movq    t007, %r15
_DONE_7:
   # return sink
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_8:
   movq    %rbx, t008
   movq    %r12, t009
   movq    %r13, t010
   movq    %r14, t011
   movq    %r15, t012
   movq    $0, %rdi
   call    _cs411newobject
   movq    %rax, t015
   movq    t015, %rdi
   call    _Test_do
   movq    %rax, t014
   movq    t014, %rdi
   call    _cs411println
_bail_5:
   movq    t008, %rbx
   movq    t009, %r12
   movq    t010, %r13
   movq    t011, %r14
   movq    t012, %r15
_DONE_9:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2014w2"
