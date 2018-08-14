function [ x, val ] = SteepestDescent(f, grad, univ, n, x1, epsilon, varargin)
% Steepest Descent Method - 
%   f = function name handle 
%   grad = function name handle of gradient  (returns column vector)
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
k = 1;
val(1) = f(x(:, 1));

% Main step
while(true)
    termination_criteria = norm(grad(x(:, k))) < epsilon;
    if termination_criteria
        % Output final f, x
        if nargin < 7
            val = val(k);
            x = x(:, k);
        end
        break;
    end

    d = -grad(x(:, k));
    a = univ(f, x(:, k), d, 0.00001);

    x(:, k+1) = x(:, k) + a*d;
    val(k+1) = f(x(:, k+1));
    k = k + 1;
end

end

