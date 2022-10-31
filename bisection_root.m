function x = bisection_root(f, a, b, tol)
% Function that returns the root of a single-variable using Bisection
% method
l = a;
r = b;
x = (l + r)/2;
while(abs(f(x)) > tol) % Tolerence check
   x = (l + r) / 2; % Moving to the right segment when no root is being found in the left
   if (f(x) * f(l)) > 0  
        l = (l + r) / 2 ; %Checking left segment
   else   
        r = (l + r) / 2 ; %Checking right segment
   end
end
end
