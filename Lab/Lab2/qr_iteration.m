function [eigenvalue_qr, eigenvector_qr] = qr_iteration(A, acc_error)
    n = size(A, 1);
    Ak = A;
    Q_total = eye(n);

    while true
        [Q,R] = qr(Ak);
        Ak = R * Q;
        Q_total = Q_total * Q;

        if norm(Ak - diag(diag(Ak))) < acc_error
            break;
        end
    end
    eigenvalue_qr = diag(Ak);
    eigenvector_qr = Q_total;

    [eigenvalue_qr, idx] = sort(eigenvalue_qr, 'ascend');
    eigenvector_qr = eigenvector_qr(:, idx);
end