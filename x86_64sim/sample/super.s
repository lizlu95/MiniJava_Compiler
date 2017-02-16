   .text
.globl _A_ainit
_A_ainit:
_L_1144:
   # movq    %rbx, %rbx/*t3657*/
   # movq    %r12, %r12/*t3658*/
   # movq    %r13, %r13/*t3659*/
   # movq    %r14, %r14/*t3660*/
   # movq    %r15, %r15/*t3661*/
   # movq    %rdi, %rdi/*t3654*/
   # movq    %rsi, %rsi/*t3655*/
   # movq    %rdx, %rdx/*t3656*/
   movq    %rsi/*t3655*/, (%rdi/*t3654*/)
   movq    %rdx/*t3656*/, 8(%rdi/*t3654*/)
   movq    $0, %rax
   # movq    %rbx/*t3657*/, %rbx
   # movq    %r12/*t3658*/, %r12
   # movq    %r13/*t3659*/, %r13
   # movq    %r14/*t3660*/, %r14
   # movq    %r15/*t3661*/, %r15
   # return sink
   ret

.globl _A_getX
_A_getX:
_L_1146:
   # movq    %rbx, %rbx/*t3663*/
   # movq    %r12, %r12/*t3664*/
   # movq    %r13, %r13/*t3665*/
   # movq    %r14, %r14/*t3666*/
   # movq    %r15, %r15/*t3667*/
   # movq    %rdi, %rdi/*t3662*/
   movq    (%rdi/*t3662*/), %rax/*t3725*/
   # movq    %rax/*t3725*/, %rax
   # movq    %rbx/*t3663*/, %rbx
   # movq    %r12/*t3664*/, %r12
   # movq    %r13/*t3665*/, %r13
   # movq    %r14/*t3666*/, %r14
   # movq    %r15/*t3667*/, %r15
   # return sink
   ret

.globl _A_getY
_A_getY:
_L_1148:
   # movq    %rbx, %rbx/*t3669*/
   # movq    %r12, %r12/*t3670*/
   # movq    %r13, %r13/*t3671*/
   # movq    %r14, %r14/*t3672*/
   # movq    %r15, %r15/*t3673*/
   # movq    %rdi, %rdi/*t3668*/
   movq    8(%rdi/*t3668*/), %rax/*t3726*/
   # movq    %rax/*t3726*/, %rax
   # movq    %rbx/*t3669*/, %rbx
   # movq    %r12/*t3670*/, %r12
   # movq    %r13/*t3671*/, %r13
   # movq    %r14/*t3672*/, %r14
   # movq    %r15/*t3673*/, %r15
   # return sink
   ret

.globl _A_sum
_A_sum:
_L_1150:
   # movq    %rbx, %rbx/*t3675*/
   # movq    %r12, %r12/*t3676*/
   # movq    %r13, %r13/*t3677*/
   # movq    %r14, %r14/*t3678*/
   # movq    %r15, %r15/*t3679*/
   # movq    %rdi, %rdi/*t3674*/
   movq    (%rdi/*t3674*/), %rax/*t3728*/
   # movq    %rax/*t3728*/, %rax/*t3727*/
   movq    8(%rdi/*t3674*/), %rdi/*t3729*/
   addq    %rdi/*t3729*/, %rax/*t3727*/
   # movq    %rax/*t3727*/, %rax
   # movq    %rbx/*t3675*/, %rbx
   # movq    %r12/*t3676*/, %r12
   # movq    %r13/*t3677*/, %r13
   # movq    %r14/*t3678*/, %r14
   # movq    %r15/*t3679*/, %r15
   # return sink
   ret

.globl _B_binit
_B_binit:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_1152:
   movq    %rbx, -16(%rbp)
   movq    %r12, -8(%rbp)
   # movq    %r13, %r13/*t3687*/
   # movq    %r14, %r14/*t3688*/
   # movq    %r15, %r15/*t3689*/
   movq    %rdi, %r12/*t3680*/
   # movq    %rsi, %rsi/*t3681*/
   # movq    %rdx, %rdx/*t3682*/
   movq    %rcx, %rbx/*t3683*/
   # movq    %rdx/*t3682*/, %rdx
   # movq    %rsi/*t3681*/, %rsi
   movq    %r12/*t3680*/, %rdi
   call    _A_ainit
   # movq    %rax, %rax/*t3684*/
   movq    %rbx/*t3683*/, 16(%r12/*t3680*/)
   movq    $0, %rax
_bail_1130:
   movq    -16(%rbp), %rbx/*t3750*/
   # movq    %rbx/*t3750*/, %rbx
   movq    -8(%rbp), %r12/*t3751*/
   # movq    %r12/*t3751*/, %r12
   # movq    %r13/*t3687*/, %r13
   # movq    %r14/*t3688*/, %r14
   # movq    %r15/*t3689*/, %r15
_DONE_1153:
   # return sink
   leave
   ret

.globl _B_getZ
_B_getZ:
_L_1154:
   # movq    %rbx, %rbx/*t3691*/
   # movq    %r12, %r12/*t3692*/
   # movq    %r13, %r13/*t3693*/
   # movq    %r14, %r14/*t3694*/
   # movq    %r15, %r15/*t3695*/
   # movq    %rdi, %rdi/*t3690*/
   movq    16(%rdi/*t3690*/), %rax/*t3730*/
   # movq    %rax/*t3730*/, %rax
   # movq    %rbx/*t3691*/, %rbx
   # movq    %r12/*t3692*/, %r12
   # movq    %r13/*t3693*/, %r13
   # movq    %r14/*t3694*/, %r14
   # movq    %r15/*t3695*/, %r15
   # return sink
   ret

.globl _B_sum
_B_sum:
_L_1156:
   # movq    %rbx, %rbx/*t3697*/
   # movq    %r12, %r12/*t3698*/
   # movq    %r13, %r13/*t3699*/
   # movq    %r14, %r14/*t3700*/
   # movq    %r15, %r15/*t3701*/
   # movq    %rdi, %rdi/*t3696*/
   movq    (%rdi/*t3696*/), %rax/*t3733*/
   # movq    %rax/*t3733*/, %rax/*t3732*/
   movq    8(%rdi/*t3696*/), %rsi/*t3734*/
   addq    %rsi/*t3734*/, %rax/*t3732*/
   # movq    %rax/*t3732*/, %rax/*t3731*/
   movq    16(%rdi/*t3696*/), %rdi/*t3735*/
   addq    %rdi/*t3735*/, %rax/*t3731*/
   # movq    %rax/*t3731*/, %rax
   # movq    %rbx/*t3697*/, %rbx
   # movq    %r12/*t3698*/, %r12
   # movq    %r13/*t3699*/, %r13
   # movq    %r14/*t3700*/, %r14
   # movq    %r15/*t3701*/, %r15
   # return sink
   ret

.globl _Test_do
_Test_do:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_1158:
   movq    %rbx, -16(%rbp)
   movq    %r12, -8(%rbp)
   # movq    %r13, %r13/*t3717*/
   # movq    %r14, %r14/*t3718*/
   # movq    %r15, %r15/*t3719*/
   # movq    %rdi, %rdi/*t3702*/
   movq    $16, %rdi
   call    _cs411newobject
   movq    %rax, %r12/*t3703*/
   movq    $24, %rdi
   call    _cs411newobject
   movq    %rax, %rbx/*t3704*/
   # movq    %rbx/*t3704*/, %rbx/*t3705*/
   # movq    %r12/*t3703*/, %r12/*t3707*/
   cmpq    $0, %r12/*t3707*/
   je      _L_1135
_L_1134:
   movq    $2, %rdx
   movq    $1, %rsi
   movq    %r12/*t3707*/, %rdi
   call    _A_ainit
   # movq    %rax, %rax/*t3706*/
   movq    %rbx/*t3704*/, %rdi/*t3708*/
   cmpq    $0, %rdi/*t3708*/
   je      _L_1135
_L_1136:
   movq    $3, %rcx
   movq    $2, %rdx
   movq    $1, %rsi
   # movq    %rdi/*t3708*/, %rdi
   call    _B_binit
   # movq    %rax, %rax/*t3706*/
   # movq    %r12/*t3703*/, %r12/*t3709*/
   cmpq    $0, %r12/*t3709*/
   je      _L_1135
_L_1137:
   movq    %r12/*t3709*/, %rdi
   call    _A_getX
   movq    %rax, %rdi
   call    _cs411println
   # movq    %r12/*t3703*/, %r12/*t3710*/
   cmpq    $0, %r12/*t3710*/
   je      _L_1135
_L_1138:
   movq    %r12/*t3710*/, %rdi
   call    _A_getY
   movq    %rax, %rdi
   call    _cs411println
   movq    %rbx/*t3704*/, %rdi/*t3711*/
   cmpq    $0, %rdi/*t3711*/
   je      _L_1135
_L_1139:
   # movq    %rdi/*t3711*/, %rdi
   call    _B_getZ
   movq    %rax, %rdi
   call    _cs411println
   # movq    %r12/*t3703*/, %r12/*t3712*/
   cmpq    $0, %r12/*t3712*/
   je      _L_1135
_L_1140:
   movq    %r12/*t3712*/, %rdi
   call    _A_sum
   movq    %rax, %rdi
   call    _cs411println
   movq    %rbx/*t3704*/, %rdi/*t3713*/
   cmpq    $0, %rdi/*t3713*/
   je      _L_1135
_L_1141:
   # movq    %rdi/*t3713*/, %rdi
   call    _B_sum
   movq    %rax, %rdi
   call    _cs411println
   # movq    %rbx/*t3705*/, %rbx/*t3714*/
   cmpq    $0, %rbx/*t3714*/
   je      _L_1135
_L_1142:
   movq    %rbx/*t3714*/, %rdi
   call    _A_sum
   movq    %rax, %rdi
   call    _cs411println
   movq    $0, %rax
_bail_1133:
   movq    -16(%rbp), %rbx/*t3770*/
   # movq    %rbx/*t3770*/, %rbx
   movq    -8(%rbp), %r12/*t3771*/
   # movq    %r12/*t3771*/, %r12
   # movq    %r13/*t3717*/, %r13
   # movq    %r14/*t3718*/, %r14
   # movq    %r15/*t3719*/, %r15
   jmp     _DONE_1159
_L_1135:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1133
_DONE_1159:
   # return sink
   leave
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_1160:
   # movq    %rbx, %rbx/*t3720*/
   # movq    %r12, %r12/*t3721*/
   # movq    %r13, %r13/*t3722*/
   # movq    %r14, %r14/*t3723*/
   # movq    %r15, %r15/*t3724*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t3737*/
   movq    %rax/*t3737*/, %rdi
   call    _Test_do
   # movq    %rax, %rax/*t3736*/
   movq    %rax/*t3736*/, %rdi
   call    _cs411println
   # movq    %rbx/*t3720*/, %rbx
   # movq    %r12/*t3721*/, %r12
   # movq    %r13/*t3722*/, %r13
   # movq    %r14/*t3723*/, %r14
   # movq    %r15/*t3724*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
