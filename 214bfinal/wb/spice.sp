*Matthew Meza
*Homework 5 Problem 5 E
*
*
.param C = 514.15f
 
.include /usr/class/ee214b/hspice/ee214b_hspice.sp
.include otapart3.sp

vdd vdd 0 1.8
vsc vsc 0 0.8
vsd vsd 0 0 pulse(0 500m 0 100p 100p 100n 200n)

x1 vsd vsc vsp vsm balun 
x2 vip vim vop vom vod vdd otapart3

csp vsp vip1 'C'
csm vsm vim1 'C'

rsp vsp vip1 10G
rsm vsm vim1 10G

cfp vop vim1 'C/2'
cfm vom vip1 'C/2'

vxp vip vip1 0
vxm vim vim1 0

clp vop 0 'C'
clm vom 0 'C'

.op
.tran 0.01n 100n 0 0.01n **SWEEP k 1u 3.5u 0.01u
.dc vsd -2m 2m 0.001m ***SWEEP k 20u 25u 0.1u
.ac dec 1000 1e6 100e9
.lstb mode=diff vsource=vxp,vxm
.probe ac lstb(db) lstb(p)
.noise v(vod) vsd
.option post brief accurate 
.end

