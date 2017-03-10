*Matthew Meza
*Creating OTA subcircuit
*nch w='Wn' l='Ln'
*pch w='Wp' l='Lp'
* Circuit Parameters
.param Wn = 76.67u
+ Wp = 292.32u
+ Ln = 0.32u
+ Lp = 0.32u
+ I = 30.2857u  
+ Cn = 36.778f
+ wnb = 10.95u
+ wpb = 49.75u

.subckt otapart3 vip vim vop vom vod vdd
x1 vod voc vop vom balun 
rdum vod 0 100gig

*Nuetral Caps
C1 Vim ncl 'Cn'
C2 ncr Vip 'Cn' 

*Biasing
I1 0 mir 'I'
MBL1 mb1d Vbias2 VDD VDD pch l='Lp' w=4.7375u
MB1 Vbias2 Vbias2 mb1d VDD pch w='wpb' l='Lp'
MB2 mb2d Vbias1 VDD VDD pch w='wpb' l='Lp'
MB3 Vbias1 Vbias2 mb2d VDD pch w='wpb' l='Lp'

MIR1 mir mir 0 0 nch w='wnb' l='Ln'
MIR2 Vbias2 mir 0 0 nch w='wnb' l='Ln'
MIR3 Vbias1 mir 0 0 nch w='wnb' l='Ln'
***MIR4 tn mir 0 0 nch w='Wn' l='Ln' m=2
MIR4 tn mir 0 0 nch w='wnb' l='Ln' m=15

*Middle Branch Biasing
MD1 md2d Vbias1 VDD VDD pch w='wpb' l='Lp'
MD2 Vbias3 Vbias2 md2d VDD pch w='wpb' l='Lp'
MD3 Vbias3 Vbias3 tn 0 nch w=5u l= 2.8u 

G1 tn 0 Voc Vocd 5m
V3 vocd 0 1

************Circuit***************
**Diff Input Pair
M1L ncl Vip tn 0 nch w='Wn' l='Ln'
M1R ncr Vim tn 0 nch w='Wn' l='Ln'
M2L Vom Vbias3 ncl 0 nch w='Wn' l='Ln'
M2R Vop Vbias3 ncr 0 nch w='Wn' l='Ln'

**PCas
M4R pcr Vbias1 VDD VDD pch w='Wp' l='Lp'
M4L pcl Vbias1 VDD VDD pch w='Wp' l='Lp'
M3L Vom Vbias2 pcl VDD pch w='Wp' l='Lp'
M3R Vop Vbias2 pcr VDD pch w='Wp' l='Lp'

***END OTA Subcircuit
.ends


