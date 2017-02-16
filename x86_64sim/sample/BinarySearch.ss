   .text
.globl _cs411main
_cs411main:
   pushq  %rbp
   movq   %rsp, %rbp
_L_222:
   movq    %rbx, t580
   movq    %r12, t581
   movq    %r13, t582
   movq    %r14, t583
   movq    %r15, t584
   movq    $16, t660
   movq    t660, %rdi
   call    _cs411newobject
   movq    %rax, t647
   movq    $20, t661
   movq    t661, %rsi
   movq    t647, %rdi
   call    _BS_Start
   movq    %rax, t646
   movq    t646, %rdi
   call    _cs411println
   movq    t580, %rbx
   movq    t581, %r12
   movq    t582, %r13
   movq    t583, %r14
   movq    t584, %r15
_DONE_223:
   #return sink
   leave
   ret

.globl _BS_Start
_BS_Start:
   pushq  %rbp
   movq   %rsp, %rbp
_L_224:
   movq    %rdi, t585
   movq    %rsi, t586
   movq    %rbx, t589
   movq    %r12, t590
   movq    %r13, t591
   movq    %r14, t592
   movq    %r15, t593
   movq    t586, %rsi
   movq    t585, %rdi
   call    _BS_Init
   movq    %rax, t587
   movq    t585, %rdi
   call    _BS_Print
   movq    %rax, t588
   movq    $8, t662
   movq    t662, %rsi
   movq    t585, %rdi
   call    _BS_Search
   movq    %rax, t648
   movq    $0, t663
   cmpq    t663, t648
   jne     _L_168
_L_169:
   movq    $0, t664
   movq    t664, %rdi
   call    _cs411println
_L_170:
   movq    $19, t665
   movq    t665, %rsi
   movq    t585, %rdi
   call    _BS_Search
   movq    %rax, t649
   movq    $0, t666
   cmpq    t666, t649
   jne     _L_171
_L_172:
   movq    $0, t667
   movq    t667, %rdi
   call    _cs411println
_L_173:
   movq    $20, t668
   movq    t668, %rsi
   movq    t585, %rdi
   call    _BS_Search
   movq    %rax, t650
   movq    $0, t669
   cmpq    t669, t650
   jne     _L_174
_L_175:
   movq    $0, t670
   movq    t670, %rdi
   call    _cs411println
_L_176:
   movq    $21, t671
   movq    t671, %rsi
   movq    t585, %rdi
   call    _BS_Search
   movq    %rax, t651
   movq    $0, t672
   cmpq    t672, t651
   jne     _L_177
_L_178:
   movq    $0, t673
   movq    t673, %rdi
   call    _cs411println
_L_179:
   movq    $37, t674
   movq    t674, %rsi
   movq    t585, %rdi
   call    _BS_Search
   movq    %rax, t652
   movq    $0, t675
   cmpq    t675, t652
   jne     _L_180
_L_181:
   movq    $0, t676
   movq    t676, %rdi
   call    _cs411println
_L_182:
   movq    $38, t677
   movq    t677, %rsi
   movq    t585, %rdi
   call    _BS_Search
   movq    %rax, t653
   movq    $0, t678
   cmpq    t678, t653
   jne     _L_183
_L_184:
   movq    $0, t679
   movq    t679, %rdi
   call    _cs411println
_L_185:
   movq    $39, t680
   movq    t680, %rsi
   movq    t585, %rdi
   call    _BS_Search
   movq    %rax, t654
   movq    $0, t681
   cmpq    t681, t654
   jne     _L_186
_L_187:
   movq    $0, t682
   movq    t682, %rdi
   call    _cs411println
_L_188:
   movq    $50, t683
   movq    t683, %rsi
   movq    t585, %rdi
   call    _BS_Search
   movq    %rax, t655
   movq    $0, t684
   cmpq    t684, t655
   jne     _L_189
_L_190:
   movq    $0, t685
   movq    t685, %rdi
   call    _cs411println
_L_191:
   movq    $999, t686
   movq    t686, %rax
   movq    t589, %rbx
   movq    t590, %r12
   movq    t591, %r13
   movq    t592, %r14
   movq    t593, %r15
   jmp     _DONE_225
_L_168:
   movq    $1, t687
   movq    t687, %rdi
   call    _cs411println
   jmp     _L_170
_L_171:
   movq    $1, t688
   movq    t688, %rdi
   call    _cs411println
   jmp     _L_173
_L_174:
   movq    $1, t689
   movq    t689, %rdi
   call    _cs411println
   jmp     _L_176
_L_177:
   movq    $1, t690
   movq    t690, %rdi
   call    _cs411println
   jmp     _L_179
_L_180:
   movq    $1, t691
   movq    t691, %rdi
   call    _cs411println
   jmp     _L_182
_L_183:
   movq    $1, t692
   movq    t692, %rdi
   call    _cs411println
   jmp     _L_185
_L_186:
   movq    $1, t693
   movq    t693, %rdi
   call    _cs411println
   jmp     _L_188
_L_189:
   movq    $1, t694
   movq    t694, %rdi
   call    _cs411println
   jmp     _L_191
_DONE_225:
   #return sink
   leave
   ret

.globl _BS_Search
_BS_Search:
   pushq  %rbp
   movq   %rsp, %rbp
_L_226:
   movq    %rdi, t594
   movq    %rsi, t595
   movq    %rbx, t603
   movq    %r12, t604
   movq    %r13, t605
   movq    %r14, t606
   movq    %r15, t607
   movq    $0, t695
   movq    t695, t601
   movq    $0, t696
   movq    t696, t596
   movq    (t594), t699
   movq    t699, t698
   movq    $8, t700
   subq    t700, t698
   movq    (t698), t697
   movq    t697, t597
   movq    t597, t701
   decq    t701
   movq    t701, t597
   movq    $0, t702
   movq    t702, t598
   movq    $1, t703
   movq    t703, t599
_L_194:
   movq    $0, t704
   cmpq    t704, t599
   jne     _L_193
_L_192:
   movq    t595, %rdx
   movq    t601, %rsi
   movq    t594, %rdi
   call    _BS_Compare
   movq    %rax, t657
   movq    $0, t705
   cmpq    t705, t657
   jne     _L_204
_L_205:
   movq    $0, t706
   movq    t706, t596
_L_206:
   movq    t596, %rax
   movq    t603, %rbx
   movq    t604, %r12
   movq    t605, %r13
   movq    t606, %r14
   movq    t607, %r15
   jmp     _DONE_227
_L_193:
   movq    t598, t707
   addq    t597, t707
   movq    t707, t600
   movq    t600, %rsi
   movq    t594, %rdi
   call    _BS_Div
   movq    %rax, t600
   movq    (t594), t709
   movq    (t709, t600, 8), t708
   movq    t708, t601
   cmpq    t601, t595
   jl      _L_195
_L_196:
   movq    t600, t710
   incq    t710
   movq    t710, t598
_L_197:
   movq    t595, %rdx
   movq    t601, %rsi
   movq    t594, %rdi
   call    _BS_Compare
   movq    %rax, t656
   movq    $0, t711
   cmpq    t711, t656
   jne     _L_198
_L_199:
   movq    $1, t712
   movq    t712, t599
_L_200:
   cmpq    t598, t597
   jl      _L_201
_L_202:
   movq    $0, t713
   movq    t713, t602
_L_203:
   jmp     _L_194
_L_195:
   movq    t600, t714
   decq    t714
   movq    t714, t597
   jmp     _L_197
_L_198:
   movq    $0, t715
   movq    t715, t599
   jmp     _L_200
_L_201:
   movq    $0, t716
   movq    t716, t599
   jmp     _L_203
_L_204:
   movq    $1, t717
   movq    t717, t596
   jmp     _L_206
_DONE_227:
   #return sink
   leave
   ret

.globl _BS_Div
_BS_Div:
   pushq  %rbp
   movq   %rsp, %rbp
_L_228:
   movq    %rdi, t608
   movq    %rsi, t609
   movq    %rbx, t613
   movq    %r12, t614
   movq    %r13, t615
   movq    %r14, t616
   movq    %r15, t617
   movq    $0, t718
   movq    t718, t610
   movq    $0, t719
   movq    t719, t611
   movq    t609, t720
   decq    t720
   movq    t720, t612
_L_209:
   cmpq    t612, t611
   jl      _L_208
_L_207:
   movq    t610, %rax
   movq    t613, %rbx
   movq    t614, %r12
   movq    t615, %r13
   movq    t616, %r14
   movq    t617, %r15
   jmp     _DONE_229
_L_208:
   movq    t610, t721
   incq    t721
   movq    t721, t610
   movq    t611, t722
   addq    $2, t722
   movq    t722, t611
   jmp     _L_209
_DONE_229:
   #return sink
   leave
   ret

.globl _BS_Compare
_BS_Compare:
   pushq  %rbp
   movq   %rsp, %rbp
_L_230:
   movq    %rdi, t618
   movq    %rsi, t619
   movq    %rdx, t620
   movq    %rbx, t623
   movq    %r12, t624
   movq    %r13, t625
   movq    %r14, t626
   movq    %r15, t627
   movq    $0, t723
   movq    t723, t621
   movq    t620, t724
   incq    t724
   movq    t724, t622
   cmpq    t620, t619
   jl      _L_210
_L_211:
   cmpq    t622, t619
   jl      _L_214
_L_213:
   movq    $0, t725
   movq    t725, t621
_L_215:
_L_212:
   movq    t621, %rax
   movq    t623, %rbx
   movq    t624, %r12
   movq    t625, %r13
   movq    t626, %r14
   movq    t627, %r15
   jmp     _DONE_231
_L_210:
   movq    $0, t726
   movq    t726, t621
   jmp     _L_212
_L_214:
   movq    $1, t727
   movq    t727, t621
   jmp     _L_215
_DONE_231:
   #return sink
   leave
   ret

.globl _BS_Print
_BS_Print:
   pushq  %rbp
   movq   %rsp, %rbp
_L_232:
   movq    %rdi, t628
   movq    %rbx, t630
   movq    %r12, t631
   movq    %r13, t632
   movq    %r14, t633
   movq    %r15, t634
   movq    $1, t728
   movq    t728, t629
_L_218:
   movq    8(t628), t729
   cmpq    t729, t629
   jl      _L_217
_L_216:
   movq    $99999, t730
   movq    t730, %rdi
   call    _cs411println
   movq    $0, t731
   movq    t731, %rax
   movq    t630, %rbx
   movq    t631, %r12
   movq    t632, %r13
   movq    t633, %r14
   movq    t634, %r15
   jmp     _DONE_233
_L_217:
   movq    (t628), t733
   movq    (t733, t629, 8), t732
   movq    t732, %rdi
   call    _cs411println
   movq    t629, t734
   incq    t734
   movq    t734, t629
   jmp     _L_218
_DONE_233:
   #return sink
   leave
   ret

.globl _BS_Init
_BS_Init:
   pushq  %rbp
   movq   %rsp, %rbp
_L_234:
   movq    %rdi, t635
   movq    %rsi, t636
   movq    %rbx, t641
   movq    %r12, t642
   movq    %r13, t643
   movq    %r14, t644
   movq    %r15, t645
   movq    t636, 8(t635)
   movq    t635, t659
   movq    t636, %rdi
   call    _cs411newarray
   movq    %rax, t658
   movq    t658, (t659)
   movq    $1, t735
   movq    t735, t637
   movq    8(t635), t737
   movq    t737, t736
   incq    t736
   movq    t736, t638
_L_221:
   movq    8(t635), t738
   cmpq    t738, t637
   jl      _L_220
_L_219:
   movq    $0, t739
   movq    t739, %rax
   movq    t641, %rbx
   movq    t642, %r12
   movq    t643, %r13
   movq    t644, %r14
   movq    t645, %r15
   jmp     _DONE_235
_L_220:
   imulq   $2, t637, t740
   movq    t740, t640
   movq    t638, t741
   movq    $3, t742
   subq    t742, t741
   movq    t741, t639
   movq    (t635), t743
   movq    t640, t744
   addq    t639, t744
   movq    t744, (t743, t637, 8)
   movq    t637, t745
   incq    t745
   movq    t745, t637
   movq    t638, t746
   decq    t746
   movq    t746, t638
   jmp     _L_221
_DONE_235:
   #return sink
   leave
   ret

   .ident	"minijavac: cs411 course project 2011w2"
