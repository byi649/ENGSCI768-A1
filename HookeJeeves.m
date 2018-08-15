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
x(:, 1) = x1;
y(:, 1) = x(:, 1);
k = 1;
val(1) = f(x(:, 1));

if nargin >=6
    xstep = [x1'];
    valstep = [val(1)];
end

% Main step
while(true)
    % Exploratory search
    for j = 1:n
        % Create unit d vector
        d = zeros(n, 1);
        d(j) = 1;
        % Line search
        a = univ(f, y(:, j), d, 0.00001);
        y(:, j+1) = y(:, j) + a*d;
        
        % For plotting steps in Q2
        if nargin >=6
            xstep = [xstep, y(:, j+1)];
            valstep = [valstep, f(y(:, j+1))];
        end
        
    end
    x(:, k+1) = y(:, n+1);
    val(k+1) = f(x(:, k+1));
    
    % Termination criteria - l2 norm of step
    termination_criteria = norm(x(:, k+1) - x(:, k)) < epsilon;
    if termination_criteria
        % Output final f, x
        if nargin < 6
            val = val(:, k+1);
            x = x(:, k+1);
        else
            val = valstep;
            x = xstep;
        end
        break;
    end

    % Pattern search
    ds = x(:, k+1) - x(:, k);
    a = univ(f, x(:, k+1), ds, 0.00001);
    y(:, 1) = x(:, k+1) + a*ds;
    
    % For plotting steps in Q2
    if nargin >=6
        xstep = [xstep, y(:, 1)];
        valstep = [valstep, f(y(:, 1))];
    end
    
    k = k + 1;
end

end