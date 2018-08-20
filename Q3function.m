function [ y ] = Q3function( x )
% function for Question 3 of Assignment 1, 2018
% input
%   x = 4-dimensional variable vector (column vector)
% output
%   y = objective function value of x

global patternC
global patternQ

abMatrix = [x(1), -x(2);
            x(2), x(1)];
        
rMatrix = [x(3); x(4)];

for i = 1:length(patternC)
    patternTransformed(:, i) = abMatrix*patternC(:, i) + rMatrix;
end

y = norm(patternTransformed - patternQ, 'fro')^2;

end