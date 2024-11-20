A = [2 1 0; 1 3 1; 0 1 2];

[eigenvector_matrix, eigenvalue_matrix] = eig(A);

%{
To pick the eigenvector that corresponds the maximum eigenvalues,
obtaining the index that corresponds the maximum eigenvalues and mapping it
to the eigenvector.
%}


[lambda_max, index_maxlambda] = max(diag(eigenvalue_matrix));
eigenvector_max = eigenvector_matrix(:, index_maxlambda);

[dom_lambda_power_iteration, dom_v_power_iteration] = power_iteration(A, 1e-7);
fprintf('Power iteration dominant eigenvalue: %.9f\n', dom_lambda_power_iteration);
disp('Power iteration dominant eigenvector');
disp(dom_v_power_iteration);

fprintf('Eig function dominant eigenvalue: %.9f\n', lambda_max);
disp( 'Eig function dominant eigenvector');
disp(eigenvector_max);



[lambda_min, index_minlambda] = min(diag(eigenvalue_matrix));

eigenvector_min = eigenvector_matrix(:, index_minlambda);

[min_lambda_inverse_iteration, min_v_inverse_iteration] = inverse_iteration(A,0, 1e-7);

fprintf('Inverse iteration minimum eigenvalue: %.9f\n', min_lambda_inverse_iteration);
disp('Inverse iteration minimum eigenvector');
disp(min_v_inverse_iteration);

fprintf('Eig function minimum eigenvalue: %.9f\n', lambda_min);
disp( 'Eig function minimum eigenvector');
disp(eigenvector_min);



[eigenvalues, eigenvectors] = qr_iteration(A, 1e-7);

fprintf('QR iteration eigenvalues:\n');
disp(eigenvalues);

fprintf('QR iteration eigenvectors:\n');
disp(eigenvectors);

fprintf('Eig function eigenvalues:\n');
disp(diag(eigenvalue_matrix));

fprintf('Eig function eigenvectors:\n');
disp(eigenvector_matrix);
