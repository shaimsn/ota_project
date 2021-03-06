*Matthew Meza
*Creating OTA subcircuit
*nch w='Wn' l='Ln'
*pch w='Wp' l='Lp'
.param Wn = 88.76u
+ Wp = 338.4u
+ Ln = 0.32u
+ Lp = 0.32u
+ I = 245u
+ Cn = 42.576f

.subckt otapart3 vip vim vop vom vod vdd
x1 vod voc vop vom balun 
rdum vod 0 100gig

*Nuetral Caps
C1 Vim N005 'Cn'
C2 N006 Vip 'Cn' 

*Biasing
MB1 Vbias2 Vbias2 VDD VDD pch w='Wp/4.3' l='Lp*4.3'    ***DIV 5 4.3
MB2 N004 Vbias1 VDD VDD pch w='Wp' l='Lp'
MB3 Vbias1 Vbias2 N004 VDD pch w='Wp' l='Lp'
I2 Vbias2 0 'I'
I3 Vbias1 0 'I'

************Circuit***************
**Diff Input Pair
M1L N005 Vip tn 0 nch w='Wn' l='Ln'
M1R N006 Vim tn 0 nch w='Wn' l='Ln'
M2L Vom Vbias3 N005 0 nch w='Wn' l='Ln'
M2R Vop Vbias3 N006 0 nch w='Wn' l='Ln'

**PCas
M4R N003 Vbias1 VDD VDD pch w='Wp' l='Lp'
M4L N002 Vbias1 VDD VDD pch w='Wp' l='Lp'
M3L Vom Vbias2 N002 VDD pch w='Wp' l='Lp'
M3R Vop Vbias2 N003 VDD pch w='Wp' l='Lp'

**Middle Branch
*M1 N001 Vbias1 VDD VDD pch w='Wp' l='Lp'
*M2 Vbias3 Vbias2 N001 VDD pch w='Wp' l='Lp'
*M3 Vbias3 Vbias3 tn 0 nch w=18u l = 0.25u
Vbias3 Vbias3 0 1.1
**Tail Current Source
I1 0 N008 'I'
MT tn N008 0 0 nch w='Wn' l='Ln'm=2
MT1 N008 N008 0 0 nch w='Wn' l='Ln'

G1 tn 0 Voc Vocd 5m
V3 vocd 0 1

***END OTA Subcircuit
.ends


