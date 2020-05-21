% if else statement for light/dark, also need it to repeat at certain
% interval to successfully model 24hr period
if t < n
    P0 = sin(theta*x) % production during light hours
else
    P0 = sin((theta -value)*x)  % production during dark hours
end