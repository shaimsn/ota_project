*EE214B Winter 2017, Design Project, Part II

.include /usr/class/ee214b/hspice/ee214b_hspice.sp
.include two_stage_ota_block.sp

******************************************************
*Fill in the appropriate choices for vsc, vocdes using
*.param commands 
******************************************************
.param vsc = 700m
.param vocdes = 900m

******************************************************
*Input parameters
******************************************************
vdd vdd 0 1.8
vsc vsc 0 'vsc'
*vsd vsd 0 ac 1
vsd vsd 0 dc *pulse(0 800m 0 1p 1p 100n 200n)
x1 vsd vsc vip vim balun

******************************************************
*Circuit elements
******************************************************
*ota block
x3 realvip realvim vop vom vdd vod voc two_stage_ota_block

*cap network (t = top, b = bottom)
cst vip vipota 628f
cft vipota vom 314f
clt vom 0 628f
rhuget vip vipota 100G

csb vim vimota 628f
cfb vimota vop 314f
clb vop 0 628f
rhugeb vim vimota 100G


******************************************************
*Loop gain injection sources
******************************************************
vlstbp vipota realvip ac 0
vlstbm vimota realvim ac 0


******************************************************
*Analysis
******************************************************
.op
.dc vsd -100m 100m 0.1m
.ac dec 100 1e6 100e9
*.lstb mode=diff vsource=vlstbp,vlstbm
*.noise v(vod) vsd
.tran 1p 100n
*.MEASURE AC phase_margin FIND LSTB(P) when LSTB(DB)=0
.option post brief accurate
.end


