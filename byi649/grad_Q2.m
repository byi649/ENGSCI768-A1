function [ y ] = grad_Q2( x )
% gradient of function for Question 2 of Assignment 1, 2018
% input
%   x = 2-dimensional variable vector (column vector)
% output
%   y = gradient of function evaluated at x (column vector)

y = [12*x(1)^3 + 20*x(1)*x(2) + 2*x(2) - 5;
     8*x(2)^3 + 10*x(1)^2 + 2*x(1)       ];

end

