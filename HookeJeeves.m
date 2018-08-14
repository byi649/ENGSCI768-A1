function [x,val] = HookeJeeves(f, univ, n, x1, epsilon, varargin)
% Hooke Jeeves Method - 
%   f = function name handle 
%   univ = function name handle of univariate minimisation function 
%   n = number of variables
%   x1 = starting point (vector with n entries, column vector)
%   epsilon = terminate algorithm once points have a distance of less than eps
%   varargin = optional argument to output iteration steps
% output:
%   x = optimal solution
%   val = objective function value of optimal solution f(x)


% Initialisation
% epsilon = epsilon
x(:, 1) = x1;
y(:, 1) = x(:, 1);
k = 1;
val(1) = f(x(:, 1));

a = [];
% Main step
while(true)
    % Exploratory search
    for j = 1:n
        % Create unit d vector
        d = zeros(n, 1);
        d(j) = 1;
        % Line search
        a(j) = univ(f, y(:, j), d, 0.00001);
        y(:, j+1) = y(:, j) + a(j)*d;
    end
    x(:, k+1) = y(:, n+1);
    val(k+1) = f(x(:, k+1));

    % Termination criteria - l2 norm
    termination_criteria = norm(x(:, k+1) - x(:, k)) < epsilon;
    if termination_criteria
        % Output final f, x
        if nargin < 6
            val = val(:, k+1);
            x = x(:, k+1);
        end
        break;
    end

    % Pattern search
    ds = x(:, k+1) - x(:, k);
    as = univ(f, x(:, k+1), ds, 0.00001);
    y(:, 1) = x(:, k+1) + as*ds;
    j = 1;
    k = k + 1;
end