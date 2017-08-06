 TEXT 
Begin:
0703FE  60000058                  BRA       88(PC)               L0000
070402  60000076                  BRA       118(PC)              L0002
070406  60000078                  BRA       120(PC)              L0003
07040A  534E4448434F4D4D          DC.B      $53,$4E,$44,$48,$43,$4F,$4D,$4D 
070412  54696D20466F6C6C          DC.B      $54,$69,$6D,$20,$46,$6F,$6C,$6C 
07041A  696E005249505047          DC.B      $69,$6E,$00,$52,$49,$50,$50,$47 
070422  72617A6579202F20          DC.B      $72,$61,$7A,$65,$79,$20,$2F,$20 
07042A  50484600434F4E56          DC.B      $50,$48,$46,$00,$43,$4F,$4E,$56 
070432  4772617A6579202F          DC.B      $47,$72,$61,$7A,$65,$79,$20,$2F 
07043A  2050484600544954          DC.B      $20,$50,$48,$46,$00,$54,$49,$54 
070442  4C4C65642053746F          DC.B      $4C,$4C,$65,$64,$20,$53,$74,$6F 
07044A  726D200023233037          DC.B      $72,$6D,$20,$00,$23,$23,$30,$37 
070452  005443353000              DC.B      $00,$54,$43,$35,$30,$00 
070458  2F00                L0000:MOVE.L    D0,-(A7)            
07045A  41FA002A                  LEA       42(PC),A0            L0004
07045E  4A50                      TST.W     (A0)                
070460  660C                      BNE.S     12(PC)               L0001
070462  30BCFFFF                  MOVE.W    #-1,(A0)            
070466  6100009E                  BSR       158(PC)              L0006
07046A  61000162                  BSR       354(PC)              L0008
07046E  201F                L0001:MOVE.L    (A7)+,D0            
070470  04400001                  SUBI.W    #1,D0               
070474  6100015C                  BSR       348(PC)              L0009
070478  4E75                      RTS                           
07047A  6100000C            L0002:BSR       12(PC)               L0005
07047E  4E75                      RTS                           
070480  61000154            L0003:BSR       340(PC)              L000A
070484  4E75                      RTS                           
070486  0000                L0004:DC.B      $00,$00 
070488  2F08                L0005:MOVE.L    A0,-(A7)            
07048A  40E7                      MOVE      SR,-(A7)            
07048C  46FC2700                  MOVE      #$2700,SR           
070490  41FA00EC                  LEA       236(PC),A0           L0007
070494  11D8FA01                  MOVE.B    (A0)+,$FFFFFA01.W   
070498  11D8FA03                  MOVE.B    (A0)+,$FFFFFA03.W   
07049C  11D8FA05                  MOVE.B    (A0)+,$FFFFFA05.W   
0704A0  11D8FA07                  MOVE.B    (A0)+,$FFFFFA07.W   
0704A4  11D8FA09                  MOVE.B    (A0)+,$FFFFFA09.W   
0704A8  11D8FA0B                  MOVE.B    (A0)+,$FFFFFA0B.W   
0704AC  11D8FA0D                  MOVE.B    (A0)+,$FFFFFA0D.W   
0704B0  11D8FA0F                  MOVE.B    (A0)+,$FFFFFA0F.W   
0704B4  11D8FA11                  MOVE.B    (A0)+,$FFFFFA11.W   
0704B8  11D8FA13                  MOVE.B    (A0)+,$FFFFFA13.W   
0704BC  11D8FA15                  MOVE.B    (A0)+,$FFFFFA15.W   
0704C0  11D8FA17                  MOVE.B    (A0)+,$FFFFFA17.W   
0704C4  11D8FA19                  MOVE.B    (A0)+,$FFFFFA19.W   
0704C8  11D8FA1B                  MOVE.B    (A0)+,$FFFFFA1B.W   
0704CC  11D8FA1D                  MOVE.B    (A0)+,$FFFFFA1D.W   
0704D0  11D8FA1F                  MOVE.B    (A0)+,$FFFFFA1F.W   
0704D4  11D8FA21                  MOVE.B    (A0)+,$FFFFFA21.W   
0704D8  11D8FA23                  MOVE.B    (A0)+,$FFFFFA23.W   
0704DC  11D8FA25                  MOVE.B    (A0)+,$FFFFFA25.W   
0704E0  D1FC00000001              ADDA.L    #1,A0               
0704E6  21D80094                  MOVE.L    (A0)+,$94.W         
0704EA  21D80110                  MOVE.L    (A0)+,$110.W        
0704EE  21D80114                  MOVE.L    (A0)+,$114.W        
0704F2  21D80120                  MOVE.L    (A0)+,$120.W        
0704F6  21D80134                  MOVE.L    (A0)+,$134.W        
0704FA  46DF                      MOVE      (A7)+,SR            
0704FC  205F                      MOVEA.L   (A7)+,A0            
0704FE  11FC00C0FA23              MOVE.B    #-$40,$FFFFFA23.W   
070504  4E75                      RTS                           
070506  2F08                L0006:MOVE.L    A0,-(A7)            
070508  40E7                      MOVE      SR,-(A7)            
07050A  46FC2700                  MOVE      #$2700,SR           
07050E  41FA006E                  LEA       110(PC),A0           L0007
070512  10F8FA01                  MOVE.B    $FFFFFA01.W,(A0)+   
070516  10F8FA03                  MOVE.B    $FFFFFA03.W,(A0)+   
07051A  10F8FA05                  MOVE.B    $FFFFFA05.W,(A0)+   
07051E  10F8FA07                  MOVE.B    $FFFFFA07.W,(A0)+   
070522  10F8FA09                  MOVE.B    $FFFFFA09.W,(A0)+   
070526  10F8FA0B                  MOVE.B    $FFFFFA0B.W,(A0)+   
07052A  10F8FA0D                  MOVE.B    $FFFFFA0D.W,(A0)+   
07052E  10F8FA0F                  MOVE.B    $FFFFFA0F.W,(A0)+   
070532  10F8FA11                  MOVE.B    $FFFFFA11.W,(A0)+   
070536  10F8FA13                  MOVE.B    $FFFFFA13.W,(A0)+   
07053A  10F8FA15                  MOVE.B    $FFFFFA15.W,(A0)+   
07053E  10F8FA17                  MOVE.B    $FFFFFA17.W,(A0)+   
070542  10F8FA19                  MOVE.B    $FFFFFA19.W,(A0)+   
070546  10F8FA1B                  MOVE.B    $FFFFFA1B.W,(A0)+   
07054A  10F8FA1D                  MOVE.B    $FFFFFA1D.W,(A0)+   
07054E  10F8FA1F                  MOVE.B    $FFFFFA1F.W,(A0)+   
070552  10F8FA21                  MOVE.B    $FFFFFA21.W,(A0)+   
070556  10F8FA23                  MOVE.B    $FFFFFA23.W,(A0)+   
07055A  10F8FA25                  MOVE.B    $FFFFFA25.W,(A0)+   
07055E  D1FC00000001              ADDA.L    #1,A0               
070564  20F80094                  MOVE.L    $94.W,(A0)+         
070568  20F80110                  MOVE.L    $110.W,(A0)+        
07056C  20F80114                  MOVE.L    $114.W,(A0)+        
070570  20F80120                  MOVE.L    $120.W,(A0)+        
070574  20F80134                  MOVE.L    $134.W,(A0)+        
070578  46DF                      MOVE      (A7)+,SR            
07057A  205F                      MOVEA.L   (A7)+,A0            
07057C  4E75                      RTS                           
07057E                      L0007:DCB.W     40,0
0705CE  60000014            L0008:BRA       20(PC)               L000C
0705D2  60000006            L0009:BRA       6(PC)                L000B
0705D6  60000014            L000A:BRA       20(PC)               L000E
0705DA  41FA0CE6            L000B:LEA       3302(PC),A0          L0048
0705DE  3080                      MOVE.W    D0,(A0)             
0705E0  60000006                  BRA       6(PC)                L000D
0705E4  60000012            L000C:BRA       18(PC)               L000F
0705E8  6000017A            L000D:BRA       378(PC)              L001E
0705EC  60000356            L000E:BRA       854(PC)              L0022
0705F0  60000172                  BRA       370(PC)              L001E
0705F4  6000016E                  BRA       366(PC)              L001E
0705F8  203C000009EF        L000F:MOVE.L    #$9EF,D0            
0705FE  223C00070764              MOVE.L    #$70764,D1          
070604  243C000729D9              MOVE.L    #$729D9,D2          
07060A  41FA0158                  LEA       344(PC),A0           L001E
07060E  2608                      MOVE.L    A0,D3               
070610  B290                L0010:CMP.L     (A0),D1             
070612  6F02                      BLE.S     2(PC)                L0011
070614  606A                      BRA.S     106(PC)              L001A
070616  B490                L0011:CMP.L     (A0),D2             
070618  6C02                      BGE.S     2(PC)                L0012
07061A  6064                      BRA.S     100(PC)              L001A
07061C  2A28FFFC            L0012:MOVE.L    -4(A0),D5           
070620  9A83                      SUB.L     D3,D5               
070622  DA81                      ADD.L     D1,D5               
070624  B285                      CMP.L     D5,D1               
070626  6E12                      BGT.S     18(PC)               L0013
070628  B485                      CMP.L     D5,D2               
07062A  6D0E                      BLT.S     14(PC)               L0013
07062C  B2A80004                  CMP.L     4(A0),D1            
070630  6E08                      BGT.S     8(PC)                L0013
070632  B4A80004                  CMP.L     4(A0),D2            
070636  6D02                      BLT.S     2(PC)                L0013
070638  603E                      BRA.S     62(PC)               L0019
07063A  45FA004E            L0013:LEA       78(PC),A2            L001B
07063E  0C5200FF            L0014:CMPI.W    #$FF,(A2)           
070642  670A                      BEQ.S     10(PC)               L0015
070644  3A1A                      MOVE.W    (A2)+,D5            
070646  BA68FFFE                  CMP.W     -2(A0),D5           
07064A  6734                      BEQ.S     52(PC)               L001A
07064C  60F0                      BRA.S     -16(PC)              L0014
07064E  45FA007E            L0015:LEA       126(PC),A2           L001C
070652  0C5200FF            L0016:CMPI.W    #$FF,(A2)           
070656  670A                      BEQ.S     10(PC)               L0017
070658  3A1A                      MOVE.W    (A2)+,D5            
07065A  BA68FFFC                  CMP.W     -4(A0),D5           
07065E  6720                      BEQ.S     32(PC)               L001A
070660  60F0                      BRA.S     -16(PC)              L0016
070662  45FA0074            L0017:LEA       116(PC),A2           L001D
070666  0C92000000FF        L0018:CMPI.L    #$FF,(A2)           
07066C  670A                      BEQ.S     10(PC)               L0019
07066E  2A1A                      MOVE.L    (A2)+,D5            
070670  BAA8FFFE                  CMP.L     -2(A0),D5           
070674  670A                      BEQ.S     10(PC)               L001A
070676  60EE                      BRA.S     -18(PC)              L0018
070678  9390                L0019:SUB.L     D1,(A0)             
07067A  D790                      ADD.L     D3,(A0)             
07067C  41E80002                  LEA       2(A0),A0            
070680  41E80002            L001A:LEA       2(A0),A0            
070684  5380                      SUBQ.L    #1,D0               
070686  6688                      BNE.S     -120(PC)             L0010
070688  4E75                      RTS                           
07068A  020008D0081008A8    L001B:DC.B      $02,$00,$08,$D0,$08,$10,$08,$A8 
070692  082810BC6B006700          DC.B      $08,$28,$10,$BC,$6B,$00,$67,$00 
07069A  B87C102A08004A2A          DC.B      $B8,$7C,$10,$2A,$08,$00,$4A,$2A 
0706A2  08040C00102912BC          DC.B      $08,$04,$0C,$00,$10,$29,$12,$BC 
0706AA  08D5B03C081513FC          DC.B      $08,$D5,$B0,$3C,$08,$15,$13,$FC 
0706B2  08E80881102D522D          DC.B      $08,$E8,$08,$81,$10,$2D,$52,$2D 
0706BA  134024681D7C0C39          DC.B      $13,$40,$24,$68,$1D,$7C,$0C,$39 
0706C2  6000083908EE08AE          DC.B      $60,$00,$08,$39,$08,$EE,$08,$AE 
0706CA  0C2D00FF                  DC.B      $0C,$2D,$00,$FF 
0706CE  0280117C08E808A8    L001C:DC.B      $02,$80,$11,$7C,$08,$E8,$08,$A8 
0706D6  00FF                      DC.B      $00,$FF 
0706D8  00FF8800FFFF8800    L001D:DC.B      $00,$FF,$88,$00,$FF,$FF,$88,$00 
0706E0  000000FF54686973          DC.B      $00,$00,$00,$FF,$54,$68,$69,$73 
0706E8  2066696C65207761          DC.B      $20,$66,$69,$6C,$65,$20,$77,$61 
0706F0  73206D6164652050          DC.B      $73,$20,$6D,$61,$64,$65,$20,$50 
0706F8  432D52656C617469          DC.B      $43,$2D,$52,$65,$6C,$61,$74,$69 
070700  7665207573696E67          DC.B      $76,$65,$20,$75,$73,$69,$6E,$67 
070708  20472E532E522056          DC.B      $20,$47,$2E,$53,$2E,$52,$20,$56 
070710  332E3120636F6465          DC.B      $33,$2E,$31,$20,$63,$6F,$64,$65 
070718  6420627920546865          DC.B      $64,$20,$62,$79,$20,$54,$68,$65 
070720  20502E482E462E20          DC.B      $20,$50,$2E,$48,$2E,$46,$2E,$20 
070728  496E204175677573          DC.B      $49,$6E,$20,$41,$75,$67,$75,$73 
070730  7420393221205468          DC.B      $74,$20,$39,$32,$21,$20,$54,$68 
070738  6973206D75736963          DC.B      $69,$73,$20,$6D,$75,$73,$69,$63 
070740  2077617320726970          DC.B      $20,$77,$61,$73,$20,$72,$69,$70 
070748  7065642062792000          DC.B      $70,$65,$64,$20,$62,$79,$20,$00 
070750  4772617A6579204F          DC.B      $47,$72,$61,$7A,$65,$79,$20,$4F 
070758  6620504846210000          DC.B      $66,$20,$50,$48,$46,$21,$00,$00 
070760                            DCB.W     2,0 
070764  4280                L001E:CLR.L     D0                  
070766  3039000712C2              MOVE.W    $712C2,D0           
07076C  E340                      ASL.W     #1,D0               
07076E  4281                      CLR.L     D1                  
070770  3200                      MOVE.W    D0,D1               
070772  068100071396              ADDI.L    #$71396,D1          
070778  2041                      MOVEA.L   D1,A0               
07077A  61000272                  BSR       626(PC)              L0028
07077E  23C100070F42              MOVE.L    D1,$70F42           
070784  4281                      CLR.L     D1                  
070786  3200                      MOVE.W    D0,D1               
070788  0681000713AA              ADDI.L    #$713AA,D1          
07078E  2041                      MOVEA.L   D1,A0               
070790  6100025C                  BSR       604(PC)              L0028
070794  23C100070F46              MOVE.L    D1,$70F46           
07079A  4281                      CLR.L     D1                  
07079C  3200                      MOVE.W    D0,D1               
07079E  0681000713BE              ADDI.L    #$713BE,D1          
0707A4  2041                      MOVEA.L   D1,A0               
0707A6  61000246                  BSR       582(PC)              L0028
0707AA  23C100070F4A              MOVE.L    D1,$70F4A           
0707B0  103C00FF                  MOVE.B    #-1,D0              
0707B4  13C000070F32              MOVE.B    D0,$70F32           
0707BA  13C000070F33              MOVE.B    D0,$70F33           
0707C0  13C000070F34              MOVE.B    D0,$70F34           
0707C6  13C000070F1E        L001F:MOVE.B    D0,$70F1E           
0707CC  13C000070F1F              MOVE.B    D0,$70F1F           
0707D2  13C000070F20              MOVE.B    D0,$70F20           
0707D8  42B900070F0E              CLR.L     $70F0E              
0707DE  42B900070F16              CLR.L     $70F16              
0707E4  42B900070F12              CLR.L     $70F12              
0707EA  42B900070EDA              CLR.L     $70EDA              
0707F0  42B900070EDE              CLR.L     $70EDE              
0707F6  42B900070F9A              CLR.L     $70F9A              
0707FC  42B900070EEA              CLR.L     $70EEA              
070802  42B900070FB6              CLR.L     $70FB6              
070808  42B900070F36              CLR.L     $70F36              
07080E  42B900070F0A              CLR.L     $70F0A              
070814  42B900070EF2              CLR.L     $70EF2              
07081A  42B900070EF6              CLR.L     $70EF6              
070820  103C0001                  MOVE.B    #1,D0               
070824  13C000070EF6              MOVE.B    D0,$70EF6           
07082A  13C000070EF7              MOVE.B    D0,$70EF7           
070830  13C000070EF8              MOVE.B    D0,$70EF8           
070836  13C000070EFE              MOVE.B    D0,$70EFE           
07083C  13C000070EFF              MOVE.B    D0,$70EFF           
070842  13C000070F00              MOVE.B    D0,$70F00           
070848  123C0009                  MOVE.B    #9,D1               
07084C  13C100070F9E              MOVE.B    D1,$70F9E           
070852  E301                      ASL.B     #1,D1               
070854  13C100070F9F              MOVE.B    D1,$70F9F           
07085A  E301                      ASL.B     #1,D1               
07085C  13C100070FA0              MOVE.B    D1,$70FA0           
070862  23FC00070E5000070F72      MOVE.L    #$70E50,$70F72      
07086C  23FC00070E5C00070F76      MOVE.L    #$70E5C,$70F76      
070876  23FC00070E6800070F7A      MOVE.L    #$70E68,$70F7A      
070880  4E75                L0020:RTS                           
070882  4202                      CLR.B     D2                  
070884  103C0008                  MOVE.B    #8,D0               
070888  61000100                  BSR       256(PC)              L0025
07088C  4202                      CLR.B     D2                  
07088E  103C0009                  MOVE.B    #9,D0               
070892  610000F6                  BSR       246(PC)              L0025
070896  4202                      CLR.B     D2                  
070898  103C000A                  MOVE.B    #$A,D0              
07089C  610000EC                  BSR       236(PC)              L0025
0708A0  4280                      CLR.L     D0                  
0708A2  13C000070F32              MOVE.B    D0,$70F32           
0708A8  13C000070F33              MOVE.B    D0,$70F33           
0708AE  13C000070F34              MOVE.B    D0,$70F34           
0708B4  103C00FF                  MOVE.B    #-1,D0              
0708B8  6000FF0C                  BRA       -244(PC)             L001F
0708BC  E300                      ASL.B     #1,D0               
0708BE  02800000001F              ANDI.L    #$1F,D0             
0708C4  41F9000713D2              LEA       $713D2,A0           
0708CA  13F00000000712C9          MOVE.B    0(A0,D0.W),$712C9   
0708D2  13F00001000712C8          MOVE.B    1(A0,D0.W),$712C8   
0708DA  4280                      CLR.L     D0                  
0708DC  3039000712C8              MOVE.W    $712C8,D0           
0708E2  048000000000              SUBI.L    #0,D0               
0708E8  068000071392              ADDI.L    #$71392,D0          
0708EE  2040                      MOVEA.L   D0,A0               
0708F0  4280                      CLR.L     D0                  
0708F2  1010                L0021:MOVE.B    (A0),D0             
0708F4  6B00FF8A                  BMI       -118(PC)             L0020
0708F8  E208                      LSR.B     #1,D0               
0708FA  43F900070F32              LEA       $70F32,A1           
070900  13BC00FF0000              MOVE.B    #-1,0(A1,D0.W)      
070906  43F900070EF6              LEA       $70EF6,A1           
07090C  13BC00010000              MOVE.B    #1,0(A1,D0.W)       
070912  1018                      MOVE.B    (A0)+,D0            
070914  E300                      ASL.B     #1,D0               
070916  43F900070F42              LEA       $70F42,A1           
07091C  13D8000712C9              MOVE.B    (A0)+,$712C9        
070922  13D8000712C8              MOVE.B    (A0)+,$712C8        
070928  4281                      CLR.L     D1                  
07092A  3239000712C8              MOVE.W    $712C8,D1           
070930  048100000000              SUBI.L    #0,D1               
070936  068100071392              ADDI.L    #$71392,D1          
07093C  23810000                  MOVE.L    D1,0(A1,D0.W)       
070940  6000FFB0                  BRA       -80(PC)              L0021
070944  423900070E74        L0022:CLR.B     $70E74              
07094A  4DF900070F42              LEA       $70F42,A6           
070950  4BF9000712CC              LEA       $712CC,A5           
070956  4286                      CLR.L     D6                  
070958  4285                      CLR.L     D5                  
07095A  4284                      CLR.L     D4                  
07095C  1A06                L0023:MOVE.B    D6,D5               
07095E  E345                      ASL.W     #1,D5               
070960  1805                      MOVE.B    D5,D4               
070962  E344                      ASL.W     #1,D4               
070964  610000A8                  BSR       168(PC)              L0029
070968  5206                      ADDQ.B    #1,D6               
07096A  BC3C0003                  CMP.B     #3,D6               
07096E  6600FFEC                  BNE       -20(PC)              L0023
070972  4E75                      RTS                           
070974  14365049            L0024:MOVE.B    $49(A6,D5.W),D2     
070978  1006                      MOVE.B    D6,D0               
07097A  E300                      ASL.B     #1,D0               
07097C  6100000C                  BSR       12(PC)               L0025
070980  14365048                  MOVE.B    $48(A6,D5.W),D2     
070984  1006                      MOVE.B    D6,D0               
070986  E300                      ASL.B     #1,D0               
070988  5200                      ADDQ.B    #1,D0               
07098A  23C2000712C4        L0025:MOVE.L    D2,$712C4           
070990  B03C0007                  CMP.B     #7,D0               
070994  67000018                  BEQ       24(PC)               L0026
070998  13C000FF8800              MOVE.B    D0,$FF8800.L        
07099E  13C200FF8802              MOVE.B    D2,$FF8802.L        
0709A4  2439000712C4              MOVE.L    $712C4,D2           
0709AA  2002                      MOVE.L    D2,D0               
0709AC  4E75                      RTS                           
0709AE  13C000FF8800        L0026:MOVE.B    D0,$FF8800.L        
0709B4  123900FF8800              MOVE.B    $FF8800.L,D1        
0709BA  020100C0                  ANDI.B    #-$40,D1            
0709BE  0202003F                  ANDI.B    #$3F,D2             
0709C2  8202                      OR.B      D2,D1               
0709C4  13C100FF8802              MOVE.B    D1,$FF8802.L        
0709CA  2439000712C4              MOVE.L    $712C4,D2           
0709D0  2002                      MOVE.L    D2,D0               
0709D2  4E75                      RTS                           
0709D4  143900070F9E        L0027:MOVE.B    $70F9E,D2           
0709DA  843900070F9F              OR.B      $70F9F,D2           
0709E0  843900070FA0              OR.B      $70FA0,D2           
0709E6  103C0007                  MOVE.B    #7,D0               
0709EA  6000FF9E                  BRA       -98(PC)              L0025
0709EE  13D8000712C9        L0028:MOVE.B    (A0)+,$712C9        
0709F4  13D8000712C8              MOVE.B    (A0)+,$712C8        
0709FA  4281                      CLR.L     D1                  
0709FC  3239000712C8              MOVE.W    $712C8,D1           
070A02  04410000                  SUBI.W    #0,D1               
070A06  068100071392              ADDI.L    #$71392,D1          
070A0C  4E75                      RTS                           
070A0E  1E3660F0            L0029:MOVE.B    -$10(A6,D6.W),D7    
070A12  8F3900070E74              OR.B      D7,$70E74           
070A18  4A3660F0                  TST.B     -$10(A6,D6.W)       
070A1C  6A0002DA                  BPL       730(PC)              L0045
070A20  4A366060                  TST.B     $60(A6,D6.W)        
070A24  6600002E                  BNE       46(PC)               L002A
070A28  53366064                  SUBQ.B    #1,$64(A6,D6.W)     
070A2C  6A000058                  BPL       88(PC)               L002C
070A30  1DB660686064              MOVE.B    $68(A6,D6.W),$64(A6,D6.W) 
070A36  523660EC                  ADDQ.B    #1,-$14(A6,D6.W)    
070A3A  0C36000F60EC              CMPI.B    #$F,-$14(A6,D6.W)   
070A40  66000044                  BNE       68(PC)               L002C
070A44  1DBC00016060              MOVE.B    #1,$60(A6,D6.W)     
070A4A  1DB6606C6064              MOVE.B    $6C(A6,D6.W),$64(A6,D6.W) 
070A50  60000034                  BRA       52(PC)               L002C
070A54  0C3600016060        L002A:CMPI.B    #1,$60(A6,D6.W)     
070A5A  6600002A                  BNE       42(PC)               L002C
070A5E  53366064                  SUBQ.B    #1,$64(A6,D6.W)     
070A62  6A000022                  BPL       34(PC)               L002C
070A66  1DB6606C6064              MOVE.B    $6C(A6,D6.W),$64(A6,D6.W) 
070A6C  103660EC                  MOVE.B    -$14(A6,D6.W),D0    
070A70  B0366070                  CMP.B     $70(A6,D6.W),D0     
070A74  6700000A                  BEQ       10(PC)               L002B
070A78  533660EC                  SUBQ.B    #1,-$14(A6,D6.W)    
070A7C  6A000008                  BPL       8(PC)                L002C
070A80  1DBC00026060        L002B:MOVE.B    #2,$60(A6,D6.W)     
070A86  143660EC            L002C:MOVE.B    -$14(A6,D6.W),D2    
070A8A  1006                      MOVE.B    D6,D0               
070A8C  5000                      ADDQ.B    #8,D0               
070A8E  6100FEFA                  BSR       -262(PC)             L0025
070A92  4A3660F4                  TST.B     -$C(A6,D6.W)        
070A96  67000020                  BEQ       32(PC)               L002D
070A9A  4A3660F8                  TST.B     -8(A6,D6.W)         
070A9E  67000018                  BEQ       24(PC)               L002D
070AA2  533660F8                  SUBQ.B    #1,-8(A6,D6.W)      
070AA6  66000100                  BNE       256(PC)              L0037
070AAA  6100FEC8                  BSR       -312(PC)             L0024
070AAE  1DB660E0605C              MOVE.B    -$20(A6,D6.W),$5C(A6,D6.W)
070AB4  6100FF1E                  BSR       -226(PC)             L0027
070AB8  4A366074            L002D:TST.B     $74(A6,D6.W)        
070ABC  67000054                  BEQ       84(PC)               L0031
070AC0  4A366078                  TST.B     $78(A6,D6.W)        
070AC4  6700000A                  BEQ       10(PC)               L002E
070AC8  53366078                  SUBQ.B    #1,$78(A6,D6.W)     
070ACC  66000044                  BNE       68(PC)               L0031
070AD0  30365048            L002E:MOVE.W    $48(A6,D5.W),D0     
070AD4  4281                      CLR.L     D1                  
070AD6  12366088                  MOVE.B    -$78(A6,D6.W),D1    
070ADA  4A36608C                  TST.B     -$74(A6,D6.W)       
070ADE  67000008                  BEQ       8(PC)                L002F
070AE2  D041                      ADD.W     D1,D0               
070AE4  60000004                  BRA       4(PC)                L0030
070AE8  9041                L002F:SUB.W     D1,D0               
070AEA  3D805048            L0030:MOVE.W    D0,$48(A6,D5.W)     
070AEE  6100FE84                  BSR       -380(PC)             L0024
070AF2  53366090                  SUBQ.B    #1,-$70(A6,D6.W)    
070AF6  66000054                  BNE       84(PC)               L0033
070AFA  10366094                  MOVE.B    -$6C(A6,D6.W),D0    
070AFE  6700004C                  BEQ       76(PC)               L0033
070B02  E300                      ASL.B     #1,D0               
070B04  1D806090                  MOVE.B    D0,-$70(A6,D6.W)    
070B08  0A3600FF608C              EORI.B    #-1,-$74(A6,D6.W)   
070B0E  6000003C                  BRA       60(PC)               L0033
070B12  4A366098            L0031:TST.B     -$68(A6,D6.W)       
070B16  67000034                  BEQ       52(PC)               L0033
070B1A  53366098                  SUBQ.B    #1,-$68(A6,D6.W)    
070B1E  6600002C                  BNE       44(PC)               L0033
070B22  1DB6609C6098              MOVE.B    -$64(A6,D6.W),-$68(A6,D6.W) 
070B28  123660A0                  MOVE.B    -$60(A6,D6.W),D1    
070B2C  103660A4                  MOVE.B    -$5C(A6,D6.W),D0    
070B30  0A3600FF608C              EORI.B    #-1,-$74(A6,D6.W)   
070B36  67000008                  BEQ       8(PC)                L0032
070B3A  D001                      ADD.B     D1,D0               
070B3C  60000046                  BRA       70(PC)               L0036
070B40  1DB660586098        L0032:MOVE.B    $58(A6,D6.W),-$68(A6,D6.W)
070B46  9001                      SUB.B     D1,D0               
070B48  6000003A                  BRA       58(PC)               L0036
070B4C  4A3660A8            L0033:TST.B     -$58(A6,D6.W)       
070B50  67000056                  BEQ       86(PC)               L0037
070B54  143660A8                  MOVE.B    -$58(A6,D6.W),D2    
070B58  103660A4                  MOVE.B    -$5C(A6,D6.W),D0    
070B5C  B03660AC                  CMP.B     -$54(A6,D6.W),D0    
070B60  67000046                  BEQ       70(PC)               L0037
070B64  65000010                  BCS       16(PC)               L0034
070B68  9002                      SUB.B     D2,D0               
070B6A  B03660AC                  CMP.B     -$54(A6,D6.W),D0    
070B6E  64000014                  BCC       20(PC)               L0036
070B72  6000000C                  BRA       12(PC)               L0035
070B76  D002                L0034:ADD.B     D2,D0               
070B78  B03660AC                  CMP.B     -$54(A6,D6.W),D0    
070B7C  65000006                  BCS       6(PC)                L0036
070B80  103660AC            L0035:MOVE.B    -$54(A6,D6.W),D0    
070B84  1D8060A4            L0036:MOVE.B    D0,-$5C(A6,D6.W)    
070B88  024000FF                  ANDI.W    #$FF,D0             
070B8C  E300                      ASL.B     #1,D0               
070B8E  45F9000712D2              LEA       $712D2,A2           
070B94  30320000                  MOVE.W    0(A2,D0.W),D0       
070B98  4241                      CLR.W     D1                  
070B9A  123660B0                  MOVE.B    -$50(A6,D6.W),D1    
070B9E  D041                      ADD.W     D1,D0               
070BA0  3D805048                  MOVE.W    D0,$48(A6,D5.W)     
070BA4  6100FDCE                  BSR       -562(PC)             L0024
070BA8  533660B4            L0037:SUBQ.B    #1,-$4C(A6,D6.W)    
070BAC  103660B4                  MOVE.B    -$4C(A6,D6.W),D0    
070BB0  B03660FC                  CMP.B     -4(A6,D6.W),D0      
070BB4  6700000A                  BEQ       10(PC)               L0038
070BB8  4A3660E4                  TST.B     -$1C(A6,D6.W)       
070BBC  66000010                  BNE       16(PC)               L0039
070BC0  1DB55001605C        L0038:MOVE.B    1(A5,D5.W),$5C(A6,D6.W) 
070BC6  6100FE0C                  BSR       -500(PC)             L0027
070BCA  523660E4                  ADDQ.B    #1,-$1C(A6,D6.W)    
070BCE  533660E4            L0039:SUBQ.B    #1,-$1C(A6,D6.W)    
070BD2  4A3660B4                  TST.B     -$4C(A6,D6.W)       
070BD6  66000120                  BNE       288(PC)              L0045
070BDA  20764000                  MOVEA.L   0(A6,D4.W),A0       
070BDE  4280                L003A:CLR.L     D0                  
070BE0  1018                      MOVE.B    (A0)+,D0            
070BE2  67000006                  BEQ       6(PC)                L003B
070BE6  6A000024                  BPL       36(PC)               L003D
070BEA  0240001F            L003B:ANDI.W    #$1F,D0             
070BEE  E540                      ASL.W     #2,D0               
070BF0  43F900070E76              LEA       $70E76,A1           
070BF6  22710000                  MOVEA.L   0(A1,D0.W),A1       
070BFA  B3FC000712D2              CMPA.L    #$712D2,A1          
070C00  67000004                  BEQ       4(PC)                L003C
070C04  4ED1                      JMP       (A1)                
070C06  4EF900070C06        L003C:JMP       $70C06              
070C0C  1400                L003D:MOVE.B    D0,D2               
070C0E  4A3660D0                  TST.B     -$30(A6,D6.W)       
070C12  6700000C                  BEQ       12(PC)               L003E
070C16  4200                      CLR.B     D0                  
070C18  1D8060D0                  MOVE.B    D0,-$30(A6,D6.W)    
070C1C  60000006                  BRA       6(PC)                L003F
070C20  103660CC            L003E:MOVE.B    -$34(A6,D6.W),D0    
070C24  D002                L003F:ADD.B     D2,D0               
070C26  4A3660A8                  TST.B     -$58(A6,D6.W)       
070C2A  6700000A                  BEQ       10(PC)               L0040
070C2E  1D8060AC                  MOVE.B    D0,-$54(A6,D6.W)    
070C32  103660A4                  MOVE.B    -$5C(A6,D6.W),D0    
070C36  024000FF            L0040:ANDI.W    #$FF,D0             
070C3A  1D8060A4                  MOVE.B    D0,-$5C(A6,D6.W)    
070C3E  E300                      ASL.B     #1,D0               
070C40  45F9000712D2              LEA       $712D2,A2           
070C46  30320000                  MOVE.W    0(A2,D0.W),D0       
070C4A  4241                      CLR.W     D1                  
070C4C  123660B0                  MOVE.B    -$50(A6,D6.W),D1    
070C50  D041                      ADD.W     D1,D0               
070C52  3D805048                  MOVE.W    D0,$48(A6,D5.W)     
070C56  6100FD1C                  BSR       -740(PC)             L0024
070C5A  103660D4                  MOVE.B    -$2C(A6,D6.W),D0    
070C5E  4A00                      TST.B     D0                  
070C60  66000004                  BNE       4(PC)                L0041
070C64  1018                      MOVE.B    (A0)+,D0            
070C66  1D8060B4            L0041:MOVE.B    D0,-$4C(A6,D6.W)    
070C6A  2D884000                  MOVE.L    A0,0(A6,D4.W)       
070C6E  1DB6609C6098              MOVE.B    -$64(A6,D6.W),-$68(A6,D6.W) 
070C74  1DB660E860E4              MOVE.B    -$18(A6,D6.W),-$1C(A6,D6.W) 
070C7A  1DB660E0605C              MOVE.B    -$20(A6,D6.W),$5C(A6,D6.W)
070C80  6100FD52                  BSR       -686(PC)             L0027
070C84  10366074                  MOVE.B    $74(A6,D6.W),D0     
070C88  67000010                  BEQ       16(PC)               L0042
070C8C  1D806078                  MOVE.B    D0,$78(A6,D6.W)     
070C90  1DB660946090              MOVE.B    -$6C(A6,D6.W),-$70(A6,D6.W) 
070C96  103660B8                  MOVE.B    -$48(A6,D6.W),D0    
070C9A  1D80608C            L0042:MOVE.B    D0,-$74(A6,D6.W)    
070C9E  4A3660BC                  TST.B     -$44(A6,D6.W)       
070CA2  67000022                  BEQ       34(PC)               L0044
070CA6  1DB660C06060              MOVE.B    -$40(A6,D6.W),$60(A6,D6.W)
070CAC  10366068                  MOVE.B    $68(A6,D6.W),D0     
070CB0  4A366060                  TST.B     $60(A6,D6.W)        
070CB4  67000006                  BEQ       6(PC)                L0043
070CB8  1036606C                  MOVE.B    $6C(A6,D6.W),D0     
070CBC  1D806064            L0043:MOVE.B    D0,$64(A6,D6.W)     
070CC0  1DB660C460EC              MOVE.B    -$3C(A6,D6.W),-$14(A6,D6.W) 
070CC6  4A3660F4            L0044:TST.B     -$C(A6,D6.W)        
070CCA  6700002C                  BEQ       44(PC)               L0045
070CCE  1DB660F460F8              MOVE.B    -$C(A6,D6.W),-8(A6,D6.W)
070CD4  1DB660D8605C              MOVE.B    -$28(A6,D6.W),$5C(A6,D6.W)
070CDA  6100FCF8                  BSR       -776(PC)             L0027
070CDE  14365041                  MOVE.B    $41(A6,D5.W),D2     
070CE2  1006                      MOVE.B    D6,D0               
070CE4  E300                      ASL.B     #1,D0               
070CE6  6100FCA2                  BSR       -862(PC)             L0025
070CEA  14365040                  MOVE.B    $40(A6,D5.W),D2     
070CEE  1006                      MOVE.B    D6,D0               
070CF0  E300                      ASL.B     #1,D0               
070CF2  5200                      ADDQ.B    #1,D0               
070CF4  6100FC94                  BSR       -876(PC)             L0025
070CF8  4E75                L0045:RTS                           
070CFA  1D9860C8                  MOVE.B    (A0)+,-$38(A6,D6.W) 
070CFE  2D884010                  MOVE.L    A0,$10(A6,D4.W)     
070D02  6000FEDA                  BRA       -294(PC)             L003A
070D06  533660C8                  SUBQ.B    #1,-$38(A6,D6.W)    
070D0A  6700FED2                  BEQ       -302(PC)             L003A
070D0E  20764010                  MOVEA.L   $10(A6,D4.W),A0     
070D12  6000FECA                  BRA       -310(PC)             L003A
070D16  1D9860D4                  MOVE.B    (A0)+,-$2C(A6,D6.W) 
070D1A  6000FEC2                  BRA       -318(PC)             L003A
070D1E  523660F0                  ADDQ.B    #1,-$10(A6,D6.W)    
070D22  6000FFD4                  BRA       -44(PC)              L0045
070D26  13D8000712C9              MOVE.B    (A0)+,$712C9        
070D2C  13D8000712C8              MOVE.B    (A0)+,$712C8        
070D32  4280                      CLR.L     D0                  
070D34  3039000712C8              MOVE.W    $712C8,D0           
070D3A  048000000000              SUBI.L    #0,D0               
070D40  068000071392              ADDI.L    #$71392,D0          
070D46  2040                      MOVEA.L   D0,A0               
070D48  6000FE94                  BRA       -364(PC)             L003A
070D4C  6100FCA0                  BSR       -864(PC)             L0028
070D50  22764030                  MOVEA.L   $30(A6,D4.W),A1     
070D54  2308                      MOVE.L    A0,-(A1)            
070D56  2D894030                  MOVE.L    A1,$30(A6,D4.W)     
070D5A  2041                      MOVEA.L   D1,A0               
070D5C  6000FE80                  BRA       -384(PC)             L003A
070D60  22764030                  MOVEA.L   $30(A6,D4.W),A1     
070D64  2059                      MOVEA.L   (A1)+,A0            
070D66  2D894030                  MOVE.L    A1,$30(A6,D4.W)     
070D6A  6000FE72                  BRA       -398(PC)             L003A
070D6E  1D9860CC                  MOVE.B    (A0)+,-$34(A6,D6.W) 
070D72  6000FE6A                  BRA       -406(PC)             L003A
070D76  1018                      MOVE.B    (A0)+,D0            
070D78  1418                      MOVE.B    (A0)+,D2            
070D7A  B03C0007                  CMP.B     #7,D0               
070D7E  66000014                  BNE       20(PC)               L0046
070D82  1002                      MOVE.B    D2,D0               
070D84  1D80605C                  MOVE.B    D0,$5C(A6,D6.W)     
070D88  1D8060E0                  MOVE.B    D0,-$20(A6,D6.W)    
070D8C  6100FC46                  BSR       -954(PC)             L0027
070D90  6000FE4C                  BRA       -436(PC)             L003A
070D94  6100FBF4            L0046:BSR       -1036(PC)            L0025
070D98  6000FE44                  BRA       -444(PC)             L003A
070D9C  1010                      MOVE.B    (A0),D0             
070D9E  E808                      LSR.B     #4,D0               
070DA0  1D8060C4                  MOVE.B    D0,-$3C(A6,D6.W)    
070DA4  1018                      MOVE.B    (A0)+,D0            
070DA6  0200000F                  ANDI.B    #$F,D0              
070DAA  1D806070                  MOVE.B    D0,$70(A6,D6.W)     
070DAE  1010                      MOVE.B    (A0),D0             
070DB0  E808                      LSR.B     #4,D0               
070DB2  1D806068                  MOVE.B    D0,$68(A6,D6.W)     
070DB6  1D98606C                  MOVE.B    (A0)+,$6C(A6,D6.W)  
070DBA  0236000F606C              ANDI.B    #$F,$6C(A6,D6.W)    
070DC0  1D9860C0                  MOVE.B    (A0)+,-$40(A6,D6.W) 
070DC4  6000FE18                  BRA       -488(PC)             L003A
070DC8  1D9860BC                  MOVE.B    (A0)+,-$44(A6,D6.W) 
070DCC  6000FE10                  BRA       -496(PC)             L003A
070DD0  1D9860A0                  MOVE.B    (A0)+,-$60(A6,D6.W) 
070DD4  1D98609C                  MOVE.B    (A0)+,-$64(A6,D6.W) 
070DD8  1D986058                  MOVE.B    (A0)+,$58(A6,D6.W)  
070DDC  6000FE00                  BRA       -512(PC)             L003A
070DE0  1D9860A8                  MOVE.B    (A0)+,-$58(A6,D6.W) 
070DE4  6000FDF8                  BRA       -520(PC)             L003A
070DE8  1D986074                  MOVE.B    (A0)+,$74(A6,D6.W)  
070DEC  1D986088                  MOVE.B    (A0)+,-$78(A6,D6.W) 
070DF0  1D986094                  MOVE.B    (A0)+,-$6C(A6,D6.W) 
070DF4  1D9860B8                  MOVE.B    (A0)+,-$48(A6,D6.W) 
070DF8  6000FDE4                  BRA       -540(PC)             L003A
070DFC  1DBC00FF60D0              MOVE.B    #-1,-$30(A6,D6.W)   
070E02  6000FDDA                  BRA       -550(PC)             L003A
070E06  1D9860F4                  MOVE.B    (A0)+,-$C(A6,D6.W)  
070E0A  66000010                  BNE       16(PC)               L0047
070E0E  1DB660E0605C              MOVE.B    -$20(A6,D6.W),$5C(A6,D6.W)
070E14  6100FBBE                  BSR       -1090(PC)            L0027
070E18  6000FDC4                  BRA       -572(PC)             L003A
070E1C  1D9860D8            L0047:MOVE.B    (A0)+,-$28(A6,D6.W) 
070E20  1D985040                  MOVE.B    (A0)+,$40(A6,D5.W)  
070E24  1D985041                  MOVE.B    (A0)+,$41(A6,D5.W)  
070E28  6000FDB4                  BRA       -588(PC)             L003A
070E2C  1D9860B0                  MOVE.B    (A0)+,-$50(A6,D6.W) 
070E30  6000FDAC                  BRA       -596(PC)             L003A
070E34  1D9860FC                  MOVE.B    (A0)+,-4(A6,D6.W)   
070E38  6000FDA4                  BRA       -604(PC)             L003A
070E3C  1D9860E86000FD9C          DC.B      $1D,$98,$60,$E8,$60,$00,$FD,$9C 
070E44                            DCB.W     2,0 
070E48  00071EFB00071E8F          DC.B      $00,$07,$1E,$FB,$00,$07,$1E,$8F 
070E50                            DCB.W     2,0 
070E54  00071FDB00071EB4          DC.B      $00,$07,$1F,$DB,$00,$07,$1E,$B4 
070E5C  00071DCC00071FA6          DC.B      $00,$07,$1D,$CC,$00,$07,$1F,$A6 
070E64  00071EE400000000          DC.B      $00,$07,$1E,$E4,$00,$00,$00,$00 
070E6C                            DCB.W     4,0 
070E74  FF0000070CFA0007          DC.B      $FF,$00,$00,$07,$0C,$FA,$00,$07 
070E7C  0D0600070D160007          DC.B      $0D,$06,$00,$07,$0D,$16,$00,$07 
070E84  0D1E00070D4C0007          DC.B      $0D,$1E,$00,$07,$0D,$4C,$00,$07 
070E8C  0D6000070D6E0007          DC.B      $0D,$60,$00,$07,$0D,$6E,$00,$07 
070E94  0E2C00070D760007          DC.B      $0E,$2C,$00,$07,$0D,$76,$00,$07 
070E9C  0D9C00070DC80007          DC.B      $0D,$9C,$00,$07,$0D,$C8,$00,$07 
070EA4  0DD000070DE00007          DC.B      $0D,$D0,$00,$07,$0D,$E0,$00,$07 
070EAC  0DE800070DFC0007          DC.B      $0D,$E8,$00,$07,$0D,$FC,$00,$07 
070EB4  0E0600070D260007          DC.B      $0E,$06,$00,$07,$0D,$26,$00,$07 
070EBC  0E3C00070E340000          DC.B      $0E,$3C,$00,$07,$0E,$34,$00,$00 
070EC4                            DCB.W     3,0 
070ECA  0100000000000000          DC.B      $01,$00,$00,$00,$00,$00,$00,$00 
070ED2  FDF5E80000000000          DC.B      $FD,$F5,$E8,$00,$00,$00,$00,$00 
070EDA  0000010000000200          DC.B      $00,$00,$01,$00,$00,$00,$02,$00 
070EE2  0000050048153700          DC.B      $00,$00,$05,$00,$48,$15,$37,$00 
070EEA                            DCB.W     2,0 
070EEE  0037010000000000          DC.B      $00,$37,$01,$00,$00,$00,$00,$00 
070EF6  0709030000000000          DC.B      $07,$09,$03,$00,$00,$00,$00,$00 
070EFE  0101000001010100          DC.B      $01,$01,$00,$00,$01,$01,$01,$00 
070F06  0B0F0D0003000A00          DC.B      $0B,$0F,$0D,$00,$03,$00,$0A,$00 
070F0E  00FBFE0000000000          DC.B      $00,$FB,$FE,$00,$00,$00,$00,$00 
070F16  0000040000022000          DC.B      $00,$00,$04,$00,$00,$02,$20,$00 
070F1E  FFFFFF0008102000          DC.B      $FF,$FF,$FF,$00,$08,$10,$20,$00 
070F26  FCFCFE00FFFFFF00          DC.B      $FC,$FC,$FE,$00,$FF,$FF,$FF,$00 
070F2E  0A0E0C00FFFFFF00          DC.B      $0A,$0E,$0C,$00,$FF,$FF,$FF,$00 
070F36  0002000000000000          DC.B      $00,$02,$00,$00,$00,$00,$00,$00 
070F3E  FFFFFF0000071F13          DC.B      $FF,$FF,$FF,$00,$00,$07,$1F,$13 
070F46  00071FC300071F73          DC.B      $00,$07,$1F,$C3,$00,$07,$1F,$73 
070F4E                            DCB.W     2,0 
070F52  00071E8C00071C2F          DC.B      $00,$07,$1E,$8C,$00,$07,$1C,$2F 
070F5A  00071F6E00000000          DC.B      $00,$07,$1F,$6E,$00,$00,$00,$00 
070F62                            DCB.W     8,0 
070F72  00070E4800070E58          DC.B      $00,$07,$0E,$48,$00,$07,$0E,$58 
070F7A  00070E6000000000          DC.B      $00,$07,$0E,$60,$00,$00,$00,$00 
070F82  00000100AAAA0000          DC.B      $00,$00,$01,$00,$AA,$AA,$00,$00 
070F8A  00350238008E0000          DC.B      $00,$35,$02,$38,$00,$8E,$00,$00 
070F92                            DCB.W     5,0 
070F9C  0200080220000201          DC.B      $02,$00,$08,$02,$20,$00,$02,$01 
070FA4  0100000001000000          DC.B      $01,$00,$00,$00,$01,$00,$00,$00 
070FAC  000000010A000000          DC.B      $00,$00,$00,$01,$0A,$00,$00,$00 
070FB4                            DCB.W     391,0 
0712C2  00020006890A0C4A    L0048:DC.B      $00,$02,$00,$06,$89,$0A,$0C,$4A 
0712CA  000036092D121B24          DC.B      $00,$00,$36,$09,$2D,$12,$1B,$24 
0712D2  0EEE0E180D4D0C8E          DC.B      $0E,$EE,$0E,$18,$0D,$4D,$0C,$8E 
0712DA  0BDA0B2F0A8F09F7          DC.B      $0B,$DA,$0B,$2F,$0A,$8F,$09,$F7 
0712E2  096808E1086107E9          DC.B      $09,$68,$08,$E1,$08,$61,$07,$E9 
0712EA  0777070C06A70647          DC.B      $07,$77,$07,$0C,$06,$A7,$06,$47 
0712F2  05ED0598054704FC          DC.B      $05,$ED,$05,$98,$05,$47,$04,$FC 
0712FA  04B40470043103F4          DC.B      $04,$B4,$04,$70,$04,$31,$03,$F4 
071302  03BC038603530324          DC.B      $03,$BC,$03,$86,$03,$53,$03,$24 
07130A  02F602CC02A4027E          DC.B      $02,$F6,$02,$CC,$02,$A4,$02,$7E 
071312  025A0238021801FA          DC.B      $02,$5A,$02,$38,$02,$18,$01,$FA 
07131A  01DE01C301AA0192          DC.B      $01,$DE,$01,$C3,$01,$AA,$01,$92 
071322  017B01660152013F          DC.B      $01,$7B,$01,$66,$01,$52,$01,$3F 
07132A  012D011C010C00FD          DC.B      $01,$2D,$01,$1C,$01,$0C,$00,$FD 
071332  00EF00E100D500C9          DC.B      $00,$EF,$00,$E1,$00,$D5,$00,$C9 
07133A  00BE00B300A9009F          DC.B      $00,$BE,$00,$B3,$00,$A9,$00,$9F 
071342  0096008E0086007F          DC.B      $00,$96,$00,$8E,$00,$86,$00,$7F 
07134A  00770071006A0064          DC.B      $00,$77,$00,$71,$00,$6A,$00,$64 
071352  005F005900540050          DC.B      $00,$5F,$00,$59,$00,$54,$00,$50 
07135A  004B00470043003F          DC.B      $00,$4B,$00,$47,$00,$43,$00,$3F 
071362  003C003800350032          DC.B      $00,$3C,$00,$38,$00,$35,$00,$32 
07136A  002F002D002A0028          DC.B      $00,$2F,$00,$2D,$00,$2A,$00,$28 
071372  0026002400220020          DC.B      $00,$26,$00,$24,$00,$22,$00,$20 
07137A  001E001C001B0019          DC.B      $00,$1E,$00,$1C,$00,$1B,$00,$19 
071382  0018001600150014          DC.B      $00,$18,$00,$16,$00,$15,$00,$14 
07138A  0013001200110010          DC.B      $00,$13,$00,$12,$00,$11,$00,$10 
071392  4016070B6302DA07          DC.B      $40,$16,$07,$0B,$63,$02,$DA,$07 
07139A  980A620262026202          DC.B      $98,$0A,$62,$02,$62,$02,$62,$02 
0713A2  8B15070008000900          DC.B      $8B,$15,$07,$00,$08,$00,$09,$00 
0713AA  4E036008010B660C          DC.B      $4E,$03,$60,$08,$01,$0B,$66,$0C 
0713B2  680EB811B1150700          DC.B      $68,$0E,$B8,$11,$B1,$15,$07,$00 
0713BA  080009004505C608          DC.B      $08,$00,$09,$00,$45,$05,$C6,$08 
0713C2  3D0BDB0C280F5012          DC.B      $3D,$0B,$DB,$0C,$28,$0F,$50,$12 
0713CA  D415070008000900          DC.B      $D4,$15,$07,$00,$08,$00,$09,$00 
0713D2  56005A005E006200          DC.B      $56,$00,$5A,$00,$5E,$00,$62,$00 
0713DA  6C00700074007800          DC.B      $6C,$00,$70,$00,$74,$00,$78,$00 
0713E2  7C00800084000088          DC.B      $7C,$00,$80,$00,$84,$00,$00,$88 
0713EA  00FF00A400FF00C8          DC.B      $00,$FF,$00,$A4,$00,$FF,$00,$C8 
0713F2  00FF00E300020401          DC.B      $00,$FF,$00,$E3,$00,$02,$04,$01 
0713FA  042701FF004E01FF          DC.B      $04,$27,$01,$FF,$00,$4E,$01,$FF 
071402  007001FF00B301FF          DC.B      $00,$70,$01,$FF,$00,$B3,$01,$FF 
07140A  00D801FF00F601FF          DC.B      $00,$D8,$01,$FF,$00,$F6,$01,$FF 
071412  002202FF003902FF          DC.B      $00,$22,$02,$FF,$00,$39,$02,$FF 
07141A  8D0107000191FF92          DC.B      $8D,$01,$07,$00,$01,$91,$FF,$92 
071422  FF8A0188070889F0          DC.B      $FF,$8A,$01,$88,$07,$08,$89,$F0 
07142A  03013C018008410A          DC.B      $03,$01,$3C,$01,$80,$08,$41,$0A 
071432  8A0081838D000000          DC.B      $8A,$00,$81,$83,$8D,$00,$00,$00 
07143A  0091FF92FF8A0188          DC.B      $00,$91,$FF,$92,$FF,$8A,$01,$88 
071442  070188061F89C001          DC.B      $07,$01,$88,$06,$1F,$89,$C0,$01 
07144A  01500E8990010150          DC.B      $01,$50,$0E,$89,$90,$01,$01,$50 
071452  0E890000011E0283          DC.B      $0E,$89,$00,$00,$01,$1E,$02,$83 
07145A  8D0101000091FF92          DC.B      $8D,$01,$01,$00,$00,$91,$FF,$92 
071462  FF8A0188070889CC          DC.B      $FF,$8A,$01,$88,$07,$08,$89,$CC 
07146A  0001500A89000001          DC.B      $00,$01,$50,$0A,$89,$00,$00,$01 
071472  5A02838D01010001          DC.B      $5A,$02,$83,$8D,$01,$01,$00,$01 
07147A  91FF92FF8A018807          DC.B      $91,$FF,$92,$FF,$8A,$01,$88,$07 
071482  0889EE00014B1E88          DC.B      $08,$89,$EE,$00,$01,$4B,$1E,$88 
07148A  070188061F89E007          DC.B      $07,$01,$88,$06,$1F,$89,$E0,$07 
071492  015A80838D010100          DC.B      $01,$5A,$80,$83,$8D,$01,$01,$00 
07149A  0191FF92FF8A0189          DC.B      $01,$91,$FF,$92,$FF,$8A,$01,$89 
0714A2  BB0001880712320A          DC.B      $BB,$00,$01,$88,$07,$12,$32,$0A 
0714AA  8807104B1E880702          DC.B      $88,$07,$10,$4B,$1E,$88,$07,$02 
0714B2  89B007015A80838D          DC.B      $89,$B0,$07,$01,$5A,$80,$83,$8D 
0714BA  010100018B000000          DC.B      $01,$01,$00,$01,$8B,$00,$00,$00 
0714C2  91FF92FF8A018807          DC.B      $91,$FF,$92,$FF,$8A,$01,$88,$07 
0714CA  2489880001321488          DC.B      $24,$89,$88,$00,$01,$32,$14,$88 
0714D2  07204B1E88070489          DC.B      $07,$20,$4B,$1E,$88,$07,$04,$89 
0714DA  8007015A80838D00          DC.B      $80,$07,$01,$5A,$80,$83,$8D,$00 
0714E2  000000911492FF8A          DC.B      $00,$00,$00,$91,$14,$92,$FF,$8A 
0714EA  0188070889EE0001          DC.B      $01,$88,$07,$08,$89,$EE,$00,$01 
0714F2  80033C328191FF48          DC.B      $80,$03,$3C,$32,$81,$91,$FF,$48 
0714FA  3289000001480483          DC.B      $32,$89,$00,$00,$01,$48,$04,$83 
071502  8D0000000091FF92          DC.B      $8D,$00,$00,$00,$00,$91,$FF,$92 
07150A  FF8B0000008A0188          DC.B      $FF,$8B,$00,$00,$00,$8A,$01,$88 
071512  070189EE00018806          DC.B      $07,$01,$89,$EE,$00,$01,$88,$06 
07151A  0F500488061E5014          DC.B      $0F,$50,$04,$88,$06,$1E,$50,$14 
071522  89E0010288061B50          DC.B      $89,$E0,$01,$02,$88,$06,$1B,$50 
07152A  048A008806195004          DC.B      $04,$8A,$00,$88,$06,$19,$50,$04 
071532  8806175004880615          DC.B      $88,$06,$17,$50,$04,$88,$06,$15 
07153A  50048A0189000001          DC.B      $50,$04,$8A,$01,$89,$00,$00,$01 
071542  1E04838D00000000          DC.B      $1E,$04,$83,$8D,$00,$00,$00,$00 
07154A  8B000000910692FF          DC.B      $8B,$00,$00,$00,$91,$06,$92,$FF 
071552  8A0188070889F001          DC.B      $8A,$01,$88,$07,$08,$89,$F0,$01 
07155A  01460C91FF4D0648          DC.B      $01,$46,$0C,$91,$FF,$4D,$06,$48 
071562  0C89000001480483          DC.B      $0C,$89,$00,$00,$01,$48,$04,$83 
07156A  8D0101000091FF92          DC.B      $8D,$01,$01,$00,$00,$91,$FF,$92 
071572  FF8A0188070889D0          DC.B      $FF,$8A,$01,$88,$07,$08,$89,$D0 
07157A  0101800550068189          DC.B      $01,$01,$80,$05,$50,$06,$81,$89 
071582  0000015004838D00          DC.B      $00,$00,$01,$50,$04,$83,$8D,$00 
07158A  00000091FF92FF8A          DC.B      $00,$00,$00,$91,$FF,$92,$FF,$8A 
071592  0188070889C00301          DC.B      $01,$88,$07,$08,$89,$C0,$03,$01 
07159A  8B07020280082D04          DC.B      $8B,$07,$02,$02,$80,$08,$2D,$04 
0715A2  8A00310432043904          DC.B      $8A,$00,$31,$04,$32,$04,$39,$04 
0715AA  3D043E04818B0000          DC.B      $3D,$04,$3E,$04,$81,$8B,$00,$00 
0715B2  00838D0119000091          DC.B      $00,$83,$8D,$01,$19,$00,$00,$91 
0715BA  FF92FF8A01880708          DC.B      $FF,$92,$FF,$8A,$01,$88,$07,$08 
0715C2  89CC0001190C9034          DC.B      $89,$CC,$00,$01,$19,$0C,$90,$34 
0715CA  028D0000000091FF          DC.B      $02,$8D,$00,$00,$00,$00,$91,$FF 
0715D2  92FF8A0188070889          DC.B      $92,$FF,$8A,$01,$88,$07,$08,$89 
0715DA  CC0001140420042C          DC.B      $CC,$00,$01,$14,$04,$20,$04,$2C 
0715E2  043804160422042E          DC.B      $04,$38,$04,$16,$04,$22,$04,$2E 
0715EA  043A048900000114          DC.B      $04,$3A,$04,$89,$00,$00,$01,$14 
0715F2  04838391FF92FF8A          DC.B      $04,$83,$83,$91,$FF,$92,$FF,$8A 
0715FA  0189DD0001880708          DC.B      $01,$89,$DD,$00,$01,$88,$07,$08 
071602  841C078603842E07          DC.B      $84,$1C,$07,$86,$03,$84,$2E,$07 
07160A  80028602842E0786          DC.B      $80,$02,$86,$02,$84,$2E,$07,$86 
071612  FD842E0781860082          DC.B      $FD,$84,$2E,$07,$81,$86,$00,$82 
07161A  0289F00201800784          DC.B      $02,$89,$F0,$02,$01,$80,$07,$84 
071622  B40784D50684E606          DC.B      $B4,$07,$84,$D5,$06,$84,$E6,$06 
07162A  84D50684E60684D5          DC.B      $84,$D5,$06,$84,$E6,$06,$84,$D5 
071632  0684D5068BF40101          DC.B      $06,$84,$D5,$06,$8B,$F4,$01,$01 
07163A  81800284C70784D5          DC.B      $81,$80,$02,$84,$C7,$07,$84,$D5 
071642  0684E60684D50684          DC.B      $06,$84,$E6,$06,$84,$D5,$06,$84 
07164A  E60684D50684D506          DC.B      $E6,$06,$84,$D5,$06,$84,$D5,$06 
071652  8184C70786078499          DC.B      $81,$84,$C7,$07,$86,$07,$84,$99 
07165A  0684990684AA0686          DC.B      $06,$84,$99,$06,$84,$AA,$06,$86 
071662  0584990684990684          DC.B      $05,$84,$99,$06,$84,$99,$06,$84 
07166A  AA068004860384B4          DC.B      $AA,$06,$80,$04,$86,$03,$84,$B4 
071672  07860184C7078180          DC.B      $07,$86,$01,$84,$C7,$07,$81,$80 
07167A  0286FF84B4078601          DC.B      $02,$86,$FF,$84,$B4,$07,$86,$01 
071682  84C7078180048603          DC.B      $84,$C7,$07,$81,$80,$04,$86,$03 
07168A  84B407860184C707          DC.B      $84,$B4,$07,$86,$01,$84,$C7,$07 
071692  818B000000800286          DC.B      $81,$8B,$00,$00,$00,$80,$02,$86 
07169A  F784B40786F584C7          DC.B      $F7,$84,$B4,$07,$86,$F5,$84,$C7 
0716A2  0786F384B40786F5          DC.B      $07,$86,$F3,$84,$B4,$07,$86,$F5 
0716AA  84C7078188070982          DC.B      $84,$C7,$07,$81,$88,$07,$09,$82 
0716B2  00320F88070889BB          DC.B      $00,$32,$0F,$88,$07,$08,$89,$BB 
0716BA  0001820480038605          DC.B      $00,$01,$82,$04,$80,$03,$86,$05 
0716C2  842E078603842E07          DC.B      $84,$2E,$07,$86,$03,$84,$2E,$07 
0716CA  8189B00F01800286          DC.B      $81,$89,$B0,$0F,$01,$80,$02,$86 
0716D2  05844F078603844F          DC.B      $05,$84,$4F,$07,$86,$03,$84,$4F 
0716DA  07818807098391FF          DC.B      $07,$81,$88,$07,$09,$83,$91,$FF 
0716E2  92FF8A0188071232          DC.B      $92,$FF,$8A,$01,$88,$07,$12,$32 
0716EA  0F88071089AA0001          DC.B      $0F,$88,$07,$10,$89,$AA,$00,$01 
0716F2  841C078603842E07          DC.B      $84,$1C,$07,$86,$03,$84,$2E,$07 
0716FA  8602842E0786FD84          DC.B      $86,$02,$84,$2E,$07,$86,$FD,$84 
071702  2E078602842E0786          DC.B      $2E,$07,$86,$02,$84,$2E,$07,$86 
07170A  FD444544403D3B39          DC.B      $FD,$44,$45,$44,$40,$3D,$3B,$39 
071712  3834312F2D2C2825          DC.B      $38,$34,$31,$2F,$2D,$2C,$28,$25 
07171A  23212325282C2D2F          DC.B      $23,$21,$23,$25,$28,$2C,$2D,$2F 
071722  313438393B820039          DC.B      $31,$34,$38,$39,$3B,$82,$00,$39 
07172A  0189DD0001820480          DC.B      $01,$89,$DD,$00,$01,$82,$04,$80 
071732  02860284930786FD          DC.B      $02,$86,$02,$84,$93,$07,$86,$FD 
07173A  8493078B0C010381          DC.B      $84,$93,$07,$8B,$0C,$01,$03,$81 
071742  82008C0289FF0001          DC.B      $82,$00,$8C,$02,$89,$FF,$00,$01 
07174A  8B00000086008D10          DC.B      $8B,$00,$00,$00,$86,$00,$8D,$10 
071752  03030080023A0838          DC.B      $03,$03,$00,$80,$02,$3A,$08,$38 
07175A  0836083808360835          DC.B      $08,$36,$08,$38,$08,$36,$08,$35 
071762  0833103510361033          DC.B      $08,$33,$10,$35,$10,$36,$10,$33 
07176A  0831082F10311033          DC.B      $08,$31,$08,$2F,$10,$31,$10,$33 
071772  0831103618381035          DC.B      $08,$31,$10,$36,$18,$38,$10,$35 
07177A  103D20818C0089EE          DC.B      $10,$3D,$20,$81,$8C,$00,$89,$EE 
071782  00018B1301FF8005          DC.B      $00,$01,$8B,$13,$01,$FF,$80,$05 
07178A  3D083A083608813A          DC.B      $3D,$08,$3A,$08,$36,$08,$81,$3A 
071792  0880053D08380835          DC.B      $08,$80,$05,$3D,$08,$38,$08,$35 
07179A  0881380880053A08          DC.B      $08,$81,$38,$08,$80,$05,$3A,$08 
0717A2  3608330881360880          DC.B      $36,$08,$33,$08,$81,$36,$08,$80 
0717AA  0538083508310881          DC.B      $05,$38,$08,$35,$08,$31,$08,$81 
0717B2  3508914036603820          DC.B      $35,$08,$91,$40,$36,$60,$38,$20 
0717BA  3560312033403410          DC.B      $35,$60,$31,$20,$33,$40,$34,$10 
0717C2  3310362035403140          DC.B      $33,$10,$36,$20,$35,$40,$31,$40 
0717CA  3660382035603120          DC.B      $36,$60,$38,$20,$35,$60,$31,$20 
0717D2  3340341033103420          DC.B      $33,$40,$34,$10,$33,$10,$34,$20 
0717DA  91FF3680820486FE          DC.B      $91,$FF,$36,$80,$82,$04,$86,$FE 
0717E2  84930786FC849307          DC.B      $84,$93,$07,$86,$FC,$84,$93,$07 
0717EA  8B00000086008200          DC.B      $8B,$00,$00,$00,$86,$00,$82,$00 
0717F2  8999CC008D000000          DC.B      $89,$99,$CC,$00,$8D,$00,$00,$00 
0717FA  008B3C020E128013          DC.B      $00,$8B,$3C,$02,$0E,$12,$80,$13 
071802  808B00000089EE00          DC.B      $80,$8B,$00,$00,$00,$89,$EE,$00 
07180A  0180024220431042          DC.B      $01,$80,$02,$42,$20,$43,$10,$42 
071812  103E204220401D3E          DC.B      $10,$3E,$20,$42,$20,$40,$1D,$3E 
07181A  033B1D3C033E1D3B          DC.B      $03,$3B,$1D,$3C,$03,$3E,$1D,$3B 
071822  03392086F48B1301          DC.B      $03,$39,$20,$86,$F4,$8B,$13,$01 
07182A  0F818B0000008600          DC.B      $0F,$81,$8B,$00,$00,$00,$86,$00 
071832  8C0189AE00008D20          DC.B      $8C,$01,$89,$AE,$00,$00,$8D,$20 
07183A  0103003980372039          DC.B      $01,$03,$00,$39,$80,$37,$20,$39 
071842  203520372039403A          DC.B      $20,$35,$20,$37,$20,$39,$40,$3A 
07184A  403C40374089E00F          DC.B      $40,$3C,$40,$37,$40,$89,$E0,$0F 
071852  018BF403028D0000          DC.B      $01,$8B,$F4,$03,$02,$8D,$00,$00 
07185A  00008C0039803720          DC.B      $00,$00,$8C,$00,$39,$80,$37,$20 
071862  3920362037203940          DC.B      $39,$20,$36,$20,$37,$20,$39,$40 
07186A  3B403C4037408B18          DC.B      $3B,$40,$3C,$40,$37,$40,$8B,$18 
071872  020189E00A018240          DC.B      $02,$01,$89,$E0,$0A,$01,$82,$40 
07187A  3632342F312D2F2B          DC.B      $36,$32,$34,$2F,$31,$2D,$2F,$2B 
071882  820489EE00018002          DC.B      $82,$04,$89,$EE,$00,$01,$80,$02 
07188A  8B0000008605842E          DC.B      $8B,$00,$00,$00,$86,$05,$84,$2E 
071892  078B1301FF860384          DC.B      $07,$8B,$13,$01,$FF,$86,$03,$84 
07189A  93078B0000008601          DC.B      $93,$07,$8B,$00,$00,$00,$86,$01 
0718A2  842E078B1301FF86          DC.B      $84,$2E,$07,$8B,$13,$01,$FF,$86 
0718AA  03849307818B0000          DC.B      $03,$84,$93,$07,$81,$8B,$00,$00 
0718B2  0082048003860584          DC.B      $00,$82,$04,$80,$03,$86,$05,$84 
0718BA  2E078603842E0781          DC.B      $2E,$07,$86,$03,$84,$2E,$07,$81 
0718C2  89E00F0180028605          DC.B      $89,$E0,$0F,$01,$80,$02,$86,$05 
0718CA  844F078603844F07          DC.B      $84,$4F,$07,$86,$03,$84,$4F,$07 
0718D2  818807128391FF92          DC.B      $81,$88,$07,$12,$83,$91,$FF,$92 
0718DA  FF8A01880724321E          DC.B      $FF,$8A,$01,$88,$07,$24,$32,$1E 
0718E2  8806198807008988          DC.B      $88,$06,$19,$88,$07,$00,$89,$88 
0718EA  0001841C07860344          DC.B      $00,$01,$84,$1C,$07,$86,$03,$44 
0718F2  4544403D3B393834          DC.B      $45,$44,$40,$3D,$3B,$39,$38,$34 
0718FA  312F2D2C28252321          DC.B      $31,$2F,$2D,$2C,$28,$25,$23,$21 
071902  2325288200340289          DC.B      $23,$25,$28,$82,$00,$34,$02,$89 
07190A  90200086001E1088          DC.B      $90,$20,$00,$86,$00,$1E,$10,$88 
071912  072088060F89F002          DC.B      $07,$20,$88,$06,$0F,$89,$F0,$02 
07191A  018F01040101801C          DC.B      $01,$8F,$01,$04,$01,$01,$80,$1C 
071922  84620681800286FB          DC.B      $84,$62,$06,$81,$80,$02,$86,$FB 
07192A  8462068462068600          DC.B      $84,$62,$06,$84,$62,$06,$86,$00 
071932  8462068462068186          DC.B      $84,$62,$06,$84,$62,$06,$81,$86 
07193A  FE84620684620686          DC.B      $FE,$84,$62,$06,$84,$62,$06,$86 
071942  0084620684620686          DC.B      $00,$84,$62,$06,$84,$62,$06,$86 
07194A  FE84790684790686          DC.B      $FE,$84,$79,$06,$84,$79,$06,$86 
071952  0084790684790686          DC.B      $00,$84,$79,$06,$84,$79,$06,$86 
07195A  FE84790684790686          DC.B      $FE,$84,$79,$06,$84,$79,$06,$86 
071962  0084620686FE8462          DC.B      $00,$84,$62,$06,$86,$FE,$84,$62 
07196A  06800886FC846206          DC.B      $06,$80,$08,$86,$FC,$84,$62,$06 
071972  8462068186F88462          DC.B      $84,$62,$06,$81,$86,$F8,$84,$62 
07197A  0684620686F78462          DC.B      $06,$84,$62,$06,$86,$F7,$84,$62 
071982  0684620686F88462          DC.B      $06,$84,$62,$06,$86,$F8,$84,$62 
07198A  0684620686FA8462          DC.B      $06,$84,$62,$06,$86,$FA,$84,$62 
071992  0686F78462068004          DC.B      $06,$86,$F7,$84,$62,$06,$80,$04 
07199A  86FC846206846206          DC.B      $86,$FC,$84,$62,$06,$84,$62,$06 
0719A2  81800286FC847906          DC.B      $81,$80,$02,$86,$FC,$84,$79,$06 
0719AA  84790686FA847906          DC.B      $84,$79,$06,$86,$FA,$84,$79,$06 
0719B2  84790681800286FC          DC.B      $84,$79,$06,$81,$80,$02,$86,$FC 
0719BA  8462068462068462          DC.B      $84,$62,$06,$84,$62,$06,$84,$62 
0719C2  0684620686F88462          DC.B      $06,$84,$62,$06,$86,$F8,$84,$62 
0719CA  0684620686038462          DC.B      $06,$84,$62,$06,$86,$03,$84,$62 
0719D2  068462068186FC80          DC.B      $06,$84,$62,$06,$81,$86,$FC,$80 
0719DA  101208120884F306          DC.B      $10,$12,$08,$12,$08,$84,$F3,$06 
0719E2  10088189F00F0180          DC.B      $10,$08,$81,$89,$F0,$0F,$01,$80 
0719EA  0412808A00818807          DC.B      $04,$12,$80,$8A,$00,$81,$88,$07 
0719F2  24831208120884F3          DC.B      $24,$83,$12,$08,$12,$08,$84,$F3 
0719FA  0619041904120812          DC.B      $06,$19,$04,$19,$04,$12,$08,$12 
071A02  0884F3061E041904          DC.B      $08,$84,$F3,$06,$1E,$04,$19,$04 
071A0A  851208120884F306          DC.B      $85,$12,$08,$12,$08,$84,$F3,$06 
071A12  8807241204190412          DC.B      $88,$07,$24,$12,$04,$19,$04,$12 
071A1A  08120884F3068807          DC.B      $08,$12,$08,$84,$F3,$06,$88,$07 
071A22  241E041904880720          DC.B      $24,$1E,$04,$19,$04,$88,$07,$20 
071A2A  853A8A003B3F423A          DC.B      $85,$3A,$8A,$00,$3B,$3F,$42,$3A 
071A32  3B3F423A3B3F428A          DC.B      $3B,$3F,$42,$3A,$3B,$3F,$42,$8A 
071A3A  01853A8A003B3F42          DC.B      $01,$85,$3A,$8A,$00,$3B,$3F,$42 
071A42  3A3B3F428A018536          DC.B      $3A,$3B,$3F,$42,$8A,$01,$85,$36 
071A4A  8A003B3F42363B3F          DC.B      $8A,$00,$3B,$3F,$42,$36,$3B,$3F 
071A52  42363B3F428A0185          DC.B      $42,$36,$3B,$3F,$42,$8A,$01,$85 
071A5A  368A003B3F42363B          DC.B      $36,$8A,$00,$3B,$3F,$42,$36,$3B 
071A62  3F428A0185388A00          DC.B      $3F,$42,$8A,$01,$85,$38,$8A,$00 
071A6A  3A3D41383A3D4138          DC.B      $3A,$3D,$41,$38,$3A,$3D,$41,$38 
071A72  3A3D418A0185388A          DC.B      $3A,$3D,$41,$8A,$01,$85,$38,$8A 
071A7A  003A3D41383A3D41          DC.B      $00,$3A,$3D,$41,$38,$3A,$3D,$41 
071A82  8A01858807008F00          DC.B      $8A,$01,$85,$88,$07,$00,$8F,$00 
071A8A  88060989F001018E          DC.B      $88,$06,$09,$89,$F0,$01,$01,$8E 
071A92  8D0114000126088D          DC.B      $8D,$01,$14,$00,$01,$26,$08,$8D 
071A9A                            DCB.W     2,0 
071A9E  88072089F0020188          DC.B      $88,$07,$20,$89,$F0,$02,$01,$88 
071AA6  060F8F0104010185          DC.B      $06,$0F,$8F,$01,$04,$01,$01,$85 
071AAE  82048609842E0786          DC.B      $82,$04,$86,$09,$84,$2E,$07,$86 
071AB6  07842E078605842E          DC.B      $07,$84,$2E,$07,$86,$05,$84,$2E 
071ABE  0785444544403D3B          DC.B      $07,$85,$44,$45,$44,$40,$3D,$3B 
071AC6  393834312F2D2C28          DC.B      $39,$38,$34,$31,$2F,$2D,$2C,$28 
071ACE  2523212325282C2D          DC.B      $25,$23,$21,$23,$25,$28,$2C,$2D 
071AD6  2F313438393B3D40          DC.B      $2F,$31,$34,$38,$39,$3B,$3D,$40 
071ADE  444585448A004544          DC.B      $44,$45,$85,$44,$8A,$00,$45,$44 
071AE6  403D3B393834312F          DC.B      $40,$3D,$3B,$39,$38,$34,$31,$2F 
071AEE  2D2C282523212325          DC.B      $2D,$2C,$28,$25,$23,$21,$23,$25 
071AF6  282C2D2F31343839          DC.B      $28,$2C,$2D,$2F,$31,$34,$38,$39 
071AFE  3B3D404445854345          DC.B      $3B,$3D,$40,$44,$45,$85,$43,$45 
071B06  43403C3B39373430          DC.B      $43,$40,$3C,$3B,$39,$37,$34,$30 
071B0E  2F2D2B2824232123          DC.B      $2F,$2D,$2B,$28,$24,$23,$21,$23 
071B16  24282B2D2F303437          DC.B      $24,$28,$2B,$2D,$2F,$30,$34,$37 
071B1E  393B3C4043458525          DC.B      $39,$3B,$3C,$40,$43,$45,$85,$25 
071B26  212321252328252C          DC.B      $21,$23,$21,$25,$23,$28,$25,$2C 
071B2E  282D2C2F2D312F34          DC.B      $28,$2D,$2C,$2F,$2D,$31,$2F,$34 
071B36  31383439383B393D          DC.B      $31,$38,$34,$39,$38,$3B,$39,$3D 
071B3E  3B403D4440454485          DC.B      $3B,$40,$3D,$44,$40,$45,$44,$85 
071B46  84990684AA068499          DC.B      $84,$99,$06,$84,$AA,$06,$84,$99 
071B4E  0684AA0684990684          DC.B      $06,$84,$AA,$06,$84,$99,$06,$84 
071B56  99068584B70684C8          DC.B      $99,$06,$85,$84,$B7,$06,$84,$C8 
071B5E  0684B70684C80684          DC.B      $06,$84,$B7,$06,$84,$C8,$06,$84 
071B66  B70684B706858A01          DC.B      $B7,$06,$84,$B7,$06,$85,$8A,$01 
071B6E  91FF920189EE0001          DC.B      $91,$FF,$92,$01,$89,$EE,$00,$01 
071B76  8807083A0C380691          DC.B      $88,$07,$08,$3A,$0C,$38,$06,$91 
071B7E  063A2A91FF89BB00          DC.B      $06,$3A,$2A,$91,$FF,$89,$BB,$00 
071B86  018D120203009106          DC.B      $01,$8D,$12,$02,$03,$00,$91,$06 
071B8E  3A123F1291FF3C3C          DC.B      $3A,$12,$3F,$12,$91,$FF,$3C,$3C 
071B96  89EE00012E06331E          DC.B      $89,$EE,$00,$01,$2E,$06,$33,$1E 
071B9E  310C300691062E0C          DC.B      $31,$0C,$30,$06,$91,$06,$2E,$0C 
071BA6  91FF2C1291062E0C          DC.B      $91,$FF,$2C,$12,$91,$06,$2E,$0C 
071BAE  91FF89BB00019106          DC.B      $91,$FF,$89,$BB,$00,$01,$91,$06 
071BB6  3A0C3D06410C91FF          DC.B      $3A,$0C,$3D,$06,$41,$0C,$91,$FF 
071BBE  89EE00013F423F0C          DC.B      $89,$EE,$00,$01,$3F,$42,$3F,$0C 
071BC6  3D0C3F0C41C04160          DC.B      $3D,$0C,$3F,$0C,$41,$C0,$41,$60 
071BCE  8D000000008B0103          DC.B      $8D,$00,$00,$00,$00,$8B,$01,$03 
071BD6  0341608B00000084          DC.B      $03,$41,$60,$8B,$00,$00,$00,$84 
071BDE  8E098B18010B848E          DC.B      $8E,$09,$8B,$18,$01,$0B,$84,$8E 
071BE6  098B00000091FF82          DC.B      $09,$8B,$00,$00,$00,$91,$FF,$82 
071BEE  0041188391FF9201          DC.B      $00,$41,$18,$83,$91,$FF,$92,$01 
071BF6  8A0188071089F001          DC.B      $8A,$01,$88,$07,$10,$89,$F0,$01 
071BFE  018F0202010186F9          DC.B      $01,$8F,$02,$02,$01,$01,$86,$F9 
071C06  843609250686FB84          DC.B      $84,$36,$09,$25,$06,$86,$FB,$84 
071C0E  3609230686FE8436          DC.B      $36,$09,$23,$06,$86,$FE,$84,$36 
071C16  09200686FB160C22          DC.B      $09,$20,$06,$86,$FB,$16,$0C,$22 
071C1E  0C84DD09240C190C          DC.B      $0C,$84,$DD,$09,$24,$0C,$19,$0C 
071C26  250C84DD09260C80          DC.B      $25,$0C,$84,$DD,$09,$26,$0C,$80 
071C2E  0386008468092106          DC.B      $03,$86,$00,$84,$68,$09,$21,$06 
071C36  86FD846809250686          DC.B      $86,$FD,$84,$68,$09,$25,$06,$86 
071C3E  F9846809240686FC          DC.B      $F9,$84,$68,$09,$24,$06,$86,$FC 
071C46  8478091D0686FB84          DC.B      $84,$78,$09,$1D,$06,$86,$FB,$84 
071C4E  7809240681860016          DC.B      $78,$09,$24,$06,$81,$86,$00,$16 
071C56  308391FF92018A01          DC.B      $30,$83,$91,$FF,$92,$01,$8A,$01 
071C5E  89D0050188072086          DC.B      $89,$D0,$05,$01,$88,$07,$20,$86 
071C66  F9843B0A84600A86          DC.B      $F9,$84,$3B,$0A,$84,$60,$0A,$86 
071C6E  FB843B0A84600A86          DC.B      $FB,$84,$3B,$0A,$84,$60,$0A,$86 
071C76  FC84160A84600A86          DC.B      $FC,$84,$16,$0A,$84,$60,$0A,$86 
071C7E  FB843B0A843B0A80          DC.B      $FB,$84,$3B,$0A,$84,$3B,$0A,$80 
071C86  03860084160A8416          DC.B      $03,$86,$00,$84,$16,$0A,$84,$16 
071C8E  0A86FD843B0A843B          DC.B      $0A,$86,$FD,$84,$3B,$0A,$84,$3B 
071C96  0A86F984160A8416          DC.B      $0A,$86,$F9,$84,$16,$0A,$84,$16 
071C9E  0A86FC84160A86FB          DC.B      $0A,$86,$FC,$84,$16,$0A,$86,$FB 
071CA6  843B0A8186008202          DC.B      $84,$3B,$0A,$81,$86,$00,$82,$02 
071CAE  92FF398B0C01018F          DC.B      $92,$FF,$39,$8B,$0C,$01,$01,$8F 
071CB6  003A3C3E41393A3C          DC.B      $00,$3A,$3C,$3E,$41,$39,$3A,$3C 
071CBE  3E4139920182003A          DC.B      $3E,$41,$39,$92,$01,$82,$00,$3A 
071CC6  03838F0202010122          DC.B      $03,$83,$8F,$02,$02,$01,$01,$22 
071CCE  0C160C84DD098F00          DC.B      $0C,$16,$0C,$84,$DD,$09,$8F,$00 
071CD6  880712220C880710          DC.B      $88,$07,$12,$22,$0C,$88,$07,$10 
071CDE  8F02020101160C22          DC.B      $8F,$02,$02,$01,$01,$16,$0C,$22 
071CE6  0C84DD098F008807          DC.B      $0C,$84,$DD,$09,$8F,$00,$88,$07 
071CEE  1222068807108F02          DC.B      $12,$22,$06,$88,$07,$10,$8F,$02 
071CF6  020101858F020201          DC.B      $02,$01,$01,$85,$8F,$02,$02,$01 
071CFE  01160C220C84DD09          DC.B      $01,$16,$0C,$22,$0C,$84,$DD,$09 
071D06  8F00220C8F020201          DC.B      $8F,$00,$22,$0C,$8F,$02,$02,$01 
071D0E  01160C220C84DD09          DC.B      $01,$16,$0C,$22,$0C,$84,$DD,$09 
071D16  8F0022068F020201          DC.B      $8F,$00,$22,$06,$8F,$02,$02,$01 
071D1E  01859106410C3F06          DC.B      $01,$85,$91,$06,$41,$0C,$3F,$06 
071D26  3E0C3C0C3A0C3C0C          DC.B      $3E,$0C,$3C,$0C,$3A,$0C,$3C,$0C 
071D2E  911E352A91063206          DC.B      $91,$1E,$35,$2A,$91,$06,$32,$06 
071D36  350C370C3A0C3C06          DC.B      $35,$0C,$37,$0C,$3A,$0C,$3C,$06 
071D3E  3A0C911E3E189106          DC.B      $3A,$0C,$91,$1E,$3E,$18,$91,$06 
071D46  3E063F063E063A0C          DC.B      $3E,$06,$3F,$06,$3E,$06,$3A,$0C 
071D4E  350C370C3506370C          DC.B      $35,$0C,$37,$0C,$35,$06,$37,$0C 
071D56  35063306320C350C          DC.B      $35,$06,$33,$06,$32,$0C,$35,$0C 
071D5E  3606350C310C330C          DC.B      $36,$06,$35,$0C,$31,$0C,$33,$0C 
071D66  310C300C3106330C          DC.B      $31,$0C,$30,$0C,$31,$06,$33,$0C 
071D6E  858E89EE0F018D01          DC.B      $85,$8E,$89,$EE,$0F,$01,$8D,$01 
071D76  130001260C8D0000          DC.B      $13,$00,$01,$26,$0C,$8D,$00,$00 
071D7E  000089F001018582          DC.B      $00,$00,$89,$F0,$01,$01,$85,$82 
071D86  028F0220AAAA3A8B          DC.B      $02,$8F,$02,$20,$AA,$AA,$3A,$8B 
071D8E  0C01018A008F003C          DC.B      $0C,$01,$01,$8A,$00,$8F,$00,$3C 
071D96  3E413A3C3E413A3C          DC.B      $3E,$41,$3A,$3C,$3E,$41,$3A,$3C 
071D9E  3E418A0182008470          DC.B      $3E,$41,$8A,$01,$82,$00,$84,$70 
071DA6  0A85820292FF8F02          DC.B      $0A,$85,$82,$02,$92,$FF,$8F,$02 
071DAE  20AAAA398B0C0101          DC.B      $20,$AA,$AA,$39,$8B,$0C,$01,$01 
071DB6  8A008F003A3C3E41          DC.B      $8A,$00,$8F,$00,$3A,$3C,$3E,$41 
071DBE  393A3C3E41393A8A          DC.B      $39,$3A,$3C,$3E,$41,$39,$3A,$8A 
071DC6  01820084700A8582          DC.B      $01,$82,$00,$84,$70,$0A,$85,$82 
071DCE  0292FF8F0220AAAA          DC.B      $02,$92,$FF,$8F,$02,$20,$AA,$AA 
071DD6  388B0C01018A008F          DC.B      $38,$8B,$0C,$01,$01,$8A,$00,$8F 
071DDE  003C3D41383C3D41          DC.B      $00,$3C,$3D,$41,$38,$3C,$3D,$41 
071DE6  383C3D418A018200          DC.B      $38,$3C,$3D,$41,$8A,$01,$82,$00 
071DEE  84700A858F0220AA          DC.B      $84,$70,$0A,$85,$8F,$02,$20,$AA 
071DF6  AA8807241E188F00          DC.B      $AA,$88,$07,$24,$1E,$18,$8F,$00 
071DFE  84700A858B000000          DC.B      $84,$70,$0A,$85,$8B,$00,$00,$00 
071E06  880704899001008D          DC.B      $88,$07,$04,$89,$90,$01,$00,$8D 
071E0E  01C800FF8806088E          DC.B      $01,$C8,$00,$FF,$88,$06,$08,$8E 
071E16  4918880603880720          DC.B      $49,$18,$88,$06,$03,$88,$07,$20 
071E1E  8D000000008C0089          DC.B      $8D,$00,$00,$00,$00,$8C,$00,$89 
071E26  D00501858A019102          DC.B      $D0,$05,$01,$85,$8A,$01,$91,$02 
071E2E  92FF89D00A018807          DC.B      $92,$FF,$89,$D0,$0A,$01,$88,$07 
071E36  08848D0B848D0B8B          DC.B      $08,$84,$8D,$0B,$84,$8D,$0B,$8B 
071E3E  00000089A9000191          DC.B      $00,$00,$00,$89,$A9,$00,$01,$91 
071E46  FF82068002880708          DC.B      $FF,$82,$06,$80,$02,$88,$07,$08 
071E4E  8600849A0B86FE84          DC.B      $86,$00,$84,$9A,$0B,$86,$FE,$84 
071E56  B30B86F9849A0B86          DC.B      $B3,$0B,$86,$F9,$84,$9A,$0B,$86 
071E5E  FC849A0B8182008C          DC.B      $FC,$84,$9A,$0B,$81,$82,$00,$8C 
071E66  00860089B0090186          DC.B      $00,$86,$00,$89,$B0,$09,$01,$86 
071E6E  008002450C40123D          DC.B      $00,$80,$02,$45,$0C,$40,$12,$3D 
071E76  72430C40123C723E          DC.B      $72,$43,$0C,$40,$12,$3C,$72,$3E 
071E7E  0C3B123672410C3E          DC.B      $0C,$3B,$12,$36,$72,$41,$0C,$3E 
071E86  123972818004845B          DC.B      $12,$39,$72,$81,$80,$04,$84,$5B 
071E8E  0B8190980A8A0191          DC.B      $0B,$81,$90,$98,$0A,$8A,$01,$91 
071E96  FF92FF8806028807          DC.B      $FF,$92,$FF,$88,$06,$02,$88,$07 
071E9E  108F0202010089F0          DC.B      $10,$8F,$02,$02,$01,$00,$89,$F0 
071EA6  010184270C180C17          DC.B      $01,$01,$84,$27,$0C,$18,$0C,$17 
071EAE  0686FB84270C1D0C          DC.B      $06,$86,$FB,$84,$27,$0C,$1D,$0C 
071EB6  1A0686F984270C1C          DC.B      $1A,$06,$86,$F9,$84,$27,$0C,$1C 
071EBE  0C1D0686FE84270C          DC.B      $0C,$1D,$06,$86,$FE,$84,$27,$0C 
071EC6  190C170686009016          DC.B      $19,$0C,$17,$06,$86,$00,$90,$16 
071ECE  0B8A0191FF92FF88          DC.B      $0B,$8A,$01,$91,$FF,$92,$FF,$88 
071ED6  072089D00A018204          DC.B      $07,$20,$89,$D0,$0A,$01,$82,$04 
071EDE  84020C84020C8402          DC.B      $84,$02,$0C,$84,$02,$0C,$84,$02 
071EE6  0C84020C904C0B89          DC.B      $0C,$84,$02,$0C,$90,$4C,$0B,$89 
071EEE  DC0001847A0B89BA          DC.B      $DC,$00,$01,$84,$7A,$0B,$89,$BA 
071EF6  0001847A0B899800          DC.B      $00,$01,$84,$7A,$0B,$89,$98,$00 
071EFE  01847A0B89650001          DC.B      $01,$84,$7A,$0B,$89,$65,$00,$01 
071F06  847A0B4A48858D01          DC.B      $84,$7A,$0B,$4A,$48,$85,$8D,$01 
071F0E  010000480A8D0000          DC.B      $01,$00,$00,$48,$0A,$8D,$00,$00 
071F16  0000891000014A08          DC.B      $00,$00,$89,$10,$00,$01,$4A,$08 
071F1E  8584CC0B84CC0B84          DC.B      $85,$84,$CC,$0B,$84,$CC,$0B,$84 
071F26  CC0B84CC0B852D31          DC.B      $CC,$0B,$84,$CC,$0B,$85,$2D,$31 
071F2E  34393D4045403D39          DC.B      $34,$39,$3D,$40,$45,$40,$3D,$39 
071F36  34312D3134393D40          DC.B      $34,$31,$2D,$31,$34,$39,$3D,$40 
071F3E  45403D393431852D          DC.B      $45,$40,$3D,$39,$34,$31,$85,$2D 
071F46  3236393E4245423E          DC.B      $32,$36,$39,$3E,$42,$45,$42,$3E 
071F4E  3936322D3236393E          DC.B      $39,$36,$32,$2D,$32,$36,$39,$3E 
071F56  4245423E39363285          DC.B      $42,$45,$42,$3E,$39,$36,$32,$85 
071F5E  8008560251108A00          DC.B      $80,$08,$56,$02,$51,$10,$8A,$00 
071F66  818A01858A01800B          DC.B      $81,$8A,$01,$85,$8A,$01,$80,$0B 
071F6E  328A003639813236          DC.B      $32,$8A,$00,$36,$39,$81,$32,$36 
071F76  39858A01800B328A          DC.B      $39,$85,$8A,$01,$80,$0B,$32,$8A 
071F7E  0035398132353985          DC.B      $00,$35,$39,$81,$32,$35,$39,$85 
071F86  8A01800B318A0036          DC.B      $8A,$01,$80,$0B,$31,$8A,$00,$36 
071F8E  3981313639858600          DC.B      $39,$81,$31,$36,$39,$85,$86,$00 
071F96  8B0C020284F40B8B          DC.B      $8B,$0C,$02,$02,$84,$F4,$0B,$8B 
071F9E  05020286FE84D80B          DC.B      $05,$02,$02,$86,$FE,$84,$D8,$0B 
071FA6  8B0C020286FD84E6          DC.B      $8B,$0C,$02,$02,$86,$FD,$84,$E6 
071FAE  0B8B07020286FC84          DC.B      $0B,$8B,$07,$02,$02,$86,$FC,$84 
071FB6  D80B851A0C8A001A          DC.B      $D8,$0B,$85,$1A,$0C,$8A,$00,$1A 
071FBE  068A011A0C260684          DC.B      $06,$8A,$01,$1A,$0C,$26,$06,$84 
071FC6  4A0C1F0C21061A0C          DC.B      $4A,$0C,$1F,$0C,$21,$06,$1A,$0C 
071FCE  8A001A068A011A0C          DC.B      $8A,$00,$1A,$06,$8A,$01,$1A,$0C 
071FD6  2606844A0C8589F0          DC.B      $26,$06,$84,$4A,$0C,$85,$89,$F0 
071FDE  010188070288060A          DC.B      $01,$01,$88,$07,$02,$88,$06,$0A 
071FE6  8E22128B00000088          DC.B      $8E,$22,$12,$8B,$00,$00,$00,$88 
071FEE  071089F001018806          DC.B      $07,$10,$89,$F0,$01,$01,$88,$06 
071FF6  028591FF92FF8807          DC.B      $02,$85,$91,$FF,$92,$FF,$88,$07 
071FFE  108A0189F001018F          DC.B      $10,$8A,$01,$89,$F0,$01,$01,$8F 
072006  02020101800686FD          DC.B      $02,$02,$01,$01,$80,$06,$86,$FD 
07200E  846D0D86FB846D0D          DC.B      $84,$6D,$0D,$86,$FB,$84,$6D,$0D 
072016  818002860084940D          DC.B      $81,$80,$02,$86,$00,$84,$94,$0D 
07201E  86FE84940D86FD84          DC.B      $86,$FE,$84,$94,$0D,$86,$FD,$84 
072026  940D86FB84940D81          DC.B      $94,$0D,$86,$FB,$84,$94,$0D,$81 
07202E  800286FC846D0D84          DC.B      $80,$02,$86,$FC,$84,$6D,$0D,$84 
072036  6D0D846D0D86FA84          DC.B      $6D,$0D,$84,$6D,$0D,$86,$FA,$84 
07203E  BD0D86F784BD0D81          DC.B      $BD,$0D,$86,$F7,$84,$BD,$0D,$81 
072046  800386FA846D0D86          DC.B      $80,$03,$86,$FA,$84,$6D,$0D,$86 
07204E  FC84BD0D86FB84BD          DC.B      $FC,$84,$BD,$0D,$86,$FB,$84,$BD 
072056  0D81800386FA846D          DC.B      $0D,$81,$80,$03,$86,$FA,$84,$6D 
07205E  0D8186FB84BD0D86          DC.B      $0D,$81,$86,$FB,$84,$BD,$0D,$86 
072066  FC84BD0D90780C91          DC.B      $FC,$84,$BD,$0D,$90,$78,$0C,$91 
07206E  FF92018807208A01          DC.B      $FF,$92,$01,$88,$07,$20,$8A,$01 
072076  800484600A818002          DC.B      $80,$04,$84,$60,$0A,$81,$80,$02 
07207E  84240E84440E8180          DC.B      $84,$24,$0E,$84,$44,$0E,$81,$80 
072086  0486FD84D50D86F9          DC.B      $04,$86,$FD,$84,$D5,$0D,$86,$F9 
07208E  84160A86FB84FF0D          DC.B      $84,$16,$0A,$86,$FB,$84,$FF,$0D 
072096  81800286FD843B0A          DC.B      $81,$80,$02,$86,$FD,$84,$3B,$0A 
07209E  84600A86FB843B0A          DC.B      $84,$60,$0A,$86,$FB,$84,$3B,$0A 
0720A6  84600A86FD84CE0D          DC.B      $84,$60,$0A,$86,$FD,$84,$CE,$0D 
0720AE  86FE84D50D818002          DC.B      $86,$FE,$84,$D5,$0D,$81,$80,$02 
0720B6  86F984CE0D86FA84          DC.B      $86,$F9,$84,$CE,$0D,$86,$FA,$84 
0720BE  D50D86FC84D50D86          DC.B      $D5,$0D,$86,$FC,$84,$D5,$0D,$86 
0720C6  F884160A86F984DC          DC.B      $F8,$84,$16,$0A,$86,$F9,$84,$DC 
0720CE  0D81800386FA8416          DC.B      $0D,$81,$80,$03,$86,$FA,$84,$16 
0720D6  0A86FE84DC0D86FC          DC.B      $0A,$86,$FE,$84,$DC,$0D,$86,$FC 
0720DE  84F30986F784F309          DC.B      $84,$F3,$09,$86,$F7,$84,$F3,$09 
0720E6  81800386FA84160A          DC.B      $81,$80,$03,$86,$FA,$84,$16,$0A 
0720EE  84600A8186F784F3          DC.B      $84,$60,$0A,$81,$86,$F7,$84,$F3 
0720F6  0986FC84F30990E4          DC.B      $09,$86,$FC,$84,$F3,$09,$90,$E4 
0720FE  0C160C220C84DD09          DC.B      $0C,$16,$0C,$22,$0C,$84,$DD,$09 
072106  8F0022068F020201          DC.B      $8F,$00,$22,$06,$8F,$02,$02,$01 
07210E  01220616061D0C22          DC.B      $01,$22,$06,$16,$06,$1D,$0C,$22 
072116  0684DD098F002206          DC.B      $06,$84,$DD,$09,$8F,$00,$22,$06 
07211E  8F020201011D0685          DC.B      $8F,$02,$02,$01,$01,$1D,$06,$85 
072126  160C220C84DD0988          DC.B      $16,$0C,$22,$0C,$84,$DD,$09,$88 
07212E  07128F00160C8F02          DC.B      $07,$12,$8F,$00,$16,$0C,$8F,$02 
072136  020101160C880710          DC.B      $02,$01,$01,$16,$0C,$88,$07,$10 
07213E  1D06160684DD098F          DC.B      $1D,$06,$16,$06,$84,$DD,$09,$8F 
072146  00220C8F02020101          DC.B      $00,$22,$0C,$8F,$02,$02,$01,$01 
07214E  85160C220C84DD09          DC.B      $85,$16,$0C,$22,$0C,$84,$DD,$09 
072156  8F00220C8F020201          DC.B      $8F,$00,$22,$0C,$8F,$02,$02,$01 
07215E  0185843B0A843B0A          DC.B      $01,$85,$84,$3B,$0A,$84,$3B,$0A 
072166  8584160A84160A85          DC.B      $85,$84,$16,$0A,$84,$16,$0A,$85 
07216E  82028F0220AAAA8B          DC.B      $82,$02,$8F,$02,$20,$AA,$AA,$8B 
072176  0C01013D8A008F00          DC.B      $0C,$01,$01,$3D,$8A,$00,$8F,$00 
07217E  3D41383A3D41383A          DC.B      $3D,$41,$38,$3A,$3D,$41,$38,$3A 
072186  3D413882008A0184          DC.B      $3D,$41,$38,$82,$00,$8A,$01,$84 
07218E  700A85820292FF8F          DC.B      $70,$0A,$85,$82,$02,$92,$FF,$8F 
072196  0220AAAA388B0C01          DC.B      $02,$20,$AA,$AA,$38,$8B,$0C,$01 
07219E  018A008F003C3E41          DC.B      $01,$8A,$00,$8F,$00,$3C,$3E,$41 
0721A6  383C3E41383C3E41          DC.B      $38,$3C,$3E,$41,$38,$3C,$3E,$41 
0721AE  82008A0184700A85          DC.B      $82,$00,$8A,$01,$84,$70,$0A,$85 
0721B6  89F000018807048F          DC.B      $89,$F0,$00,$01,$88,$07,$04,$8F 
0721BE  0220AAAA550C8807          DC.B      $02,$20,$AA,$AA,$55,$0C,$88,$07 
0721C6  008F005A065A0682          DC.B      $00,$8F,$00,$5A,$06,$5A,$06,$82 
0721CE  0088070484700A85          DC.B      $00,$88,$07,$04,$84,$70,$0A,$85 
0721D6  89F000018807008F          DC.B      $89,$F0,$00,$01,$88,$07,$00,$8F 
0721DE  0220AAAA5A065A06          DC.B      $02,$20,$AA,$AA,$5A,$06,$5A,$06 
0721E6  88060C89F0010188          DC.B      $88,$06,$0C,$89,$F0,$01,$01,$88 
0721EE  07048F00550C8200          DC.B      $07,$04,$8F,$00,$55,$0C,$82,$00 
0721F6  84700A85910592FF          DC.B      $84,$70,$0A,$85,$91,$05,$92,$FF 
0721FE  88071088060589F0          DC.B      $88,$07,$10,$88,$06,$05,$89,$F0 
072206  00018A0182068D01          DC.B      $00,$01,$8A,$01,$82,$06,$8D,$01 
07220E  0A0300800884C30F          DC.B      $0A,$03,$00,$80,$08,$84,$C3,$0F 
072216  818002860384C30F          DC.B      $81,$80,$02,$86,$03,$84,$C3,$0F 
07221E  86FE84C30F860084          DC.B      $86,$FE,$84,$C3,$0F,$86,$00,$84 
072226  C30F860084C30F86          DC.B      $C3,$0F,$86,$00,$84,$C3,$0F,$86 
07222E  0584C30F860384C3          DC.B      $05,$84,$C3,$0F,$86,$03,$84,$C3 
072236  0F860084C30F8600          DC.B      $0F,$86,$00,$84,$C3,$0F,$86,$00 
07223E  84C30F8188071282          DC.B      $84,$C3,$0F,$81,$88,$07,$12,$82 
072246  0088061E5A0C8806          DC.B      $00,$88,$06,$1E,$5A,$0C,$88,$06 
07224E  1A5A0C8806165A0C          DC.B      $1A,$5A,$0C,$88,$06,$16,$5A,$0C 
072256  8806125A0C88060E          DC.B      $88,$06,$12,$5A,$0C,$88,$06,$0E 
07225E  5A0C88060A5A0C88          DC.B      $5A,$0C,$88,$06,$0A,$5A,$0C,$88 
072266  06085A0C8806035A          DC.B      $06,$08,$5A,$0C,$88,$06,$03,$5A 
07226E  0C80088600841610          DC.B      $0C,$80,$08,$86,$00,$84,$16,$10 
072276  84161086FC841610          DC.B      $84,$16,$10,$86,$FC,$84,$16,$10 
07227E  86FB841610818006          DC.B      $86,$FB,$84,$16,$10,$81,$80,$06 
072286  8600841D1086FC84          DC.B      $86,$00,$84,$1D,$10,$86,$FC,$84 
07228E  1D1086FE841D1086          DC.B      $1D,$10,$86,$FE,$84,$1D,$10,$86 
072296  FB841D1081800786          DC.B      $FB,$84,$1D,$10,$81,$80,$07,$86 
07229E  00841D108186FB84          DC.B      $00,$84,$1D,$10,$81,$86,$FB,$84 
0722A6  1D10800786F9841D          DC.B      $1D,$10,$80,$07,$86,$F9,$84,$1D 
0722AE  108186FB841D1086          DC.B      $10,$81,$86,$FB,$84,$1D,$10,$86 
0722B6  0090680E91FF92FF          DC.B      $00,$90,$68,$0E,$91,$FF,$92,$FF 
0722BE  8A01800D84CC0F84          DC.B      $8A,$01,$80,$0D,$84,$CC,$0F,$84 
0722C6  CC0F84CC0F84F00F          DC.B      $CC,$0F,$84,$CC,$0F,$84,$F0,$0F 
0722CE  8188072089B00801          DC.B      $81,$88,$07,$20,$89,$B0,$08,$01 
0722D6  820280028600847F          DC.B      $82,$02,$80,$02,$86,$00,$84,$7F 
0722DE  1086FE84B4108603          DC.B      $10,$86,$FE,$84,$B4,$10,$86,$03 
0722E6  84B41086FE84B410          DC.B      $84,$B4,$10,$86,$FE,$84,$B4,$10 
0722EE  8B0C010181800486          DC.B      $8B,$0C,$01,$01,$81,$80,$04,$86 
0722F6  0084E910860184F0          DC.B      $00,$84,$E9,$10,$86,$01,$84,$F0 
0722FE  10860084E91086FE          DC.B      $10,$86,$00,$84,$E9,$10,$86,$FE 
072306  84F0108180048600          DC.B      $84,$F0,$10,$81,$80,$04,$86,$00 
07230E  844F118603844F11          DC.B      $84,$4F,$11,$86,$03,$84,$4F,$11 
072316  8605844F11860384          DC.B      $86,$05,$84,$4F,$11,$86,$03,$84 
07231E  4F11818004847111          DC.B      $4F,$11,$81,$80,$04,$84,$71,$11 
072326  8491118180048600          DC.B      $84,$91,$11,$81,$80,$04,$86,$00 
07232E  84F71086FC842311          DC.B      $84,$F7,$10,$86,$FC,$84,$23,$11 
072336  86FE84231186FB84          DC.B      $86,$FE,$84,$23,$11,$86,$FB,$84 
07233E  F71081800486F984          DC.B      $F7,$10,$81,$80,$04,$86,$F9,$84 
072346  F01086F784F01081          DC.B      $F0,$10,$86,$F7,$84,$F0,$10,$81 
07234E  8200860090280F0C          DC.B      $82,$00,$86,$00,$90,$28,$0F,$0C 
072356  0C13181616181B85          DC.B      $0C,$13,$18,$16,$16,$18,$1B,$85 
07235E  8F02040101880720          DC.B      $8F,$02,$04,$01,$01,$88,$07,$20 
072366  89F0000111018F00          DC.B      $89,$F0,$00,$01,$11,$01,$8F,$00 
07236E  8C0401058C008807          DC.B      $8C,$04,$01,$05,$8C,$00,$88,$07 
072376  0489C000015A065A          DC.B      $04,$89,$C0,$00,$01,$5A,$06,$5A 
07237E  065A06858F020401          DC.B      $06,$5A,$06,$85,$8F,$02,$04,$01 
072386  0188072089F00001          DC.B      $01,$88,$07,$20,$89,$F0,$00,$01 
07238E  11018F008C040105          DC.B      $11,$01,$8F,$00,$8C,$04,$01,$05 
072396  8C0088070489C000          DC.B      $8C,$00,$88,$07,$04,$89,$C0,$00 
07239E  015A0689D002015A          DC.B      $01,$5A,$06,$89,$D0,$02,$01,$5A 
0723A6  0C85841D10841D10          DC.B      $0C,$85,$84,$1D,$10,$84,$1D,$10 
0723AE  858F020201018807          DC.B      $85,$8F,$02,$02,$01,$01,$88,$07 
0723B6  108D000000008E89          DC.B      $10,$8D,$00,$00,$00,$00,$8E,$89 
0723BE  F0000111018F008E          DC.B      $F0,$00,$01,$11,$01,$8F,$00,$8E 
0723C6  8C0401058C008807          DC.B      $8C,$04,$01,$05,$8C,$00,$88,$07 
0723CE  108D010703001F01          DC.B      $10,$8D,$01,$07,$03,$00,$1F,$01 
0723D6  0C052B01180B8F02          DC.B      $0C,$05,$2B,$01,$18,$0B,$8F,$02 
0723DE  0201018807108D00          DC.B      $02,$01,$01,$88,$07,$10,$8D,$00 
0723E6  0000008E89F00001          DC.B      $00,$00,$00,$8E,$89,$F0,$00,$01 
0723EE  11018F008E8C0401          DC.B      $11,$01,$8F,$00,$8E,$8C,$04,$01 
0723F6  058C008807108D01          DC.B      $05,$8C,$00,$88,$07,$10,$8D,$01 
0723FE  0703002B01180588          DC.B      $07,$03,$00,$2B,$01,$18,$05,$88 
072406  070289C000015A06          DC.B      $07,$02,$89,$C0,$00,$01,$5A,$06 
07240E  5A06853C8A003F43          DC.B      $5A,$06,$85,$3C,$8A,$00,$3F,$43 
072416  3C3F433C3F433C3F          DC.B      $3C,$3F,$43,$3C,$3F,$43,$3C,$3F 
07241E  433C3F433C3F433C          DC.B      $43,$3C,$3F,$43,$3C,$3F,$43,$3C 
072426  3F433C3F433C3F43          DC.B      $3F,$43,$3C,$3F,$43,$3C,$3F,$43 
07242E  3C3F433C3F433C3F          DC.B      $3C,$3F,$43,$3C,$3F,$43,$3C,$3F 
072436  433C3F433C3F433C          DC.B      $43,$3C,$3F,$43,$3C,$3F,$43,$3C 
07243E  3F433C3F438A0185          DC.B      $3F,$43,$3C,$3F,$43,$8A,$01,$85 
072446  3C8A0040433C4043          DC.B      $3C,$8A,$00,$40,$43,$3C,$40,$43 
07244E  3C40433C40433C40          DC.B      $3C,$40,$43,$3C,$40,$43,$3C,$40 
072456  433C40433C40433C          DC.B      $43,$3C,$40,$43,$3C,$40,$43,$3C 
07245E  40433C40433C4043          DC.B      $40,$43,$3C,$40,$43,$3C,$40,$43 
072466  3C40433C40433C40          DC.B      $3C,$40,$43,$3C,$40,$43,$3C,$40 
07246E  433C40433C40433C          DC.B      $43,$3C,$40,$43,$3C,$40,$43,$3C 
072476  40438A018584F710          DC.B      $40,$43,$8A,$01,$85,$84,$F7,$10 
07247E  84F7108584231184          DC.B      $84,$F7,$10,$85,$84,$23,$11,$84 
072486  23118589B0040188          DC.B      $23,$11,$85,$89,$B0,$04,$01,$88 
07248E  072082023C8A003F          DC.B      $07,$20,$82,$02,$3C,$8A,$00,$3F 
072496  433C3F433C3F433C          DC.B      $43,$3C,$3F,$43,$3C,$3F,$43,$3C 
07249E  3F438A01821889C0          DC.B      $3F,$43,$8A,$01,$82,$18,$89,$C0 
0724A6  0101880704880609          DC.B      $01,$01,$88,$07,$04,$88,$06,$09 
0724AE  5A82028806038589          DC.B      $5A,$82,$02,$88,$06,$03,$85,$89 
0724B6  B004018807208202          DC.B      $B0,$04,$01,$88,$07,$20,$82,$02 
0724BE  3C8A0040433C4043          DC.B      $3C,$8A,$00,$40,$43,$3C,$40,$43 
0724C6  3C40433C40438A01          DC.B      $3C,$40,$43,$3C,$40,$43,$8A,$01 
0724CE  821889C001018807          DC.B      $82,$18,$89,$C0,$01,$01,$88,$07 
0724D6  048806095A820288          DC.B      $04,$88,$06,$09,$5A,$82,$02,$88 
0724DE  06038589C0000188          DC.B      $06,$03,$85,$89,$C0,$00,$01,$88 
0724E6  072082068B0C01FF          DC.B      $07,$20,$82,$06,$8B,$0C,$01,$FF 
0724EE  303C483C821889C0          DC.B      $30,$3C,$48,$3C,$82,$18,$89,$C0 
0724F6  0101880704880609          DC.B      $01,$01,$88,$07,$04,$88,$06,$09 
0724FE  5A8806038589C000          DC.B      $5A,$88,$06,$03,$85,$89,$C0,$00 
072506  0188070082005A0C          DC.B      $01,$88,$07,$00,$82,$00,$5A,$0C 
07250E  5A065A06821889C0          DC.B      $5A,$06,$5A,$06,$82,$18,$89,$C0 
072516  0101880704880609          DC.B      $01,$01,$88,$07,$04,$88,$06,$09 
07251E  5A8806038589C000          DC.B      $5A,$88,$06,$03,$85,$89,$C0,$00 
072526  0188070082005A06          DC.B      $01,$88,$07,$00,$82,$00,$5A,$06 
07252E  5A0689D001018807          DC.B      $5A,$06,$89,$D0,$01,$01,$88,$07 
072536  048806065A0C8218          DC.B      $04,$88,$06,$06,$5A,$0C,$82,$18 
07253E  89C001018806095A          DC.B      $89,$C0,$01,$01,$88,$06,$09,$5A 
072546  8806038591FF92FF          DC.B      $88,$06,$03,$85,$91,$FF,$92,$FF 
07254E  8807108F02020101          DC.B      $88,$07,$10,$8F,$02,$02,$01,$01 
072556  8806058D02030300          DC.B      $88,$06,$05,$8D,$02,$03,$03,$00 
07255E  89E0010180028600          DC.B      $89,$E0,$01,$01,$80,$02,$86,$00 
072566  84971486FE846714          DC.B      $84,$97,$14,$86,$FE,$84,$67,$14 
07256E  86FC84971486FB84          DC.B      $86,$FC,$84,$97,$14,$86,$FB,$84 
072576  671481800286FC84          DC.B      $67,$14,$81,$80,$02,$86,$FC,$84 
07257E  971486FB84971486          DC.B      $97,$14,$86,$FB,$84,$97,$14,$86 
072586  F984971486FB8497          DC.B      $F9,$84,$97,$14,$86,$FB,$84,$97 
07258E  1481800286008497          DC.B      $14,$81,$80,$02,$86,$00,$84,$97 
072596  1486FD84671486F4          DC.B      $14,$86,$FD,$84,$67,$14,$86,$F4 
07259E  84971486FC84B814          DC.B      $84,$97,$14,$86,$FC,$84,$B8,$14 
0725A6  86FD84B81486FE84          DC.B      $86,$FD,$84,$B8,$14,$86,$FE,$84 
0725AE  B81486FF84B81481          DC.B      $B8,$14,$86,$FF,$84,$B8,$14,$81 
0725B6  8003860084011486          DC.B      $80,$03,$86,$00,$84,$01,$14,$86 
0725BE  F984B81486FB84B8          DC.B      $F9,$84,$B8,$14,$86,$FB,$84,$B8 
0725C6  1481860084011486          DC.B      $14,$81,$86,$00,$84,$01,$14,$86 
0725CE  FE84011486FC8401          DC.B      $FE,$84,$01,$14,$86,$FC,$84,$01 
0725D6  14800286FB840114          DC.B      $14,$80,$02,$86,$FB,$84,$01,$14 
0725DE  8190B81191FF92FF          DC.B      $81,$90,$B8,$11,$91,$FF,$92,$FF 
0725E6  88072082048A0180          DC.B      $88,$07,$20,$82,$04,$8A,$01,$80 
0725EE  0286008BF4020289          DC.B      $02,$86,$00,$8B,$F4,$02,$02,$89 
0725F6  C00E01840B158960          DC.B      $C0,$0E,$01,$84,$0B,$15,$89,$60 
0725FE  E000840B158BFB02          DC.B      $E0,$00,$84,$0B,$15,$8B,$FB,$02 
072606  0289C00E01840B15          DC.B      $02,$89,$C0,$0E,$01,$84,$0B,$15 
07260E  8960E000840B158B          DC.B      $89,$60,$E0,$00,$84,$0B,$15,$8B 
072616  F4020289C00E0184          DC.B      $F4,$02,$02,$89,$C0,$0E,$01,$84 
07261E  0B158960E000840B          DC.B      $0B,$15,$89,$60,$E0,$00,$84,$0B 
072626  158BFB020289C00E          DC.B      $15,$8B,$FB,$02,$02,$89,$C0,$0E 
07262E  0186F9842A1586FB          DC.B      $01,$86,$F9,$84,$2A,$15,$86,$FB 
072636  840B158180028BFB          DC.B      $84,$0B,$15,$81,$80,$02,$8B,$FB 
07263E  020286FC842A158B          DC.B      $02,$02,$86,$FC,$84,$2A,$15,$8B 
072646  F4020286FE843815          DC.B      $F4,$02,$02,$86,$FE,$84,$38,$15 
07264E  86008419158BF402          DC.B      $86,$00,$84,$19,$15,$8B,$F4,$02 
072656  0286FB840B158BFB          DC.B      $02,$86,$FB,$84,$0B,$15,$8B,$FB 
07265E  0202840B1586F984          DC.B      $02,$02,$84,$0B,$15,$86,$F9,$84 
072666  0B158BF4020286F7          DC.B      $0B,$15,$8B,$F4,$02,$02,$86,$F7 
07266E  84381586FC843815          DC.B      $84,$38,$15,$86,$FC,$84,$38,$15 
072676  8BFB020286F9842A          DC.B      $8B,$FB,$02,$02,$86,$F9,$84,$2A 
07267E  1586FB842A158180          DC.B      $15,$86,$FB,$84,$2A,$15,$81,$80 
072686  0286F4844014330C          DC.B      $02,$86,$F4,$84,$40,$14,$33,$0C 
07268E  38183A183C183D0C          DC.B      $38,$18,$3A,$18,$3C,$18,$3D,$0C 
072696  3C183F3086F68419          DC.B      $3C,$18,$3F,$30,$86,$F6,$84,$19 
07269E  14410C3F0C3E0C3C          DC.B      $14,$41,$0C,$3F,$0C,$3E,$0C,$3C 
0726A6  183A183C18353C86          DC.B      $18,$3A,$18,$3C,$18,$35,$3C,$86 
0726AE  F2844014360C350C          DC.B      $F2,$84,$40,$14,$36,$0C,$35,$0C 
0726B6  361838183A0C3C18          DC.B      $36,$18,$38,$18,$3A,$0C,$3C,$18 
0726BE  3A0C3D3086F08419          DC.B      $3A,$0C,$3D,$30,$86,$F0,$84,$19 
0726C6  1486FC84191486ED          DC.B      $14,$86,$FC,$84,$19,$14,$86,$ED 
0726CE  84401486F9844014          DC.B      $84,$40,$14,$86,$F9,$84,$40,$14 
0726D6  86F284191486FE84          DC.B      $86,$F2,$84,$19,$14,$86,$FE,$84 
0726DE  191486EF84401486          DC.B      $19,$14,$86,$EF,$84,$40,$14,$86 
0726E6  FB84401481800386          DC.B      $FB,$84,$40,$14,$81,$80,$03,$86 
0726EE  F484191482018600          DC.B      $F4,$84,$19,$14,$82,$01,$86,$00 
0726F6  841B1486EF844014          DC.B      $84,$1B,$14,$86,$EF,$84,$40,$14 
0726FE  820186FB84421486          DC.B      $82,$01,$86,$FB,$84,$42,$14,$86 
072706  F484191486ED8440          DC.B      $F4,$84,$19,$14,$86,$ED,$84,$40 
07270E  1486ED84191486F9          DC.B      $14,$86,$ED,$84,$19,$14,$86,$F9 
072716  84191486EF844014          DC.B      $84,$19,$14,$86,$EF,$84,$40,$14 
07271E  8186F48419148201          DC.B      $81,$86,$F4,$84,$19,$14,$82,$01 
072726  8600841B1486EF84          DC.B      $86,$00,$84,$1B,$14,$86,$EF,$84 
07272E  4014820186FB8442          DC.B      $40,$14,$82,$01,$86,$FB,$84,$42 
072736  1486F484191486F2          DC.B      $14,$86,$F4,$84,$19,$14,$86,$F2 
07273E  841914820186FE84          DC.B      $84,$19,$14,$82,$01,$86,$FE,$84 
072746  1B1486ED84401482          DC.B      $1B,$14,$86,$ED,$84,$40,$14,$82 
07274E  0186F984421486F2          DC.B      $01,$86,$F9,$84,$42,$14,$86,$F2 
072756  84191486F0841914          DC.B      $84,$19,$14,$86,$F0,$84,$19,$14 
07275E  820186FC841B1486          DC.B      $82,$01,$86,$FC,$84,$1B,$14,$86 
072766  EB844014820186F7          DC.B      $EB,$84,$40,$14,$82,$01,$86,$F7 
07276E  84421486F0841914          DC.B      $84,$42,$14,$86,$F0,$84,$19,$14 
072776  800386ED84191481          DC.B      $80,$03,$86,$ED,$84,$19,$14,$81 
07277E  86EF841914800386          DC.B      $86,$EF,$84,$19,$14,$80,$03,$86 
072786  ED8440148186EF84          DC.B      $ED,$84,$40,$14,$81,$86,$EF,$84 
07278E  401490501214061B          DC.B      $40,$14,$90,$50,$12,$14,$06,$1B 
072796  0C200684C414140C          DC.B      $0C,$20,$06,$84,$C4,$14,$14,$0C 
07279E  1B06200684C41414          DC.B      $1B,$06,$20,$06,$84,$C4,$14,$14 
0727A6  0C84C4148582028B          DC.B      $0C,$84,$C4,$14,$85,$82,$02,$8B 
0727AE  0C010189D0030138          DC.B      $0C,$01,$01,$89,$D0,$03,$01,$38 
0727B6  8A003C3F383C3F38          DC.B      $8A,$00,$3C,$3F,$38,$3C,$3F,$38 
0727BE  3C3F383C3F89CA0D          DC.B      $3C,$3F,$38,$3C,$3F,$89,$CA,$0D 
0727C6  018BF403038A0182          DC.B      $01,$8B,$F4,$03,$03,$8A,$01,$82 
0727CE  0086008582028B0C          DC.B      $00,$86,$00,$85,$82,$02,$8B,$0C 
0727D6  010189D003013C8A          DC.B      $01,$01,$89,$D0,$03,$01,$3C,$8A 
0727DE  003F443C3F443C3F          DC.B      $00,$3F,$44,$3C,$3F,$44,$3C,$3F 
0727E6  443C3F4489CA0D01          DC.B      $44,$3C,$3F,$44,$89,$CA,$0D,$01 
0727EE  8BF403038A018200          DC.B      $8B,$F4,$03,$03,$8A,$01,$82,$00 
0727F6  8600851406200C1B          DC.B      $86,$00,$85,$14,$06,$20,$0C,$1B 
0727FE  0684C414200C1B06          DC.B      $06,$84,$C4,$14,$20,$0C,$1B,$06 
072806  140C200684C41420          DC.B      $14,$0C,$20,$06,$84,$C4,$14,$20 
07280E  061B061406200C14          DC.B      $06,$1B,$06,$14,$06,$20,$0C,$14 
072816  0684C4142006140C          DC.B      $06,$84,$C4,$14,$20,$06,$14,$0C 
07281E  1B06140C84C41484          DC.B      $1B,$06,$14,$0C,$84,$C4,$14,$84 
072826  E614851406200C1B          DC.B      $E6,$14,$85,$14,$06,$20,$0C,$1B 
07282E  0684C4142006140C          DC.B      $06,$84,$C4,$14,$20,$06,$14,$0C 
072836  1B06140C84C41420          DC.B      $1B,$06,$14,$0C,$84,$C4,$14,$20 
07283E  0C1406200C140684          DC.B      $0C,$14,$06,$20,$0C,$14,$06,$84 
072846  C414200C1B06140C          DC.B      $C4,$14,$20,$0C,$1B,$06,$14,$0C 
07284E  200684C414140C85          DC.B      $20,$06,$84,$C4,$14,$14,$0C,$85 
072856  8807008E89F00101          DC.B      $88,$07,$00,$8E,$89,$F0,$01,$01 
07285E  88060B8D01140001          DC.B      $88,$06,$0B,$8D,$01,$14,$00,$01 
072866  260C8806058D0203          DC.B      $26,$0C,$88,$06,$05,$8D,$02,$03 
07286E  030088071089E001          DC.B      $03,$00,$88,$07,$10,$89,$E0,$01 
072876  01858807008E89F0          DC.B      $01,$85,$88,$07,$00,$8E,$89,$F0 
07287E  010188060B8D0114          DC.B      $01,$01,$88,$06,$0B,$8D,$01,$14 
072886  000126068E260688          DC.B      $00,$01,$26,$06,$8E,$26,$06,$88 
07288E  06058D0203030088          DC.B      $06,$05,$8D,$02,$03,$03,$00,$88 
072896  071089E001018538          DC.B      $07,$10,$89,$E0,$01,$01,$85,$38 
07289E  8A003B3F383B3F38          DC.B      $8A,$00,$3B,$3F,$38,$3B,$3F,$38 
0728A6  3B3F383B3F388A00          DC.B      $3B,$3F,$38,$3B,$3F,$38,$8A,$00 
0728AE  3B3F383B3F383B3F          DC.B      $3B,$3F,$38,$3B,$3F,$38,$3B,$3F 
0728B6  383B3F8A0185388A          DC.B      $38,$3B,$3F,$8A,$01,$85,$38,$8A 
0728BE  003C3F383C3F383C          DC.B      $00,$3C,$3F,$38,$3C,$3F,$38,$3C 
0728C6  3F383C3F388A003C          DC.B      $3F,$38,$3C,$3F,$38,$8A,$00,$3C 
0728CE  3F383C3F383C3F38          DC.B      $3F,$38,$3C,$3F,$38,$3C,$3F,$38 
0728D6  3C3F8A0185535250          DC.B      $3C,$3F,$8A,$01,$85,$53,$52,$50 
0728DE  4B4746443F3B3A38          DC.B      $4B,$47,$46,$44,$3F,$3B,$3A,$38 
0728E6  332F2E2C272C2E2F          DC.B      $33,$2F,$2E,$2C,$27,$2C,$2E,$2F 
0728EE  33383A3B3F444647          DC.B      $33,$38,$3A,$3B,$3F,$44,$46,$47 
0728F6  4B50525350855452          DC.B      $4B,$50,$52,$53,$50,$85,$54,$52 
0728FE  504B4846443F3C3A          DC.B      $50,$4B,$48,$46,$44,$3F,$3C,$3A 
072906  3833302E2C272C2E          DC.B      $38,$33,$30,$2E,$2C,$27,$2C,$2E 
07290E  3033383A3C3F4446          DC.B      $30,$33,$38,$3A,$3C,$3F,$44,$46 
072916  484B505254508591          DC.B      $48,$4B,$50,$52,$54,$50,$85,$91 
07291E  FF92FF88070889D0          DC.B      $FF,$92,$FF,$88,$07,$08,$89,$D0 
072926  06018A018B0C0101          DC.B      $06,$01,$8A,$01,$8B,$0C,$01,$01 
07292E  8202860C842D1686          DC.B      $82,$02,$86,$0C,$84,$2D,$16,$86 
072936  0B841616860A842D          DC.B      $0B,$84,$16,$16,$86,$0A,$84,$2D 
07293E  168807098391FF92          DC.B      $16,$88,$07,$09,$83,$91,$FF,$92 
072946  FF88071089D00D01          DC.B      $FF,$88,$07,$10,$89,$D0,$0D,$01 
07294E  8A01120C8C02190C          DC.B      $8A,$01,$12,$0C,$8C,$02,$19,$0C 
072956  1E0C170C1E0C230C          DC.B      $1E,$0C,$17,$0C,$1E,$0C,$23,$0C 
07295E  8C0010C488071283          DC.B      $8C,$00,$10,$C4,$88,$07,$12,$83 
072966  91FF92FF8A018002          DC.B      $91,$FF,$92,$FF,$8A,$01,$80,$02 
07296E  88060589D0000188          DC.B      $88,$06,$05,$89,$D0,$00,$01,$88 
072976  07005A065A068807          DC.B      $07,$00,$5A,$06,$5A,$06,$88,$07 
07297E  045A0C88070089F0          DC.B      $04,$5A,$0C,$88,$07,$00,$89,$F0 
072986  010188060B8D0114          DC.B      $01,$01,$88,$06,$0B,$8D,$01,$14 
07298E  0001260C8D000000          DC.B      $00,$01,$26,$0C,$8D,$00,$00,$00 
072996  0081880704880605          DC.B      $00,$81,$88,$07,$04,$88,$06,$05 
07299E  89D00C015AC48807          DC.B      $89,$D0,$0C,$01,$5A,$C4,$88,$07 
0729A6  2483288A002B2F32          DC.B      $24,$83,$28,$8A,$00,$2B,$2F,$32 
0729AE  282B2F32282B2F32          DC.B      $28,$2B,$2F,$32,$28,$2B,$2F,$32 
0729B6  282B2F32282B8A01          DC.B      $28,$2B,$2F,$32,$28,$2B,$8A,$01 
0729BE  85288A002C2F3328          DC.B      $85,$28,$8A,$00,$2C,$2F,$33,$28 
0729C6  2C2F33282C2F3328          DC.B      $2C,$2F,$33,$28,$2C,$2F,$33,$28 
0729CE  2C2F33282C8A0185          DC.B      $2C,$2F,$33,$28,$2C,$8A,$01,$85 
0729D6  5279E500                  DC.B      $52,$79,$E5,$00 
ZUEND: END
