clear all; 
close all;

%addpath('/usr/class/ee214b/matlab/hspice_toolbox');
addpath('/Users/shaimsn/Documents/Stanford/Winter 2017/EE214B/matlab/hspice_toolbox');

% Load HSpice output 
m = loadsig('part2.sw0');
% List all available signal
lssig(m)

% Read into MATLAB variables 
% f     = evalsig(m, 'HERTZ'); 
vod   = evalsig(m, 'v_vod'); 
vid    = evalsig(m, 'v_vsd'); 


plot(vod,vod./vid)
