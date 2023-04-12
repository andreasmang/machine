clear, close all; clc;
% draw a realization from Gaussian probability distribution
% with \bar{x}=0 and covariance matrix C = L^{-1}, where L is the
% precision matrix (finite difference approximation of the laplacian
% operator; the implementation is in one and two dimensions

% problem dimension (256 x 256)
n = 256;

% get finite difference approximation of laplacian operator (i.e.,
% precision matrix L)
L = getLapMat([n,n],2);

% compute cholesky decomposition
C = % ADD YOUR CODE HERE

% number of draws
ndraws = 6;
figure()
for i = 1 : ndraws
    % draw x from normal distribution
    w = % ADD YOUR CODE
    x = % ADD YOUR CODE

    subplot(2,3,i), imagesc(reshape(x,[n,n]));
    axis square, colormap gray;
end




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
