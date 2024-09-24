%Test code for LU factorization
%{
A = [1,2,2; 4,4,2; 4,6,4];
b = [3; 6; 10];
%}
% Test Data 1


A = [3,-7,-2,2; -3,5,1,0; 6,-4,0,-5; -9,5,-5,12];
b = [-9; 5; 7; 11];


% Matrices in Example 2.13 in the textbook

disp('The matrix A is:');
disp(A);

[L, U] = myLU(A);

disp('Lower triangular matrix L is:');
disp(L);

disp('Upper triangular matrix U is:');
disp(U);

%Give results of matrices L and U

y = fwdSubst(L,b,1);

disp('The solution to y is:(Ly = b)');
disp(y);

n = length(y);

x = backSubst(U,y,n);

disp('The solution to x is:(Ux = y)');
disp(x);