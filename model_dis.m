% code which runs the equations and is hopefully able to graph
% concentrations
% file name: model_dis
clear all;
clf;
global T dt Tnight;
in_carcadian; % imports parameters
for klok = 1:klokmax
    t = klok*dt;
    Mp_old = Mp;
    Mt_old = Mt;
    T0_old = T0;
    T1_old = T1;
    T2_old = T2;
    P0_old = P0;
    P1_old = P1;
    P2_old = P2;
    C_old = C;
    Cn_old = Cn;
    % arrays for plotting
    t_plot(klok) = t;
    Mp_plot(klok) = Mp; 
    Mt_plot(klok) = Mt;
    T0_plot(klok) = T0;
    T1_plot(klok) = T1;
    T2_plot(klok) = T2;
    P0_plot(klok) = P0;
    P1_plot(klok) = P1;
    P2_plot(klok) = P2;
    C_plot(klok) = C;
    Cn_plot(klok) = Cn;
    
    