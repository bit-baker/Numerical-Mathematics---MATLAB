function [L, U, P] = LU_decomoposition(A)    

%Function that accepts matrix A(n*n) and returns its LU decomposition with
%partial pivoting
n = size(A,1);

U = A;
L= eye(n); % I(n*n) matrix
P= eye(n); % I(n*n) matrix

for k=1:n-1
   [M,I] = max(abs(U(k:n,k)));
   i = I + k - 1;
   
   if abs(U(i,k)) > 1E-8 % avoiding /0
       U([k i], k:n) = U([i k], k:n); % Upper triangle matrix switching
       L([k i], 1: k-1) = L([i k], 1: k-1); % Lower triangle matrix switching
       P([k i],:) = P([i k],:); % Permutation matrix switching
       
       for j = k + 1:n
           L(j,k) = U(j,k)/U(k,k); % Pivot division
           U(j,k:n) = U(j,k:n) -  L(j,k) * U(k,k:n); % Lower diagonal elements become zero
       end
   end
end
% check norm of P*A-L*U
end
