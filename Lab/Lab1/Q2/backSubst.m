function x = backSubst(U, y, k)

x = zeros(k, 1);

for i=k:-1:1
    x(i)=(y(i)-U(i, i+1:k)*x(i+1:k)) / U(i, i);
end
end