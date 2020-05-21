%filename:  LV_sa.m
clear all %clear all variables
clf       %and figures
global T TS tauS tauD;
global Csa Rs RMi RAo dt CHECK PLA;
in_LV_sa  %initialize
for klok=1:klokmax
  t=klok*dt;
  PLV_old=PLV;
  Psa_old=Psa;
  CLV_old=CLV;
  CLV=CV_now(t,CLVS,CLVD);
  %find self-consistent 
  %valve states and pressures:
  set_SMi_SAo
  %store in arrays for future plotting:
  t_plot(klok)=t;
  CLV_plot(klok)=CLV;
  PLV_plot(klok)=PLV;
  Psa_plot(klok)=Psa;
  VLV_plot(klok)=CLV*PLV+VLVd;
  Vsa_plot(klok)=Csa*Psa+Vsad;
  QMi_plot(klok)=SMi*(PLA-PLV)/RMi;
  QAo_plot(klok)=SAo*(PLV-Psa)/RAo;
  Qs_plot(klok)=Psa/Rs;
  SMi_plot(klok)=SMi;
  SAo_plot(klok)=SAo;
end
%plot results:
figure(1)
subplot(3,1,1), plot(t_plot,CLV_plot)
title('copliance of ventricle vs time')
subplot(3,1,2), plot(t_plot,PLV_plot,t_plot,Psa_plot)
legend('PLV','Psa')
title('PLV and Psa vs time')
subplot(3,1,3), plot(t_plot,QMi_plot,t_plot,QAo_plot,t_plot,Qs_plot)
legend('QMi','QAo','Qs')
title('flow through Mi Ao and system')
%left ventricular pressure-volume loop
figure(2)
plot(VLV_plot,PLV_plot)
title('ventricular pressure-volume loop')
%systemic arterial pressure-volume ``loop''
figure(3)
plot(Vsa_plot,Psa_plot)
title('Systemic arterial pressure-volume "loop"')
%% Section 2
systolic = max(Psa_plot(1,length(Psa_plot)/4:end));
diastolic = min(Psa_plot(1,length(Psa_plot)/4:end));
%task 3: Steady state
TF_s = islocalmax(Psa_plot);
TF_d = islocalmin(Psa_plot);
sys = zeros(1,klokmax*dt/T);
dias = zeros(1,klokmax*dt/T);
l = 1;
k = 1;
for i = 1:length(Psa_plot) % loop creates vectors with only peak values
    if TF_s(i) == 1
        sys(l) = Psa_plot(1,i);
        l = l+1;
    elseif TF_d(i) == 1
        dias(k) = Psa_plot(1,i);
        k = k+1;
    else 
    end
end
error_d = zeros(1,14);
error_s = zeros(1,14);
for i = 1:14
    error_d(i) = dias(i)-dias(i+1);
    error_s(i) = sys(i) - sys(i+1);
end
t_error = (1:14);
figure(4)
subplot(2,1,1)
plot(t_error,error_s)
title('systolic pressure going to steady state')
subplot(2,1,2)
plot(t_error,error_d)
title('diastolic pressure going to steady state')

bp_mean = (mean(dias(1,4:end))+ mean(sys(4:end)))/2



