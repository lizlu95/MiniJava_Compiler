   .text
.globl _cs411main
_cs411main:
   pushq  %rbp
   movq   %rsp, %rbp
_L_400:
   movq    %rbx, t1174
   movq    %r12, t1175
   movq    %r13, t1176
   movq    %r14, t1177
   movq    %r15, t1178
   movq    $16, t1227
   movq    t1227, %rdi
   call    _cs411newobject
   movq    %rax, t1220
   movq    $10, t1228
   movq    t1228, %rsi
   movq    t1220, %rdi
   call    _LS_Start
   movq    %rax, t1219
   movq    t1219, %rdi
   call    _cs411println
   movq    t1174, %rbx
   movq    t1175, %r12
   movq    t1176, %r13
   movq    t1177, %r14
   movq    t1178, %r15
_DONE_401:
   #return sink
   leave
   ret

.globl _LS_Start
_LS_Start:
   pushq  %rbp
   movq   %rsp, %rbp
_L_402:
   movq    %rdi, t1179
   movq    %rsi, t1180
   movq    %rbx, t1183
   movq    %r12, t1184
   movq    %r13, t1185
   movq    %r14, t1186
   movq    %r15, t1187
   movq    t1180, %rsi
   movq    t1179, %rdi
   call    _LS_Init
   movq    %rax, t1181
   movq    t1179, %rdi
   call    _LS_Print
   movq    %rax, t1182
   movq    $9999, t1229
   movq    t1229, %rdi
   call    _cs411println
   movq    $8, t1230
   movq    t1230, %rsi
   movq    t1179, %rdi
   call    _LS_Search
   movq    %rax, t1221
   movq    t1221, %rdi
   call    _cs411println
   movq    $12, t1231
   movq    t1231, %rsi
   movq    t1179, %rdi
   call    _LS_Search
   movq    %rax, t1222
   movq    t1222, %rdi
   call    _cs411println
   movq    $17, t1232
   movq    t1232, %rsi
   movq    t1179, %rdi
   call    _LS_Search
   movq    %rax, t1223
   movq    t1223, %rdi
   call    _cs411println
   movq    $50, t1233
   movq    t1233, %rsi
   movq    t1179, %rdi
   call    _LS_Search
   movq    %rax, t1224
   movq    t1224, %rdi
   call    _cs411println
   movq    $55, t1234
   movq    t1234, %rax
   movq    t1183, %rbx
   movq    t1184, %r12
   movq    t1185, %r13
   movq    t1186, %r14
   movq    t1187, %r15
_DONE_403:
   #return sink
   leave
   ret

.globl _LS_Print
_LS_Print:
   pushq  %rbp
   movq   %rsp, %rbp
_L_404:
   movq    %rdi, t1188
   movq    %rbx, t1190
   movq    %r12, t1191
   movq    %r13, t1192
   movq    %r14, t1193
   movq    %r15, t1194
   movq    $1, t1235
   movq    t1235, t1189
_L_387:
   movq    8(t1188), t1236
   cmpq    t1236, t1189
   jl      _L_386
_L_385:
   movq    $0, t1237
   movq    t1237, %rax
   movq    t1190, %rbx
   movq    t1191, %r12
   movq    t1192, %r13
   movq    t1193, %r14
   movq    t1194, %r15
   jmp     _DONE_405
_L_386:
   movq    (t1188), t1239
   movq    (t1239, t1189, 8), t1238
   movq    t1238, %rdi
   call    _cs411println
   movq    t1189, t1240
   incq    t1240
   movq    t1240, t1189
   jmp     _L_387
_DONE_405:
   #return sink
   leave
   ret

.globl _LS_Search
_LS_Search:
   pushq  %rbp
   movq   %rsp, %rbp
_L_406:
   movq    %rdi, t1195
   movq    %rsi, t1196
   movq    %rbx, t1203
   movq    %r12, t1204
   movq    %r13, t1205
   movq    %r14, t1206
   movq    %r15, t1207
   movq    $1, t1241
   movq    t1241, t1197
   movq    $0, t1242
   movq    t1242, t1198
   movq    $0, t1243
   movq    t1243, t1199
_L_390:
   movq    8(t1195), t1244
   cmpq    t1244, t1197
   jl      _L_389
_L_388:
   movq    t1199, %rax
   movq    t1203, %rbx
   movq    t1204, %r12
   movq    t1205, %r13
   movq    t1206, %r14
   movq    t1207, %r15
   jmp     _DONE_407
_L_389:
   movq    (t1195), t1246
   movq    (t1246, t1197, 8), t1245
   movq    t1245, t1200
   movq    t1196, t1247
   incq    t1247
   movq    t1247, t1201
   cmpq    t1196, t1200
   jl      _L_391
_L_392:
   cmpq    t1201, t1200
   jl      _L_395
_L_394:
   movq    $0, t1248
   movq    t1248, t1202
_L_396:
_L_393:
   movq    t1197, t1249
   incq    t1249
   movq    t1249, t1197
   jmp     _L_390
_L_391:
   movq    $0, t1250
   movq    t1250, t1202
   jmp     _L_393
_L_395:
   movq    $1, t1251
   movq    t1251, t1198
   movq    $1, t1252
   movq    t1252, t1199
   movq    8(t1195), t1253
   movq    t1253, t1197
   jmp     _L_396
_DONE_407:
   #return sink
   leave
   ret

.globl _LS_Init
_LS_Init:
   pushq  %rbp
   movq   %rsp, %rbp
_L_408:
   movq    %rdi, t1208
   movq    %rsi, t1209
   movq    %rbx, t1214
   movq    %r12, t1215
   movq    %r13, t1216
   movq    %r14, t1217
   movq    %r15, t1218
   movq    t1209, 8(t1208)
   movq    t1208, t1226
   movq    t1209, %rdi
   call    _cs411newarray
   movq    %rax, t1225
   movq    t1225, (t1226)
   movq    $1, t1254
   movq    t1254, t1210
   movq    8(t1208), t1256
   movq    t1256, t1255
   incq    t1255
   movq    t1255, t1211
_L_399:
   movq    8(t1208), t1257
   cmpq    t1257, t1210
   jl      _L_398
_L_397:
   movq    $0, t1258
   movq    t1258, %rax
   movq    t1214, %rbx
   movq    t1215, %r12
   movq    t1216, %r13
   movq    t1217, %r14
   movq    t1218, %r15
   jmp     _DONE_409
_L_398:
   imulq   $2, t1210, t1259
   movq    t1259, t1212
   movq    t1211, t1260
   movq    $3, t1261
   subq    t1261, t1260
   movq    t1260, t1213
   movq    (t1208), t1262
   movq    t1212, t1263
   addq    t1213, t1263
   movq    t1263, (t1262, t1210, 8)
   movq    t1210, t1264
   incq    t1264
   movq    t1264, t1210
   movq    t1211, t1265
   decq    t1265
   movq    t1265, t1211
   jmp     _L_399
_DONE_409:
   #return sink
   leave
   ret

   .ident	"minijavac: cs411 course project 2011w2"
