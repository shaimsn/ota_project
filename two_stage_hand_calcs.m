clc
clear

f = 1e-15;
u = 1e-6;
p = 1e-12;

%% Loop gain and phase margin
%%% Loop gain
gds1 = 34.0e-6;
gds2 = 95.9e-6;
gds3 = 34.0e-6;
gds4 = 59.61e-6;

ro1 = 1/gds1;
ro2 = 1/gds2;
ro3 = 1/gds3;
ro4 = 1/gds4;

R1 = parallel(ro1,ro3);
R2 = parallel(ro2,ro4);

Cf = 314e-15;
Cs = 628e-15;
Cl = 628e-15;
Cgg1 = 309.64e-15;
beta = Cf/(Cf + Cs + Cgg1);

gm1 = 2.294e-3;
gm2 = 6.925e-3;
gm3 = 2.272e-3;
gm4 = 3.53e-3;

Lo = beta*gm1*R1*gm2*R2 

%%% Phase margin
Cdd1 = 142.5*f;
Cdd3 = 36.9*f;
Cself1 = 0;%Cdd1+Cdd3;

Cdd2 = 280.2*f;
Cdd4 = 104.4*f;
Cself2 = 0;% Cdd2 + Cdd4;

Cgs2 = 425.3*f;

C1 = Cgs2 + Cself1;

Cltot = Cl + (1-beta)*Cf + Cself2;

Cc = 747*f;

wp2 = (gm2/C1)*1/(1+Cltot/Cc+Cltot/C1);

wu1 = beta*gm1/Cc;
fu1 = wu1/(2*pi)

phase_margin = 360*atan(wp2/wu1)/(2*pi)

%% Noise and dynamic range
%%% Noise
kT = 1.38e-23*300;
gamman = 0.84;
gammap = 0.88;

vod_int_noise = 2*(1/beta)*(kT/Cc)*gammap*(1+((gamman/gammap)*(gm3/gm1))) + ...
    2*(kT/Cltot)*(1+gamman*(1+((gammap/gamman)*(gm4/gm2))))

%%% Dynamic range
Vod_peak = 1.62;
dyn_range = 10*log10((0.5*Vod_peak^2)/vod_int_noise)

%% Static gain error and settling time
%%% Static gain error
static_gain_error = 1/Lo

%%% Settling time
tau = 1/wu1;
eps_d = 0.001; %0.1 percent
settling_time = tau*log(1/eps_d)


