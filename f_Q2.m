function [ y ] = f_Q2( x )
% function for Question 2 of Assignment 1, 2018
% input
%   x = 2-dimensional variable vector (column vector)
% output
%   y = objective function value of x

%y = 3*x(1)^4 + 2*x(2)^4 + 10*x(1)^2*x(2) + 2*x(1)*x(2) - 5*x(1);
%y = 2*x(1)^2 + 3*x(1)*x(2) + 5*x(2)^2 - x(1);
y = 2*x(1)^4 + 4*x(2)^4 - x(1) - 2*x(2);

end

