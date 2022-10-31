function [l] = lagrange_polynomial(x, i, xList)
%This function returns lagrange polynomial at x
% from the given list of x points
% Takes x (point where lagrange polynomial is to be evaluated)
% i - the position where to be evaluated
% xList - list of x locations as input and 
% returns the lagrange polynomial at x for given list of x locations 
prod=1;
for k=1:length(xList)
    if i~=k
        prod = prod * ((x-xList(k))/(xList(i)-xList(k)));
    end
end
l = prod;

