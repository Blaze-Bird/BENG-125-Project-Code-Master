% the initialization parameters for the system we are creating
% will probably end up with 3-4 other scripts to run with this one

% Things which will be calculated so give initial values
Mp =   % mRNA for PER
Mt =   % mRNA for TIM
T0 =   % unphosphorylated TIM
T1 =   % monophosphorylated TIM
T2 =   % binophosphorylated TIM
P0 =   % Native protein
P1 =   % monophosphorylated protein
P2 =   % biphosphorylated protein
Pn =   % Nuclear protein
C =    % PER-TIM complex concentration
Cn =   % PER-TIM complex in the nucleus which is a repressor

% Time parameters
T = 24; % one full cycle of experiment
Tnight = 12; % time of the cycle which is dark
dt = .01*T; % duration of time step in hours
klokmax = 3*T/dt; % total number of timesteps, currently 3 cycles

% parameters
n = 4; % number of equations?
kdc = 0.01;        % degradation rate of PER-TIM in cytoplasm per hour
kdn = 0.01;      % degradation of PER-TIM in nucleus per hour
kd = 0.01;        % as kd increases oscilations increase, linear degradation term, per hour
k1 = 0.6; % transport rate into neucleus per hour, no other dimensions
k2 = 0.2; % transport tate into cytosol per hour, no other dimensions
k3 = 1.2; % association rate of C per nM per hour
k4 = 0.6; % disociation rate of C per hour

% unknown parameters
vdp = 2*10^-9;   % no idea what this parameter does
vdt = 2*10^-9;   % does the same thing as vdp but for TIM

% Synthsis rates
ksp = 0.9*10^-9; % synthesis rate of PER
kst = 0.9*10^-9; % synthesis rate of TIM

% accumulation rates
vsp = 1* 10^-9; % maximum accumulation rate of PER mRNA in cytosol
vst = 1* 10^-9; % maximum accumulaiton rate of TIM mRNA in cytosol
% degradation rates
vmp = 0.7*10^-9; % maximum degradation rate of PER mRNA
vmt = 0.7*10^-9; % maximum degradation rate of TIM mRNA
% Michaelis constants
Kmp = 0.2*10^-9; % constant for PER mRNA
Kmt = 0.2*10^-9; % constant for TIM mRNA

% max rate of formation of the phosphoralization of PER
V1p = 8*10^-9;        
V2p = 1*10^-9;
V3p = 8*10^-9;
V4p = 1*10^-9;
% Max rate of formation of the phosphoralization of TIM
V1t = 8*10^-9;
V2t = 1*10^-9;
V3t = 8*10^-9;
V4t = 1*10^-9;
% Michalis constant of phosphoralization of PER
KIp = 1*10^-9;
Kdp = 0.2*10^-9; % constant for disassociation of PER
K1p = 2*10^-9;
K2p = 2*10^-9;
K3p = 2*10^-9;
K4p = 2*10^-9;
% Michalis constant of phosphoralization of TIM
KIt = 1*10-9;
Kdt = 0.2*10^-9; % constant for disassociation of TIM
K1t = 2*10^-9;
K2t = 2*10^-9;
K3t = 2*10^-9;
K4t = 2*10^-9;

