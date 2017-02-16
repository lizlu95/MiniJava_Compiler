   .text
.globl _cs411main
_cs411main:
   pushq  %rbp
   movq   %rsp, %rbp
_L_453:
   movq    %rbx, t1266
   movq    %r12, t1267
   movq    %r13, t1268
   movq    %r14, t1269
   movq    %r15, t1270
   movq    $0, t1431
   movq    t1431, %rdi
   call    _cs411newobject
   movq    %rax, t1419
   movq    t1419, %rdi
   call    _LL_Start
   movq    %rax, t1418
   movq    t1418, %rdi
   call    _cs411println
   movq    t1266, %rbx
   movq    t1267, %r12
   movq    t1268, %r13
   movq    t1269, %r14
   movq    t1270, %r15
_DONE_454:
   #return sink
   leave
   ret

.globl _Element_Init
_Element_Init:
   pushq  %rbp
   movq   %rsp, %rbp
_L_455:
   movq    %rdi, t1271
   movq    %rsi, t1272
   movq    %rdx, t1273
   movq    %rcx, t1274
   movq    %rbx, t1275
   movq    %r12, t1276
   movq    %r13, t1277
   movq    %r14, t1278
   movq    %r15, t1279
   movq    t1272, (t1271)
   movq    t1273, 8(t1271)
   movq    t1274, 16(t1271)
   movq    $1, t1432
   movq    t1432, %rax
   movq    t1275, %rbx
   movq    t1276, %r12
   movq    t1277, %r13
   movq    t1278, %r14
   movq    t1279, %r15
_DONE_456:
   #return sink
   leave
   ret

.globl _Element_GetAge
_Element_GetAge:
   pushq  %rbp
   movq   %rsp, %rbp
_L_457:
   movq    %rdi, t1280
   movq    %rbx, t1281
   movq    %r12, t1282
   movq    %r13, t1283
   movq    %r14, t1284
   movq    %r15, t1285
   movq    (t1280), t1433
   movq    t1433, %rax
   movq    t1281, %rbx
   movq    t1282, %r12
   movq    t1283, %r13
   movq    t1284, %r14
   movq    t1285, %r15
_DONE_458:
   #return sink
   leave
   ret

.globl _Element_GetSalary
_Element_GetSalary:
   pushq  %rbp
   movq   %rsp, %rbp
_L_459:
   movq    %rdi, t1286
   movq    %rbx, t1287
   movq    %r12, t1288
   movq    %r13, t1289
   movq    %r14, t1290
   movq    %r15, t1291
   movq    8(t1286), t1434
   movq    t1434, %rax
   movq    t1287, %rbx
   movq    t1288, %r12
   movq    t1289, %r13
   movq    t1290, %r14
   movq    t1291, %r15
_DONE_460:
   #return sink
   leave
   ret

.globl _Element_GetMarried
_Element_GetMarried:
   pushq  %rbp
   movq   %rsp, %rbp
_L_461:
   movq    %rdi, t1292
   movq    %rbx, t1293
   movq    %r12, t1294
   movq    %r13, t1295
   movq    %r14, t1296
   movq    %r15, t1297
   movq    16(t1292), t1435
   movq    t1435, %rax
   movq    t1293, %rbx
   movq    t1294, %r12
   movq    t1295, %r13
   movq    t1296, %r14
   movq    t1297, %r15
_DONE_462:
   #return sink
   leave
   ret

.globl _Element_Equal
_Element_Equal:
   pushq  %rbp
   movq   %rsp, %rbp
_L_463:
   movq    %rdi, t1298
   movq    %rsi, t1299
   movq    %rbx, t1304
   movq    %r12, t1305
   movq    %r13, t1306
   movq    %r14, t1307
   movq    %r15, t1308
   movq    $1, t1436
   movq    t1436, t1300
   movq    t1299, %rdi
   call    _Element_GetAge
   movq    %rax, t1301
   movq    (t1298), t1437
   movq    t1437, %rdx
   movq    t1301, %rsi
   movq    t1298, %rdi
   call    _Element_Compare
   movq    %rax, t1420
   movq    $0, t1438
   cmpq    t1438, t1420
   jne     _L_411
_L_410:
   movq    $0, t1439
   movq    t1439, t1300
_L_412:
   movq    t1300, %rax
   movq    t1304, %rbx
   movq    t1305, %r12
   movq    t1306, %r13
   movq    t1307, %r14
   movq    t1308, %r15
   jmp     _DONE_464
_L_411:
   movq    t1299, %rdi
   call    _Element_GetSalary
   movq    %rax, t1302
   movq    8(t1298), t1440
   movq    t1440, %rdx
   movq    t1302, %rsi
   movq    t1298, %rdi
   call    _Element_Compare
   movq    %rax, t1421
   movq    $0, t1441
   cmpq    t1441, t1421
   jne     _L_414
_L_413:
   movq    $0, t1442
   movq    t1442, t1300
_L_415:
   jmp     _L_412
_L_414:
   movq    16(t1298), t1443
   movq    $0, t1444
   cmpq    t1444, t1443
   jne     _L_416
_L_417:
   movq    t1299, %rdi
   call    _Element_GetMarried
   movq    %rax, t1423
   movq    $0, t1445
   cmpq    t1445, t1423
   jne     _L_422
_L_423:
   movq    $0, t1446
   movq    t1446, t1303
_L_424:
_L_418:
   jmp     _L_415
_L_416:
   movq    t1299, %rdi
   call    _Element_GetMarried
   movq    %rax, t1422
   movq    $0, t1447
   cmpq    t1447, t1422
   jne     _L_420
_L_419:
   movq    $0, t1448
   movq    t1448, t1300
_L_421:
   jmp     _L_418
_L_420:
   movq    $0, t1449
   movq    t1449, t1303
   jmp     _L_421
_L_422:
   movq    $0, t1450
   movq    t1450, t1300
   jmp     _L_424
_DONE_464:
   #return sink
   leave
   ret

.globl _Element_Compare
_Element_Compare:
   pushq  %rbp
   movq   %rsp, %rbp
_L_465:
   movq    %rdi, t1309
   movq    %rsi, t1310
   movq    %rdx, t1311
   movq    %rbx, t1314
   movq    %r12, t1315
   movq    %r13, t1316
   movq    %r14, t1317
   movq    %r15, t1318
   movq    $0, t1451
   movq    t1451, t1312
   movq    t1311, t1452
   incq    t1452
   movq    t1452, t1313
   cmpq    t1311, t1310
   jl      _L_425
_L_426:
   cmpq    t1313, t1310
   jl      _L_429
_L_428:
   movq    $0, t1453
   movq    t1453, t1312
_L_430:
_L_427:
   movq    t1312, %rax
   movq    t1314, %rbx
   movq    t1315, %r12
   movq    t1316, %r13
   movq    t1317, %r14
   movq    t1318, %r15
   jmp     _DONE_466
_L_425:
   movq    $0, t1454
   movq    t1454, t1312
   jmp     _L_427
_L_429:
   movq    $1, t1455
   movq    t1455, t1312
   jmp     _L_430
_DONE_466:
   #return sink
   leave
   ret

.globl _List_Init
_List_Init:
   pushq  %rbp
   movq   %rsp, %rbp
_L_467:
   movq    %rdi, t1319
   movq    %rbx, t1320
   movq    %r12, t1321
   movq    %r13, t1322
   movq    %r14, t1323
   movq    %r15, t1324
   movq    $1, t1456
   movq    t1456, 16(t1319)
   movq    $1, t1457
   movq    t1457, %rax
   movq    t1320, %rbx
   movq    t1321, %r12
   movq    t1322, %r13
   movq    t1323, %r14
   movq    t1324, %r15
_DONE_468:
   #return sink
   leave
   ret

.globl _List_InitNew
_List_InitNew:
   pushq  %rbp
   movq   %rsp, %rbp
_L_469:
   movq    %rdi, t1325
   movq    %rsi, t1326
   movq    %rdx, t1327
   movq    %rcx, t1328
   movq    %rbx, t1329
   movq    %r12, t1330
   movq    %r13, t1331
   movq    %r14, t1332
   movq    %r15, t1333
   movq    t1328, 16(t1325)
   movq    t1326, (t1325)
   movq    t1327, 8(t1325)
   movq    $1, t1458
   movq    t1458, %rax
   movq    t1329, %rbx
   movq    t1330, %r12
   movq    t1331, %r13
   movq    t1332, %r14
   movq    t1333, %r15
_DONE_470:
   #return sink
   leave
   ret

.globl _List_Insert
_List_Insert:
   pushq  %rbp
   movq   %rsp, %rbp
_L_471:
   movq    %rdi, t1334
   movq    %rsi, t1335
   movq    %rbx, t1339
   movq    %r12, t1340
   movq    %r13, t1341
   movq    %r14, t1342
   movq    %r15, t1343
   movq    t1334, t1337
   movq    $24, t1459
   movq    t1459, %rdi
   call    _cs411newobject
   movq    %rax, t1338
   movq    $0, t1460
   movq    t1460, %rcx
   movq    t1337, %rdx
   movq    t1335, %rsi
   movq    t1338, %rdi
   call    _List_InitNew
   movq    %rax, t1336
   movq    t1338, %rax
   movq    t1339, %rbx
   movq    t1340, %r12
   movq    t1341, %r13
   movq    t1342, %r14
   movq    t1343, %r15
_DONE_472:
   #return sink
   leave
   ret

.globl _List_SetNext
_List_SetNext:
   pushq  %rbp
   movq   %rsp, %rbp
_L_473:
   movq    %rdi, t1344
   movq    %rsi, t1345
   movq    %rbx, t1346
   movq    %r12, t1347
   movq    %r13, t1348
   movq    %r14, t1349
   movq    %r15, t1350
   movq    t1345, 8(t1344)
   movq    $1, t1461
   movq    t1461, %rax
   movq    t1346, %rbx
   movq    t1347, %r12
   movq    t1348, %r13
   movq    t1349, %r14
   movq    t1350, %r15
_DONE_474:
   #return sink
   leave
   ret

.globl _List_Delete
_List_Delete:
   pushq  %rbp
   movq   %rsp, %rbp
_L_475:
   movq    %rdi, t1351
   movq    %rsi, t1352
   movq    %rbx, t1362
   movq    %r12, t1363
   movq    %r13, t1364
   movq    %r14, t1365
   movq    %r15, t1366
   movq    t1351, t1353
   movq    $0, t1462
   movq    t1462, t1354
   movq    $-1, t1463
   movq    t1463, t1360
   movq    t1351, t1356
   movq    t1351, t1357
   movq    16(t1351), t1464
   movq    t1464, t1358
   movq    (t1351), t1465
   movq    t1465, t1359
_L_433:
   movq    $0, t1466
   cmpq    t1466, t1358
   jne     _L_431
_L_434:
   movq    $0, t1467
   cmpq    t1467, t1354
   jne     _L_431
_L_432:
   movq    t1359, %rsi
   movq    t1352, %rdi
   call    _Element_Equal
   movq    %rax, t1424
   movq    $0, t1468
   cmpq    t1468, t1424
   jne     _L_435
_L_436:
   movq    $0, t1469
   movq    t1469, t1361
_L_437:
   movq    $0, t1470
   cmpq    t1470, t1354
   jne     _L_442
_L_441:
   movq    t1356, t1357
   movq    t1356, %rdi
   call    _List_GetNext
   movq    %rax, t1356
   movq    t1356, %rdi
   call    _List_GetEnd
   movq    %rax, t1358
   movq    t1356, %rdi
   call    _List_GetElem
   movq    %rax, t1359
   movq    $1, t1471
   movq    t1471, t1360
_L_443:
   jmp     _L_433
_L_435:
   movq    $1, t1472
   movq    t1472, t1354
   movq    $0, t1473
   cmpq    t1473, t1360
   jl      _L_438
_L_439:
   movq    $-555, t1474
   movq    t1474, %rdi
   call    _cs411println
   movq    t1357, t1426
   movq    t1356, %rdi
   call    _List_GetNext
   movq    %rax, t1425
   movq    t1425, %rsi
   movq    t1426, %rdi
   call    _List_SetNext
   movq    %rax, t1355
   movq    $-555, t1475
   movq    t1475, %rdi
   call    _cs411println
_L_440:
   jmp     _L_437
_L_438:
   movq    t1356, %rdi
   call    _List_GetNext
   movq    %rax, t1353
   jmp     _L_440
_L_442:
   movq    $0, t1476
   movq    t1476, t1361
   jmp     _L_443
_L_431:
   movq    t1353, %rax
   movq    t1362, %rbx
   movq    t1363, %r12
   movq    t1364, %r13
   movq    t1365, %r14
   movq    t1366, %r15
_DONE_476:
   #return sink
   leave
   ret

.globl _List_Search
_List_Search:
   pushq  %rbp
   movq   %rsp, %rbp
_L_477:
   movq    %rdi, t1367
   movq    %rsi, t1368
   movq    %rbx, t1374
   movq    %r12, t1375
   movq    %r13, t1376
   movq    %r14, t1377
   movq    %r15, t1378
   movq    $0, t1477
   movq    t1477, t1369
   movq    t1367, t1370
   movq    16(t1367), t1478
   movq    t1478, t1372
   movq    (t1367), t1479
   movq    t1479, t1371
_L_446:
   movq    $0, t1480
   cmpq    t1480, t1372
   jne     _L_444
_L_445:
   movq    t1371, %rsi
   movq    t1368, %rdi
   call    _Element_Equal
   movq    %rax, t1427
   movq    $0, t1481
   cmpq    t1481, t1427
   jne     _L_447
_L_448:
   movq    $0, t1482
   movq    t1482, t1373
_L_449:
   movq    t1370, %rdi
   call    _List_GetNext
   movq    %rax, t1370
   movq    t1370, %rdi
   call    _List_GetEnd
   movq    %rax, t1372
   movq    t1370, %rdi
   call    _List_GetElem
   movq    %rax, t1371
   jmp     _L_446
_L_447:
   movq    $1, t1483
   movq    t1483, t1369
   jmp     _L_449
_L_444:
   movq    t1369, %rax
   movq    t1374, %rbx
   movq    t1375, %r12
   movq    t1376, %r13
   movq    t1377, %r14
   movq    t1378, %r15
_DONE_478:
   #return sink
   leave
   ret

.globl _List_GetEnd
_List_GetEnd:
   pushq  %rbp
   movq   %rsp, %rbp
_L_479:
   movq    %rdi, t1379
   movq    %rbx, t1380
   movq    %r12, t1381
   movq    %r13, t1382
   movq    %r14, t1383
   movq    %r15, t1384
   movq    16(t1379), t1484
   movq    t1484, %rax
   movq    t1380, %rbx
   movq    t1381, %r12
   movq    t1382, %r13
   movq    t1383, %r14
   movq    t1384, %r15
_DONE_480:
   #return sink
   leave
   ret

.globl _List_GetElem
_List_GetElem:
   pushq  %rbp
   movq   %rsp, %rbp
_L_481:
   movq    %rdi, t1385
   movq    %rbx, t1386
   movq    %r12, t1387
   movq    %r13, t1388
   movq    %r14, t1389
   movq    %r15, t1390
   movq    (t1385), t1485
   movq    t1485, %rax
   movq    t1386, %rbx
   movq    t1387, %r12
   movq    t1388, %r13
   movq    t1389, %r14
   movq    t1390, %r15
_DONE_482:
   #return sink
   leave
   ret

.globl _List_GetNext
_List_GetNext:
   pushq  %rbp
   movq   %rsp, %rbp
_L_483:
   movq    %rdi, t1391
   movq    %rbx, t1392
   movq    %r12, t1393
   movq    %r13, t1394
   movq    %r14, t1395
   movq    %r15, t1396
   movq    8(t1391), t1486
   movq    t1486, %rax
   movq    t1392, %rbx
   movq    t1393, %r12
   movq    t1394, %r13
   movq    t1395, %r14
   movq    t1396, %r15
_DONE_484:
   #return sink
   leave
   ret

.globl _List_Print
_List_Print:
   pushq  %rbp
   movq   %rsp, %rbp
_L_485:
   movq    %rdi, t1397
   movq    %rbx, t1401
   movq    %r12, t1402
   movq    %r13, t1403
   movq    %r14, t1404
   movq    %r15, t1405
   movq    t1397, t1398
   movq    16(t1397), t1487
   movq    t1487, t1399
   movq    (t1397), t1488
   movq    t1488, t1400
_L_452:
   movq    $0, t1489
   cmpq    t1489, t1399
   jne     _L_450
_L_451:
   movq    t1400, %rdi
   call    _Element_GetAge
   movq    %rax, t1428
   movq    t1428, %rdi
   call    _cs411println
   movq    t1398, %rdi
   call    _List_GetNext
   movq    %rax, t1398
   movq    t1398, %rdi
   call    _List_GetEnd
   movq    %rax, t1399
   movq    t1398, %rdi
   call    _List_GetElem
   movq    %rax, t1400
   jmp     _L_452
_L_450:
   movq    $1, t1490
   movq    t1490, %rax
   movq    t1401, %rbx
   movq    t1402, %r12
   movq    t1403, %r13
   movq    t1404, %r14
   movq    t1405, %r15
_DONE_486:
   #return sink
   leave
   ret

.globl _LL_Start
_LL_Start:
   pushq  %rbp
   movq   %rsp, %rbp
_L_487:
   movq    %rdi, t1406
   movq    %rbx, t1413
   movq    %r12, t1414
   movq    %r13, t1415
   movq    %r14, t1416
   movq    %r15, t1417
   movq    $24, t1491
   movq    t1491, %rdi
   call    _cs411newobject
   movq    %rax, t1408
   movq    t1408, %rdi
   call    _List_Init
   movq    %rax, t1409
   movq    t1408, t1407
   movq    t1407, %rdi
   call    _List_Init
   movq    %rax, t1409
   movq    t1407, %rdi
   call    _List_Print
   movq    %rax, t1409
   movq    $24, t1492
   movq    t1492, %rdi
   call    _cs411newobject
   movq    %rax, t1410
   movq    $0, t1493
   movq    t1493, %rcx
   movq    $37000, t1494
   movq    t1494, %rdx
   movq    $25, t1495
   movq    t1495, %rsi
   movq    t1410, %rdi
   call    _Element_Init
   movq    %rax, t1409
   movq    t1410, %rsi
   movq    t1407, %rdi
   call    _List_Insert
   movq    %rax, t1407
   movq    t1407, %rdi
   call    _List_Print
   movq    %rax, t1409
   movq    $10000000, t1496
   movq    t1496, %rdi
   call    _cs411println
   movq    $24, t1497
   movq    t1497, %rdi
   call    _cs411newobject
   movq    %rax, t1410
   movq    $1, t1498
   movq    t1498, %rcx
   movq    $42000, t1499
   movq    t1499, %rdx
   movq    $39, t1500
   movq    t1500, %rsi
   movq    t1410, %rdi
   call    _Element_Init
   movq    %rax, t1409
   movq    t1410, t1411
   movq    t1410, %rsi
   movq    t1407, %rdi
   call    _List_Insert
   movq    %rax, t1407
   movq    t1407, %rdi
   call    _List_Print
   movq    %rax, t1409
   movq    $10000000, t1501
   movq    t1501, %rdi
   call    _cs411println
   movq    $24, t1502
   movq    t1502, %rdi
   call    _cs411newobject
   movq    %rax, t1410
   movq    $0, t1503
   movq    t1503, %rcx
   movq    $34000, t1504
   movq    t1504, %rdx
   movq    $22, t1505
   movq    t1505, %rsi
   movq    t1410, %rdi
   call    _Element_Init
   movq    %rax, t1409
   movq    t1410, %rsi
   movq    t1407, %rdi
   call    _List_Insert
   movq    %rax, t1407
   movq    t1407, %rdi
   call    _List_Print
   movq    %rax, t1409
   movq    $24, t1506
   movq    t1506, %rdi
   call    _cs411newobject
   movq    %rax, t1412
   movq    $0, t1507
   movq    t1507, %rcx
   movq    $34000, t1508
   movq    t1508, %rdx
   movq    $27, t1509
   movq    t1509, %rsi
   movq    t1412, %rdi
   call    _Element_Init
   movq    %rax, t1409
   movq    t1411, %rsi
   movq    t1407, %rdi
   call    _List_Search
   movq    %rax, t1429
   movq    t1429, %rdi
   call    _cs411println
   movq    t1412, %rsi
   movq    t1407, %rdi
   call    _List_Search
   movq    %rax, t1430
   movq    t1430, %rdi
   call    _cs411println
   movq    $10000000, t1510
   movq    t1510, %rdi
   call    _cs411println
   movq    $24, t1511
   movq    t1511, %rdi
   call    _cs411newobject
   movq    %rax, t1410
   movq    $0, t1512
   movq    t1512, %rcx
   movq    $35000, t1513
   movq    t1513, %rdx
   movq    $28, t1514
   movq    t1514, %rsi
   movq    t1410, %rdi
   call    _Element_Init
   movq    %rax, t1409
   movq    t1410, %rsi
   movq    t1407, %rdi
   call    _List_Insert
   movq    %rax, t1407
   movq    t1407, %rdi
   call    _List_Print
   movq    %rax, t1409
   movq    $2220000, t1515
   movq    t1515, %rdi
   call    _cs411println
   movq    t1411, %rsi
   movq    t1407, %rdi
   call    _List_Delete
   movq    %rax, t1407
   movq    t1407, %rdi
   call    _List_Print
   movq    %rax, t1409
   movq    $33300000, t1516
   movq    t1516, %rdi
   call    _cs411println
   movq    t1410, %rsi
   movq    t1407, %rdi
   call    _List_Delete
   movq    %rax, t1407
   movq    t1407, %rdi
   call    _List_Print
   movq    %rax, t1409
   movq    $44440000, t1517
   movq    t1517, %rdi
   call    _cs411println
   movq    $0, t1518
   movq    t1518, %rax
   movq    t1413, %rbx
   movq    t1414, %r12
   movq    t1415, %r13
   movq    t1416, %r14
   movq    t1417, %r15
_DONE_488:
   #return sink
   leave
   ret

   .ident	"minijavac: cs411 course project 2011w2"
