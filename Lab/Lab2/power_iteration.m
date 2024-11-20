function [dom_lambda, dom_v] = power_iteration(A, acc_error)
%{
arguments notes:
dom_lambda: return the dominant eigenvalue; 
dom_v: Dominant vector that corresponds to the dominant lambda;

iter_num: The number of iteration given by the user, since we need to fix
the iteration number;

acc_error: Acceptable error - this is the error that the user accepts
between actual answer and the solution by theory.
%}
    n = size(A, 1);
    x = rand(n,1);
    %Give an arbitrary vector x as initial (n by 1)

    while true
        y = A * x;
        x_next = y / norm(y);

        if norm(x_next - x) < acc_error
            break;
        end
        x = x_next; 
    end
    dom_v = x_next;

    dom_lambda = ((dom_v' * A * dom_v) / (dom_v' * dom_v));
    % Apply Rayleigh Quotient
end