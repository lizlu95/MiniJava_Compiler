   .text
.globl _cs411main
_cs411main:
   pushq  %rbp
   movq   %rsp, %rbp
_L_312:
   movq    %rbx, t747
   movq    %r12, t748
   movq    %r13, t749
   movq    %r14, t750
   movq    %r15, t751
   movq    $0, t960
   movq    t960, %rdi
   call    _cs411newobject
   movq    %rax, t926
   movq    t926, %rdi
   call    _BT_Start
   movq    %rax, t925
   movq    t925, %rdi
   call    _cs411println
   movq    t747, %rbx
   movq    t748, %r12
   movq    t749, %r13
   movq    t750, %r14
   movq    t751, %r15
_DONE_313:
   #return sink
   leave
   ret

.globl _BT_Start
_BT_Start:
   pushq  %rbp
   movq   %rsp, %rbp
_L_314:
   movq    %rdi, t752
   movq    %rbx, t756
   movq    %r12, t757
   movq    %r13, t758
   movq    %r14, t759
   movq    %r15, t760
   movq    $48, t961
   movq    t961, %rdi
   call    _cs411newobject
   movq    %rax, t753
   movq    $16, t962
   movq    t962, %rsi
   movq    t753, %rdi
   call    _Tree_Init
   movq    %rax, t754
   movq    t753, %rdi
   call    _Tree_Print
   movq    %rax, t754
   movq    $100000000, t963
   movq    t963, %rdi
   call    _cs411println
   movq    $8, t964
   movq    t964, %rsi
   movq    t753, %rdi
   call    _Tree_Insert
   movq    %rax, t754
   movq    t753, %rdi
   call    _Tree_Print
   movq    %rax, t754
   movq    $24, t965
   movq    t965, %rsi
   movq    t753, %rdi
   call    _Tree_Insert
   movq    %rax, t754
   movq    $4, t966
   movq    t966, %rsi
   movq    t753, %rdi
   call    _Tree_Insert
   movq    %rax, t754
   movq    $12, t967
   movq    t967, %rsi
   movq    t753, %rdi
   call    _Tree_Insert
   movq    %rax, t754
   movq    $20, t968
   movq    t968, %rsi
   movq    t753, %rdi
   call    _Tree_Insert
   movq    %rax, t754
   movq    $28, t969
   movq    t969, %rsi
   movq    t753, %rdi
   call    _Tree_Insert
   movq    %rax, t754
   movq    $14, t970
   movq    t970, %rsi
   movq    t753, %rdi
   call    _Tree_Insert
   movq    %rax, t754
   movq    t753, %rdi
   call    _Tree_Print
   movq    %rax, t754
   movq    $24, t971
   movq    t971, %rsi
   movq    t753, %rdi
   call    _Tree_Search
   movq    %rax, t927
   movq    t927, %rdi
   call    _cs411println
   movq    $12, t972
   movq    t972, %rsi
   movq    t753, %rdi
   call    _Tree_Search
   movq    %rax, t928
   movq    t928, %rdi
   call    _cs411println
   movq    $16, t973
   movq    t973, %rsi
   movq    t753, %rdi
   call    _Tree_Search
   movq    %rax, t929
   movq    t929, %rdi
   call    _cs411println
   movq    $50, t974
   movq    t974, %rsi
   movq    t753, %rdi
   call    _Tree_Search
   movq    %rax, t930
   movq    t930, %rdi
   call    _cs411println
   movq    $12, t975
   movq    t975, %rsi
   movq    t753, %rdi
   call    _Tree_Search
   movq    %rax, t931
   movq    t931, %rdi
   call    _cs411println
   movq    $12, t976
   movq    t976, %rsi
   movq    t753, %rdi
   call    _Tree_Delete
   movq    %rax, t754
   movq    t753, %rdi
   call    _Tree_Print
   movq    %rax, t754
   movq    $12, t977
   movq    t977, %rsi
   movq    t753, %rdi
   call    _Tree_Search
   movq    %rax, t932
   movq    t932, %rdi
   call    _cs411println
   movq    $0, t978
   movq    t978, %rax
   movq    t756, %rbx
   movq    t757, %r12
   movq    t758, %r13
   movq    t759, %r14
   movq    t760, %r15
_DONE_315:
   #return sink
   leave
   ret

.globl _Tree_Init
_Tree_Init:
   pushq  %rbp
   movq   %rsp, %rbp
_L_316:
   movq    %rdi, t761
   movq    %rsi, t762
   movq    %rbx, t763
   movq    %r12, t764
   movq    %r13, t765
   movq    %r14, t766
   movq    %r15, t767
   movq    t762, 16(t761)
   movq    $0, t979
   movq    t979, 24(t761)
   movq    $0, t980
   movq    t980, 32(t761)
   movq    $1, t981
   movq    t981, %rax
   movq    t763, %rbx
   movq    t764, %r12
   movq    t765, %r13
   movq    t766, %r14
   movq    t767, %r15
_DONE_317:
   #return sink
   leave
   ret

.globl _Tree_SetRight
_Tree_SetRight:
   pushq  %rbp
   movq   %rsp, %rbp
_L_318:
   movq    %rdi, t768
   movq    %rsi, t769
   movq    %rbx, t770
   movq    %r12, t771
   movq    %r13, t772
   movq    %r14, t773
   movq    %r15, t774
   movq    t769, 8(t768)
   movq    $1, t982
   movq    t982, %rax
   movq    t770, %rbx
   movq    t771, %r12
   movq    t772, %r13
   movq    t773, %r14
   movq    t774, %r15
_DONE_319:
   #return sink
   leave
   ret

.globl _Tree_SetLeft
_Tree_SetLeft:
   pushq  %rbp
   movq   %rsp, %rbp
_L_320:
   movq    %rdi, t775
   movq    %rsi, t776
   movq    %rbx, t777
   movq    %r12, t778
   movq    %r13, t779
   movq    %r14, t780
   movq    %r15, t781
   movq    t776, (t775)
   movq    $1, t983
   movq    t983, %rax
   movq    t777, %rbx
   movq    t778, %r12
   movq    t779, %r13
   movq    t780, %r14
   movq    t781, %r15
_DONE_321:
   #return sink
   leave
   ret

.globl _Tree_GetRight
_Tree_GetRight:
   pushq  %rbp
   movq   %rsp, %rbp
_L_322:
   movq    %rdi, t782
   movq    %rbx, t783
   movq    %r12, t784
   movq    %r13, t785
   movq    %r14, t786
   movq    %r15, t787
   movq    8(t782), t984
   movq    t984, %rax
   movq    t783, %rbx
   movq    t784, %r12
   movq    t785, %r13
   movq    t786, %r14
   movq    t787, %r15
_DONE_323:
   #return sink
   leave
   ret

.globl _Tree_GetLeft
_Tree_GetLeft:
   pushq  %rbp
   movq   %rsp, %rbp
_L_324:
   movq    %rdi, t788
   movq    %rbx, t789
   movq    %r12, t790
   movq    %r13, t791
   movq    %r14, t792
   movq    %r15, t793
   movq    (t788), t985
   movq    t985, %rax
   movq    t789, %rbx
   movq    t790, %r12
   movq    t791, %r13
   movq    t792, %r14
   movq    t793, %r15
_DONE_325:
   #return sink
   leave
   ret

.globl _Tree_GetKey
_Tree_GetKey:
   pushq  %rbp
   movq   %rsp, %rbp
_L_326:
   movq    %rdi, t794
   movq    %rbx, t795
   movq    %r12, t796
   movq    %r13, t797
   movq    %r14, t798
   movq    %r15, t799
   movq    16(t794), t986
   movq    t986, %rax
   movq    t795, %rbx
   movq    t796, %r12
   movq    t797, %r13
   movq    t798, %r14
   movq    t799, %r15
_DONE_327:
   #return sink
   leave
   ret

.globl _Tree_SetKey
_Tree_SetKey:
   pushq  %rbp
   movq   %rsp, %rbp
_L_328:
   movq    %rdi, t800
   movq    %rsi, t801
   movq    %rbx, t802
   movq    %r12, t803
   movq    %r13, t804
   movq    %r14, t805
   movq    %r15, t806
   movq    t801, 16(t800)
   movq    $1, t987
   movq    t987, %rax
   movq    t802, %rbx
   movq    t803, %r12
   movq    t804, %r13
   movq    t805, %r14
   movq    t806, %r15
_DONE_329:
   #return sink
   leave
   ret

.globl _Tree_GetHas_Right
_Tree_GetHas_Right:
   pushq  %rbp
   movq   %rsp, %rbp
_L_330:
   movq    %rdi, t807
   movq    %rbx, t808
   movq    %r12, t809
   movq    %r13, t810
   movq    %r14, t811
   movq    %r15, t812
   movq    32(t807), t988
   movq    t988, %rax
   movq    t808, %rbx
   movq    t809, %r12
   movq    t810, %r13
   movq    t811, %r14
   movq    t812, %r15
_DONE_331:
   #return sink
   leave
   ret

.globl _Tree_GetHas_Left
_Tree_GetHas_Left:
   pushq  %rbp
   movq   %rsp, %rbp
_L_332:
   movq    %rdi, t813
   movq    %rbx, t814
   movq    %r12, t815
   movq    %r13, t816
   movq    %r14, t817
   movq    %r15, t818
   movq    24(t813), t989
   movq    t989, %rax
   movq    t814, %rbx
   movq    t815, %r12
   movq    t816, %r13
   movq    t817, %r14
   movq    t818, %r15
_DONE_333:
   #return sink
   leave
   ret

.globl _Tree_SetHas_Left
_Tree_SetHas_Left:
   pushq  %rbp
   movq   %rsp, %rbp
_L_334:
   movq    %rdi, t819
   movq    %rsi, t820
   movq    %rbx, t821
   movq    %r12, t822
   movq    %r13, t823
   movq    %r14, t824
   movq    %r15, t825
   movq    t820, 24(t819)
   movq    $1, t990
   movq    t990, %rax
   movq    t821, %rbx
   movq    t822, %r12
   movq    t823, %r13
   movq    t824, %r14
   movq    t825, %r15
_DONE_335:
   #return sink
   leave
   ret

.globl _Tree_SetHas_Right
_Tree_SetHas_Right:
   pushq  %rbp
   movq   %rsp, %rbp
_L_336:
   movq    %rdi, t826
   movq    %rsi, t827
   movq    %rbx, t828
   movq    %r12, t829
   movq    %r13, t830
   movq    %r14, t831
   movq    %r15, t832
   movq    t827, 32(t826)
   movq    $1, t991
   movq    t991, %rax
   movq    t828, %rbx
   movq    t829, %r12
   movq    t830, %r13
   movq    t831, %r14
   movq    t832, %r15
_DONE_337:
   #return sink
   leave
   ret

.globl _Tree_Compare
_Tree_Compare:
   pushq  %rbp
   movq   %rsp, %rbp
_L_338:
   movq    %rdi, t833
   movq    %rsi, t834
   movq    %rdx, t835
   movq    %rbx, t838
   movq    %r12, t839
   movq    %r13, t840
   movq    %r14, t841
   movq    %r15, t842
   movq    $0, t992
   movq    t992, t836
   movq    t835, t993
   incq    t993
   movq    t993, t837
   cmpq    t835, t834
   jl      _L_236
_L_237:
   cmpq    t837, t834
   jl      _L_240
_L_239:
   movq    $0, t994
   movq    t994, t836
_L_241:
_L_238:
   movq    t836, %rax
   movq    t838, %rbx
   movq    t839, %r12
   movq    t840, %r13
   movq    t841, %r14
   movq    t842, %r15
   jmp     _DONE_339
_L_236:
   movq    $0, t995
   movq    t995, t836
   jmp     _L_238
_L_240:
   movq    $1, t996
   movq    t996, t836
   jmp     _L_241
_DONE_339:
   #return sink
   leave
   ret

.globl _Tree_Insert
_Tree_Insert:
   pushq  %rbp
   movq   %rsp, %rbp
_L_340:
   movq    %rdi, t843
   movq    %rsi, t844
   movq    %rbx, t850
   movq    %r12, t851
   movq    %r13, t852
   movq    %r14, t853
   movq    %r15, t854
   movq    $48, t997
   movq    t997, %rdi
   call    _cs411newobject
   movq    %rax, t845
   movq    t844, %rsi
   movq    t845, %rdi
   call    _Tree_Init
   movq    %rax, t846
   movq    t843, t849
   movq    $1, t998
   movq    t998, t847
_L_244:
   movq    $0, t999
   cmpq    t999, t847
   jne     _L_243
_L_242:
   movq    $1, t1000
   movq    t1000, %rax
   movq    t850, %rbx
   movq    t851, %r12
   movq    t852, %r13
   movq    t853, %r14
   movq    t854, %r15
   jmp     _DONE_341
_L_243:
   movq    t849, %rdi
   call    _Tree_GetKey
   movq    %rax, t848
   cmpq    t848, t844
   jl      _L_245
_L_246:
   movq    t849, %rdi
   call    _Tree_GetHas_Right
   movq    %rax, t934
   movq    $0, t1001
   cmpq    t1001, t934
   jne     _L_251
_L_252:
   movq    $0, t1002
   movq    t1002, t847
   movq    $1, t1003
   movq    t1003, %rsi
   movq    t849, %rdi
   call    _Tree_SetHas_Right
   movq    %rax, t846
   movq    t845, %rsi
   movq    t849, %rdi
   call    _Tree_SetRight
   movq    %rax, t846
_L_253:
_L_247:
   jmp     _L_244
_L_245:
   movq    t849, %rdi
   call    _Tree_GetHas_Left
   movq    %rax, t933
   movq    $0, t1004
   cmpq    t1004, t933
   jne     _L_248
_L_249:
   movq    $0, t1005
   movq    t1005, t847
   movq    $1, t1006
   movq    t1006, %rsi
   movq    t849, %rdi
   call    _Tree_SetHas_Left
   movq    %rax, t846
   movq    t845, %rsi
   movq    t849, %rdi
   call    _Tree_SetLeft
   movq    %rax, t846
_L_250:
   jmp     _L_247
_L_248:
   movq    t849, %rdi
   call    _Tree_GetLeft
   movq    %rax, t849
   jmp     _L_250
_L_251:
   movq    t849, %rdi
   call    _Tree_GetRight
   movq    %rax, t849
   jmp     _L_253
_DONE_341:
   #return sink
   leave
   ret

.globl _Tree_Delete
_Tree_Delete:
   pushq  %rbp
   movq   %rsp, %rbp
_L_342:
   movq    %rdi, t855
   movq    %rsi, t856
   movq    %rbx, t864
   movq    %r12, t865
   movq    %r13, t866
   movq    %r14, t867
   movq    %r15, t868
   movq    t855, t857
   movq    t855, t858
   movq    $1, t1007
   movq    t1007, t859
   movq    $0, t1008
   movq    t1008, t860
   movq    $1, t1009
   movq    t1009, t861
_L_256:
   movq    $0, t1010
   cmpq    t1010, t859
   jne     _L_255
_L_254:
   movq    t860, %rax
   movq    t864, %rbx
   movq    t865, %r12
   movq    t866, %r13
   movq    t867, %r14
   movq    t868, %r15
   jmp     _DONE_343
_L_255:
   movq    t857, %rdi
   call    _Tree_GetKey
   movq    %rax, t862
   cmpq    t862, t856
   jl      _L_257
_L_258:
   cmpq    t856, t862
   jl      _L_263
_L_264:
   movq    $0, t1011
   cmpq    t1011, t861
   jne     _L_269
_L_270:
   movq    t857, %rdx
   movq    t858, %rsi
   movq    t855, %rdi
   call    _Tree_Remove
   movq    %rax, t863
_L_271:
   movq    $1, t1012
   movq    t1012, t860
   movq    $0, t1013
   movq    t1013, t859
_L_265:
_L_259:
   movq    $0, t1014
   movq    t1014, t861
   jmp     _L_256
_L_257:
   movq    t857, %rdi
   call    _Tree_GetHas_Left
   movq    %rax, t935
   movq    $0, t1015
   cmpq    t1015, t935
   jne     _L_260
_L_261:
   movq    $0, t1016
   movq    t1016, t859
_L_262:
   jmp     _L_259
_L_260:
   movq    t857, t858
   movq    t857, %rdi
   call    _Tree_GetLeft
   movq    %rax, t857
   jmp     _L_262
_L_263:
   movq    t857, %rdi
   call    _Tree_GetHas_Right
   movq    %rax, t936
   movq    $0, t1017
   cmpq    t1017, t936
   jne     _L_266
_L_267:
   movq    $0, t1018
   movq    t1018, t859
_L_268:
   jmp     _L_265
_L_266:
   movq    t857, t858
   movq    t857, %rdi
   call    _Tree_GetRight
   movq    %rax, t857
   jmp     _L_268
_L_269:
   movq    t857, %rdi
   call    _Tree_GetHas_Right
   movq    %rax, t937
   movq    $0, t1019
   cmpq    t1019, t937
   jne     _L_273
_L_275:
   movq    t857, %rdi
   call    _Tree_GetHas_Left
   movq    %rax, t938
   movq    $0, t1020
   cmpq    t1020, t938
   jne     _L_273
_L_272:
   movq    $1, t1021
   movq    t1021, t863
_L_274:
   jmp     _L_271
_L_273:
   movq    t857, %rdx
   movq    t858, %rsi
   movq    t855, %rdi
   call    _Tree_Remove
   movq    %rax, t863
   jmp     _L_274
_DONE_343:
   #return sink
   leave
   ret

.globl _Tree_Remove
_Tree_Remove:
   pushq  %rbp
   movq   %rsp, %rbp
_L_344:
   movq    %rdi, t869
   movq    %rsi, t870
   movq    %rdx, t871
   movq    %rbx, t875
   movq    %r12, t876
   movq    %r13, t877
   movq    %r14, t878
   movq    %r15, t879
   movq    t871, %rdi
   call    _Tree_GetHas_Left
   movq    %rax, t939
   movq    $0, t1022
   cmpq    t1022, t939
   jne     _L_276
_L_277:
   movq    t871, %rdi
   call    _Tree_GetHas_Right
   movq    %rax, t940
   movq    $0, t1023
   cmpq    t1023, t940
   jne     _L_279
_L_280:
   movq    t871, %rdi
   call    _Tree_GetKey
   movq    %rax, t873
   movq    t870, %rdi
   call    _Tree_GetLeft
   movq    %rax, t941
   movq    t941, %rdi
   call    _Tree_GetKey
   movq    %rax, t874
   movq    t874, %rdx
   movq    t873, %rsi
   movq    t869, %rdi
   call    _Tree_Compare
   movq    %rax, t942
   movq    $0, t1024
   cmpq    t1024, t942
   jne     _L_282
_L_283:
   movq    40(t869), t1025
   movq    t1025, %rsi
   movq    t870, %rdi
   call    _Tree_SetRight
   movq    %rax, t872
   movq    $0, t1026
   movq    t1026, %rsi
   movq    t870, %rdi
   call    _Tree_SetHas_Right
   movq    %rax, t872
_L_284:
_L_281:
_L_278:
   movq    $1, t1027
   movq    t1027, %rax
   movq    t875, %rbx
   movq    t876, %r12
   movq    t877, %r13
   movq    t878, %r14
   movq    t879, %r15
   jmp     _DONE_345
_L_276:
   movq    t871, %rdx
   movq    t870, %rsi
   movq    t869, %rdi
   call    _Tree_RemoveLeft
   movq    %rax, t872
   jmp     _L_278
_L_279:
   movq    t871, %rdx
   movq    t870, %rsi
   movq    t869, %rdi
   call    _Tree_RemoveRight
   movq    %rax, t872
   jmp     _L_281
_L_282:
   movq    40(t869), t1028
   movq    t1028, %rsi
   movq    t870, %rdi
   call    _Tree_SetLeft
   movq    %rax, t872
   movq    $0, t1029
   movq    t1029, %rsi
   movq    t870, %rdi
   call    _Tree_SetHas_Left
   movq    %rax, t872
   jmp     _L_284
_DONE_345:
   #return sink
   leave
   ret

.globl _Tree_RemoveRight
_Tree_RemoveRight:
   pushq  %rbp
   movq   %rsp, %rbp
_L_346:
   movq    %rdi, t880
   movq    %rsi, t881
   movq    %rdx, t882
   movq    %rbx, t884
   movq    %r12, t885
   movq    %r13, t886
   movq    %r14, t887
   movq    %r15, t888
_L_287:
   movq    t882, %rdi
   call    _Tree_GetHas_Right
   movq    %rax, t943
   movq    $0, t1030
   cmpq    t1030, t943
   jne     _L_286
_L_285:
   movq    40(t880), t1031
   movq    t1031, %rsi
   movq    t881, %rdi
   call    _Tree_SetRight
   movq    %rax, t883
   movq    $0, t1032
   movq    t1032, %rsi
   movq    t881, %rdi
   call    _Tree_SetHas_Right
   movq    %rax, t883
   movq    $1, t1033
   movq    t1033, %rax
   movq    t884, %rbx
   movq    t885, %r12
   movq    t886, %r13
   movq    t887, %r14
   movq    t888, %r15
   jmp     _DONE_347
_L_286:
   movq    t882, t946
   movq    t882, %rdi
   call    _Tree_GetRight
   movq    %rax, t945
   movq    t945, %rdi
   call    _Tree_GetKey
   movq    %rax, t944
   movq    t944, %rsi
   movq    t946, %rdi
   call    _Tree_SetKey
   movq    %rax, t883
   movq    t882, t881
   movq    t882, %rdi
   call    _Tree_GetRight
   movq    %rax, t882
   jmp     _L_287
_DONE_347:
   #return sink
   leave
   ret

.globl _Tree_RemoveLeft
_Tree_RemoveLeft:
   pushq  %rbp
   movq   %rsp, %rbp
_L_348:
   movq    %rdi, t889
   movq    %rsi, t890
   movq    %rdx, t891
   movq    %rbx, t893
   movq    %r12, t894
   movq    %r13, t895
   movq    %r14, t896
   movq    %r15, t897
_L_290:
   movq    t891, %rdi
   call    _Tree_GetHas_Left
   movq    %rax, t947
   movq    $0, t1034
   cmpq    t1034, t947
   jne     _L_289
_L_288:
   movq    40(t889), t1035
   movq    t1035, %rsi
   movq    t890, %rdi
   call    _Tree_SetLeft
   movq    %rax, t892
   movq    $0, t1036
   movq    t1036, %rsi
   movq    t890, %rdi
   call    _Tree_SetHas_Left
   movq    %rax, t892
   movq    $1, t1037
   movq    t1037, %rax
   movq    t893, %rbx
   movq    t894, %r12
   movq    t895, %r13
   movq    t896, %r14
   movq    t897, %r15
   jmp     _DONE_349
_L_289:
   movq    t891, t950
   movq    t891, %rdi
   call    _Tree_GetLeft
   movq    %rax, t949
   movq    t949, %rdi
   call    _Tree_GetKey
   movq    %rax, t948
   movq    t948, %rsi
   movq    t950, %rdi
   call    _Tree_SetKey
   movq    %rax, t892
   movq    t891, t890
   movq    t891, %rdi
   call    _Tree_GetLeft
   movq    %rax, t891
   jmp     _L_290
_DONE_349:
   #return sink
   leave
   ret

.globl _Tree_Search
_Tree_Search:
   pushq  %rbp
   movq   %rsp, %rbp
_L_350:
   movq    %rdi, t898
   movq    %rsi, t899
   movq    %rbx, t904
   movq    %r12, t905
   movq    %r13, t906
   movq    %r14, t907
   movq    %r15, t908
   movq    t898, t902
   movq    $1, t1038
   movq    t1038, t900
   movq    $0, t1039
   movq    t1039, t901
_L_293:
   movq    $0, t1040
   cmpq    t1040, t900
   jne     _L_292
_L_291:
   movq    t901, %rax
   movq    t904, %rbx
   movq    t905, %r12
   movq    t906, %r13
   movq    t907, %r14
   movq    t908, %r15
   jmp     _DONE_351
_L_292:
   movq    t902, %rdi
   call    _Tree_GetKey
   movq    %rax, t903
   cmpq    t903, t899
   jl      _L_294
_L_295:
   cmpq    t899, t903
   jl      _L_300
_L_301:
   movq    $1, t1041
   movq    t1041, t901
   movq    $0, t1042
   movq    t1042, t900
_L_302:
_L_296:
   jmp     _L_293
_L_294:
   movq    t902, %rdi
   call    _Tree_GetHas_Left
   movq    %rax, t951
   movq    $0, t1043
   cmpq    t1043, t951
   jne     _L_297
_L_298:
   movq    $0, t1044
   movq    t1044, t900
_L_299:
   jmp     _L_296
_L_297:
   movq    t902, %rdi
   call    _Tree_GetLeft
   movq    %rax, t902
   jmp     _L_299
_L_300:
   movq    t902, %rdi
   call    _Tree_GetHas_Right
   movq    %rax, t952
   movq    $0, t1045
   cmpq    t1045, t952
   jne     _L_303
_L_304:
   movq    $0, t1046
   movq    t1046, t900
_L_305:
   jmp     _L_302
_L_303:
   movq    t902, %rdi
   call    _Tree_GetRight
   movq    %rax, t902
   jmp     _L_305
_DONE_351:
   #return sink
   leave
   ret

.globl _Tree_Print
_Tree_Print:
   pushq  %rbp
   movq   %rsp, %rbp
_L_352:
   movq    %rdi, t909
   movq    %rbx, t912
   movq    %r12, t913
   movq    %r13, t914
   movq    %r14, t915
   movq    %r15, t916
   movq    t909, t910
   movq    t910, %rsi
   movq    t909, %rdi
   call    _Tree_RecPrint
   movq    %rax, t911
   movq    $1, t1047
   movq    t1047, %rax
   movq    t912, %rbx
   movq    t913, %r12
   movq    t914, %r13
   movq    t915, %r14
   movq    t916, %r15
_DONE_353:
   #return sink
   leave
   ret

.globl _Tree_RecPrint
_Tree_RecPrint:
   pushq  %rbp
   movq   %rsp, %rbp
_L_354:
   movq    %rdi, t917
   movq    %rsi, t918
   movq    %rbx, t920
   movq    %r12, t921
   movq    %r13, t922
   movq    %r14, t923
   movq    %r15, t924
   movq    t918, %rdi
   call    _Tree_GetHas_Left
   movq    %rax, t953
   movq    $0, t1048
   cmpq    t1048, t953
   jne     _L_306
_L_307:
   movq    $1, t1049
   movq    t1049, t919
_L_308:
   movq    t918, %rdi
   call    _Tree_GetKey
   movq    %rax, t956
   movq    t956, %rdi
   call    _cs411println
   movq    t918, %rdi
   call    _Tree_GetHas_Right
   movq    %rax, t957
   movq    $0, t1050
   cmpq    t1050, t957
   jne     _L_309
_L_310:
   movq    $1, t1051
   movq    t1051, t919
_L_311:
   movq    $1, t1052
   movq    t1052, %rax
   movq    t920, %rbx
   movq    t921, %r12
   movq    t922, %r13
   movq    t923, %r14
   movq    t924, %r15
   jmp     _DONE_355
_L_306:
   movq    t917, t955
   movq    t918, %rdi
   call    _Tree_GetLeft
   movq    %rax, t954
   movq    t954, %rsi
   movq    t955, %rdi
   call    _Tree_RecPrint
   movq    %rax, t919
   jmp     _L_308
_L_309:
   movq    t917, t959
   movq    t918, %rdi
   call    _Tree_GetRight
   movq    %rax, t958
   movq    t958, %rsi
   movq    t959, %rdi
   call    _Tree_RecPrint
   movq    %rax, t919
   jmp     _L_311
_DONE_355:
   #return sink
   leave
   ret

   .ident	"minijavac: cs411 course project 2011w2"
