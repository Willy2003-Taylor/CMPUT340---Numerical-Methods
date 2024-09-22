% Sample script  that shows how to automate running problem solutions
close all;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% a) Load an image using the imread command 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

image_pepper = imread('Q1/peppers3.tif');

% b) Display original image in the first spot of a 2 x 3 a grid layout
%    Check the imshow and subplot commands.

subplot(2,3,1);
imshow(image_pepper);
 
pause(); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% c) Display a gray scale version of the image in position 2 of the grid.
%    help rgb2gray

grayscale_pepper = rgb2gray(image_pepper);
subplot(2,3,2);
imshow(grayscale_pepper);

pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% d) Generate a new figure and ask user to manually select a region of the
%    image. Display the subimage in position 3 of the grid.
%    Hint 1: getrect()
%    Hint 2: to use getrect, you should first install Image Processing Toolbox:
%         (a) Open the Add-On Manager in MATLAB via "Home > Add-Ons > Get Add-Ons" and install the Add-On Explorer if it is not already installed.
%         (b) Search "Image Processing Toolbox" and install it.
%         (c) Restart MATLAB after installing

% Get user input on a newly dislayed image

% Make grid the current figure

% Display selected region. Make sure to apply the cut
% over all 3 channels.

% You are NOT ALLOWED to use the imcrop function of Matlab.
figure;
imshow(image_pepper);
selection = getrect;

x = round(selection(1));
y = round(selection(2));
width = round(selection(3));
height = round(selection(4));

%Output for getrect function is a 
% 4-element numeric vector with the form [xmin ymin width height]

%Since the position is selected manually by user
%necessarily to ensure that the position is in bound

x = max(x, 1); y = max(y, 1);
width = min(width, size(image_pepper, 2) - x + 1);
height = min(height, size(image_pepper, 1) - y + 1);

%Since "image_pepper" is in RGB, which returns a 3D array.
%1st dimension -> height; 2nd dimension -> width; 3rd dimension -> color
%Since the 2nd argument of size() function requires it to be 
% positive integer

subimage = image_pepper(y: y + height - 1, x: x + width - 1, :);

subplot(2,3,3);
imshow(subimage);        
pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% e) Create a function J = luminance_change(I, option, value) such that:
%   * When given the option 'c', the contrast of image I's top-left and 
%     bottom-right quadrants will be modified by the given value.
%     Simple multiplication will achieve this.
%   * When given the option 'b', the brightness of image I's top-right and 
%     bottom-left quadrants will be modified by the given value.
%     Simple addition will achieve this.
%  
%   Showcase your function by filling positions 4 and 5 in the grid

% Contrast change

modified1 = luminance_change(image_pepper, 'c', 0.5);
subplot(2,3,4);
imshow(modified1);

pause();

% Brightness change

modified2 = luminance_change(image_pepper, 'b',100);
subplot(2,3,5); 
imshow(modified2);

pause();


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% f) [Extra question for curiosity, no points]: 
% Display a version of the image after it's been blurred using a
% Gaussian filter. Hint: imgaussfilt()
