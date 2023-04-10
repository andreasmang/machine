clear, close all;

% find optimal regularization parameter using GCV

n = 80; % number of points
delta = 2; % error level is 2%

% get source for deconvolution problem
[x_true,s] = getDeconvSource1D( n );
K = getKernel1D( n ); % get deconvolution operator

% compute scaling for noise perturbation
sig = delta*norm(K*x_true)/(100*sqrt(n));

% compute additive noise
eta = sig.*randn(n,1);

% compute observed data
y_obs = K*x_true + eta;

% compute precision matrix of prior distribution
L = getLapMat(n, 1);

% use generalized cross validation to compute optimal regularization
% parameter linear invere problem
alpha = evalGCV(K, L, y_obs);
fprintf('optimal regularization parameter alpha = %e\n', alpha);




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
