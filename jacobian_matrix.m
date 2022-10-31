function [a,n] = jacobian_matrix(fdf, a0, x, y, tol)
%This function takes 4 inputs
% fdf function - which returns function residual and jacobian matrix
% a0 - which is initial list of coefficients
% x,y are the input data
% tol is the tolerence - the condition to check for convergence
% this function returns updated coefficient list a and n which are the
% count of iterations used to get the convergence 
a=a0;
n=0; 
[r,j] = fdf(a0, x, y); % use of fdf function to get residual and jacobian matrix
delta = - j\r; 

dnorm = norm(delta); % norm of the delta

rnorm_old = norm(r); % norm of the function residual
rnorm = norm(r);  

while (dnorm > tol) && (n < 100) % checking tolerence to converge and #iterations to exit loop
    alpha = 1; % Initial Damping factor
    a_0 = a;
    i=0;
    while i<=10
        a_0 = a + alpha * delta; %temporary coefficient list
        [r,j] = fdf(a_0, x, y); %temporary resiudal and jacobian matrix for temporary values
        delta_t = - j\r;   % temporary delta value
        rnorm_t = norm(r); % temporary residual norm
        
        if rnorm_t > rnorm  % checking if damping factor can be updated or stopped
            alpha = alpha/2; 
        else
            break;
        end
        i = i+1;
    end
    
    a = a_0; % coeeficient list updation
    rnorm = rnorm_t; % Residual norm updation
    delta = delta_t; % Delta value updation
    dnorm = norm(delta); % Delta norm updation
    n = n + 1; % Iterations
end

if n == 100
    error("Ouch! Maximum Iterations reached!!")
end

