   .text
.globl _BT_Start
_BT_Start:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_516:
   movq    %rbx, -8(%rbp)
   # movq    %r12, %r12/*t1071*/
   # movq    %r13, %r13/*t1072*/
   # movq    %r14, %r14/*t1073*/
   # movq    %r15, %r15/*t1074*/
   # movq    %rdi, %rdi/*t1047*/
   movq    $48, %rdi
   call    _cs411newobject
   movq    %rax, %rbx/*t1048*/
   # movq    %rbx/*t1048*/, %rbx/*t1051*/
   cmpq    $0, %rbx/*t1051*/
   je      _L_343
_L_342:
   movq    $16, %rsi
   movq    %rbx/*t1051*/, %rdi
   call    _Tree_Init
   # movq    %rax, %rax/*t1049*/
   # movq    %rbx/*t1048*/, %rbx/*t1052*/
   cmpq    $0, %rbx/*t1052*/
   je      _L_343
_L_344:
   movq    %rbx/*t1052*/, %rdi
   call    _Tree_Print
   # movq    %rax, %rax/*t1049*/
   movq    $100000000, %rdi
   call    _cs411println
   # movq    %rbx/*t1048*/, %rbx/*t1053*/
   cmpq    $0, %rbx/*t1053*/
   je      _L_343
_L_345:
   movq    $8, %rsi
   movq    %rbx/*t1053*/, %rdi
   call    _Tree_Insert
   # movq    %rax, %rax/*t1049*/
   # movq    %rbx/*t1048*/, %rbx/*t1054*/
   cmpq    $0, %rbx/*t1054*/
   je      _L_343
_L_346:
   movq    %rbx/*t1054*/, %rdi
   call    _Tree_Print
   # movq    %rax, %rax/*t1049*/
   # movq    %rbx/*t1048*/, %rbx/*t1055*/
   cmpq    $0, %rbx/*t1055*/
   je      _L_343
_L_347:
   movq    $24, %rsi
   movq    %rbx/*t1055*/, %rdi
   call    _Tree_Insert
   # movq    %rax, %rax/*t1049*/
   # movq    %rbx/*t1048*/, %rbx/*t1056*/
   cmpq    $0, %rbx/*t1056*/
   je      _L_343
_L_348:
   movq    $4, %rsi
   movq    %rbx/*t1056*/, %rdi
   call    _Tree_Insert
   # movq    %rax, %rax/*t1049*/
   # movq    %rbx/*t1048*/, %rbx/*t1057*/
   cmpq    $0, %rbx/*t1057*/
   je      _L_343
_L_349:
   movq    $12, %rsi
   movq    %rbx/*t1057*/, %rdi
   call    _Tree_Insert
   # movq    %rax, %rax/*t1049*/
   # movq    %rbx/*t1048*/, %rbx/*t1058*/
   cmpq    $0, %rbx/*t1058*/
   je      _L_343
_L_350:
   movq    $20, %rsi
   movq    %rbx/*t1058*/, %rdi
   call    _Tree_Insert
   # movq    %rax, %rax/*t1049*/
   # movq    %rbx/*t1048*/, %rbx/*t1059*/
   cmpq    $0, %rbx/*t1059*/
   je      _L_343
_L_351:
   movq    $28, %rsi
   movq    %rbx/*t1059*/, %rdi
   call    _Tree_Insert
   # movq    %rax, %rax/*t1049*/
   # movq    %rbx/*t1048*/, %rbx/*t1060*/
   cmpq    $0, %rbx/*t1060*/
   je      _L_343
_L_352:
   movq    $14, %rsi
   movq    %rbx/*t1060*/, %rdi
   call    _Tree_Insert
   # movq    %rax, %rax/*t1049*/
   # movq    %rbx/*t1048*/, %rbx/*t1061*/
   cmpq    $0, %rbx/*t1061*/
   je      _L_343
_L_353:
   movq    %rbx/*t1061*/, %rdi
   call    _Tree_Print
   # movq    %rax, %rax/*t1049*/
   # movq    %rbx/*t1048*/, %rbx/*t1062*/
   cmpq    $0, %rbx/*t1062*/
   je      _L_343
_L_354:
   movq    $24, %rsi
   movq    %rbx/*t1062*/, %rdi
   call    _Tree_Search
   movq    %rax, %rdi
   call    _cs411println
   # movq    %rbx/*t1048*/, %rbx/*t1063*/
   cmpq    $0, %rbx/*t1063*/
   je      _L_343
_L_355:
   movq    $12, %rsi
   movq    %rbx/*t1063*/, %rdi
   call    _Tree_Search
   movq    %rax, %rdi
   call    _cs411println
   # movq    %rbx/*t1048*/, %rbx/*t1064*/
   cmpq    $0, %rbx/*t1064*/
   je      _L_343
_L_356:
   movq    $16, %rsi
   movq    %rbx/*t1064*/, %rdi
   call    _Tree_Search
   movq    %rax, %rdi
   call    _cs411println
   # movq    %rbx/*t1048*/, %rbx/*t1065*/
   cmpq    $0, %rbx/*t1065*/
   je      _L_343
_L_357:
   movq    $50, %rsi
   movq    %rbx/*t1065*/, %rdi
   call    _Tree_Search
   movq    %rax, %rdi
   call    _cs411println
   # movq    %rbx/*t1048*/, %rbx/*t1066*/
   cmpq    $0, %rbx/*t1066*/
   je      _L_343
_L_358:
   movq    $12, %rsi
   movq    %rbx/*t1066*/, %rdi
   call    _Tree_Search
   movq    %rax, %rdi
   call    _cs411println
   # movq    %rbx/*t1048*/, %rbx/*t1067*/
   cmpq    $0, %rbx/*t1067*/
   je      _L_343
_L_359:
   movq    $12, %rsi
   movq    %rbx/*t1067*/, %rdi
   call    _Tree_Delete
   # movq    %rax, %rax/*t1049*/
   # movq    %rbx/*t1048*/, %rbx/*t1068*/
   cmpq    $0, %rbx/*t1068*/
   je      _L_343
_L_360:
   movq    %rbx/*t1068*/, %rdi
   call    _Tree_Print
   # movq    %rax, %rax/*t1049*/
   # movq    %rbx/*t1048*/, %rbx/*t1069*/
   cmpq    $0, %rbx/*t1069*/
   je      _L_343
_L_361:
   movq    $12, %rsi
   movq    %rbx/*t1069*/, %rdi
   call    _Tree_Search
   movq    %rax, %rdi
   call    _cs411println
   movq    $0, %rax
_bail_341:
   movq    -8(%rbp), %rbx/*t1332*/
   # movq    %rbx/*t1332*/, %rbx
   # movq    %r12/*t1071*/, %r12
   # movq    %r13/*t1072*/, %r13
   # movq    %r14/*t1073*/, %r14
   # movq    %r15/*t1074*/, %r15
   jmp     _DONE_517
_L_343:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_341
_DONE_517:
   # return sink
   leave
   ret

.globl _Tree_Init
_Tree_Init:
_L_518:
   # movq    %rbx, %rbx/*t1077*/
   # movq    %r12, %r12/*t1078*/
   # movq    %r13, %r13/*t1079*/
   # movq    %r14, %r14/*t1080*/
   # movq    %r15, %r15/*t1081*/
   # movq    %rdi, %rdi/*t1075*/
   # movq    %rsi, %rsi/*t1076*/
   movq    %rsi/*t1076*/, 16(%rdi/*t1075*/)
   movq    $0, %rsi/*t1294*/
   movq    %rsi/*t1294*/, 24(%rdi/*t1075*/)
   movq    $0, %rsi/*t1295*/
   movq    %rsi/*t1295*/, 32(%rdi/*t1075*/)
   movq    $1, %rax
   # movq    %rbx/*t1077*/, %rbx
   # movq    %r12/*t1078*/, %r12
   # movq    %r13/*t1079*/, %r13
   # movq    %r14/*t1080*/, %r14
   # movq    %r15/*t1081*/, %r15
   # return sink
   ret

.globl _Tree_SetRight
_Tree_SetRight:
_L_520:
   # movq    %rbx, %rbx/*t1084*/
   # movq    %r12, %r12/*t1085*/
   # movq    %r13, %r13/*t1086*/
   # movq    %r14, %r14/*t1087*/
   # movq    %r15, %r15/*t1088*/
   # movq    %rdi, %rdi/*t1082*/
   # movq    %rsi, %rsi/*t1083*/
   movq    %rsi/*t1083*/, 8(%rdi/*t1082*/)
   movq    $1, %rax
   # movq    %rbx/*t1084*/, %rbx
   # movq    %r12/*t1085*/, %r12
   # movq    %r13/*t1086*/, %r13
   # movq    %r14/*t1087*/, %r14
   # movq    %r15/*t1088*/, %r15
   # return sink
   ret

.globl _Tree_SetLeft
_Tree_SetLeft:
_L_522:
   # movq    %rbx, %rbx/*t1091*/
   # movq    %r12, %r12/*t1092*/
   # movq    %r13, %r13/*t1093*/
   # movq    %r14, %r14/*t1094*/
   # movq    %r15, %r15/*t1095*/
   # movq    %rdi, %rdi/*t1089*/
   # movq    %rsi, %rsi/*t1090*/
   movq    %rsi/*t1090*/, (%rdi/*t1089*/)
   movq    $1, %rax
   # movq    %rbx/*t1091*/, %rbx
   # movq    %r12/*t1092*/, %r12
   # movq    %r13/*t1093*/, %r13
   # movq    %r14/*t1094*/, %r14
   # movq    %r15/*t1095*/, %r15
   # return sink
   ret

.globl _Tree_GetRight
_Tree_GetRight:
_L_524:
   # movq    %rbx, %rbx/*t1097*/
   # movq    %r12, %r12/*t1098*/
   # movq    %r13, %r13/*t1099*/
   # movq    %r14, %r14/*t1100*/
   # movq    %r15, %r15/*t1101*/
   # movq    %rdi, %rdi/*t1096*/
   movq    8(%rdi/*t1096*/), %rax/*t1296*/
   # movq    %rax/*t1296*/, %rax
   # movq    %rbx/*t1097*/, %rbx
   # movq    %r12/*t1098*/, %r12
   # movq    %r13/*t1099*/, %r13
   # movq    %r14/*t1100*/, %r14
   # movq    %r15/*t1101*/, %r15
   # return sink
   ret

.globl _Tree_GetLeft
_Tree_GetLeft:
_L_526:
   # movq    %rbx, %rbx/*t1103*/
   # movq    %r12, %r12/*t1104*/
   # movq    %r13, %r13/*t1105*/
   # movq    %r14, %r14/*t1106*/
   # movq    %r15, %r15/*t1107*/
   # movq    %rdi, %rdi/*t1102*/
   movq    (%rdi/*t1102*/), %rax/*t1297*/
   # movq    %rax/*t1297*/, %rax
   # movq    %rbx/*t1103*/, %rbx
   # movq    %r12/*t1104*/, %r12
   # movq    %r13/*t1105*/, %r13
   # movq    %r14/*t1106*/, %r14
   # movq    %r15/*t1107*/, %r15
   # return sink
   ret

.globl _Tree_GetKey
_Tree_GetKey:
_L_528:
   # movq    %rbx, %rbx/*t1109*/
   # movq    %r12, %r12/*t1110*/
   # movq    %r13, %r13/*t1111*/
   # movq    %r14, %r14/*t1112*/
   # movq    %r15, %r15/*t1113*/
   # movq    %rdi, %rdi/*t1108*/
   movq    16(%rdi/*t1108*/), %rax/*t1298*/
   # movq    %rax/*t1298*/, %rax
   # movq    %rbx/*t1109*/, %rbx
   # movq    %r12/*t1110*/, %r12
   # movq    %r13/*t1111*/, %r13
   # movq    %r14/*t1112*/, %r14
   # movq    %r15/*t1113*/, %r15
   # return sink
   ret

.globl _Tree_SetKey
_Tree_SetKey:
_L_530:
   # movq    %rbx, %rbx/*t1116*/
   # movq    %r12, %r12/*t1117*/
   # movq    %r13, %r13/*t1118*/
   # movq    %r14, %r14/*t1119*/
   # movq    %r15, %r15/*t1120*/
   # movq    %rdi, %rdi/*t1114*/
   # movq    %rsi, %rsi/*t1115*/
   movq    %rsi/*t1115*/, 16(%rdi/*t1114*/)
   movq    $1, %rax
   # movq    %rbx/*t1116*/, %rbx
   # movq    %r12/*t1117*/, %r12
   # movq    %r13/*t1118*/, %r13
   # movq    %r14/*t1119*/, %r14
   # movq    %r15/*t1120*/, %r15
   # return sink
   ret

.globl _Tree_GetHas_Right
_Tree_GetHas_Right:
_L_532:
   # movq    %rbx, %rbx/*t1122*/
   # movq    %r12, %r12/*t1123*/
   # movq    %r13, %r13/*t1124*/
   # movq    %r14, %r14/*t1125*/
   # movq    %r15, %r15/*t1126*/
   # movq    %rdi, %rdi/*t1121*/
   movq    32(%rdi/*t1121*/), %rax/*t1299*/
   # movq    %rax/*t1299*/, %rax
   # movq    %rbx/*t1122*/, %rbx
   # movq    %r12/*t1123*/, %r12
   # movq    %r13/*t1124*/, %r13
   # movq    %r14/*t1125*/, %r14
   # movq    %r15/*t1126*/, %r15
   # return sink
   ret

.globl _Tree_GetHas_Left
_Tree_GetHas_Left:
_L_534:
   # movq    %rbx, %rbx/*t1128*/
   # movq    %r12, %r12/*t1129*/
   # movq    %r13, %r13/*t1130*/
   # movq    %r14, %r14/*t1131*/
   # movq    %r15, %r15/*t1132*/
   # movq    %rdi, %rdi/*t1127*/
   movq    24(%rdi/*t1127*/), %rax/*t1300*/
   # movq    %rax/*t1300*/, %rax
   # movq    %rbx/*t1128*/, %rbx
   # movq    %r12/*t1129*/, %r12
   # movq    %r13/*t1130*/, %r13
   # movq    %r14/*t1131*/, %r14
   # movq    %r15/*t1132*/, %r15
   # return sink
   ret

.globl _Tree_SetHas_Left
_Tree_SetHas_Left:
_L_536:
   # movq    %rbx, %rbx/*t1135*/
   # movq    %r12, %r12/*t1136*/
   # movq    %r13, %r13/*t1137*/
   # movq    %r14, %r14/*t1138*/
   # movq    %r15, %r15/*t1139*/
   # movq    %rdi, %rdi/*t1133*/
   # movq    %rsi, %rsi/*t1134*/
   movq    %rsi/*t1134*/, 24(%rdi/*t1133*/)
   movq    $1, %rax
   # movq    %rbx/*t1135*/, %rbx
   # movq    %r12/*t1136*/, %r12
   # movq    %r13/*t1137*/, %r13
   # movq    %r14/*t1138*/, %r14
   # movq    %r15/*t1139*/, %r15
   # return sink
   ret

.globl _Tree_SetHas_Right
_Tree_SetHas_Right:
_L_538:
   # movq    %rbx, %rbx/*t1142*/
   # movq    %r12, %r12/*t1143*/
   # movq    %r13, %r13/*t1144*/
   # movq    %r14, %r14/*t1145*/
   # movq    %r15, %r15/*t1146*/
   # movq    %rdi, %rdi/*t1140*/
   # movq    %rsi, %rsi/*t1141*/
   movq    %rsi/*t1141*/, 32(%rdi/*t1140*/)
   movq    $1, %rax
   # movq    %rbx/*t1142*/, %rbx
   # movq    %r12/*t1143*/, %r12
   # movq    %r13/*t1144*/, %r13
   # movq    %r14/*t1145*/, %r14
   # movq    %r15/*t1146*/, %r15
   # return sink
   ret

.globl _Tree_Compare
_Tree_Compare:
_L_540:
   # movq    %rbx, %rbx/*t1152*/
   # movq    %r12, %r12/*t1153*/
   # movq    %r13, %r13/*t1154*/
   # movq    %r14, %r14/*t1155*/
   # movq    %r15, %r15/*t1156*/
   # movq    %rsi, %rsi/*t1148*/
   # movq    %rdx, %rdx/*t1149*/
   movq    %rdx/*t1149*/, %rdi/*t1301*/
   incq    %rdi/*t1301*/
   # movq    %rdi/*t1301*/, %rdi/*t1151*/
   cmpq    %rdx/*t1149*/, %rsi/*t1148*/
   jge     _L_375
_L_374:
   movq    $0, %rax/*t1150*/
_L_376:
   # movq    %rax/*t1150*/, %rax
   # movq    %rbx/*t1152*/, %rbx
   # movq    %r12/*t1153*/, %r12
   # movq    %r13/*t1154*/, %r13
   # movq    %r14/*t1155*/, %r14
   # movq    %r15/*t1156*/, %r15
   jmp     _DONE_541
_L_375:
   cmpq    %rdi/*t1151*/, %rsi/*t1148*/
   jge     _L_377
_L_378:
   movq    $1, %rax/*t1150*/
   jmp     _L_376
_L_377:
   movq    $0, %rax/*t1150*/
   jmp     _L_376
_DONE_541:
   # return sink
   ret

.globl _Tree_Insert
_Tree_Insert:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_542:
   movq    %rbx, -32(%rbp)
   movq    %r12, -24(%rbp)
   movq    %r13, -16(%rbp)
   movq    %r14, -8(%rbp)
   # movq    %r15, %r15/*t1178*/
   movq    %rdi, %rbx/*t1157*/
   movq    %rsi, %r14/*t1158*/
   movq    $48, %rdi
   call    _cs411newobject
   movq    %rax, %r12/*t1159*/
   # movq    %r12/*t1159*/, %r12/*t1164*/
   cmpq    $0, %r12/*t1164*/
   je      _L_382
_L_381:
   movq    %r14/*t1158*/, %rsi
   movq    %r12/*t1164*/, %rdi
   call    _Tree_Init
   # movq    %rax, %rax/*t1160*/
   # movq    %rbx/*t1157*/, %rbx/*t1163*/
   movq    $1, %r13/*t1161*/
_looptest_385:
   cmpq    $0, %r13/*t1161*/
   je      _loopend_383
_loopbody_384:
   # movq    %rbx/*t1163*/, %rbx/*t1165*/
   cmpq    $0, %rbx/*t1165*/
   je      _L_382
_L_386:
   movq    %rbx/*t1165*/, %rdi
   call    _Tree_GetKey
   # movq    %rax, %rax/*t1162*/
   cmpq    %rax/*t1162*/, %r14/*t1158*/
   jge     _L_388
_L_387:
   # movq    %rbx/*t1163*/, %rbx/*t1166*/
   cmpq    $0, %rbx/*t1166*/
   je      _L_382
_L_393:
   movq    %rbx/*t1166*/, %rdi
   call    _Tree_GetHas_Left
   cmpq    $0, %rax
   je      _L_391
_L_390:
   # movq    %rbx/*t1163*/, %rbx/*t1167*/
   cmpq    $0, %rbx/*t1167*/
   je      _L_382
_L_394:
   movq    %rbx/*t1167*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, %rbx/*t1163*/
_L_392:
_L_389:
   jmp     _looptest_385
_L_382:
   movq    $2, %rdi
   call    _cs411error
_bail_380:
   movq    -32(%rbp), %rbx/*t1392*/
   # movq    %rbx/*t1392*/, %rbx
   movq    -24(%rbp), %r12/*t1393*/
   # movq    %r12/*t1393*/, %r12
   movq    -16(%rbp), %r13/*t1394*/
   # movq    %r13/*t1394*/, %r13
   movq    -8(%rbp), %r14/*t1395*/
   # movq    %r14/*t1395*/, %r14
   # movq    %r15/*t1178*/, %r15
   jmp     _DONE_543
_L_391:
   movq    $0, %r13/*t1161*/
   # movq    %rbx/*t1163*/, %rbx/*t1168*/
   cmpq    $0, %rbx/*t1168*/
   je      _L_382
_L_395:
   movq    $1, %rsi
   movq    %rbx/*t1168*/, %rdi
   call    _Tree_SetHas_Left
   # movq    %rax, %rax/*t1160*/
   # movq    %rbx/*t1163*/, %rbx/*t1169*/
   cmpq    $0, %rbx/*t1169*/
   je      _L_382
_L_396:
   movq    %r12/*t1159*/, %rsi
   movq    %rbx/*t1169*/, %rdi
   call    _Tree_SetLeft
   # movq    %rax, %rax/*t1160*/
   jmp     _L_392
_L_388:
   # movq    %rbx/*t1163*/, %rbx/*t1170*/
   cmpq    $0, %rbx/*t1170*/
   je      _L_382
_L_400:
   movq    %rbx/*t1170*/, %rdi
   call    _Tree_GetHas_Right
   cmpq    $0, %rax
   je      _L_398
_L_397:
   # movq    %rbx/*t1163*/, %rbx/*t1171*/
   cmpq    $0, %rbx/*t1171*/
   je      _L_382
_L_401:
   movq    %rbx/*t1171*/, %rdi
   call    _Tree_GetRight
   movq    %rax, %rbx/*t1163*/
_L_399:
   jmp     _L_389
_L_398:
   movq    $0, %r13/*t1161*/
   # movq    %rbx/*t1163*/, %rbx/*t1172*/
   cmpq    $0, %rbx/*t1172*/
   je      _L_382
_L_402:
   movq    $1, %rsi
   movq    %rbx/*t1172*/, %rdi
   call    _Tree_SetHas_Right
   # movq    %rax, %rax/*t1160*/
   # movq    %rbx/*t1163*/, %rbx/*t1173*/
   cmpq    $0, %rbx/*t1173*/
   je      _L_382
_L_403:
   movq    %r12/*t1159*/, %rsi
   movq    %rbx/*t1173*/, %rdi
   call    _Tree_SetRight
   # movq    %rax, %rax/*t1160*/
   jmp     _L_399
_loopend_383:
   movq    $1, %rax
   jmp     _bail_380
_DONE_543:
   # return sink
   leave
   ret

.globl _Tree_Delete
_Tree_Delete:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $64, %rsp
_L_544:
   movq    %rbx, -56(%rbp)
   movq    %r12, -48(%rbp)
   movq    %r13, -40(%rbp)
   movq    %r14, -32(%rbp)
   movq    %r15, -24(%rbp)
   movq    %rdi, %r15/*t1179*/
   movq    %rsi, -16(%rbp)
   movq    %r15/*t1179*/, %rbx/*t1181*/
   movq    %r15/*t1179*/, %r14/*t1182*/
   movq    $1, %r13/*t1183*/
   movq    $0, %r12/*t1417*/
   movq    %r12/*t1417*/, -8(%rbp)
   movq    $1, %r12/*t1185*/
_looptest_407:
   cmpq    $0, %r13/*t1183*/
   je      _loopend_405
_loopbody_406:
   # movq    %rbx/*t1181*/, %rbx/*t1188*/
   cmpq    $0, %rbx/*t1188*/
   je      _L_409
_L_408:
   movq    %rbx/*t1188*/, %rdi
   call    _Tree_GetKey
   # movq    %rax, %rax/*t1186*/
   movq    -16(%rbp), %rdi/*t1418*/
   cmpq    %rax/*t1186*/, %rdi/*t1418*/
   jge     _L_411
_L_410:
   # movq    %rbx/*t1181*/, %rbx/*t1189*/
   cmpq    $0, %rbx/*t1189*/
   je      _L_409
_L_416:
   movq    %rbx/*t1189*/, %rdi
   call    _Tree_GetHas_Left
   cmpq    $0, %rax
   je      _L_414
_L_413:
   movq    %rbx/*t1181*/, %r14/*t1182*/
   # movq    %rbx/*t1181*/, %rbx/*t1190*/
   cmpq    $0, %rbx/*t1190*/
   je      _L_409
_L_417:
   movq    %rbx/*t1190*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, %rbx/*t1181*/
_L_415:
_L_412:
   movq    $0, %r12/*t1185*/
   jmp     _looptest_407
_L_409:
   movq    $2, %rdi
   call    _cs411error
_bail_404:
   movq    -56(%rbp), %rbx/*t1419*/
   # movq    %rbx/*t1419*/, %rbx
   movq    -48(%rbp), %r12/*t1420*/
   # movq    %r12/*t1420*/, %r12
   movq    -40(%rbp), %r13/*t1421*/
   # movq    %r13/*t1421*/, %r13
   movq    -32(%rbp), %r14/*t1422*/
   # movq    %r14/*t1422*/, %r14
   movq    -24(%rbp), %r15/*t1423*/
   # movq    %r15/*t1423*/, %r15
   jmp     _DONE_545
_L_414:
   movq    $0, %r13/*t1183*/
   jmp     _L_415
_L_411:
   movq    -16(%rbp), %rdi/*t1424*/
   cmpq    %rdi/*t1424*/, %rax/*t1186*/
   jge     _L_419
_L_418:
   # movq    %rbx/*t1181*/, %rbx/*t1191*/
   cmpq    $0, %rbx/*t1191*/
   je      _L_409
_L_424:
   movq    %rbx/*t1191*/, %rdi
   call    _Tree_GetHas_Right
   cmpq    $0, %rax
   je      _L_422
_L_421:
   movq    %rbx/*t1181*/, %r14/*t1182*/
   # movq    %rbx/*t1181*/, %rbx/*t1192*/
   cmpq    $0, %rbx/*t1192*/
   je      _L_409
_L_425:
   movq    %rbx/*t1192*/, %rdi
   call    _Tree_GetRight
   movq    %rax, %rbx/*t1181*/
_L_423:
_L_420:
   jmp     _L_412
_L_422:
   movq    $0, %r13/*t1183*/
   jmp     _L_423
_L_419:
   cmpq    $0, %r12/*t1185*/
   je      _L_427
_L_426:
   # movq    %rbx/*t1181*/, %rbx/*t1193*/
   cmpq    $0, %rbx/*t1193*/
   je      _L_409
_L_432:
   movq    %rbx/*t1193*/, %rdi
   call    _Tree_GetHas_Right
   cmpq    $0, %rax
   je      _L_434
_L_430:
   movq    %rbx/*t1181*/, %rdx
   movq    %r14/*t1182*/, %rsi
   movq    %r15/*t1179*/, %rdi
   call    _Tree_Remove
   # movq    %rax, %rax/*t1187*/
_L_431:
_L_428:
   movq    $1, %r12/*t1425*/
   movq    %r12/*t1425*/, -8(%rbp)
   movq    $0, %r13/*t1183*/
   jmp     _L_420
_L_434:
   # movq    %rbx/*t1181*/, %rbx/*t1194*/
   cmpq    $0, %rbx/*t1194*/
   je      _L_409
_L_433:
   movq    %rbx/*t1194*/, %rdi
   call    _Tree_GetHas_Left
   cmpq    $0, %rax
   jne     _L_430
_L_429:
   movq    $1, %rax/*t1187*/
   jmp     _L_431
_L_427:
   movq    %rbx/*t1181*/, %rdx
   movq    %r14/*t1182*/, %rsi
   movq    %r15/*t1179*/, %rdi
   call    _Tree_Remove
   # movq    %rax, %rax/*t1187*/
   jmp     _L_428
_loopend_405:
   movq    -8(%rbp), %rax/*t1426*/
   # movq    %rax/*t1426*/, %rax
   jmp     _bail_404
_DONE_545:
   # return sink
   leave
   ret

.globl _Tree_Remove
_Tree_Remove:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_546:
   movq    %rbx, -24(%rbp)
   movq    %r12, -16(%rbp)
   movq    %r13, -8(%rbp)
   # movq    %r14, %r14/*t1218*/
   # movq    %r15, %r15/*t1219*/
   movq    %rdi, %r13/*t1200*/
   movq    %rsi, %rbx/*t1201*/
   movq    %rdx, %r12/*t1202*/
   # movq    %r12/*t1202*/, %r12/*t1206*/
   cmpq    $0, %r12/*t1206*/
   je      _L_440
_L_439:
   movq    %r12/*t1206*/, %rdi
   call    _Tree_GetHas_Left
   cmpq    $0, %rax
   je      _L_437
_L_436:
   movq    %r12/*t1202*/, %rdx
   movq    %rbx/*t1201*/, %rsi
   movq    %r13/*t1200*/, %rdi
   call    _Tree_RemoveLeft
   # movq    %rax, %rax/*t1203*/
_L_438:
   movq    $1, %rax
_bail_435:
   movq    -24(%rbp), %rbx/*t1450*/
   # movq    %rbx/*t1450*/, %rbx
   movq    -16(%rbp), %r12/*t1451*/
   # movq    %r12/*t1451*/, %r12
   movq    -8(%rbp), %r13/*t1452*/
   # movq    %r13/*t1452*/, %r13
   # movq    %r14/*t1218*/, %r14
   # movq    %r15/*t1219*/, %r15
   jmp     _DONE_547
_L_440:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_435
_L_437:
   # movq    %r12/*t1202*/, %r12/*t1207*/
   cmpq    $0, %r12/*t1207*/
   je      _L_440
_L_444:
   movq    %r12/*t1207*/, %rdi
   call    _Tree_GetHas_Right
   cmpq    $0, %rax
   je      _L_442
_L_441:
   movq    %r12/*t1202*/, %rdx
   movq    %rbx/*t1201*/, %rsi
   movq    %r13/*t1200*/, %rdi
   call    _Tree_RemoveRight
   # movq    %rax, %rax/*t1203*/
_L_443:
   jmp     _L_438
_L_442:
   # movq    %r12/*t1202*/, %r12/*t1208*/
   cmpq    $0, %r12/*t1208*/
   je      _L_440
_L_445:
   movq    %r12/*t1208*/, %rdi
   call    _Tree_GetKey
   movq    %rax, %r12/*t1204*/
   # movq    %rbx/*t1201*/, %rbx/*t1209*/
   cmpq    $0, %rbx/*t1209*/
   je      _L_440
_L_446:
   movq    %rbx/*t1209*/, %rdi
   call    _Tree_GetLeft
   # movq    %rax, %rax/*t1210*/
   cmpq    $0, %rax/*t1210*/
   je      _L_440
_L_447:
   movq    %rax/*t1210*/, %rdi
   call    _Tree_GetKey
   # movq    %rax, %rax/*t1205*/
   movq    %rax/*t1205*/, %rdx
   movq    %r12/*t1204*/, %rsi
   movq    %r13/*t1200*/, %rdi
   call    _Tree_Compare
   # movq    %rax, %rax/*t1302*/
   cmpq    $0, %rax/*t1302*/
   je      _L_449
_L_448:
   # movq    %rbx/*t1201*/, %rbx/*t1211*/
   cmpq    $0, %rbx/*t1211*/
   je      _L_440
_L_451:
   movq    40(%r13/*t1200*/), %rsi/*t1453*/
   # movq    %rsi/*t1453*/, %rsi
   movq    %rbx/*t1211*/, %rdi
   call    _Tree_SetLeft
   # movq    %rax, %rax/*t1203*/
   # movq    %rbx/*t1201*/, %rbx/*t1212*/
   cmpq    $0, %rbx/*t1212*/
   je      _L_440
_L_452:
   movq    $0, %rsi
   movq    %rbx/*t1212*/, %rdi
   call    _Tree_SetHas_Left
   # movq    %rax, %rax/*t1203*/
_L_450:
   jmp     _L_443
_L_449:
   # movq    %rbx/*t1201*/, %rbx/*t1213*/
   cmpq    $0, %rbx/*t1213*/
   je      _L_440
_L_453:
   movq    40(%r13/*t1200*/), %rsi/*t1454*/
   # movq    %rsi/*t1454*/, %rsi
   movq    %rbx/*t1213*/, %rdi
   call    _Tree_SetRight
   # movq    %rax, %rax/*t1203*/
   # movq    %rbx/*t1201*/, %rbx/*t1214*/
   cmpq    $0, %rbx/*t1214*/
   je      _L_440
_L_454:
   movq    $0, %rsi
   movq    %rbx/*t1214*/, %rdi
   call    _Tree_SetHas_Right
   # movq    %rax, %rax/*t1203*/
   jmp     _L_450
_DONE_547:
   # return sink
   leave
   ret

.globl _Tree_RemoveRight
_Tree_RemoveRight:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_548:
   movq    %rbx, -24(%rbp)
   movq    %r12, -16(%rbp)
   movq    %r13, -8(%rbp)
   # movq    %r14, %r14/*t1234*/
   # movq    %r15, %r15/*t1235*/
   movq    %rdi, %r13/*t1220*/
   movq    %rsi, %rbx/*t1221*/
   movq    %rdx, %r12/*t1222*/
_looptest_458:
   # movq    %r12/*t1222*/, %r12/*t1224*/
   cmpq    $0, %r12/*t1224*/
   je      _L_460
_L_459:
   movq    %r12/*t1224*/, %rdi
   call    _Tree_GetHas_Right
   cmpq    $0, %rax
   je      _loopend_456
_loopbody_457:
   # movq    %r12/*t1222*/, %r12/*t1225*/
   cmpq    $0, %r12/*t1225*/
   je      _L_460
_L_461:
   movq    %r12/*t1225*/, %rbx/*t1305*/
   # movq    %r12/*t1222*/, %r12/*t1226*/
   cmpq    $0, %r12/*t1226*/
   je      _L_460
_L_462:
   movq    %r12/*t1226*/, %rdi
   call    _Tree_GetRight
   # movq    %rax, %rax/*t1227*/
   cmpq    $0, %rax/*t1227*/
   je      _L_460
_L_463:
   movq    %rax/*t1227*/, %rdi
   call    _Tree_GetKey
   movq    %rax, %rsi
   movq    %rbx/*t1305*/, %rdi
   call    _Tree_SetKey
   # movq    %rax, %rax/*t1223*/
   movq    %r12/*t1222*/, %rbx/*t1221*/
   # movq    %r12/*t1222*/, %r12/*t1228*/
   cmpq    $0, %r12/*t1228*/
   je      _L_460
_L_464:
   movq    %r12/*t1228*/, %rdi
   call    _Tree_GetRight
   movq    %rax, %r12/*t1222*/
   jmp     _looptest_458
_L_460:
   movq    $2, %rdi
   call    _cs411error
_bail_455:
   movq    -24(%rbp), %rbx/*t1477*/
   # movq    %rbx/*t1477*/, %rbx
   movq    -16(%rbp), %r12/*t1478*/
   # movq    %r12/*t1478*/, %r12
   movq    -8(%rbp), %r13/*t1479*/
   # movq    %r13/*t1479*/, %r13
   # movq    %r14/*t1234*/, %r14
   # movq    %r15/*t1235*/, %r15
   jmp     _DONE_549
_loopend_456:
   # movq    %rbx/*t1221*/, %rbx/*t1229*/
   cmpq    $0, %rbx/*t1229*/
   je      _L_460
_L_465:
   movq    40(%r13/*t1220*/), %rsi/*t1480*/
   # movq    %rsi/*t1480*/, %rsi
   movq    %rbx/*t1229*/, %rdi
   call    _Tree_SetRight
   # movq    %rax, %rax/*t1223*/
   # movq    %rbx/*t1221*/, %rbx/*t1230*/
   cmpq    $0, %rbx/*t1230*/
   je      _L_460
_L_466:
   movq    $0, %rsi
   movq    %rbx/*t1230*/, %rdi
   call    _Tree_SetHas_Right
   # movq    %rax, %rax/*t1223*/
   movq    $1, %rax
   jmp     _bail_455
_DONE_549:
   # return sink
   leave
   ret

.globl _Tree_RemoveLeft
_Tree_RemoveLeft:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_550:
   movq    %rbx, -24(%rbp)
   movq    %r12, -16(%rbp)
   movq    %r13, -8(%rbp)
   # movq    %r14, %r14/*t1250*/
   # movq    %r15, %r15/*t1251*/
   movq    %rdi, %r13/*t1236*/
   movq    %rsi, %rbx/*t1237*/
   movq    %rdx, %r12/*t1238*/
_looptest_470:
   # movq    %r12/*t1238*/, %r12/*t1240*/
   cmpq    $0, %r12/*t1240*/
   je      _L_472
_L_471:
   movq    %r12/*t1240*/, %rdi
   call    _Tree_GetHas_Left
   cmpq    $0, %rax
   je      _loopend_468
_loopbody_469:
   # movq    %r12/*t1238*/, %r12/*t1241*/
   cmpq    $0, %r12/*t1241*/
   je      _L_472
_L_473:
   movq    %r12/*t1241*/, %rbx/*t1307*/
   # movq    %r12/*t1238*/, %r12/*t1242*/
   cmpq    $0, %r12/*t1242*/
   je      _L_472
_L_474:
   movq    %r12/*t1242*/, %rdi
   call    _Tree_GetLeft
   # movq    %rax, %rax/*t1243*/
   cmpq    $0, %rax/*t1243*/
   je      _L_472
_L_475:
   movq    %rax/*t1243*/, %rdi
   call    _Tree_GetKey
   movq    %rax, %rsi
   movq    %rbx/*t1307*/, %rdi
   call    _Tree_SetKey
   # movq    %rax, %rax/*t1239*/
   movq    %r12/*t1238*/, %rbx/*t1237*/
   # movq    %r12/*t1238*/, %r12/*t1244*/
   cmpq    $0, %r12/*t1244*/
   je      _L_472
_L_476:
   movq    %r12/*t1244*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, %r12/*t1238*/
   jmp     _looptest_470
_L_472:
   movq    $2, %rdi
   call    _cs411error
_bail_467:
   movq    -24(%rbp), %rbx/*t1498*/
   # movq    %rbx/*t1498*/, %rbx
   movq    -16(%rbp), %r12/*t1499*/
   # movq    %r12/*t1499*/, %r12
   movq    -8(%rbp), %r13/*t1500*/
   # movq    %r13/*t1500*/, %r13
   # movq    %r14/*t1250*/, %r14
   # movq    %r15/*t1251*/, %r15
   jmp     _DONE_551
_loopend_468:
   # movq    %rbx/*t1237*/, %rbx/*t1245*/
   cmpq    $0, %rbx/*t1245*/
   je      _L_472
_L_477:
   movq    40(%r13/*t1236*/), %rsi/*t1501*/
   # movq    %rsi/*t1501*/, %rsi
   movq    %rbx/*t1245*/, %rdi
   call    _Tree_SetLeft
   # movq    %rax, %rax/*t1239*/
   # movq    %rbx/*t1237*/, %rbx/*t1246*/
   cmpq    $0, %rbx/*t1246*/
   je      _L_472
_L_478:
   movq    $0, %rsi
   movq    %rbx/*t1246*/, %rdi
   call    _Tree_SetHas_Left
   # movq    %rax, %rax/*t1239*/
   movq    $1, %rax
   jmp     _bail_467
_DONE_551:
   # return sink
   leave
   ret

.globl _Tree_Search
_Tree_Search:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_552:
   movq    %rbx, -32(%rbp)
   movq    %r12, -24(%rbp)
   movq    %r13, -16(%rbp)
   movq    %r14, -8(%rbp)
   # movq    %r15, %r15/*t1267*/
   # movq    %rdi, %rdi/*t1252*/
   movq    %rsi, %r14/*t1253*/
   movq    %rdi/*t1252*/, %rbx/*t1256*/
   movq    $1, %r13/*t1254*/
   movq    $0, %r12/*t1255*/
_looptest_482:
   cmpq    $0, %r13/*t1254*/
   je      _loopend_480
_loopbody_481:
   # movq    %rbx/*t1256*/, %rbx/*t1258*/
   cmpq    $0, %rbx/*t1258*/
   je      _L_484
_L_483:
   movq    %rbx/*t1258*/, %rdi
   call    _Tree_GetKey
   # movq    %rax, %rax/*t1257*/
   cmpq    %rax/*t1257*/, %r14/*t1253*/
   jge     _L_486
_L_485:
   # movq    %rbx/*t1256*/, %rbx/*t1259*/
   cmpq    $0, %rbx/*t1259*/
   je      _L_484
_L_491:
   movq    %rbx/*t1259*/, %rdi
   call    _Tree_GetHas_Left
   cmpq    $0, %rax
   je      _L_489
_L_488:
   # movq    %rbx/*t1256*/, %rbx/*t1260*/
   cmpq    $0, %rbx/*t1260*/
   je      _L_484
_L_492:
   movq    %rbx/*t1260*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, %rbx/*t1256*/
_L_490:
_L_487:
   jmp     _looptest_482
_L_484:
   movq    $2, %rdi
   call    _cs411error
_bail_479:
   movq    -32(%rbp), %rbx/*t1518*/
   # movq    %rbx/*t1518*/, %rbx
   movq    -24(%rbp), %r12/*t1519*/
   # movq    %r12/*t1519*/, %r12
   movq    -16(%rbp), %r13/*t1520*/
   # movq    %r13/*t1520*/, %r13
   movq    -8(%rbp), %r14/*t1521*/
   # movq    %r14/*t1521*/, %r14
   # movq    %r15/*t1267*/, %r15
   jmp     _DONE_553
_L_489:
   movq    $0, %r13/*t1254*/
   jmp     _L_490
_L_486:
   cmpq    %r14/*t1253*/, %rax/*t1257*/
   jge     _L_494
_L_493:
   # movq    %rbx/*t1256*/, %rbx/*t1261*/
   cmpq    $0, %rbx/*t1261*/
   je      _L_484
_L_499:
   movq    %rbx/*t1261*/, %rdi
   call    _Tree_GetHas_Right
   cmpq    $0, %rax
   je      _L_497
_L_496:
   # movq    %rbx/*t1256*/, %rbx/*t1262*/
   cmpq    $0, %rbx/*t1262*/
   je      _L_484
_L_500:
   movq    %rbx/*t1262*/, %rdi
   call    _Tree_GetRight
   movq    %rax, %rbx/*t1256*/
_L_498:
_L_495:
   jmp     _L_487
_L_497:
   movq    $0, %r13/*t1254*/
   jmp     _L_498
_L_494:
   movq    $1, %r12/*t1255*/
   movq    $0, %r13/*t1254*/
   jmp     _L_495
_loopend_480:
   movq    %r12/*t1255*/, %rax
   jmp     _bail_479
_DONE_553:
   # return sink
   leave
   ret

.globl _Tree_Print
_Tree_Print:
   subq   $8, %rsp
_L_554:
   # movq    %rbx, %rbx/*t1271*/
   # movq    %r12, %r12/*t1272*/
   # movq    %r13, %r13/*t1273*/
   # movq    %r14, %r14/*t1274*/
   # movq    %r15, %r15/*t1275*/
   # movq    %rdi, %rdi/*t1268*/
   # movq    %rdi/*t1268*/, %rdi/*t1269*/
   movq    %rdi/*t1269*/, %rsi
   # movq    %rdi/*t1268*/, %rdi
   call    _Tree_RecPrint
   movq    $1, %rax
   # movq    %rbx/*t1271*/, %rbx
   # movq    %r12/*t1272*/, %r12
   # movq    %r13/*t1273*/, %r13
   # movq    %r14/*t1274*/, %r14
   # movq    %r15/*t1275*/, %r15
   # return sink
   addq   $8, %rsp
   ret

.globl _Tree_RecPrint
_Tree_RecPrint:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_556:
   movq    %rbx, -16(%rbp)
   movq    %r12, -8(%rbp)
   # movq    %r13, %r13/*t1286*/
   # movq    %r14, %r14/*t1287*/
   # movq    %r15, %r15/*t1288*/
   movq    %rdi, %r12/*t1276*/
   movq    %rsi, %rbx/*t1277*/
   # movq    %rbx/*t1277*/, %rbx/*t1279*/
   cmpq    $0, %rbx/*t1279*/
   je      _L_507
_L_506:
   movq    %rbx/*t1279*/, %rdi
   call    _Tree_GetHas_Left
   cmpq    $0, %rax
   je      _L_504
_L_503:
   # movq    %r12/*t1276*/, %r12/*t1309*/
   # movq    %rbx/*t1277*/, %rbx/*t1280*/
   cmpq    $0, %rbx/*t1280*/
   je      _L_507
_L_508:
   movq    %rbx/*t1280*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, %rsi
   movq    %r12/*t1309*/, %rdi
   call    _Tree_RecPrint
   # movq    %rax, %rax/*t1278*/
_L_505:
   # movq    %rbx/*t1277*/, %rbx/*t1281*/
   cmpq    $0, %rbx/*t1281*/
   je      _L_507
_L_509:
   movq    %rbx/*t1281*/, %rdi
   call    _Tree_GetKey
   movq    %rax, %rdi
   call    _cs411println
   # movq    %rbx/*t1277*/, %rbx/*t1282*/
   cmpq    $0, %rbx/*t1282*/
   je      _L_507
_L_513:
   movq    %rbx/*t1282*/, %rdi
   call    _Tree_GetHas_Right
   cmpq    $0, %rax
   je      _L_511
_L_510:
   # movq    %r12/*t1276*/, %r12/*t1310*/
   # movq    %rbx/*t1277*/, %rbx/*t1283*/
   cmpq    $0, %rbx/*t1283*/
   je      _L_507
_L_514:
   movq    %rbx/*t1283*/, %rdi
   call    _Tree_GetRight
   movq    %rax, %rsi
   movq    %r12/*t1310*/, %rdi
   call    _Tree_RecPrint
   # movq    %rax, %rax/*t1278*/
_L_512:
   movq    $1, %rax
_bail_502:
   movq    -16(%rbp), %rbx/*t1538*/
   # movq    %rbx/*t1538*/, %rbx
   movq    -8(%rbp), %r12/*t1539*/
   # movq    %r12/*t1539*/, %r12
   # movq    %r13/*t1286*/, %r13
   # movq    %r14/*t1287*/, %r14
   # movq    %r15/*t1288*/, %r15
   jmp     _DONE_557
_L_507:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_502
_L_504:
   movq    $1, %rax/*t1278*/
   jmp     _L_505
_L_511:
   movq    $1, %rax/*t1278*/
   jmp     _L_512
_DONE_557:
   # return sink
   leave
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_558:
   # movq    %rbx, %rbx/*t1289*/
   # movq    %r12, %r12/*t1290*/
   # movq    %r13, %r13/*t1291*/
   # movq    %r14, %r14/*t1292*/
   # movq    %r15, %r15/*t1293*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t1312*/
   movq    %rax/*t1312*/, %rdi
   call    _BT_Start
   # movq    %rax, %rax/*t1311*/
   movq    %rax/*t1311*/, %rdi
   call    _cs411println
   # movq    %rbx/*t1289*/, %rbx
   # movq    %r12/*t1290*/, %r12
   # movq    %r13/*t1291*/, %r13
   # movq    %r14/*t1292*/, %r14
   # movq    %r15/*t1293*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
