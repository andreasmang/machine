clear, close all; clc;
% draw a realization from Gaussian probability distribution
% with \bar{x}=0 and covariance matrix C = L^{-1}, where L is the
% precision matrix (finite difference approximation of the laplacian
% operator; the implementation is in one and two dimensions

% problem dimension (256 x 1)
n = 256;

% get finite difference approximation of laplacian operator (i.e.,
% precision matrix L)
L = getLapMat([n,1],1);

% compute cholesky decomposition
C = % ADD YOUR CODE

% number of draws
ndraws = 6;
figure()
s = linspace(0,1,n);
hold on;
for i = 1 : ndraws

    % draw x from normal distribution
    w = % ADD YOUR CODE
    x = % ADD YOUR CODE

    % plot drawn x
    plot(s,x);
end
hold off;




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
