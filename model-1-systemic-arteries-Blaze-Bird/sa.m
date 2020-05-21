%filename: sa.m
% test piece of code
clear all % clear all variables
clf       % and figures
global T TS TMAX QMAX;
global Rs Csa dt;
global t_arrest t_restart;
in_sa %initialization
Csa=Csa/2
for klok=1:klokmax
  t=klok*dt;
  QAo=QAo_now(t);
if klok >t_arrest && klok<t_restart
      QAo = 0;
  else
end
  Psa=Psa_new(Psa,QAo); %new Psa overwrites old
  %Store values in arrays for future plotting:
  t_plot(klok)=t;
  QAo_plot(klok)=QAo;
  Psa_plot(klok)=Psa;
end
%Now plot results in one figure 
%with QAo(t) in upper frame
% and Psa(t) in lower frame
subplot(2,1,1), plot(t_plot,QAo_plot)
subplot(2,1,2), plot(t_plot,Psa_plot)

% Task 2 calculating blood pressure off of Csa
TF_s= islocalmax(Psa_plot(1,length(Psa_plot)/2:end)); % points of systolic peaks
TF_d= islocalmin(Psa_plot(1,length(Psa_plot)/2:end)); % points of diastolic peaks
sys = zeros(1,round(length(Psa_plot)/2)); % space allocation
dias= zeros(1,round(length(Psa_plot)/2));


for i = 1:round(length(Psa_plot)/2) % loop creates vectors with only peak values
    if TF_s(i) == 1
        sys(i) = Psa_plot(1,i+round(length(Psa_plot)/2));
    elseif TF_d(i)==1
        dias(i) = Psa_plot(1,i+round(length(Psa_plot)/2));
    else 
        sys(i) = 0;
        dias(i) = 0;
    end
end
for l = 1:round(length(Psa_plot)/2) % creates vectors with error for each peak
    if sys(l) ~= 0
        S(l) = sys(l)-120;
    elseif dias(l) ~= 0
        D(l) = dias(l)-80;
    else
        D(l) = 0;
        S(l) = 0;
    end
end
[S_error,index1] = max(abs(S));% The index where the maximum is largest error for systolic pressure
[D_error,index2] = max(abs(D));% The index where the maximum is largest error for diastolic pressure
S_value = sys(index1);
D_value = (index2);

% Task 3
S_error3 = sum(abs(S))/sum(TF_s) % Psa(t) error in systolic peak
D_error3 = sum(abs(D))/sum(TF_d) % Psa(t) error in diastolic peak
if S_error3<=1.2 && D_error3<=.8 
    % if/else statement to ensure step size is small enough
    fprintf('step is small enough')
else 
    fprintf('make step size smaller')
end
%% Section 2
% Task 6
s_avg = sum(sys)/sum(TF_s)  %average value of the systolic peak
d_avg = sum(dias)/sum(TF_d) % average value of the diastolic peak
bp_mean = mean(Psa_plot(1,round(length(Psa_plot))/2:end)) % average value of all pressure measurements in second half

%% Section 5

