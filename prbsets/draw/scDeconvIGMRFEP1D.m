clear, close all;
clc;

% one dimensional deconvolution based on independent increment
% (anisotropic) IGMRF prior; the spatially dependent increment weights
% are computed using an iterative algorithm; the optimal regularization
% parameter is determined based on GCV

n = 80; % number of points
delta = 2; % error level is 2%
gamma = 1e-3; % perturbation
niter = 10; % number of iterations

% get source for deconvolution problem
[x_true,s] = getDeconvSource1D( n );
K = getKernel1D( n ); % get deconvolution operator

% compute scaling for noise perturbation
sig = delta*norm(K*x_true)/(100*sqrt(n));
eta = sig.*randn(n,1);

% compute observed data
y_obs = K*x_true + eta;

% get one dimensional first order derivative operator
D = getGradMat( n, 1 );

% compute weight matrix for first iteration
W = speye(n-1,n-1);
rhs = K'*y_obs;

for i = 1:niter
    % define prior precision matrix
    L = % ADD YOUR CODE HERE

    % compute optimal regularization parameter
    alpha = evalGCV(K, L, y_obs);
    fprintf('iteration: %3d (alpha = %e)\n', i, alpha)

    % compute tikhonov regularized solution
    x_alpha = % ADD YOUR CODE HERE

    % update weight matrix
    W = % ADD YOUR CODE HERE
end

% plot reconstruction
figure()
subplot(1,2,1), plot(s,x_true,'k',s,y_obs,'rx');
legend('true solution', 'observation');
subplot(1,2,2), plot(s,x_true,'k',s,x_alpha,'r-');
legend('true solution', 'estimated source');




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
