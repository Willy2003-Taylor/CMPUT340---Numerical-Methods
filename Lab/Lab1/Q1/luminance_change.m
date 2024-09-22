function J = luminance_change(I, option, value)

height = size(I, 1); width = size(I, 2);
%Obtain two arguments, height and width of the image first

Row_mid = round(height / 2);
Col_mid = round(width / 2);
%Compute the coordinate of "origin"

top_left = I(1: Row_mid, 1: Col_mid, :);
top_right = I(1: Row_mid, Col_mid + 1: end, :);
bottom_left = I(Row_mid + 1: end, 1: Col_mid, :);
bottom_right = I(Row_mid + 1: end, Col_mid + 1: end, :);

switch option
    case 'c'
        top_left = top_left * value;
        bottom_right = bottom_right * value;

    % Reduce contrast(darken) the top left and bottom right quadrants

    case 'b'
        top_right = top_right + value;
        bottom_left = bottom_left + value;
    
    % Brighten the top right nad bottom left quadrants
end

J = I;

J(1: Row_mid, 1: Col_mid, :) = top_left;
J(1: Row_mid, Col_mid + 1: end, :) = top_right;
J(Row_mid + 1: end, 1: Col_mid, :) = bottom_left;
J(Row_mid + 1: end, Col_mid + 1: end, :) = bottom_right;
