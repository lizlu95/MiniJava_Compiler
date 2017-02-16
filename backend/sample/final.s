.text
.globl _O_m
_O_m:
_L_10:
   movq    %rbx, %rsp/*t003*/
   movq    %r12, %rsp/*t004*/
   movq    %r13, %rsp/*t005*/
   movq    %r14, %rsp/*t006*/
   movq    %r15, %rsp/*t007*/
   movq    %rdi, %rsp/*t000*/
   movq    %rsi, %rsp/*t001*/
   movq    %rdx, %rsp/*t002*/
   movq    $3, %rsp/*t023*/
   movq    %rsp/*t023*/, %rax
_bail_1:
   movq    %rsp/*t003*/, %rbx
   movq    %rsp/*t004*/, %r12
   movq    %rsp/*t005*/, %r13
   movq    %rsp/*t006*/, %r14
   movq    %rsp/*t007*/, %r15
_DONE_11:
   # return sink
   ret

.text
.globl _Test_do
_Test_do:
   subq   $8, %rsp
_L_12:
   movq    %rbx, %rsp/*t013*/
   movq    %r12, %rsp/*t014*/
   movq    %r13, %rsp/*t015*/
   movq    %r14, %rsp/*t016*/
   movq    %r15, %rsp/*t017*/
   movq    %rdi, %rsp/*t008*/
   xorq    %rsp/*t026*/, %rsp/*t026*/
   # movq    %rsp/*t026*/, %rsp/*t011*/
   movq    $4, %rsp/*t027*/
   movq    %rsp/*t027*/, %rdi
   call    _cs411newarray
   movq    %rax, %rsp/*t009*/
   movq    $3, %rsp/*t028*/
   movq    $-8, %rsp/*t031*/
   # movq    %rsp/*t031*/, %rsp/*t030*/
   addq    %rsp/*t009*/, %rsp/*t030*/
   movq    (%rsp/*t030*/), %rsp/*t029*/
   cmpq    %rsp/*t029*/, %rsp/*t028*/
   jae     _boundsbad_4
_boundsok_3:
   movq    $24, %rsp/*t033*/
   # movq    %rsp/*t033*/, %rsp/*t032*/
   addq    %rsp/*t009*/, %rsp/*t032*/
   movq    $11, %rsp/*t034*/
   movq    %rsp/*t034*/, (%rsp/*t032*/)
   movq    $1, %rsp/*t035*/
   # movq    %rsp/*t035*/, %rsp/*t010*/
   xorq    %rsp/*t036*/, %rsp/*t036*/
   movq    %rsp/*t036*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t011*/
   movq    $1, %rsp/*t037*/
   # movq    %rsp/*t037*/, %rsp/*t012*/
   movq    $3, %rsp/*t038*/
   movq    $-8, %rsp/*t041*/
   # movq    %rsp/*t041*/, %rsp/*t040*/
   addq    %rsp/*t009*/, %rsp/*t040*/
   movq    (%rsp/*t040*/), %rsp/*t039*/
   cmpq    %rsp/*t039*/, %rsp/*t038*/
   jae     _boundsbad_4
_boundsok_5:
   movq    $24, %rsp/*t044*/
   # movq    %rsp/*t044*/, %rsp/*t043*/
   addq    %rsp/*t009*/, %rsp/*t043*/
   movq    (%rsp/*t043*/), %rsp/*t042*/
   # movq    %rsp/*t042*/, %rsp/*t025*/
   movq    $1, %rsp/*t045*/
   movq    %rsp/*t045*/, %rdx
   movq    $6, %rsp/*t046*/
   movq    %rsp/*t046*/, %rsi
   movq    %rsp/*t011*/, %rdi
   call    _O_m
   movq    %rax, %rsp/*t024*/
   cmpq    %rsp/*t024*/, %rsp/*t025*/
   jge     _L_8
_L_6:
   xorq    %rsp/*t047*/, %rsp/*t047*/
   cmpq    %rsp/*t047*/, %rsp/*t010*/
   je      _L_8
_L_7:
   # movq    %rsp/*t012*/, %rsp/*t010*/
   movq    $2, %rsp/*t048*/
   movq    %rsp/*t048*/, %rax
_bail_2:
   movq    %rsp/*t013*/, %rbx
   movq    %rsp/*t014*/, %r12
   movq    %rsp/*t015*/, %r13
   movq    %rsp/*t016*/, %r14
   movq    %rsp/*t017*/, %r15
   jmp     _DONE_13
_boundsbad_4:
   movq    $1, %rsp/*t049*/
   movq    %rsp/*t049*/, %rdi
   call    _cs411error
   # movq    %rax, %rax
   jmp     _bail_2
_L_8:
   xorq    %rsp/*t050*/, %rsp/*t050*/
   # movq    %rsp/*t050*/, %rsp/*t012*/
   jmp     _L_7
_DONE_13:
   # return sink
   addq   $8, %rsp
   ret

.text
.globl _cs411main
_cs411main:
   subq   $8, %rsp
_L_14:
   movq    %rbx, %rsp/*t018*/
   movq    %r12, %rsp/*t019*/
   movq    %r13, %rsp/*t020*/
   movq    %r14, %rsp/*t021*/
   movq    %r15, %rsp/*t022*/
   xorq    %rsp/*t053*/, %rsp/*t053*/
   movq    %rsp/*t053*/, %rdi
   call    _cs411newobject
   movq    %rax, %rsp/*t052*/
   movq    %rsp/*t052*/, %rdi
   call    _Test_do
   movq    %rax, %rsp/*t051*/
   movq    %rsp/*t051*/, %rdi
   call    _cs411println
_bail_9:
   movq    %rsp/*t018*/, %rbx
   movq    %rsp/*t019*/, %r12
   movq    %rsp/*t020*/, %r13
   movq    %rsp/*t021*/, %r14
   movq    %rsp/*t022*/, %r15
_DONE_15:
   # return sink
   addq   $8, %rsp
   ret

   .ident	"minijavac: cs411 course project 2011w2"
