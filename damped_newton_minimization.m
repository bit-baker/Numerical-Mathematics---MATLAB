function [x, f] = damped_newton_minimization(fun, x0, tol, maxIter)    
% Damed-Newton method for minimization
% Fucntion that returns the minimum of a function
iteration = 1;
x = x0;
alp = 0.75;
[f,g,H] = fun(x);

while ((iteration < maxIter) && (norm(g) > tol))  % Checking for maxIterations reached and tolerence
   x = x - alp *(H\g); % Damped - Newton method convergence logic
   [f, g, H] = fun(x); 
   iteration = iteration + 1;
end

if iteration == maxIter %When max iterations reached!
    error('Max Iterations reached! Did not converge!!')
end

end