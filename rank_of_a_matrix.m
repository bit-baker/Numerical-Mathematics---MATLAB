% This function computes the rank-p matrix B for given matrix A and rank p
function [B] = rank_of_a_matrix(A,p)    
if(p > min(size(A)))
    B = A;
    return
else 
    limit  = 10E-10;
    [U,S,V] = svd(A);
    S(S < limit) = 0;
    B = U(:,1:p) * S(1:p,1:p) * transpose(V(:,1:p));
end
end