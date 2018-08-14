function [ y ] = f_test(x)
% a test function
% input
%   x = 2-dimensional variable vector
% output
%   y = objective function value of x

y = (x(1)-2).^4 + (x(1)-2*x(2)).^2;

end

