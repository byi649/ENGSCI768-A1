function [ y ] = hessian_Q2( x )
% hessian of function for Question 2 of Assignment 1, 2018
% input
%   x = 2-dimensional variable vector (column vector)
% output
%   y = gradient of function evaluated at x (column vector)

y = [36*x(1)^2 + 20*x(2) - 5,   20*x(1) + 2;
     20*x(1) + 2,               24*x(2)^2 ];

end

