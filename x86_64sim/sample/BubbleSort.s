   .text
.globl _BBS_Start
_BBS_Start:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_597:
   movq    %rbx, -8(%rbp)
   # movq    %r12, %r12/*t1554*/
   # movq    %r13, %r13/*t1555*/
   # movq    %r14, %r14/*t1556*/
   # movq    %r15, %r15/*t1557*/
   movq    %rdi, %rbx/*t1550*/
   # movq    %rsi, %rsi/*t1551*/
   # movq    %rsi/*t1551*/, %rsi
   movq    %rbx/*t1550*/, %rdi
   call    _BBS_Init
   # movq    %rax, %rax/*t1552*/
   movq    %rbx/*t1550*/, %rdi
   call    _BBS_Print
   # movq    %rax, %rax/*t1552*/
   movq    $99999, %rdi
   call    _cs411println
   movq    %rbx/*t1550*/, %rdi
   call    _BBS_Sort
   # movq    %rax, %rax/*t1552*/
   movq    %rbx/*t1550*/, %rdi
   call    _BBS_Print
   # movq    %rax, %rax/*t1552*/
   movq    $0, %rax
_bail_560:
   movq    -8(%rbp), %rbx/*t1709*/
   # movq    %rbx/*t1709*/, %rbx
   # movq    %r12/*t1554*/, %r12
   # movq    %r13/*t1555*/, %r13
   # movq    %r14/*t1556*/, %r14
   # movq    %r15/*t1557*/, %r15
_DONE_598:
   # return sink
   leave
   ret

.globl _BBS_Sort
_BBS_Sort:
   subq   $8, %rsp
_L_599:
   # movq    %rbx, %rbx/*t1580*/
   # movq    %r12, %r12/*t1581*/
   # movq    %r13, %r13/*t1582*/
   # movq    %r14, %r14/*t1583*/
   # movq    %r15, %r15/*t1584*/
   # movq    %rdi, %rdi/*t1558*/
   movq    8(%rdi/*t1558*/), %rsi/*t1634*/
   # movq    %rsi/*t1634*/, %rsi/*t1633*/
   decq    %rsi/*t1633*/
   # movq    %rsi/*t1633*/, %rsi/*t1560*/
   movq    $-1, %r11/*t1561*/
_looptest_564:
   cmpq    %rsi/*t1560*/, %r11/*t1561*/
   jge     _loopend_562
_loopbody_563:
   movq    $1, %rdx/*t1566*/
_looptest_567:
   movq    %rsi/*t1560*/, %rcx/*t1635*/
   incq    %rcx/*t1635*/
   cmpq    %rcx/*t1635*/, %rdx/*t1566*/
   jge     _loopend_565
_loopbody_566:
   movq    %rdx/*t1566*/, %r8/*t1636*/
   decq    %r8/*t1636*/
   # movq    %r8/*t1636*/, %r8/*t1565*/
   # movq    %r8/*t1565*/, %r8/*t1569*/
   # movq    %r8/*t1569*/, %r8/*t1626*/
   movq    (%rdi/*t1558*/), %rcx/*t1637*/
   # movq    %rcx/*t1637*/, %rcx/*t1568*/
   movq    -8(%rcx/*t1568*/), %r9/*t1638*/
   cmpq    %r9/*t1638*/, %r8/*t1626*/
   jae     _boundsbad_569
_boundsok_568:
   movq    (%rcx/*t1568*/, %r8/*t1569*/, 8), %r8/*t1639*/
   # movq    %r8/*t1639*/, %r8/*t1562*/
   # movq    %rdx/*t1566*/, %rdx/*t1571*/
   movq    %rdx/*t1571*/, %rax/*t1627*/
   movq    (%rdi/*t1558*/), %rcx/*t1640*/
   # movq    %rcx/*t1640*/, %rcx/*t1570*/
   movq    -8(%rcx/*t1570*/), %r9/*t1641*/
   cmpq    %r9/*t1641*/, %rax/*t1627*/
   jae     _boundsbad_569
_boundsok_570:
   movq    (%rcx/*t1570*/, %rdx/*t1571*/, 8), %rcx/*t1642*/
   # movq    %rcx/*t1642*/, %rcx/*t1563*/
   cmpq    %r8/*t1562*/, %rcx/*t1563*/
   jge     _L_572
_L_571:
   movq    %rdx/*t1566*/, %rcx/*t1643*/
   decq    %rcx/*t1643*/
   # movq    %rcx/*t1643*/, %rcx/*t1564*/
   # movq    %rcx/*t1564*/, %rcx/*t1573*/
   movq    %rcx/*t1573*/, %rax/*t1628*/
   movq    (%rdi/*t1558*/), %r8/*t1644*/
   # movq    %r8/*t1644*/, %r8/*t1572*/
   movq    -8(%r8/*t1572*/), %r9/*t1645*/
   cmpq    %r9/*t1645*/, %rax/*t1628*/
   jae     _boundsbad_569
_boundsok_574:
   movq    (%r8/*t1572*/, %rcx/*t1573*/, 8), %r9/*t1646*/
   # movq    %r9/*t1646*/, %r9/*t1567*/
   # movq    %rcx/*t1564*/, %rcx/*t1577*/
   # movq    %rcx/*t1577*/, %rcx/*t1629*/
   movq    (%rdi/*t1558*/), %r8/*t1647*/
   # movq    %r8/*t1647*/, %r8/*t1576*/
   movq    -8(%r8/*t1576*/), %rax/*t1648*/
   cmpq    %rax/*t1648*/, %rcx/*t1629*/
   jae     _boundsbad_569
_boundsok_576:
   # movq    %r8/*t1576*/, %r8/*t1649*/
   imulq   $8, %rcx/*t1577*/, %rcx/*t1650*/
   addq    %rcx/*t1650*/, %r8/*t1649*/
   # movq    %r8/*t1649*/, %r8/*t1631*/
   # movq    %rdx/*t1566*/, %rdx/*t1575*/
   movq    %rdx/*t1575*/, %r10/*t1630*/
   movq    (%rdi/*t1558*/), %rcx/*t1651*/
   # movq    %rcx/*t1651*/, %rcx/*t1574*/
   movq    -8(%rcx/*t1574*/), %rax/*t1652*/
   cmpq    %rax/*t1652*/, %r10/*t1630*/
   jae     _boundsbad_569
_boundsok_575:
   movq    (%rcx/*t1574*/, %rdx/*t1575*/, 8), %rcx/*t1653*/
   movq    %rcx/*t1653*/, (%r8/*t1631*/)
   # movq    %rdx/*t1566*/, %rdx/*t1579*/
   movq    %rdx/*t1579*/, %rax/*t1632*/
   movq    (%rdi/*t1558*/), %rcx/*t1654*/
   # movq    %rcx/*t1654*/, %rcx/*t1578*/
   movq    -8(%rcx/*t1578*/), %r8/*t1655*/
   cmpq    %r8/*t1655*/, %rax/*t1632*/
   jae     _boundsbad_569
_boundsok_577:
   movq    %r9/*t1567*/, (%rcx/*t1578*/, %rdx/*t1579*/, 8)
_L_573:
   # movq    %rdx/*t1566*/, %rdx/*t1656*/
   incq    %rdx/*t1656*/
   # movq    %rdx/*t1656*/, %rdx/*t1566*/
   jmp     _looptest_567
_boundsbad_569:
   movq    $1, %rdi
   call    _cs411error
_bail_561:
   # movq    %rbx/*t1580*/, %rbx
   # movq    %r12/*t1581*/, %r12
   # movq    %r13/*t1582*/, %r13
   # movq    %r14/*t1583*/, %r14
   # movq    %r15/*t1584*/, %r15
   jmp     _DONE_600
_L_572:
   jmp     _L_573
_loopend_565:
   # movq    %rsi/*t1560*/, %rsi/*t1657*/
   decq    %rsi/*t1657*/
   # movq    %rsi/*t1657*/, %rsi/*t1560*/
   jmp     _looptest_564
_loopend_562:
   movq    $0, %rax
   jmp     _bail_561
_DONE_600:
   # return sink
   addq   $8, %rsp
   ret

.globl _BBS_Print
_BBS_Print:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_601:
   movq    %rbx, -16(%rbp)
   movq    %r12, -8(%rbp)
   # movq    %r13, %r13/*t1591*/
   # movq    %r14, %r14/*t1592*/
   # movq    %r15, %r15/*t1593*/
   movq    %rdi, %r12/*t1585*/
   movq    $0, %rbx/*t1586*/
_looptest_581:
   movq    8(%r12/*t1585*/), %rdi/*t1742*/
   cmpq    %rdi/*t1742*/, %rbx/*t1586*/
   jge     _loopend_579
_loopbody_580:
   # movq    %rbx/*t1586*/, %rbx/*t1588*/
   movq    %rbx/*t1588*/, %rdx/*t1658*/
   movq    (%r12/*t1585*/), %rdi/*t1743*/
   # movq    %rdi/*t1743*/, %rdi/*t1587*/
   movq    -8(%rdi/*t1587*/), %rsi/*t1744*/
   cmpq    %rsi/*t1744*/, %rdx/*t1658*/
   jae     _boundsbad_583
_boundsok_582:
   movq    (%rdi/*t1587*/, %rbx/*t1588*/, 8), %rdi/*t1745*/
   # movq    %rdi/*t1745*/, %rdi
   call    _cs411println
   # movq    %rbx/*t1586*/, %rbx/*t1746*/
   incq    %rbx/*t1746*/
   # movq    %rbx/*t1746*/, %rbx/*t1586*/
   jmp     _looptest_581
_boundsbad_583:
   movq    $1, %rdi
   call    _cs411error
_bail_578:
   movq    -16(%rbp), %rbx/*t1747*/
   # movq    %rbx/*t1747*/, %rbx
   movq    -8(%rbp), %r12/*t1748*/
   # movq    %r12/*t1748*/, %r12
   # movq    %r13/*t1591*/, %r13
   # movq    %r14/*t1592*/, %r14
   # movq    %r15/*t1593*/, %r15
   jmp     _DONE_602
_loopend_579:
   movq    $0, %rax
   jmp     _bail_578
_DONE_602:
   # return sink
   leave
   ret

.globl _BBS_Init
_BBS_Init:
   pushq  %rbp
   movq   %rsp, %rbp
   subq   $16, %rsp
_L_603:
   movq    %rbx, -8(%rbp)
   # movq    %r12, %r12/*t1617*/
   # movq    %r13, %r13/*t1618*/
   # movq    %r14, %r14/*t1619*/
   # movq    %r15, %r15/*t1620*/
   movq    %rdi, %rbx/*t1594*/
   # movq    %rsi, %rsi/*t1595*/
   movq    %rsi/*t1595*/, 8(%rbx/*t1594*/)
   # movq    %rbx/*t1594*/, %rbx/*t1665*/
   movq    %rsi/*t1595*/, %rdi
   call    _cs411newarray
   # movq    %rax, %rax/*t1664*/
   movq    %rax/*t1664*/, (%rbx/*t1665*/)
   movq    $0, %rsi/*t1597*/
   # movq    %rsi/*t1597*/, %rsi/*t1666*/
   movq    (%rbx/*t1594*/), %rdi/*t1766*/
   # movq    %rdi/*t1766*/, %rdi/*t1596*/
   movq    -8(%rdi/*t1596*/), %rdx/*t1767*/
   cmpq    %rdx/*t1767*/, %rsi/*t1666*/
   jae     _boundsbad_586
_boundsok_585:
   movq    $20, %rdx/*t1768*/
   movq    %rdx/*t1768*/, (%rdi/*t1596*/, %rsi/*t1597*/, 8)
   movq    $1, %rsi/*t1599*/
   # movq    %rsi/*t1599*/, %rsi/*t1667*/
   movq    (%rbx/*t1594*/), %rdi/*t1769*/
   # movq    %rdi/*t1769*/, %rdi/*t1598*/
   movq    -8(%rdi/*t1598*/), %rdx/*t1770*/
   cmpq    %rdx/*t1770*/, %rsi/*t1667*/
   jae     _boundsbad_586
_boundsok_587:
   movq    $7, %rdx/*t1771*/
   movq    %rdx/*t1771*/, (%rdi/*t1598*/, %rsi/*t1599*/, 8)
   movq    $2, %rsi/*t1601*/
   # movq    %rsi/*t1601*/, %rsi/*t1668*/
   movq    (%rbx/*t1594*/), %rdi/*t1772*/
   # movq    %rdi/*t1772*/, %rdi/*t1600*/
   movq    -8(%rdi/*t1600*/), %rdx/*t1773*/
   cmpq    %rdx/*t1773*/, %rsi/*t1668*/
   jae     _boundsbad_586
_boundsok_588:
   movq    $12, %rdx/*t1774*/
   movq    %rdx/*t1774*/, (%rdi/*t1600*/, %rsi/*t1601*/, 8)
   movq    $3, %rsi/*t1603*/
   # movq    %rsi/*t1603*/, %rsi/*t1669*/
   movq    (%rbx/*t1594*/), %rdi/*t1775*/
   # movq    %rdi/*t1775*/, %rdi/*t1602*/
   movq    -8(%rdi/*t1602*/), %rdx/*t1776*/
   cmpq    %rdx/*t1776*/, %rsi/*t1669*/
   jae     _boundsbad_586
_boundsok_589:
   movq    $18, %rdx/*t1777*/
   movq    %rdx/*t1777*/, (%rdi/*t1602*/, %rsi/*t1603*/, 8)
   movq    $4, %rsi/*t1605*/
   # movq    %rsi/*t1605*/, %rsi/*t1670*/
   movq    (%rbx/*t1594*/), %rdi/*t1778*/
   # movq    %rdi/*t1778*/, %rdi/*t1604*/
   movq    -8(%rdi/*t1604*/), %rdx/*t1779*/
   cmpq    %rdx/*t1779*/, %rsi/*t1670*/
   jae     _boundsbad_586
_boundsok_590:
   movq    $2, %rdx/*t1780*/
   movq    %rdx/*t1780*/, (%rdi/*t1604*/, %rsi/*t1605*/, 8)
   movq    $5, %rsi/*t1607*/
   # movq    %rsi/*t1607*/, %rsi/*t1671*/
   movq    (%rbx/*t1594*/), %rdi/*t1781*/
   # movq    %rdi/*t1781*/, %rdi/*t1606*/
   movq    -8(%rdi/*t1606*/), %rdx/*t1782*/
   cmpq    %rdx/*t1782*/, %rsi/*t1671*/
   jae     _boundsbad_586
_boundsok_591:
   movq    $11, %rdx/*t1783*/
   movq    %rdx/*t1783*/, (%rdi/*t1606*/, %rsi/*t1607*/, 8)
   movq    $6, %rsi/*t1609*/
   # movq    %rsi/*t1609*/, %rsi/*t1672*/
   movq    (%rbx/*t1594*/), %rdi/*t1784*/
   # movq    %rdi/*t1784*/, %rdi/*t1608*/
   movq    -8(%rdi/*t1608*/), %rdx/*t1785*/
   cmpq    %rdx/*t1785*/, %rsi/*t1672*/
   jae     _boundsbad_586
_boundsok_592:
   movq    $6, %rdx/*t1786*/
   movq    %rdx/*t1786*/, (%rdi/*t1608*/, %rsi/*t1609*/, 8)
   movq    $7, %rsi/*t1611*/
   # movq    %rsi/*t1611*/, %rsi/*t1673*/
   movq    (%rbx/*t1594*/), %rdi/*t1787*/
   # movq    %rdi/*t1787*/, %rdi/*t1610*/
   movq    -8(%rdi/*t1610*/), %rdx/*t1788*/
   cmpq    %rdx/*t1788*/, %rsi/*t1673*/
   jae     _boundsbad_586
_boundsok_593:
   movq    $9, %rdx/*t1789*/
   movq    %rdx/*t1789*/, (%rdi/*t1610*/, %rsi/*t1611*/, 8)
   movq    $8, %rsi/*t1613*/
   # movq    %rsi/*t1613*/, %rsi/*t1674*/
   movq    (%rbx/*t1594*/), %rdi/*t1790*/
   # movq    %rdi/*t1790*/, %rdi/*t1612*/
   movq    -8(%rdi/*t1612*/), %rdx/*t1791*/
   cmpq    %rdx/*t1791*/, %rsi/*t1674*/
   jae     _boundsbad_586
_boundsok_594:
   movq    $19, %rdx/*t1792*/
   movq    %rdx/*t1792*/, (%rdi/*t1612*/, %rsi/*t1613*/, 8)
   movq    $9, %rdi/*t1615*/
   # movq    %rdi/*t1615*/, %rdi/*t1675*/
   movq    (%rbx/*t1594*/), %rbx/*t1793*/
   # movq    %rbx/*t1793*/, %rbx/*t1614*/
   movq    -8(%rbx/*t1614*/), %rsi/*t1794*/
   cmpq    %rsi/*t1794*/, %rdi/*t1675*/
   jae     _boundsbad_586
_boundsok_595:
   movq    $5, %rsi/*t1795*/
   movq    %rsi/*t1795*/, (%rbx/*t1614*/, %rdi/*t1615*/, 8)
   movq    $0, %rax
_bail_584:
   movq    -8(%rbp), %rbx/*t1796*/
   # movq    %rbx/*t1796*/, %rbx
   # movq    %r12/*t1617*/, %r12
   # movq    %r13/*t1618*/, %r13
   # movq    %r14/*t1619*/, %r14
   # movq    %r15/*t1620*/, %r15
   jmp     _DONE_604
_boundsbad_586:
   movq    $1, %rdi
   call    _cs411error
   jmp     _bail_584
_DONE_604:
   # return sink
   leave
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_605:
   # movq    %rbx, %rbx/*t1621*/
   # movq    %r12, %r12/*t1622*/
   # movq    %r13, %r13/*t1623*/
   # movq    %r14, %r14/*t1624*/
   # movq    %r15, %r15/*t1625*/
   movq    $16, %rdi
   call    _cs411newobject
   # movq    %rax, %rax/*t1707*/
   movq    $10, %rsi
   movq    %rax/*t1707*/, %rdi
   call    _BBS_Start
   # movq    %rax, %rax/*t1706*/
   movq    %rax/*t1706*/, %rdi
   call    _cs411println
   # movq    %rbx/*t1621*/, %rbx
   # movq    %r12/*t1622*/, %r12
   # movq    %r13/*t1623*/, %r13
   # movq    %r14/*t1624*/, %r14
   # movq    %r15/*t1625*/, %r15
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
