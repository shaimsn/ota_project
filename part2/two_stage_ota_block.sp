* two stage ota model
*
****Creating OTA subckt***** 
.subckt two_stage_ota_block vip vim vop vom vdd vod voc

******************************************************
*OTA Circuit
******************************************************
it  vdd  vx  308u
vb1 vb1  0   0.57
vb2 vb2  0   1.17

M1a vo1m vip  vx  vdd  pch W=108u L=0.3u
M1b vo1p vim  vx  vdd  pch W=108u L=0.3u
M3a vo1m vb1  0   0    nch W=30u  L=0.3u
M3b vo1p vb1  0   0    nch W=30u  L=0.3u
M2a vom  vo1p 0   0    nch W=240u L=0.3u
M2b vop  vo1m 0   0    nch W=240u L=0.3u
M4a vom  vb2  vdd vdd  pch W=76u  L=0.3u
M4b vop  vb2  vdd vdd  pch W=76u  L=0.3u

Cna vip  vo1p 70f
Cnb vim  vo1m 70f
Cca vc1  vo1p 747f
Ccb vc2  vo1m 747f
Rza vom  vc1  140
Rzb vop  vc2  140

******************************************************
*CMFB Circuit
******************************************************
x2 vod voc vop vom balun
rdum vod 0 10gig
v1 vocdes 0 'vocdes'
gcmfb vdd vx voc vocdes 3m


*****OTA netlist ends here******** 
.ends

