   .text
.globl _cs411main
_cs411main:
   pushq  %rbp
   movq   %rsp, %rbp
_L_381:
   movq    %rbx, t1151
   movq    %r12, t1152
   movq    %r13, t1153
   movq    %r14, t1154
   movq    %r15, t1155
   movq    $0, t1168
   movq    t1168, %rdi
   call    _cs411newobject
   movq    %rax, t1165
   movq    $10, t1169
   movq    t1169, %rsi
   movq    t1165, %rdi
   call    _Fac_ComputeFac
   movq    %rax, t1164
   movq    t1164, %rdi
   call    _cs411println
   movq    t1151, %rbx
   movq    t1152, %r12
   movq    t1153, %r13
   movq    t1154, %r14
   movq    t1155, %r15
_DONE_382:
   #return sink
   leave
   ret

.globl _Fac_ComputeFac
_Fac_ComputeFac:
   pushq  %rbp
   movq   %rsp, %rbp
_L_383:
   movq    %rdi, t1156
   movq    %rsi, t1157
   movq    %rbx, t1159
   movq    %r12, t1160
   movq    %r13, t1161
   movq    %r14, t1162
   movq    %r15, t1163
   movq    $1, t1170
   cmpq    t1170, t1157
   jl      _L_378
_L_379:
   movq    t1157, t1167
   movq    t1157, t1171
   decq    t1171
   movq    t1171, %rsi
   movq    t1156, %rdi
   call    _Fac_ComputeFac
   movq    %rax, t1166
   movq    t1167, t1172
   imulq   t1166, t1172
   movq    t1172, t1158
_L_380:
   movq    t1158, %rax
   movq    t1159, %rbx
   movq    t1160, %r12
   movq    t1161, %r13
   movq    t1162, %r14
   movq    t1163, %r15
   jmp     _DONE_384
_L_378:
   movq    $1, t1173
   movq    t1173, t1158
   jmp     _L_380
_DONE_384:
   #return sink
   leave
   ret

   .ident	"minijavac: cs411 course project 2011w2"
