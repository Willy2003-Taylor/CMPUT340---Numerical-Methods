function [M_k,L_k] = elimMat(A, k)

[n,~] = size(A);

M_k = eye(n);
% Initialize M_k as an identity matrix

M_k_entry = -A(k+1:n, k)/A(k,k);

%Vectorization

M_k(k+1:n, k) = M_k_entry;
%Obtain the entries in the lower triangular of M_k

L_k = inv(M_k);
%Obtain L_k according to the formula that L_k = inv(M_k)

end