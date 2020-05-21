clc
clear
clf
A = 25*diag(ones(5,1)) + rand(5,5);
TF = islocalmax(A,2)