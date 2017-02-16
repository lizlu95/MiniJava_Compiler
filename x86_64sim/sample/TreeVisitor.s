   .text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_1564:
   # movq    %rbx, %rbx/*t3817*/
   # movq    %r12, %r12/*t3818*/
   # movq    %r13, %r13/*t3819*/
   # movq    %r14, %r14/*t3820*/
   # movq    %r15, %r15/*t3821*/
   movq    $0, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t4104*/
   movq    %rax/*t4104*/, %rdi
   call    _TV_Start
   # movq    %rax, %rax/*t4103*/
   movq    %rax/*t4103*/, %rdi
   call    _cs411println
_bail_1285:
   # movq    %rbx/*t3817*/, %rbx
   # movq    %r12/*t3818*/, %r12
   # movq    %r13/*t3819*/, %r13
   # movq    %r14/*t3820*/, %r14
   # movq    %r15/*t3821*/, %r15
_DONE_1565:
   # return sink
   addq   $8, %rsp
   ret

.globl _TV_Start
_TV_Start:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_1566:
   movq    %rbx, -16(%rbp)
   movq    %r12, -8(%rbp)
   # movq    %r13, %r13/*t3848*/
   # movq    %r14, %r14/*t3849*/
   # movq    %r15, %r15/*t3850*/
   # movq    %rdi, %rdi/*t3822*/
   movq    $48, %rdi
   call    _cs411newobject
   movq    %rax, %rbx/*t3823*/
   # movq    %rbx/*t3823*/, %rbx/*t3827*/
   cmpq    $0, %rbx/*t3827*/
   je      _L_1288
_L_1287:
   movq    $16, %rsi
   movq    %rbx/*t3827*/, %rdi
   call    _Tree_Init
   # movq    %rax, %rax/*t3824*/
   # movq    %rbx/*t3823*/, %rbx/*t3828*/
   cmpq    $0, %rbx/*t3828*/
   je      _L_1290
_L_1289:
   movq    %rbx/*t3828*/, %rdi
   call    _Tree_Print
   # movq    %rax, %rax/*t3824*/
   movq    $100000000, %rdi
   call    _cs411println
   # movq    %rbx/*t3823*/, %rbx/*t3829*/
   cmpq    $0, %rbx/*t3829*/
   je      _L_1292
_L_1291:
   movq    $8, %rsi
   movq    %rbx/*t3829*/, %rdi
   call    _Tree_Insert
   # movq    %rax, %rax/*t3824*/
   # movq    %rbx/*t3823*/, %rbx/*t3830*/
   cmpq    $0, %rbx/*t3830*/
   je      _L_1294
_L_1293:
   movq    $24, %rsi
   movq    %rbx/*t3830*/, %rdi
   call    _Tree_Insert
   # movq    %rax, %rax/*t3824*/
   # movq    %rbx/*t3823*/, %rbx/*t3831*/
   cmpq    $0, %rbx/*t3831*/
   je      _L_1296
_L_1295:
   movq    $4, %rsi
   movq    %rbx/*t3831*/, %rdi
   call    _Tree_Insert
   # movq    %rax, %rax/*t3824*/
   # movq    %rbx/*t3823*/, %rbx/*t3832*/
   cmpq    $0, %rbx/*t3832*/
   je      _L_1298
_L_1297:
   movq    $12, %rsi
   movq    %rbx/*t3832*/, %rdi
   call    _Tree_Insert
   # movq    %rax, %rax/*t3824*/
   # movq    %rbx/*t3823*/, %rbx/*t3833*/
   cmpq    $0, %rbx/*t3833*/
   je      _L_1300
_L_1299:
   movq    $20, %rsi
   movq    %rbx/*t3833*/, %rdi
   call    _Tree_Insert
   # movq    %rax, %rax/*t3824*/
   # movq    %rbx/*t3823*/, %rbx/*t3834*/
   cmpq    $0, %rbx/*t3834*/
   je      _L_1302
_L_1301:
   movq    $28, %rsi
   movq    %rbx/*t3834*/, %rdi
   call    _Tree_Insert
   # movq    %rax, %rax/*t3824*/
   # movq    %rbx/*t3823*/, %rbx/*t3835*/
   cmpq    $0, %rbx/*t3835*/
   je      _L_1304
_L_1303:
   movq    $14, %rsi
   movq    %rbx/*t3835*/, %rdi
   call    _Tree_Insert
   # movq    %rax, %rax/*t3824*/
   # movq    %rbx/*t3823*/, %rbx/*t3836*/
   cmpq    $0, %rbx/*t3836*/
   je      _L_1306
_L_1305:
   movq    %rbx/*t3836*/, %rdi
   call    _Tree_Print
   # movq    %rax, %rax/*t3824*/
   movq    $100000000, %rdi
   call    _cs411println
   movq    $16, %rdi
   call    _cs411newobject
   movq    %rax, %r12/*t3826*/
   movq    $50000000, %rdi
   call    _cs411println
   # movq    %rbx/*t3823*/, %rbx/*t3837*/
   cmpq    $0, %rbx/*t3837*/
   je      _L_1308
_L_1307:
   movq    %r12/*t3826*/, %rsi
   movq    %rbx/*t3837*/, %rdi
   call    _Tree_accept
   # movq    %rax, %rax/*t3825*/
   movq    $100000000, %rdi
   call    _cs411println
   # movq    %rbx/*t3823*/, %rbx/*t3838*/
   cmpq    $0, %rbx/*t3838*/
   je      _L_1310
_L_1309:
   movq    $24, %rsi
   movq    %rbx/*t3838*/, %rdi
   call    _Tree_Search
   movq    %rax, %rdi
   call    _cs411println
   # movq    %rbx/*t3823*/, %rbx/*t3839*/
   cmpq    $0, %rbx/*t3839*/
   je      _L_1312
_L_1311:
   movq    $12, %rsi
   movq    %rbx/*t3839*/, %rdi
   call    _Tree_Search
   movq    %rax, %rdi
   call    _cs411println
   # movq    %rbx/*t3823*/, %rbx/*t3840*/
   cmpq    $0, %rbx/*t3840*/
   je      _L_1314
_L_1313:
   movq    $16, %rsi
   movq    %rbx/*t3840*/, %rdi
   call    _Tree_Search
   movq    %rax, %rdi
   call    _cs411println
   # movq    %rbx/*t3823*/, %rbx/*t3841*/
   cmpq    $0, %rbx/*t3841*/
   je      _L_1316
_L_1315:
   movq    $50, %rsi
   movq    %rbx/*t3841*/, %rdi
   call    _Tree_Search
   movq    %rax, %rdi
   call    _cs411println
   # movq    %rbx/*t3823*/, %rbx/*t3842*/
   cmpq    $0, %rbx/*t3842*/
   je      _L_1318
_L_1317:
   movq    $12, %rsi
   movq    %rbx/*t3842*/, %rdi
   call    _Tree_Search
   movq    %rax, %rdi
   call    _cs411println
   # movq    %rbx/*t3823*/, %rbx/*t3843*/
   cmpq    $0, %rbx/*t3843*/
   je      _L_1320
_L_1319:
   movq    $12, %rsi
   movq    %rbx/*t3843*/, %rdi
   call    _Tree_Delete
   # movq    %rax, %rax/*t3824*/
   # movq    %rbx/*t3823*/, %rbx/*t3844*/
   cmpq    $0, %rbx/*t3844*/
   je      _L_1322
_L_1321:
   movq    %rbx/*t3844*/, %rdi
   call    _Tree_Print
   # movq    %rax, %rax/*t3824*/
   # movq    %rbx/*t3823*/, %rbx/*t3845*/
   cmpq    $0, %rbx/*t3845*/
   je      _L_1324
_L_1323:
   movq    $12, %rsi
   movq    %rbx/*t3845*/, %rdi
   call    _Tree_Search
   movq    %rax, %rdi
   call    _cs411println
   movq    $0, %rax
_bail_1286:
   movq    -16(%rbp), %rbx/*t4156*/
   # movq    %rbx/*t4156*/, %rbx
   movq    -8(%rbp), %r12/*t4157*/
   # movq    %r12/*t4157*/, %r12
   # movq    %r13/*t3848*/, %r13
   # movq    %r14/*t3849*/, %r14
   # movq    %r15/*t3850*/, %r15
   jmp     _DONE_1567
_L_1288:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_L_1290:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_L_1292:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_L_1294:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_L_1296:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_L_1298:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_L_1300:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_L_1302:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_L_1304:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_L_1306:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_L_1308:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_L_1310:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_L_1312:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_L_1314:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_L_1316:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_L_1318:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_L_1320:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_L_1322:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_L_1324:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1286
_DONE_1567:
   # return sink
   leave
   ret

.globl _Tree_Init
_Tree_Init:
_L_1568:
   # movq    %rbx, %rbx/*t3853*/
   # movq    %r12, %r12/*t3854*/
   # movq    %r13, %r13/*t3855*/
   # movq    %r14, %r14/*t3856*/
   # movq    %r15, %r15/*t3857*/
   # movq    %rdi, %rdi/*t3851*/
   # movq    %rsi, %rsi/*t3852*/
   movq    %rsi/*t3852*/, 16(%rdi/*t3851*/)
   movq    $0, %rsi/*t4105*/
   movq    %rsi/*t4105*/, 24(%rdi/*t3851*/)
   movq    $0, %rsi/*t4106*/
   movq    %rsi/*t4106*/, 32(%rdi/*t3851*/)
   movq    $1, %rax
_bail_1325:
   # movq    %rbx/*t3853*/, %rbx
   # movq    %r12/*t3854*/, %r12
   # movq    %r13/*t3855*/, %r13
   # movq    %r14/*t3856*/, %r14
   # movq    %r15/*t3857*/, %r15
_DONE_1569:
   # return sink
   ret

.globl _Tree_SetRight
_Tree_SetRight:
_L_1570:
   # movq    %rbx, %rbx/*t3860*/
   # movq    %r12, %r12/*t3861*/
   # movq    %r13, %r13/*t3862*/
   # movq    %r14, %r14/*t3863*/
   # movq    %r15, %r15/*t3864*/
   # movq    %rdi, %rdi/*t3858*/
   # movq    %rsi, %rsi/*t3859*/
   movq    %rsi/*t3859*/, 8(%rdi/*t3858*/)
   movq    $1, %rax
_bail_1326:
   # movq    %rbx/*t3860*/, %rbx
   # movq    %r12/*t3861*/, %r12
   # movq    %r13/*t3862*/, %r13
   # movq    %r14/*t3863*/, %r14
   # movq    %r15/*t3864*/, %r15
_DONE_1571:
   # return sink
   ret

.globl _Tree_SetLeft
_Tree_SetLeft:
_L_1572:
   # movq    %rbx, %rbx/*t3867*/
   # movq    %r12, %r12/*t3868*/
   # movq    %r13, %r13/*t3869*/
   # movq    %r14, %r14/*t3870*/
   # movq    %r15, %r15/*t3871*/
   # movq    %rdi, %rdi/*t3865*/
   # movq    %rsi, %rsi/*t3866*/
   movq    %rsi/*t3866*/, (%rdi/*t3865*/)
   movq    $1, %rax
_bail_1327:
   # movq    %rbx/*t3867*/, %rbx
   # movq    %r12/*t3868*/, %r12
   # movq    %r13/*t3869*/, %r13
   # movq    %r14/*t3870*/, %r14
   # movq    %r15/*t3871*/, %r15
_DONE_1573:
   # return sink
   ret

.globl _Tree_GetRight
_Tree_GetRight:
_L_1574:
   # movq    %rbx, %rbx/*t3873*/
   # movq    %r12, %r12/*t3874*/
   # movq    %r13, %r13/*t3875*/
   # movq    %r14, %r14/*t3876*/
   # movq    %r15, %r15/*t3877*/
   # movq    %rdi, %rdi/*t3872*/
   movq    8(%rdi/*t3872*/), %rax/*t4107*/
   # movq    %rax/*t4107*/, %rax
_bail_1328:
   # movq    %rbx/*t3873*/, %rbx
   # movq    %r12/*t3874*/, %r12
   # movq    %r13/*t3875*/, %r13
   # movq    %r14/*t3876*/, %r14
   # movq    %r15/*t3877*/, %r15
_DONE_1575:
   # return sink
   ret

.globl _Tree_GetLeft
_Tree_GetLeft:
_L_1576:
   # movq    %rbx, %rbx/*t3879*/
   # movq    %r12, %r12/*t3880*/
   # movq    %r13, %r13/*t3881*/
   # movq    %r14, %r14/*t3882*/
   # movq    %r15, %r15/*t3883*/
   # movq    %rdi, %rdi/*t3878*/
   movq    (%rdi/*t3878*/), %rax/*t4108*/
   # movq    %rax/*t4108*/, %rax
_bail_1329:
   # movq    %rbx/*t3879*/, %rbx
   # movq    %r12/*t3880*/, %r12
   # movq    %r13/*t3881*/, %r13
   # movq    %r14/*t3882*/, %r14
   # movq    %r15/*t3883*/, %r15
_DONE_1577:
   # return sink
   ret

.globl _Tree_GetKey
_Tree_GetKey:
_L_1578:
   # movq    %rbx, %rbx/*t3885*/
   # movq    %r12, %r12/*t3886*/
   # movq    %r13, %r13/*t3887*/
   # movq    %r14, %r14/*t3888*/
   # movq    %r15, %r15/*t3889*/
   # movq    %rdi, %rdi/*t3884*/
   movq    16(%rdi/*t3884*/), %rax/*t4109*/
   # movq    %rax/*t4109*/, %rax
_bail_1330:
   # movq    %rbx/*t3885*/, %rbx
   # movq    %r12/*t3886*/, %r12
   # movq    %r13/*t3887*/, %r13
   # movq    %r14/*t3888*/, %r14
   # movq    %r15/*t3889*/, %r15
_DONE_1579:
   # return sink
   ret

.globl _Tree_SetKey
_Tree_SetKey:
_L_1580:
   # movq    %rbx, %rbx/*t3892*/
   # movq    %r12, %r12/*t3893*/
   # movq    %r13, %r13/*t3894*/
   # movq    %r14, %r14/*t3895*/
   # movq    %r15, %r15/*t3896*/
   # movq    %rdi, %rdi/*t3890*/
   # movq    %rsi, %rsi/*t3891*/
   movq    %rsi/*t3891*/, 16(%rdi/*t3890*/)
   movq    $1, %rax
_bail_1331:
   # movq    %rbx/*t3892*/, %rbx
   # movq    %r12/*t3893*/, %r12
   # movq    %r13/*t3894*/, %r13
   # movq    %r14/*t3895*/, %r14
   # movq    %r15/*t3896*/, %r15
_DONE_1581:
   # return sink
   ret

.globl _Tree_GetHas_Right
_Tree_GetHas_Right:
_L_1582:
   # movq    %rbx, %rbx/*t3898*/
   # movq    %r12, %r12/*t3899*/
   # movq    %r13, %r13/*t3900*/
   # movq    %r14, %r14/*t3901*/
   # movq    %r15, %r15/*t3902*/
   # movq    %rdi, %rdi/*t3897*/
   movq    32(%rdi/*t3897*/), %rax/*t4110*/
   # movq    %rax/*t4110*/, %rax
_bail_1332:
   # movq    %rbx/*t3898*/, %rbx
   # movq    %r12/*t3899*/, %r12
   # movq    %r13/*t3900*/, %r13
   # movq    %r14/*t3901*/, %r14
   # movq    %r15/*t3902*/, %r15
_DONE_1583:
   # return sink
   ret

.globl _Tree_GetHas_Left
_Tree_GetHas_Left:
_L_1584:
   # movq    %rbx, %rbx/*t3904*/
   # movq    %r12, %r12/*t3905*/
   # movq    %r13, %r13/*t3906*/
   # movq    %r14, %r14/*t3907*/
   # movq    %r15, %r15/*t3908*/
   # movq    %rdi, %rdi/*t3903*/
   movq    24(%rdi/*t3903*/), %rax/*t4111*/
   # movq    %rax/*t4111*/, %rax
_bail_1333:
   # movq    %rbx/*t3904*/, %rbx
   # movq    %r12/*t3905*/, %r12
   # movq    %r13/*t3906*/, %r13
   # movq    %r14/*t3907*/, %r14
   # movq    %r15/*t3908*/, %r15
_DONE_1585:
   # return sink
   ret

.globl _Tree_SetHas_Left
_Tree_SetHas_Left:
_L_1586:
   # movq    %rbx, %rbx/*t3911*/
   # movq    %r12, %r12/*t3912*/
   # movq    %r13, %r13/*t3913*/
   # movq    %r14, %r14/*t3914*/
   # movq    %r15, %r15/*t3915*/
   # movq    %rdi, %rdi/*t3909*/
   # movq    %rsi, %rsi/*t3910*/
   movq    %rsi/*t3910*/, 24(%rdi/*t3909*/)
   movq    $1, %rax
_bail_1334:
   # movq    %rbx/*t3911*/, %rbx
   # movq    %r12/*t3912*/, %r12
   # movq    %r13/*t3913*/, %r13
   # movq    %r14/*t3914*/, %r14
   # movq    %r15/*t3915*/, %r15
_DONE_1587:
   # return sink
   ret

.globl _Tree_SetHas_Right
_Tree_SetHas_Right:
_L_1588:
   # movq    %rbx, %rbx/*t3918*/
   # movq    %r12, %r12/*t3919*/
   # movq    %r13, %r13/*t3920*/
   # movq    %r14, %r14/*t3921*/
   # movq    %r15, %r15/*t3922*/
   # movq    %rdi, %rdi/*t3916*/
   # movq    %rsi, %rsi/*t3917*/
   movq    %rsi/*t3917*/, 32(%rdi/*t3916*/)
   movq    $1, %rax
_bail_1335:
   # movq    %rbx/*t3918*/, %rbx
   # movq    %r12/*t3919*/, %r12
   # movq    %r13/*t3920*/, %r13
   # movq    %r14/*t3921*/, %r14
   # movq    %r15/*t3922*/, %r15
_DONE_1589:
   # return sink
   ret

.globl _Tree_Compare
_Tree_Compare:
_L_1590:
   # movq    %rbx, %rbx/*t3928*/
   # movq    %r12, %r12/*t3929*/
   # movq    %r13, %r13/*t3930*/
   # movq    %r14, %r14/*t3931*/
   # movq    %r15, %r15/*t3932*/
   # movq    %rdi, %rdi/*t3923*/
   # movq    %rsi, %rsi/*t3924*/
   # movq    %rdx, %rdx/*t3925*/
   movq    $0, %rax/*t3926*/
   movq    %rdx/*t3925*/, %rdi/*t4112*/
   incq    %rdi/*t4112*/
   # movq    %rdi/*t4112*/, %rdi/*t3927*/
   cmpq    %rdx/*t3925*/, %rsi/*t3924*/
   jge     _L_1338
_L_1337:
   movq    $0, %rax/*t3926*/
_L_1339:
   # movq    %rax/*t3926*/, %rax
_bail_1336:
   # movq    %rbx/*t3928*/, %rbx
   # movq    %r12/*t3929*/, %r12
   # movq    %r13/*t3930*/, %r13
   # movq    %r14/*t3931*/, %r14
   # movq    %r15/*t3932*/, %r15
   jmp     _DONE_1591
_L_1338:
   cmpq    %rdi/*t3927*/, %rsi/*t3924*/
   jge     _L_1340
_L_1341:
   movq    $1, %rax/*t3926*/
_L_1342:
   jmp     _L_1339
_L_1340:
   movq    $0, %rax/*t3926*/
   jmp     _L_1342
_DONE_1591:
   # return sink
   ret

.globl _Tree_Insert
_Tree_Insert:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_1592:
   movq    %rbx, -32(%rbp)
   movq    %r12, -24(%rbp)
   movq    %r13, -16(%rbp)
   movq    %r14, -8(%rbp)
   # movq    %r15, %r15/*t3954*/
   movq    %rdi, %rbx/*t3933*/
   movq    %rsi, %r14/*t3934*/
   movq    $48, %rdi
   call    _cs411newobject
   movq    %rax, %r12/*t3935*/
   # movq    %r12/*t3935*/, %r12/*t3940*/
   cmpq    $0, %r12/*t3940*/
   je      _L_1345
_L_1344:
   movq    %r14/*t3934*/, %rsi
   movq    %r12/*t3940*/, %rdi
   call    _Tree_Init
   # movq    %rax, %rax/*t3936*/
   # movq    %rbx/*t3933*/, %rbx/*t3937*/
   movq    $1, %r13/*t3938*/
_L_1348:
   cmpq    $0, %r13/*t3938*/
   je      _L_1346
_L_1347:
   # movq    %rbx/*t3937*/, %rbx/*t3941*/
   cmpq    $0, %rbx/*t3941*/
   je      _L_1350
_L_1349:
   movq    %rbx/*t3941*/, %rdi
   call    _Tree_GetKey
   # movq    %rax, %rax/*t3939*/
   cmpq    %rax/*t3939*/, %r14/*t3934*/
   jge     _L_1352
_L_1351:
   # movq    %rbx/*t3937*/, %rbx/*t3942*/
   cmpq    $0, %rbx/*t3942*/
   je      _L_1358
_L_1357:
   movq    %rbx/*t3942*/, %rdi
   call    _Tree_GetHas_Left
   cmpq    $0, %rax
   je      _L_1355
_L_1354:
   # movq    %rbx/*t3937*/, %rbx/*t3943*/
   cmpq    $0, %rbx/*t3943*/
   je      _L_1360
_L_1359:
   movq    %rbx/*t3943*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, %rbx/*t3937*/
_L_1356:
_L_1353:
   jmp     _L_1348
_L_1345:
   movq    $2, %rdi
   call    _cs411error
_bail_1343:
   movq    -32(%rbp), %rbx/*t4220*/
   # movq    %rbx/*t4220*/, %rbx
   movq    -24(%rbp), %r12/*t4221*/
   # movq    %r12/*t4221*/, %r12
   movq    -16(%rbp), %r13/*t4222*/
   # movq    %r13/*t4222*/, %r13
   movq    -8(%rbp), %r14/*t4223*/
   # movq    %r14/*t4223*/, %r14
   # movq    %r15/*t3954*/, %r15
   jmp     _DONE_1593
_L_1350:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1343
_L_1358:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1343
_L_1360:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1343
_L_1355:
   movq    $0, %r13/*t3938*/
   # movq    %rbx/*t3937*/, %rbx/*t3944*/
   cmpq    $0, %rbx/*t3944*/
   je      _L_1362
_L_1361:
   movq    $1, %rsi
   movq    %rbx/*t3944*/, %rdi
   call    _Tree_SetHas_Left
   # movq    %rax, %rax/*t3936*/
   # movq    %rbx/*t3937*/, %rbx/*t3945*/
   cmpq    $0, %rbx/*t3945*/
   je      _L_1364
_L_1363:
   movq    %r12/*t3935*/, %rsi
   movq    %rbx/*t3945*/, %rdi
   call    _Tree_SetLeft
   # movq    %rax, %rax/*t3936*/
   jmp     _L_1356
_L_1362:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1343
_L_1364:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1343
_L_1352:
   # movq    %rbx/*t3937*/, %rbx/*t3946*/
   cmpq    $0, %rbx/*t3946*/
   je      _L_1369
_L_1368:
   movq    %rbx/*t3946*/, %rdi
   call    _Tree_GetHas_Right
   cmpq    $0, %rax
   je      _L_1366
_L_1365:
   # movq    %rbx/*t3937*/, %rbx/*t3947*/
   cmpq    $0, %rbx/*t3947*/
   je      _L_1371
_L_1370:
   movq    %rbx/*t3947*/, %rdi
   call    _Tree_GetRight
   movq    %rax, %rbx/*t3937*/
_L_1367:
   jmp     _L_1353
_L_1369:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1343
_L_1371:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1343
_L_1366:
   movq    $0, %r13/*t3938*/
   # movq    %rbx/*t3937*/, %rbx/*t3948*/
   cmpq    $0, %rbx/*t3948*/
   je      _L_1373
_L_1372:
   movq    $1, %rsi
   movq    %rbx/*t3948*/, %rdi
   call    _Tree_SetHas_Right
   # movq    %rax, %rax/*t3936*/
   # movq    %rbx/*t3937*/, %rbx/*t3949*/
   cmpq    $0, %rbx/*t3949*/
   je      _L_1375
_L_1374:
   movq    %r12/*t3935*/, %rsi
   movq    %rbx/*t3949*/, %rdi
   call    _Tree_SetRight
   # movq    %rax, %rax/*t3936*/
   jmp     _L_1367
_L_1373:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1343
_L_1375:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1343
_L_1346:
   movq    $1, %rax
   jmp     _bail_1343
_DONE_1593:
   # return sink
   leave
   ret

.globl _Tree_Delete
_Tree_Delete:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $64, %rsp
_L_1594:
   movq    %rbx, -56(%rbp)
   movq    %r12, -48(%rbp)
   movq    %r13, -40(%rbp)
   movq    %r14, -32(%rbp)
   movq    %r15, -24(%rbp)
   movq    %rdi, %r15/*t3955*/
   movq    %rsi, -16(%rbp)
   movq    %r15/*t3955*/, %rbx/*t3957*/
   movq    %r15/*t3955*/, %r14/*t3958*/
   movq    $1, %r13/*t3959*/
   movq    $0, %r12/*t4246*/
   movq    %r12/*t4246*/, -8(%rbp)
   movq    $1, %r12/*t3962*/
_L_1379:
   cmpq    $0, %r13/*t3959*/
   je      _L_1377
_L_1378:
   # movq    %rbx/*t3957*/, %rbx/*t3964*/
   cmpq    $0, %rbx/*t3964*/
   je      _L_1381
_L_1380:
   movq    %rbx/*t3964*/, %rdi
   call    _Tree_GetKey
   # movq    %rax, %rax/*t3963*/
   movq    -16(%rbp), %rdi/*t4247*/
   cmpq    %rax/*t3963*/, %rdi/*t4247*/
   jge     _L_1383
_L_1382:
   # movq    %rbx/*t3957*/, %rbx/*t3965*/
   cmpq    $0, %rbx/*t3965*/
   je      _L_1389
_L_1388:
   movq    %rbx/*t3965*/, %rdi
   call    _Tree_GetHas_Left
   cmpq    $0, %rax
   je      _L_1386
_L_1385:
   movq    %rbx/*t3957*/, %r14/*t3958*/
   # movq    %rbx/*t3957*/, %rbx/*t3966*/
   cmpq    $0, %rbx/*t3966*/
   je      _L_1391
_L_1390:
   movq    %rbx/*t3966*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, %rbx/*t3957*/
_L_1387:
_L_1384:
   movq    $0, %r12/*t3962*/
   jmp     _L_1379
_L_1381:
   movq    $2, %rdi
   call    _cs411error
_bail_1376:
   movq    -56(%rbp), %rbx/*t4248*/
   # movq    %rbx/*t4248*/, %rbx
   movq    -48(%rbp), %r12/*t4249*/
   # movq    %r12/*t4249*/, %r12
   movq    -40(%rbp), %r13/*t4250*/
   # movq    %r13/*t4250*/, %r13
   movq    -32(%rbp), %r14/*t4251*/
   # movq    %r14/*t4251*/, %r14
   movq    -24(%rbp), %r15/*t4252*/
   # movq    %r15/*t4252*/, %r15
   jmp     _DONE_1595
_L_1389:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1376
_L_1391:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1376
_L_1386:
   movq    $0, %r13/*t3959*/
   jmp     _L_1387
_L_1383:
   movq    -16(%rbp), %rdi/*t4253*/
   cmpq    %rdi/*t4253*/, %rax/*t3963*/
   jge     _L_1393
_L_1392:
   # movq    %rbx/*t3957*/, %rbx/*t3967*/
   cmpq    $0, %rbx/*t3967*/
   je      _L_1399
_L_1398:
   movq    %rbx/*t3967*/, %rdi
   call    _Tree_GetHas_Right
   cmpq    $0, %rax
   je      _L_1396
_L_1395:
   movq    %rbx/*t3957*/, %r14/*t3958*/
   # movq    %rbx/*t3957*/, %rbx/*t3968*/
   cmpq    $0, %rbx/*t3968*/
   je      _L_1401
_L_1400:
   movq    %rbx/*t3968*/, %rdi
   call    _Tree_GetRight
   movq    %rax, %rbx/*t3957*/
_L_1397:
_L_1394:
   jmp     _L_1384
_L_1399:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1376
_L_1401:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1376
_L_1396:
   movq    $0, %r13/*t3959*/
   jmp     _L_1397
_L_1393:
   cmpq    $0, %r12/*t3962*/
   je      _L_1403
_L_1402:
   # movq    %rbx/*t3957*/, %rbx/*t3969*/
   cmpq    $0, %rbx/*t3969*/
   je      _L_1409
_L_1408:
   movq    %rbx/*t3969*/, %rdi
   call    _Tree_GetHas_Right
   cmpq    $0, %rax
   je      _L_1412
_L_1406:
   movq    %rbx/*t3957*/, %rdx
   movq    %r14/*t3958*/, %rsi
   movq    %r15/*t3955*/, %rdi
   call    _Tree_Remove
   # movq    %rax, %rax/*t3961*/
_L_1407:
_L_1404:
   movq    $1, %r12/*t4254*/
   movq    %r12/*t4254*/, -8(%rbp)
   movq    $0, %r13/*t3959*/
   jmp     _L_1394
_L_1409:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1376
_L_1412:
   # movq    %rbx/*t3957*/, %rbx/*t3970*/
   cmpq    $0, %rbx/*t3970*/
   je      _L_1411
_L_1410:
   movq    %rbx/*t3970*/, %rdi
   call    _Tree_GetHas_Left
   cmpq    $0, %rax
   jne     _L_1406
_L_1405:
   movq    $1, %rax/*t3961*/
   jmp     _L_1407
_L_1411:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1376
_L_1403:
   movq    %rbx/*t3957*/, %rdx
   movq    %r14/*t3958*/, %rsi
   movq    %r15/*t3955*/, %rdi
   call    _Tree_Remove
   # movq    %rax, %rax/*t3961*/
   jmp     _L_1404
_L_1377:
   movq    -8(%rbp), %rax/*t4255*/
   # movq    %rax/*t4255*/, %rax
   jmp     _bail_1376
_DONE_1595:
   # return sink
   leave
   ret

.globl _Tree_Remove
_Tree_Remove:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_1596:
   movq    %rbx, -24(%rbp)
   movq    %r12, -16(%rbp)
   movq    %r13, -8(%rbp)
   # movq    %r14, %r14/*t3994*/
   # movq    %r15, %r15/*t3995*/
   movq    %rdi, %r13/*t3976*/
   movq    %rsi, %rbx/*t3977*/
   movq    %rdx, %r12/*t3978*/
   # movq    %r12/*t3978*/, %r12/*t3982*/
   cmpq    $0, %r12/*t3982*/
   je      _L_1418
_L_1417:
   movq    %r12/*t3982*/, %rdi
   call    _Tree_GetHas_Left
   cmpq    $0, %rax
   je      _L_1415
_L_1414:
   movq    %r12/*t3978*/, %rdx
   movq    %rbx/*t3977*/, %rsi
   movq    %r13/*t3976*/, %rdi
   call    _Tree_RemoveLeft
   # movq    %rax, %rax/*t3979*/
_L_1416:
   movq    $1, %rax
_bail_1413:
   movq    -24(%rbp), %rbx/*t4280*/
   # movq    %rbx/*t4280*/, %rbx
   movq    -16(%rbp), %r12/*t4281*/
   # movq    %r12/*t4281*/, %r12
   movq    -8(%rbp), %r13/*t4282*/
   # movq    %r13/*t4282*/, %r13
   # movq    %r14/*t3994*/, %r14
   # movq    %r15/*t3995*/, %r15
   jmp     _DONE_1597
_L_1418:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1413
_L_1415:
   # movq    %r12/*t3978*/, %r12/*t3983*/
   cmpq    $0, %r12/*t3983*/
   je      _L_1423
_L_1422:
   movq    %r12/*t3983*/, %rdi
   call    _Tree_GetHas_Right
   cmpq    $0, %rax
   je      _L_1420
_L_1419:
   movq    %r12/*t3978*/, %rdx
   movq    %rbx/*t3977*/, %rsi
   movq    %r13/*t3976*/, %rdi
   call    _Tree_RemoveRight
   # movq    %rax, %rax/*t3979*/
_L_1421:
   jmp     _L_1416
_L_1423:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1413
_L_1420:
   # movq    %r12/*t3978*/, %r12/*t3984*/
   cmpq    $0, %r12/*t3984*/
   je      _L_1425
_L_1424:
   movq    %r12/*t3984*/, %rdi
   call    _Tree_GetKey
   movq    %rax, %r12/*t3980*/
   # movq    %rbx/*t3977*/, %rbx/*t3985*/
   cmpq    $0, %rbx/*t3985*/
   je      _L_1427
_L_1426:
   movq    %rbx/*t3985*/, %rdi
   call    _Tree_GetLeft
   # movq    %rax, %rax/*t3986*/
   cmpq    $0, %rax/*t3986*/
   je      _L_1429
_L_1428:
   movq    %rax/*t3986*/, %rdi
   call    _Tree_GetKey
   # movq    %rax, %rax/*t3981*/
   movq    %rax/*t3981*/, %rdx
   movq    %r12/*t3980*/, %rsi
   movq    %r13/*t3976*/, %rdi
   call    _Tree_Compare
   # movq    %rax, %rax/*t4113*/
   cmpq    $0, %rax/*t4113*/
   je      _L_1431
_L_1430:
   # movq    %rbx/*t3977*/, %rbx/*t3987*/
   cmpq    $0, %rbx/*t3987*/
   je      _L_1434
_L_1433:
   movq    40(%r13/*t3976*/), %rsi/*t4283*/
   # movq    %rsi/*t4283*/, %rsi
   movq    %rbx/*t3987*/, %rdi
   call    _Tree_SetLeft
   # movq    %rax, %rax/*t3979*/
   # movq    %rbx/*t3977*/, %rbx/*t3988*/
   cmpq    $0, %rbx/*t3988*/
   je      _L_1436
_L_1435:
   movq    $0, %rsi
   movq    %rbx/*t3988*/, %rdi
   call    _Tree_SetHas_Left
   # movq    %rax, %rax/*t3979*/
_L_1432:
   jmp     _L_1421
_L_1425:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1413
_L_1427:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1413
_L_1429:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1413
_L_1434:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1413
_L_1436:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1413
_L_1431:
   # movq    %rbx/*t3977*/, %rbx/*t3989*/
   cmpq    $0, %rbx/*t3989*/
   je      _L_1438
_L_1437:
   movq    40(%r13/*t3976*/), %rsi/*t4284*/
   # movq    %rsi/*t4284*/, %rsi
   movq    %rbx/*t3989*/, %rdi
   call    _Tree_SetRight
   # movq    %rax, %rax/*t3979*/
   # movq    %rbx/*t3977*/, %rbx/*t3990*/
   cmpq    $0, %rbx/*t3990*/
   je      _L_1440
_L_1439:
   movq    $0, %rsi
   movq    %rbx/*t3990*/, %rdi
   call    _Tree_SetHas_Right
   # movq    %rax, %rax/*t3979*/
   jmp     _L_1432
_L_1438:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1413
_L_1440:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1413
_DONE_1597:
   # return sink
   leave
   ret

.globl _Tree_RemoveRight
_Tree_RemoveRight:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_1598:
   movq    %rbx, -24(%rbp)
   movq    %r12, -16(%rbp)
   movq    %r13, -8(%rbp)
   # movq    %r14, %r14/*t4010*/
   # movq    %r15, %r15/*t4011*/
   movq    %rdi, %r13/*t3996*/
   movq    %rsi, %rbx/*t3997*/
   movq    %rdx, %r12/*t3998*/
_L_1444:
   # movq    %r12/*t3998*/, %r12/*t4000*/
   cmpq    $0, %r12/*t4000*/
   je      _L_1446
_L_1445:
   movq    %r12/*t4000*/, %rdi
   call    _Tree_GetHas_Right
   cmpq    $0, %rax
   je      _L_1442
_L_1443:
   # movq    %r12/*t3998*/, %r12/*t4001*/
   cmpq    $0, %r12/*t4001*/
   je      _L_1448
_L_1447:
   movq    %r12/*t4001*/, %rbx/*t4116*/
   # movq    %r12/*t3998*/, %r12/*t4002*/
   cmpq    $0, %r12/*t4002*/
   je      _L_1450
_L_1449:
   movq    %r12/*t4002*/, %rdi
   call    _Tree_GetRight
   # movq    %rax, %rax/*t4003*/
   cmpq    $0, %rax/*t4003*/
   je      _L_1452
_L_1451:
   movq    %rax/*t4003*/, %rdi
   call    _Tree_GetKey
   movq    %rax, %rsi
   movq    %rbx/*t4116*/, %rdi
   call    _Tree_SetKey
   # movq    %rax, %rax/*t3999*/
   movq    %r12/*t3998*/, %rbx/*t3997*/
   # movq    %r12/*t3998*/, %r12/*t4004*/
   cmpq    $0, %r12/*t4004*/
   je      _L_1454
_L_1453:
   movq    %r12/*t4004*/, %rdi
   call    _Tree_GetRight
   movq    %rax, %r12/*t3998*/
   jmp     _L_1444
_L_1446:
   movq    $2, %rdi
   call    _cs411error
_bail_1441:
   movq    -24(%rbp), %rbx/*t4308*/
   # movq    %rbx/*t4308*/, %rbx
   movq    -16(%rbp), %r12/*t4309*/
   # movq    %r12/*t4309*/, %r12
   movq    -8(%rbp), %r13/*t4310*/
   # movq    %r13/*t4310*/, %r13
   # movq    %r14/*t4010*/, %r14
   # movq    %r15/*t4011*/, %r15
   jmp     _DONE_1599
_L_1448:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1441
_L_1450:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1441
_L_1452:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1441
_L_1454:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1441
_L_1442:
   # movq    %rbx/*t3997*/, %rbx/*t4005*/
   cmpq    $0, %rbx/*t4005*/
   je      _L_1456
_L_1455:
   movq    40(%r13/*t3996*/), %rsi/*t4311*/
   # movq    %rsi/*t4311*/, %rsi
   movq    %rbx/*t4005*/, %rdi
   call    _Tree_SetRight
   # movq    %rax, %rax/*t3999*/
   # movq    %rbx/*t3997*/, %rbx/*t4006*/
   cmpq    $0, %rbx/*t4006*/
   je      _L_1458
_L_1457:
   movq    $0, %rsi
   movq    %rbx/*t4006*/, %rdi
   call    _Tree_SetHas_Right
   # movq    %rax, %rax/*t3999*/
   movq    $1, %rax
   jmp     _bail_1441
_L_1456:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1441
_L_1458:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1441
_DONE_1599:
   # return sink
   leave
   ret

.globl _Tree_RemoveLeft
_Tree_RemoveLeft:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_1600:
   movq    %rbx, -24(%rbp)
   movq    %r12, -16(%rbp)
   movq    %r13, -8(%rbp)
   # movq    %r14, %r14/*t4026*/
   # movq    %r15, %r15/*t4027*/
   movq    %rdi, %r13/*t4012*/
   movq    %rsi, %rbx/*t4013*/
   movq    %rdx, %r12/*t4014*/
_L_1462:
   # movq    %r12/*t4014*/, %r12/*t4016*/
   cmpq    $0, %r12/*t4016*/
   je      _L_1464
_L_1463:
   movq    %r12/*t4016*/, %rdi
   call    _Tree_GetHas_Left
   cmpq    $0, %rax
   je      _L_1460
_L_1461:
   # movq    %r12/*t4014*/, %r12/*t4017*/
   cmpq    $0, %r12/*t4017*/
   je      _L_1466
_L_1465:
   movq    %r12/*t4017*/, %rbx/*t4118*/
   # movq    %r12/*t4014*/, %r12/*t4018*/
   cmpq    $0, %r12/*t4018*/
   je      _L_1468
_L_1467:
   movq    %r12/*t4018*/, %rdi
   call    _Tree_GetLeft
   # movq    %rax, %rax/*t4019*/
   cmpq    $0, %rax/*t4019*/
   je      _L_1470
_L_1469:
   movq    %rax/*t4019*/, %rdi
   call    _Tree_GetKey
   movq    %rax, %rsi
   movq    %rbx/*t4118*/, %rdi
   call    _Tree_SetKey
   # movq    %rax, %rax/*t4015*/
   movq    %r12/*t4014*/, %rbx/*t4013*/
   # movq    %r12/*t4014*/, %r12/*t4020*/
   cmpq    $0, %r12/*t4020*/
   je      _L_1472
_L_1471:
   movq    %r12/*t4020*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, %r12/*t4014*/
   jmp     _L_1462
_L_1464:
   movq    $2, %rdi
   call    _cs411error
_bail_1459:
   movq    -24(%rbp), %rbx/*t4330*/
   # movq    %rbx/*t4330*/, %rbx
   movq    -16(%rbp), %r12/*t4331*/
   # movq    %r12/*t4331*/, %r12
   movq    -8(%rbp), %r13/*t4332*/
   # movq    %r13/*t4332*/, %r13
   # movq    %r14/*t4026*/, %r14
   # movq    %r15/*t4027*/, %r15
   jmp     _DONE_1601
_L_1466:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1459
_L_1468:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1459
_L_1470:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1459
_L_1472:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1459
_L_1460:
   # movq    %rbx/*t4013*/, %rbx/*t4021*/
   cmpq    $0, %rbx/*t4021*/
   je      _L_1474
_L_1473:
   movq    40(%r13/*t4012*/), %rsi/*t4333*/
   # movq    %rsi/*t4333*/, %rsi
   movq    %rbx/*t4021*/, %rdi
   call    _Tree_SetLeft
   # movq    %rax, %rax/*t4015*/
   # movq    %rbx/*t4013*/, %rbx/*t4022*/
   cmpq    $0, %rbx/*t4022*/
   je      _L_1476
_L_1475:
   movq    $0, %rsi
   movq    %rbx/*t4022*/, %rdi
   call    _Tree_SetHas_Left
   # movq    %rax, %rax/*t4015*/
   movq    $1, %rax
   jmp     _bail_1459
_L_1474:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1459
_L_1476:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1459
_DONE_1601:
   # return sink
   leave
   ret

.globl _Tree_Search
_Tree_Search:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_1602:
   movq    %rbx, -32(%rbp)
   movq    %r12, -24(%rbp)
   movq    %r13, -16(%rbp)
   movq    %r14, -8(%rbp)
   # movq    %r15, %r15/*t4043*/
   # movq    %rdi, %rdi/*t4028*/
   movq    %rsi, %r14/*t4029*/
   movq    %rdi/*t4028*/, %rbx/*t4030*/
   movq    $1, %r13/*t4032*/
   movq    $0, %r12/*t4031*/
_L_1480:
   cmpq    $0, %r13/*t4032*/
   je      _L_1478
_L_1479:
   # movq    %rbx/*t4030*/, %rbx/*t4034*/
   cmpq    $0, %rbx/*t4034*/
   je      _L_1482
_L_1481:
   movq    %rbx/*t4034*/, %rdi
   call    _Tree_GetKey
   # movq    %rax, %rax/*t4033*/
   cmpq    %rax/*t4033*/, %r14/*t4029*/
   jge     _L_1484
_L_1483:
   # movq    %rbx/*t4030*/, %rbx/*t4035*/
   cmpq    $0, %rbx/*t4035*/
   je      _L_1490
_L_1489:
   movq    %rbx/*t4035*/, %rdi
   call    _Tree_GetHas_Left
   cmpq    $0, %rax
   je      _L_1487
_L_1486:
   # movq    %rbx/*t4030*/, %rbx/*t4036*/
   cmpq    $0, %rbx/*t4036*/
   je      _L_1492
_L_1491:
   movq    %rbx/*t4036*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, %rbx/*t4030*/
_L_1488:
_L_1485:
   jmp     _L_1480
_L_1482:
   movq    $2, %rdi
   call    _cs411error
_bail_1477:
   movq    -32(%rbp), %rbx/*t4350*/
   # movq    %rbx/*t4350*/, %rbx
   movq    -24(%rbp), %r12/*t4351*/
   # movq    %r12/*t4351*/, %r12
   movq    -16(%rbp), %r13/*t4352*/
   # movq    %r13/*t4352*/, %r13
   movq    -8(%rbp), %r14/*t4353*/
   # movq    %r14/*t4353*/, %r14
   # movq    %r15/*t4043*/, %r15
   jmp     _DONE_1603
_L_1490:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1477
_L_1492:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1477
_L_1487:
   movq    $0, %r13/*t4032*/
   jmp     _L_1488
_L_1484:
   cmpq    %r14/*t4029*/, %rax/*t4033*/
   jge     _L_1494
_L_1493:
   # movq    %rbx/*t4030*/, %rbx/*t4037*/
   cmpq    $0, %rbx/*t4037*/
   je      _L_1500
_L_1499:
   movq    %rbx/*t4037*/, %rdi
   call    _Tree_GetHas_Right
   cmpq    $0, %rax
   je      _L_1497
_L_1496:
   # movq    %rbx/*t4030*/, %rbx/*t4038*/
   cmpq    $0, %rbx/*t4038*/
   je      _L_1502
_L_1501:
   movq    %rbx/*t4038*/, %rdi
   call    _Tree_GetRight
   movq    %rax, %rbx/*t4030*/
_L_1498:
_L_1495:
   jmp     _L_1485
_L_1500:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1477
_L_1502:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1477
_L_1497:
   movq    $0, %r13/*t4032*/
   jmp     _L_1498
_L_1494:
   movq    $1, %r12/*t4031*/
   movq    $0, %r13/*t4032*/
   jmp     _L_1495
_L_1478:
   movq    %r12/*t4031*/, %rax
   jmp     _bail_1477
_DONE_1603:
   # return sink
   leave
   ret

.globl _Tree_Print
_Tree_Print:
   subq   $8, %rsp
_L_1604:
   # movq    %rbx, %rbx/*t4047*/
   # movq    %r12, %r12/*t4048*/
   # movq    %r13, %r13/*t4049*/
   # movq    %r14, %r14/*t4050*/
   # movq    %r15, %r15/*t4051*/
   # movq    %rdi, %rdi/*t4044*/
   # movq    %rdi/*t4044*/, %rdi/*t4046*/
   movq    %rdi/*t4046*/, %rsi
   # movq    %rdi/*t4044*/, %rdi
   call    _Tree_RecPrint
   # movq    %rax, %rax/*t4045*/
   movq    $1, %rax
_bail_1503:
   # movq    %rbx/*t4047*/, %rbx
   # movq    %r12/*t4048*/, %r12
   # movq    %r13/*t4049*/, %r13
   # movq    %r14/*t4050*/, %r14
   # movq    %r15/*t4051*/, %r15
_DONE_1605:
   # return sink
   addq   $8, %rsp
   ret

.globl _Tree_RecPrint
_Tree_RecPrint:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_1606:
   movq    %rbx, -16(%rbp)
   movq    %r12, -8(%rbp)
   # movq    %r13, %r13/*t4062*/
   # movq    %r14, %r14/*t4063*/
   # movq    %r15, %r15/*t4064*/
   movq    %rdi, %r12/*t4052*/
   movq    %rsi, %rbx/*t4053*/
   # movq    %rbx/*t4053*/, %rbx/*t4055*/
   cmpq    $0, %rbx/*t4055*/
   je      _L_1509
_L_1508:
   movq    %rbx/*t4055*/, %rdi
   call    _Tree_GetHas_Left
   cmpq    $0, %rax
   je      _L_1506
_L_1505:
   # movq    %r12/*t4052*/, %r12/*t4120*/
   # movq    %rbx/*t4053*/, %rbx/*t4056*/
   cmpq    $0, %rbx/*t4056*/
   je      _L_1511
_L_1510:
   movq    %rbx/*t4056*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, %rsi
   movq    %r12/*t4120*/, %rdi
   call    _Tree_RecPrint
   # movq    %rax, %rax/*t4054*/
_L_1507:
   # movq    %rbx/*t4053*/, %rbx/*t4057*/
   cmpq    $0, %rbx/*t4057*/
   je      _L_1513
_L_1512:
   movq    %rbx/*t4057*/, %rdi
   call    _Tree_GetKey
   movq    %rax, %rdi
   call    _cs411println
   # movq    %rbx/*t4053*/, %rbx/*t4058*/
   cmpq    $0, %rbx/*t4058*/
   je      _L_1518
_L_1517:
   movq    %rbx/*t4058*/, %rdi
   call    _Tree_GetHas_Right
   cmpq    $0, %rax
   je      _L_1515
_L_1514:
   # movq    %r12/*t4052*/, %r12/*t4121*/
   # movq    %rbx/*t4053*/, %rbx/*t4059*/
   cmpq    $0, %rbx/*t4059*/
   je      _L_1520
_L_1519:
   movq    %rbx/*t4059*/, %rdi
   call    _Tree_GetRight
   movq    %rax, %rsi
   movq    %r12/*t4121*/, %rdi
   call    _Tree_RecPrint
   # movq    %rax, %rax/*t4054*/
_L_1516:
   movq    $1, %rax
_bail_1504:
   movq    -16(%rbp), %rbx/*t4372*/
   # movq    %rbx/*t4372*/, %rbx
   movq    -8(%rbp), %r12/*t4373*/
   # movq    %r12/*t4373*/, %r12
   # movq    %r13/*t4062*/, %r13
   # movq    %r14/*t4063*/, %r14
   # movq    %r15/*t4064*/, %r15
   jmp     _DONE_1607
_L_1509:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1504
_L_1511:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1504
_L_1506:
   movq    $1, %rax/*t4054*/
   jmp     _L_1507
_L_1513:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1504
_L_1518:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1504
_L_1520:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1504
_L_1515:
   movq    $1, %rax/*t4054*/
   jmp     _L_1516
_DONE_1607:
   # return sink
   leave
   ret

.globl _Tree_accept
_Tree_accept:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_1608:
   movq    %rbx, -16(%rbp)
   movq    %r12, -8(%rbp)
   # movq    %r13, %r13/*t4071*/
   # movq    %r14, %r14/*t4072*/
   # movq    %r15, %r15/*t4073*/
   movq    %rdi, %r12/*t4065*/
   movq    %rsi, %rbx/*t4066*/
   movq    $333, %rdi
   call    _cs411println
   # movq    %rbx/*t4066*/, %rbx/*t4068*/
   cmpq    $0, %rbx/*t4068*/
   je      _L_1523
_L_1522:
   movq    %r12/*t4065*/, %rsi
   movq    %rbx/*t4068*/, %rdi
   call    _Visitor_visit
   # movq    %rax, %rax/*t4067*/
   movq    $0, %rax
_bail_1521:
   movq    -16(%rbp), %rbx/*t4384*/
   # movq    %rbx/*t4384*/, %rbx
   movq    -8(%rbp), %r12/*t4385*/
   # movq    %r12/*t4385*/, %r12
   # movq    %r13/*t4071*/, %r13
   # movq    %r14/*t4072*/, %r14
   # movq    %r15/*t4073*/, %r15
   jmp     _DONE_1609
_L_1523:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1521
_DONE_1609:
   # return sink
   leave
   ret

.globl _Visitor_visit
_Visitor_visit:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_1610:
   movq    %rbx, -24(%rbp)
   movq    %r12, -16(%rbp)
   movq    %r13, -8(%rbp)
   # movq    %r14, %r14/*t4086*/
   # movq    %r15, %r15/*t4087*/
   movq    %rdi, %r12/*t4074*/
   movq    %rsi, %rbx/*t4075*/
   # movq    %rbx/*t4075*/, %rbx/*t4077*/
   cmpq    $0, %rbx/*t4077*/
   je      _L_1529
_L_1528:
   movq    %rbx/*t4077*/, %rdi
   call    _Tree_GetHas_Right
   cmpq    $0, %rax
   je      _L_1526
_L_1525:
   movq    %r12/*t4074*/, %r13/*t4399*/
   addq    $8, %r13/*t4399*/
   # movq    %r13/*t4399*/, %r13/*t4122*/
   # movq    %rbx/*t4075*/, %rbx/*t4078*/
   cmpq    $0, %rbx/*t4078*/
   je      _L_1531
_L_1530:
   movq    %rbx/*t4078*/, %rdi
   call    _Tree_GetRight
   movq    %rax, (%r13/*t4122*/)
   movq    8(%r12/*t4074*/), %rdi/*t4400*/
   # movq    %rdi/*t4400*/, %rdi/*t4079*/
   cmpq    $0, %rdi/*t4079*/
   je      _L_1533
_L_1532:
   movq    %r12/*t4074*/, %rsi
   # movq    %rdi/*t4079*/, %rdi
   call    _Tree_accept
   # movq    %rax, %rax/*t4076*/
_L_1527:
   # movq    %rbx/*t4075*/, %rbx/*t4080*/
   cmpq    $0, %rbx/*t4080*/
   je      _L_1538
_L_1537:
   movq    %rbx/*t4080*/, %rdi
   call    _Tree_GetHas_Left
   cmpq    $0, %rax
   je      _L_1535
_L_1534:
   # movq    %r12/*t4074*/, %r12/*t4123*/
   # movq    %rbx/*t4075*/, %rbx/*t4081*/
   cmpq    $0, %rbx/*t4081*/
   je      _L_1540
_L_1539:
   movq    %rbx/*t4081*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, (%r12/*t4123*/)
   movq    (%r12/*t4074*/), %rdi/*t4401*/
   # movq    %rdi/*t4401*/, %rdi/*t4082*/
   cmpq    $0, %rdi/*t4082*/
   je      _L_1542
_L_1541:
   movq    %r12/*t4074*/, %rsi
   # movq    %rdi/*t4082*/, %rdi
   call    _Tree_accept
   # movq    %rax, %rax/*t4076*/
_L_1536:
   movq    $0, %rax
_bail_1524:
   movq    -24(%rbp), %rbx/*t4402*/
   # movq    %rbx/*t4402*/, %rbx
   movq    -16(%rbp), %r12/*t4403*/
   # movq    %r12/*t4403*/, %r12
   movq    -8(%rbp), %r13/*t4404*/
   # movq    %r13/*t4404*/, %r13
   # movq    %r14/*t4086*/, %r14
   # movq    %r15/*t4087*/, %r15
   jmp     _DONE_1611
_L_1529:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1524
_L_1531:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1524
_L_1533:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1524
_L_1526:
   movq    $0, %rax/*t4076*/
   jmp     _L_1527
_L_1538:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1524
_L_1540:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1524
_L_1542:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1524
_L_1535:
   movq    $0, %rax/*t4076*/
   jmp     _L_1536
_DONE_1611:
   # return sink
   leave
   ret

.globl _MyVisitor_visit
_MyVisitor_visit:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $32, %rsp
_L_1612:
   movq    %rbx, -24(%rbp)
   movq    %r12, -16(%rbp)
   movq    %r13, -8(%rbp)
   # movq    %r14, %r14/*t4101*/
   # movq    %r15, %r15/*t4102*/
   movq    %rdi, %r12/*t4088*/
   movq    %rsi, %rbx/*t4089*/
   # movq    %rbx/*t4089*/, %rbx/*t4091*/
   cmpq    $0, %rbx/*t4091*/
   je      _L_1548
_L_1547:
   movq    %rbx/*t4091*/, %rdi
   call    _Tree_GetHas_Right
   cmpq    $0, %rax
   je      _L_1545
_L_1544:
   movq    %r12/*t4088*/, %r13/*t4428*/
   addq    $8, %r13/*t4428*/
   # movq    %r13/*t4428*/, %r13/*t4127*/
   # movq    %rbx/*t4089*/, %rbx/*t4092*/
   cmpq    $0, %rbx/*t4092*/
   je      _L_1550
_L_1549:
   movq    %rbx/*t4092*/, %rdi
   call    _Tree_GetRight
   movq    %rax, (%r13/*t4127*/)
   movq    8(%r12/*t4088*/), %rdi/*t4429*/
   # movq    %rdi/*t4429*/, %rdi/*t4093*/
   cmpq    $0, %rdi/*t4093*/
   je      _L_1552
_L_1551:
   movq    %r12/*t4088*/, %rsi
   # movq    %rdi/*t4093*/, %rdi
   call    _Tree_accept
   # movq    %rax, %rax/*t4090*/
_L_1546:
   # movq    %rbx/*t4089*/, %rbx/*t4094*/
   cmpq    $0, %rbx/*t4094*/
   je      _L_1554
_L_1553:
   movq    %rbx/*t4094*/, %rdi
   call    _Tree_GetKey
   movq    %rax, %rdi
   call    _cs411println
   # movq    %rbx/*t4089*/, %rbx/*t4095*/
   cmpq    $0, %rbx/*t4095*/
   je      _L_1559
_L_1558:
   movq    %rbx/*t4095*/, %rdi
   call    _Tree_GetHas_Left
   cmpq    $0, %rax
   je      _L_1556
_L_1555:
   # movq    %r12/*t4088*/, %r12/*t4128*/
   # movq    %rbx/*t4089*/, %rbx/*t4096*/
   cmpq    $0, %rbx/*t4096*/
   je      _L_1561
_L_1560:
   movq    %rbx/*t4096*/, %rdi
   call    _Tree_GetLeft
   movq    %rax, (%r12/*t4128*/)
   movq    (%r12/*t4088*/), %rdi/*t4430*/
   # movq    %rdi/*t4430*/, %rdi/*t4097*/
   cmpq    $0, %rdi/*t4097*/
   je      _L_1563
_L_1562:
   movq    %r12/*t4088*/, %rsi
   # movq    %rdi/*t4097*/, %rdi
   call    _Tree_accept
   # movq    %rax, %rax/*t4090*/
_L_1557:
   movq    $0, %rax
_bail_1543:
   movq    -24(%rbp), %rbx/*t4431*/
   # movq    %rbx/*t4431*/, %rbx
   movq    -16(%rbp), %r12/*t4432*/
   # movq    %r12/*t4432*/, %r12
   movq    -8(%rbp), %r13/*t4433*/
   # movq    %r13/*t4433*/, %r13
   # movq    %r14/*t4101*/, %r14
   # movq    %r15/*t4102*/, %r15
   jmp     _DONE_1613
_L_1548:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1543
_L_1550:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1543
_L_1552:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1543
_L_1545:
   movq    $0, %rax/*t4090*/
   jmp     _L_1546
_L_1554:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1543
_L_1559:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1543
_L_1561:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1543
_L_1563:
   movq    $2, %rdi
   call    _cs411error
   jmp     _bail_1543
_L_1556:
   movq    $0, %rax/*t4090*/
   jmp     _L_1557
_DONE_1613:
   # return sink
   leave
   ret

   .ident	"minijavac: cs411 course project 2011w2"
