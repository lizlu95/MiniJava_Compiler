   .text
.globl _cs411main
_cs411main:
   pushq  %rbp
   movq   %rsp, %rbp
_L_513:
   movq    %rbx, t1519
   movq    %r12, t1520
   movq    %r13, t1521
   movq    %r14, t1522
   movq    %r15, t1523
   movq    $16, t1566
   movq    t1566, %rdi
   call    _cs411newobject
   movq    %rax, t1563
   movq    $10, t1567
   movq    t1567, %rsi
   movq    t1563, %rdi
   call    _QS_Start
   movq    %rax, t1562
   movq    t1562, %rdi
   call    _cs411println
   movq    t1519, %rbx
   movq    t1520, %r12
   movq    t1521, %r13
   movq    t1522, %r14
   movq    t1523, %r15
_DONE_514:
   #return sink
   leave
   ret

.globl _QS_Start
_QS_Start:
   pushq  %rbp
   movq   %rsp, %rbp
_L_515:
   movq    %rdi, t1524
   movq    %rsi, t1525
   movq    %rbx, t1527
   movq    %r12, t1528
   movq    %r13, t1529
   movq    %r14, t1530
   movq    %r15, t1531
   movq    t1525, %rsi
   movq    t1524, %rdi
   call    _QS_Init
   movq    %rax, t1526
   movq    t1524, %rdi
   call    _QS_Print
   movq    %rax, t1526
   movq    $9999, t1568
   movq    t1568, %rdi
   call    _cs411println
   movq    8(t1524), t1570
   movq    t1570, t1569
   decq    t1569
   movq    t1569, t1526
   movq    t1526, %rdx
   movq    $0, t1571
   movq    t1571, %rsi
   movq    t1524, %rdi
   call    _QS_Sort
   movq    %rax, t1526
   movq    t1524, %rdi
   call    _QS_Print
   movq    %rax, t1526
   movq    $0, t1572
   movq    t1572, %rax
   movq    t1527, %rbx
   movq    t1528, %r12
   movq    t1529, %r13
   movq    t1530, %r14
   movq    t1531, %r15
_DONE_516:
   #return sink
   leave
   ret

.globl _QS_Sort
_QS_Sort:
   pushq  %rbp
   movq   %rsp, %rbp
_L_517:
   movq    %rdi, t1532
   movq    %rsi, t1533
   movq    %rdx, t1534
   movq    %rbx, t1543
   movq    %r12, t1544
   movq    %r13, t1545
   movq    %r14, t1546
   movq    %r15, t1547
   movq    $0, t1573
   movq    t1573, t1539
   cmpq    t1534, t1533
   jl      _L_489
_L_490:
   movq    $0, t1574
   movq    t1574, t1538
_L_491:
   movq    $0, t1575
   movq    t1575, %rax
   movq    t1543, %rbx
   movq    t1544, %r12
   movq    t1545, %r13
   movq    t1546, %r14
   movq    t1547, %r15
   jmp     _DONE_518
_L_489:
   movq    (t1532), t1577
   movq    (t1577, t1534, 8), t1576
   movq    t1576, t1535
   movq    t1533, t1578
   decq    t1578
   movq    t1578, t1536
   movq    t1534, t1537
   movq    $1, t1579
   movq    t1579, t1540
_L_494:
   movq    $0, t1580
   cmpq    t1580, t1540
   jne     _L_493
_L_492:
   movq    (t1532), t1581
   movq    (t1532), t1583
   movq    (t1583, t1536, 8), t1582
   movq    t1582, (t1581, t1537, 8)
   movq    (t1532), t1584
   movq    (t1532), t1586
   movq    (t1586, t1534, 8), t1585
   movq    t1585, (t1584, t1536, 8)
   movq    (t1532), t1587
   movq    t1539, (t1587, t1534, 8)
   movq    t1536, t1588
   decq    t1588
   movq    t1588, %rdx
   movq    t1533, %rsi
   movq    t1532, %rdi
   call    _QS_Sort
   movq    %rax, t1538
   movq    t1534, %rdx
   movq    t1536, t1589
   incq    t1589
   movq    t1589, %rsi
   movq    t1532, %rdi
   call    _QS_Sort
   movq    %rax, t1538
   jmp     _L_491
_L_493:
   movq    $1, t1590
   movq    t1590, t1541
_L_497:
   movq    $0, t1591
   cmpq    t1591, t1541
   jne     _L_496
_L_495:
   movq    $1, t1592
   movq    t1592, t1541
_L_503:
   movq    $0, t1593
   cmpq    t1593, t1541
   jne     _L_502
_L_501:
   movq    (t1532), t1595
   movq    (t1595, t1536, 8), t1594
   movq    t1594, t1539
   movq    (t1532), t1596
   movq    (t1532), t1598
   movq    (t1598, t1537, 8), t1597
   movq    t1597, (t1596, t1536, 8)
   movq    (t1532), t1599
   movq    t1539, (t1599, t1537, 8)
   movq    t1536, t1600
   incq    t1600
   cmpq    t1600, t1537
   jl      _L_507
_L_508:
   movq    $1, t1601
   movq    t1601, t1540
_L_509:
   jmp     _L_494
_L_496:
   movq    t1536, t1602
   incq    t1602
   movq    t1602, t1536
   movq    (t1532), t1604
   movq    (t1604, t1536, 8), t1603
   movq    t1603, t1542
   cmpq    t1535, t1542
   jl      _L_499
_L_498:
   movq    $0, t1605
   movq    t1605, t1541
_L_500:
   jmp     _L_497
_L_499:
   movq    $1, t1606
   movq    t1606, t1541
   jmp     _L_500
_L_502:
   movq    t1537, t1607
   decq    t1607
   movq    t1607, t1537
   movq    (t1532), t1609
   movq    (t1609, t1537, 8), t1608
   movq    t1608, t1542
   cmpq    t1542, t1535
   jl      _L_505
_L_504:
   movq    $0, t1610
   movq    t1610, t1541
_L_506:
   jmp     _L_503
_L_505:
   movq    $1, t1611
   movq    t1611, t1541
   jmp     _L_506
_L_507:
   movq    $0, t1612
   movq    t1612, t1540
   jmp     _L_509
_DONE_518:
   #return sink
   leave
   ret

.globl _QS_Print
_QS_Print:
   pushq  %rbp
   movq   %rsp, %rbp
_L_519:
   movq    %rdi, t1548
   movq    %rbx, t1550
   movq    %r12, t1551
   movq    %r13, t1552
   movq    %r14, t1553
   movq    %r15, t1554
   movq    $0, t1613
   movq    t1613, t1549
_L_512:
   movq    8(t1548), t1614
   cmpq    t1614, t1549
   jl      _L_511
_L_510:
   movq    $0, t1615
   movq    t1615, %rax
   movq    t1550, %rbx
   movq    t1551, %r12
   movq    t1552, %r13
   movq    t1553, %r14
   movq    t1554, %r15
   jmp     _DONE_520
_L_511:
   movq    (t1548), t1617
   movq    (t1617, t1549, 8), t1616
   movq    t1616, %rdi
   call    _cs411println
   movq    t1549, t1618
   incq    t1618
   movq    t1618, t1549
   jmp     _L_512
_DONE_520:
   #return sink
   leave
   ret

.globl _QS_Init
_QS_Init:
   pushq  %rbp
   movq   %rsp, %rbp
_L_521:
   movq    %rdi, t1555
   movq    %rsi, t1556
   movq    %rbx, t1557
   movq    %r12, t1558
   movq    %r13, t1559
   movq    %r14, t1560
   movq    %r15, t1561
   movq    t1556, 8(t1555)
   movq    t1555, t1565
   movq    t1556, %rdi
   call    _cs411newarray
   movq    %rax, t1564
   movq    t1564, (t1565)
   movq    (t1555), t1619
   movq    $20, t1620
   movq    t1620, (t1619)
   movq    (t1555), t1621
   movq    $7, t1622
   movq    t1622, 8(t1621)
   movq    (t1555), t1623
   movq    $12, t1624
   movq    t1624, 16(t1623)
   movq    (t1555), t1625
   movq    $18, t1626
   movq    t1626, 24(t1625)
   movq    (t1555), t1627
   movq    $2, t1628
   movq    t1628, 32(t1627)
   movq    (t1555), t1629
   movq    $11, t1630
   movq    t1630, 40(t1629)
   movq    (t1555), t1631
   movq    $6, t1632
   movq    t1632, 48(t1631)
   movq    (t1555), t1633
   movq    $9, t1634
   movq    t1634, 56(t1633)
   movq    (t1555), t1635
   movq    $19, t1636
   movq    t1636, 64(t1635)
   movq    (t1555), t1637
   movq    $5, t1638
   movq    t1638, 72(t1637)
   movq    $0, t1639
   movq    t1639, %rax
   movq    t1557, %rbx
   movq    t1558, %r12
   movq    t1559, %r13
   movq    t1560, %r14
   movq    t1561, %r15
_DONE_522:
   #return sink
   leave
   ret

   .ident	"minijavac: cs411 course project 2011w2"

