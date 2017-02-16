   .text
.globl _BS_Start
_BS_Start:
   subq   $8, %rsp
_L_325:
   movq    %rbx, t659
   movq    %r12, t660
   movq    %r13, t661
   movq    %r14, t662
   movq    %r15, t663
   movq    %rdi, t655
   movq    %rsi, t656
   movq    t656, %rsi
   movq    t655, %rdi
   call    _BS_Init
   movq    %rax, t657
   movq    t655, %rdi
   call    _BS_Print
   movq    %rax, t658
   movq    $8, %rsi
   movq    t655, %rdi
   call    _BS_Search
   movq    %rax, t727
   cmpq    $0, t727
   je      _L_260
_L_259:
   movq    $1, %rdi
   call    _cs411println
_L_261:
   movq    $19, %rsi
   movq    t655, %rdi
   call    _BS_Search
   movq    %rax, t728
   cmpq    $0, t728
   je      _L_263
_L_262:
   movq    $1, %rdi
   call    _cs411println
_L_264:
   movq    $20, %rsi
   movq    t655, %rdi
   call    _BS_Search
   movq    %rax, t729
   cmpq    $0, t729
   je      _L_266
_L_265:
   movq    $1, %rdi
   call    _cs411println
_L_267:
   movq    $21, %rsi
   movq    t655, %rdi
   call    _BS_Search
   movq    %rax, t730
   cmpq    $0, t730
   je      _L_269
_L_268:
   movq    $1, %rdi
   call    _cs411println
_L_270:
   movq    $37, %rsi
   movq    t655, %rdi
   call    _BS_Search
   movq    %rax, t731
   cmpq    $0, t731
   je      _L_272
_L_271:
   movq    $1, %rdi
   call    _cs411println
_L_273:
   movq    $38, %rsi
   movq    t655, %rdi
   call    _BS_Search
   movq    %rax, t732
   cmpq    $0, t732
   je      _L_275
_L_274:
   movq    $1, %rdi
   call    _cs411println
_L_276:
   movq    $39, %rsi
   movq    t655, %rdi
   call    _BS_Search
   movq    %rax, t733
   cmpq    $0, t733
   je      _L_278
_L_277:
   movq    $1, %rdi
   call    _cs411println
_L_279:
   movq    $50, %rsi
   movq    t655, %rdi
   call    _BS_Search
   movq    %rax, t734
   cmpq    $0, t734
   je      _L_281
_L_280:
   movq    $1, %rdi
   call    _cs411println
_L_282:
   movq    $999, %rax
_bail_258:
   movq    t659, %rbx
   movq    t660, %r12
   movq    t661, %r13
   movq    t662, %r14
   movq    t663, %r15
   jmp     _DONE_326
_L_260:
   movq    $0, %rdi
   call    _cs411println
   jmp     _L_261
_L_263:
   movq    $0, %rdi
   call    _cs411println
   jmp     _L_264
_L_266:
   movq    $0, %rdi
   call    _cs411println
   jmp     _L_267
_L_269:
   movq    $0, %rdi
   call    _cs411println
   jmp     _L_270
_L_272:
   movq    $0, %rdi
   call    _cs411println
   jmp     _L_273
_L_275:
   movq    $0, %rdi
   call    _cs411println
   jmp     _L_276
_L_278:
   movq    $0, %rdi
   call    _cs411println
   jmp     _L_279
_L_281:
   movq    $0, %rdi
   call    _cs411println
   jmp     _L_282
_DONE_326:
   # return sink
   addq   $8, %rsp
   ret

.globl _BS_Search
_BS_Search:
   subq   $8, %rsp
_L_327:
   movq    %rbx, t675
   movq    %r12, t676
   movq    %r13, t677
   movq    %r14, t678
   movq    %r15, t679
   movq    %rdi, t664
   movq    %rsi, t665
   movq    $0, t671
   movq    $0, t666
   movq    (t664), t740
   movq    t740, t739
   movq    $8, t741
   subq    t741, t739
   movq    (t739), t738
   movq    t738, t667
   movq    t667, t742
   movq    $1, t743
   subq    t743, t742
   movq    t742, t667
   movq    $0, t668
   movq    $1, t669
_looptest_286:
   cmpq    $0, t669
   je      _loopend_284
_loopbody_285:
   movq    t668, t744
   addq    t667, t744
   movq    t744, t670
   movq    t670, %rsi
   movq    t664, %rdi
   call    _BS_Div
   movq    %rax, t670
   movq    t670, t674
   movq    t674, t735
   movq    (t664), t745
   movq    t745, t673
   movq    t673, t747
   movq    $8, t748
   subq    t748, t747
   movq    (t747), t746
   cmpq    t746, t735
   jae     _boundsbad_288
_boundsok_287:
   movq    t673, t750
   movq    t674, t751
   movq    $8, t752
   imulq   t752, t751
   addq    t751, t750
   movq    (t750), t749
   movq    t749, t671
   cmpq    t671, t665
   jge     _L_290
_L_289:
   movq    t670, t753
   movq    $1, t754
   subq    t754, t753
   movq    t753, t667
_L_291:
   movq    t665, %rdx
   movq    t671, %rsi
   movq    t664, %rdi
   call    _BS_Compare
   movq    %rax, t736
   cmpq    $0, t736
   je      _L_293
_L_292:
   movq    $0, t669
_L_294:
   cmpq    t668, t667
   jge     _L_296
_L_295:
   movq    $0, t669
_L_297:
   jmp     _looptest_286
_boundsbad_288:
   movq    $1, %rdi
   call    _cs411error
_bail_283:
   movq    t675, %rbx
   movq    t676, %r12
   movq    t677, %r13
   movq    t678, %r14
   movq    t679, %r15
   jmp     _DONE_328
_L_290:
   movq    t670, t755
   movq    $1, t756
   addq    t756, t755
   movq    t755, t668
   jmp     _L_291
_L_293:
   movq    $1, t669
   jmp     _L_294
_L_296:
   movq    $0, t672
   jmp     _L_297
_loopend_284:
   movq    t665, %rdx
   movq    t671, %rsi
   movq    t664, %rdi
   call    _BS_Compare
   movq    %rax, t737
   cmpq    $0, t737
   je      _L_299
_L_298:
   movq    $1, t666
_L_300:
   movq    t666, %rax
   jmp     _bail_283
_L_299:
   movq    $0, t666
   jmp     _L_300
_DONE_328:
   # return sink
   addq   $8, %rsp
   ret

.globl _BS_Div
_BS_Div:
_L_329:
   movq    %rbx, t685
   movq    %r12, t686
   movq    %r13, t687
   movq    %r14, t688
   movq    %r15, t689
   movq    %rdi, t680
   movq    %rsi, t681
   movq    $0, t682
   movq    $0, t683
   movq    t681, t757
   movq    $1, t758
   subq    t758, t757
   movq    t757, t684
_looptest_304:
   cmpq    t684, t683
   jge     _loopend_302
_loopbody_303:
   movq    t682, t759
   movq    $1, t760
   addq    t760, t759
   movq    t759, t682
   movq    t683, t761
   movq    $2, t762
   addq    t762, t761
   movq    t761, t683
   jmp     _looptest_304
_loopend_302:
   movq    t682, %rax
_bail_301:
   movq    t685, %rbx
   movq    t686, %r12
   movq    t687, %r13
   movq    t688, %r14
   movq    t689, %r15
_DONE_330:
   # return sink
   ret

.globl _BS_Compare
_BS_Compare:
_L_331:
   movq    %rbx, t695
   movq    %r12, t696
   movq    %r13, t697
   movq    %r14, t698
   movq    %r15, t699
   movq    %rdi, t690
   movq    %rsi, t691
   movq    %rdx, t692
   movq    $0, t693
   movq    t692, t763
   movq    $1, t764
   addq    t764, t763
   movq    t763, t694
   cmpq    t692, t691
   jge     _L_307
_L_306:
   movq    $0, t693
_L_308:
   movq    t693, %rax
_bail_305:
   movq    t695, %rbx
   movq    t696, %r12
   movq    t697, %r13
   movq    t698, %r14
   movq    t699, %r15
   jmp     _DONE_332
_L_307:
   cmpq    t694, t691
   jge     _L_309
_L_310:
   movq    $1, t693
_L_311:
   jmp     _L_308
_L_309:
   movq    $0, t693
   jmp     _L_311
_DONE_332:
   # return sink
   ret

.globl _BS_Print
_BS_Print:
   subq   $8, %rsp
_L_333:
   movq    %rbx, t704
   movq    %r12, t705
   movq    %r13, t706
   movq    %r14, t707
   movq    %r15, t708
   movq    %rdi, t700
   movq    $1, t701
_looptest_315:
   movq    t700, t767
   movq    $8, t768
   addq    t768, t767
   movq    (t767), t766
   cmpq    t766, t701
   jge     _loopend_313
_loopbody_314:
   movq    t701, t703
   movq    t703, t765
   movq    (t700), t769
   movq    t769, t702
   movq    t702, t771
   movq    $8, t772
   subq    t772, t771
   movq    (t771), t770
   cmpq    t770, t765
   jae     _boundsbad_317
_boundsok_316:
   movq    t702, t774
   movq    t703, t775
   movq    $8, t776
   imulq   t776, t775
   addq    t775, t774
   movq    (t774), t773
   movq    t773, %rdi
   call    _cs411println
   movq    t701, t777
   movq    $1, t778
   addq    t778, t777
   movq    t777, t701
   jmp     _looptest_315
_boundsbad_317:
   movq    $1, %rdi
   call    _cs411error
_bail_312:
   movq    t704, %rbx
   movq    t705, %r12
   movq    t706, %r13
   movq    t707, %r14
   movq    t708, %r15
   jmp     _DONE_334
_loopend_313:
   movq    $99999, %rdi
   call    _cs411println
   movq    $0, %rax
   jmp     _bail_312
_DONE_334:
   # return sink
   addq   $8, %rsp
   ret

.globl _BS_Init
_BS_Init:
   subq   $8, %rsp
_L_335:
   movq    %rbx, t717
   movq    %r12, t718
   movq    %r13, t719
   movq    %r14, t720
   movq    %r15, t721
   movq    %rdi, t709
   movq    %rsi, t710
   movq    t709, t782
   movq    $8, t783
   addq    t783, t782
   movq    t710, (t782)
   movq    t709, t780
   movq    t710, %rdi
   call    _cs411newarray
   movq    %rax, t779
   movq    t779, (t780)
   movq    $1, t711
   movq    t709, t786
   movq    $8, t787
   addq    t787, t786
   movq    (t786), t785
   movq    t785, t784
   movq    $1, t788
   addq    t788, t784
   movq    t784, t712
_looptest_321:
   movq    t709, t790
   movq    $8, t791
   addq    t791, t790
   movq    (t790), t789
   cmpq    t789, t711
   jge     _loopend_319
_loopbody_320:
   movq    $2, t793
   movq    t793, t792
   imulq   t711, t792
   movq    t792, t714
   movq    t712, t794
   movq    $3, t795
   subq    t795, t794
   movq    t794, t713
   movq    t711, t716
   movq    t716, t781
   movq    (t709), t796
   movq    t796, t715
   movq    t715, t798
   movq    $8, t799
   subq    t799, t798
   movq    (t798), t797
   cmpq    t797, t781
   jae     _boundsbad_323
_boundsok_322:
   movq    t715, t800
   movq    t716, t801
   movq    $8, t802
   imulq   t802, t801
   addq    t801, t800
   movq    t714, t803
   addq    t713, t803
   movq    t803, (t800)
   movq    t711, t804
   movq    $1, t805
   addq    t805, t804
   movq    t804, t711
   movq    t712, t806
   movq    $1, t807
   subq    t807, t806
   movq    t806, t712
   jmp     _looptest_321
_boundsbad_323:
   movq    $1, %rdi
   call    _cs411error
_bail_318:
   movq    t717, %rbx
   movq    t718, %r12
   movq    t719, %r13
   movq    t720, %r14
   movq    t721, %r15
   jmp     _DONE_336
_loopend_319:
   movq    $0, %rax
   jmp     _bail_318
_DONE_336:
   # return sink
   addq   $8, %rsp
   ret

.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_337:
   movq    %rbx, t722
   movq    %r12, t723
   movq    %r13, t724
   movq    %r14, t725
   movq    %r15, t726
   movq    $16, %rdi
   call    _cs411newobject
   movq    %rax, t809
   movq    $20, %rsi
   movq    t809, %rdi
   call    _BS_Start
   movq    %rax, t808
   movq    t808, %rdi
   call    _cs411println
_bail_324:
   movq    t722, %rbx
   movq    t723, %r12
   movq    t724, %r13
   movq    t725, %r14
   movq    t726, %r15
_DONE_338:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
