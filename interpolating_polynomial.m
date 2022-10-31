function [f] = interpolating_polynomial(L, x, xList, yList)
%This function uses function L(taken as input) and evaluates
% interpolating polynomial at x(given in input) 
% from given xList(x locations) and yList(y locations)
sum=0;
for i=1:length(yList)
    sum = sum + (yList(i) * (L(x,i,xList)))
end
f = sum
