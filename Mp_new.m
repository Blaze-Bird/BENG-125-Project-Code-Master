% equation for dMp/dt
function [Mp] = Mp_new(Mp_old)
global t, 
r1 = vsp*(KIp^n /(KIp^n +Cn^n));
r2 = vmp*(Mp_old/(Kmp+Mp_old));
r3 = kd*Mp_old;
Mp = MP_old +(r1-r2-r3);
end