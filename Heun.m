clear all; close all;  clc
%anonymous function with parameter t and x
ftx = @(t,x) 4*exp(0.8*t) - 0.5*x;
N = 4;   
to = 0; 
tf = 4;
h = (tf - to)/N;    %compute the step size
xo = 2;     % boundary condition x
x = [N,1];  % creates colomn vector of 4 by 1 matrix
t = [N,1];
x(1,:) = xo;    %initialize the first element in the vector matrix x
t(1,:) = to;    %initialize the first element in the vector matrix t

disp('Heun method table of result')
%to display the table heading t and x
disp([sprintf('%5s', 't'), sprintf('%15s', 'x')])
%Heun method iteration
for i=1:(N+1)
    k1 = ftx(t(i),x(i));    %call to the anonymous function
    k2 = ftx(t(i)+h, x(i) + k1*h);
    x(i+1) = x(i) + (k1+k2)/2*h;
    %displays the result at each iteration
    disp([sprintf('%6.1f', t(i)), sprintf('%16.3f', x(i))])
    t(i+1) = t(i) + h;  %compute the next value  of t
end