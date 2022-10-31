% This function implements Rayleigh-Quotient iteration for Eigen value and
% Eigen vectors.
% It takes a real and square matrix A and an initial vector v0 arguments
% and returns eigen values and associated eigen vectors.
function [l,v] = Rayleigh_quotient_iteration(A,v0)    
v = v0; 
v = v/norm(v);
lambda = transpose(v) * A * v; % Lambda computation
tol = 10E-8; % Tolerence value
df = 1;
p=1;

while df > tol % Iterates till the eigen value is better than tolerence
    v = (A - (lambda * eye(size(A))) ) \ v; 
    v = v/norm(v);
    lambda_new = transpose(v) * A * v;  % Eigenvalue computation using Rayleigh Quotient
    df = abs((lambda_new - lambda) / lambda_new); % Exits if this value is better than tolerence
    lambda = lambda_new; 
    p=p+1;
end
l = lambda;
end