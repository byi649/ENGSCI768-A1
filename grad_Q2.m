function [ y ] = grad_Q2( x )
% gradient of function for Question 2 of Assignment 1, 2018
% input
%   x = 2-dimensional variable vector (column vector)
% output
%   y = gradient of function evaluated at x (column vector)

% y = [4*x(1) + 3*x(2) - 1;
%      3*x(1) + 10*x(2)];

y = [8*x(1)^3 - 1;
     16*x(2)^3 - 2];

end

