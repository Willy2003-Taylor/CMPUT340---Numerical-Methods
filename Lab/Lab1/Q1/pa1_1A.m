% Vectorize the following
% Note the use of the tic/toc calls to time execution
% Compare the time once you have vectorized it

tic
for i = 1:1000
    t(i) = 2*i;
    y(i) = sin (t(i));
end
toc

clear;

%Running time by using for loop is 0.001s


% Vectorization for the given example e1.m%

tic
i = 1:1000;
t = 2*i;
y = sin(t);
toc

clear;

%Running time by vectorization is less than 0.001s

%Note: Two patches of code are tested respectively by commenting the other
%one



