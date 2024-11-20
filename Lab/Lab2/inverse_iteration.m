function [min_lambda, min_v] = inverse_iteration(A, shift, acc_error)
    n = size(A, 1);
    x = rand(n, 1);
    I = eye(n);

    while true
        y = (A - shift * I) \ x;
        x_next = y / norm(y);

        if norm(x_next - x) < acc_error
            break;
        end
        x = x_next;
    end
    min_v = x_next;

    min_lambda = ((min_v)' * A * (min_v)) / ((min_v)' * (min_v));
end