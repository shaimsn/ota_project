%% Matthew Meza 
close all
clear all
clc

addpath('/Users/shaimsn/Documents/Stanford/Winter 2017/EE214B/matlab'); 
load('180nch.mat')
load('180pch.mat')
%% Part 1
Cself = 0;
cgdn = 0;
for i = 0:3
betamax = 1/3;
beta = 1/4;
kT = 4.14195e-21;
totnoise2_diff = 17.6715e-9;  %% Shais 70.924e-9 Matts 70.686e-9
totnoise2_half = totnoise2_diff/2; 
gammap = 0.88;
gamman = 0.84;
ln = 2 %0.22;
lp = 2 %0.235; %0.235

CLtot = (kT/(beta*(totnoise2_half)))*gamman*(1+((gammap)/(gamman)));
CFtot = (CLtot+Cself+2*cgdn)/(3-beta);
CS = 2*CFtot;
CL = CS;

ts = 10e-9;
ed = 0.001;
tau = ts/(log(1/ed));
wu = 1/tau;
gm = wu*CLtot/beta;
cgs = (CS + CFtot)/3;
wt = gm/(cgs);
gm_id = lookup(nch, 'GM_ID', 'GM_CGG', wt, 'L', ln);
id = gm/gm_id;

wn = id/lookup(nch, 'ID_W','GM_ID', gm_id, 'L', ln);
wp = id/lookup(pch, 'ID_W','GM_ID', gm_id, 'L', lp);

cgdn = wn*lookup(nch, 'CGD_W', 'GM_ID', gm_id, 'L', ln, 'W', wn);
CF = CFtot - cgdn;
cdbn = wn*lookup(nch, 'CDD_W', 'GM_ID', gm_id, 'L', ln, 'W', wn) - cgdn;
cddp = wp*lookup(pch, 'CDD_W', 'GM_ID', gm_id, 'L', ln, 'W', wn);

Cself = cdbn + cddp;

end