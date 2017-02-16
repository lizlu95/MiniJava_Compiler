   .text
.globl _cs411main
_cs411main:
   pushq  %rbp
   movq   %rsp, %rbp
_L_368:
   movq    %rbx, t1053
   movq    %r12, t1054
   movq    %r13, t1055
   movq    %r14, t1056
   movq    %r15, t1057
   movq    $16, t1099
   movq    t1099, %rdi
   call    _cs411newobject
   movq    %rax, t1096
   movq    $10, t1100
   movq    t1100, %rsi
   movq    t1096, %rdi
   call    _BBS_Start
   movq    %rax, t1095
   movq    t1095, %rdi
   call    _cs411println
   movq    t1053, %rbx
   movq    t1054, %r12
   movq    t1055, %r13
   movq    t1056, %r14
   movq    t1057, %r15
_DONE_369:
   #return sink
   leave
   ret

.globl _BBS_Start
_BBS_Start:
   pushq  %rbp
   movq   %rsp, %rbp
_L_370:
   movq    %rdi, t1058
   movq    %rsi, t1059
   movq    %rbx, t1061
   movq    %r12, t1062
   movq    %r13, t1063
   movq    %r14, t1064
   movq    %r15, t1065
   movq    t1059, %rsi
   movq    t1058, %rdi
   call    _BBS_Init
   movq    %rax, t1060
   movq    t1058, %rdi
   call    _BBS_Print
   movq    %rax, t1060
   movq    $99999, t1101
   movq    t1101, %rdi
   call    _cs411println
   movq    t1058, %rdi
   call    _BBS_Sort
   movq    %rax, t1060
   movq    t1058, %rdi
   call    _BBS_Print
   movq    %rax, t1060
   movq    $0, t1102
   movq    t1102, %rax
   movq    t1061, %rbx
   movq    t1062, %r12
   movq    t1063, %r13
   movq    t1064, %r14
   movq    t1065, %r15
_DONE_371:
   #return sink
   leave
   ret

.globl _BBS_Sort
_BBS_Sort:
   pushq  %rbp
   movq   %rsp, %rbp
_L_372:
   movq    %rdi, t1066
   movq    %rbx, t1076
   movq    %r12, t1077
   movq    %r13, t1078
   movq    %r14, t1079
   movq    %r15, t1080
   movq    8(t1066), t1104
   movq    t1104, t1103
   decq    t1103
   movq    t1103, t1068
   movq    $-1, t1105
   movq    t1105, t1069
_L_358:
   cmpq    t1068, t1069
   jl      _L_357
_L_356:
   movq    $0, t1106
   movq    t1106, %rax
   movq    t1076, %rbx
   movq    t1077, %r12
   movq    t1078, %r13
   movq    t1079, %r14
   movq    t1080, %r15
   jmp     _DONE_373
_L_357:
   movq    $1, t1107
   movq    t1107, t1074
_L_361:
   movq    t1068, t1108
   incq    t1108
   cmpq    t1108, t1074
   jl      _L_360
_L_359:
   movq    t1068, t1109
   decq    t1109
   movq    t1109, t1068
   jmp     _L_358
_L_360:
   movq    t1074, t1110
   decq    t1110
   movq    t1110, t1073
   movq    (t1066), t1112
   movq    (t1112, t1073, 8), t1111
   movq    t1111, t1070
   movq    (t1066), t1114
   movq    (t1114, t1074, 8), t1113
   movq    t1113, t1071
   cmpq    t1070, t1071
   jl      _L_362
_L_363:
   movq    $0, t1115
   movq    t1115, t1067
_L_364:
   movq    t1074, t1116
   incq    t1116
   movq    t1116, t1074
   jmp     _L_361
_L_362:
   movq    t1074, t1117
   decq    t1117
   movq    t1117, t1072
   movq    (t1066), t1119
   movq    (t1119, t1072, 8), t1118
   movq    t1118, t1075
   movq    (t1066), t1120
   movq    (t1066), t1122
   movq    (t1122, t1074, 8), t1121
   movq    t1121, (t1120, t1072, 8)
   movq    (t1066), t1123
   movq    t1075, (t1123, t1074, 8)
   jmp     _L_364
_DONE_373:
   #return sink
   leave
   ret

.globl _BBS_Print
_BBS_Print:
   pushq  %rbp
   movq   %rsp, %rbp
_L_374:
   movq    %rdi, t1081
   movq    %rbx, t1083
   movq    %r12, t1084
   movq    %r13, t1085
   movq    %r14, t1086
   movq    %r15, t1087
   movq    $0, t1124
   movq    t1124, t1082
_L_367:
   movq    8(t1081), t1125
   cmpq    t1125, t1082
   jl      _L_366
_L_365:
   movq    $0, t1126
   movq    t1126, %rax
   movq    t1083, %rbx
   movq    t1084, %r12
   movq    t1085, %r13
   movq    t1086, %r14
   movq    t1087, %r15
   jmp     _DONE_375
_L_366:
   movq    (t1081), t1128
   movq    (t1128, t1082, 8), t1127
   movq    t1127, %rdi
   call    _cs411println
   movq    t1082, t1129
   incq    t1129
   movq    t1129, t1082
   jmp     _L_367
_DONE_375:
   #return sink
   leave
   ret

.globl _BBS_Init
_BBS_Init:
   pushq  %rbp
   movq   %rsp, %rbp
_L_376:
   movq    %rdi, t1088
   movq    %rsi, t1089
   movq    %rbx, t1090
   movq    %r12, t1091
   movq    %r13, t1092
   movq    %r14, t1093
   movq    %r15, t1094
   movq    t1089, 8(t1088)
   movq    t1088, t1098
   movq    t1089, %rdi
   call    _cs411newarray
   movq    %rax, t1097
   movq    t1097, (t1098)
   movq    (t1088), t1130
   movq    $20, t1131
   movq    t1131, (t1130)
   movq    (t1088), t1132
   movq    $7, t1133
   movq    t1133, 8(t1132)
   movq    (t1088), t1134
   movq    $12, t1135
   movq    t1135, 16(t1134)
   movq    (t1088), t1136
   movq    $18, t1137
   movq    t1137, 24(t1136)
   movq    (t1088), t1138
   movq    $2, t1139
   movq    t1139, 32(t1138)
   movq    (t1088), t1140
   movq    $11, t1141
   movq    t1141, 40(t1140)
   movq    (t1088), t1142
   movq    $6, t1143
   movq    t1143, 48(t1142)
   movq    (t1088), t1144
   movq    $9, t1145
   movq    t1145, 56(t1144)
   movq    (t1088), t1146
   movq    $19, t1147
   movq    t1147, 64(t1146)
   movq    (t1088), t1148
   movq    $5, t1149
   movq    t1149, 72(t1148)
   movq    $0, t1150
   movq    t1150, %rax
   movq    t1090, %rbx
   movq    t1091, %r12
   movq    t1092, %r13
   movq    t1093, %r14
   movq    t1094, %r15
_DONE_377:
   #return sink
   leave
   ret

   .ident	"minijavac: cs411 course project 2011w2"
