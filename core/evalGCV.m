function alpha = evalGCV(K, L, y_obs)
% implementation of generalized cross validation for tikhonov regularized
% linear inverse problem K*x = y
%
% input:
%   K        forward operator
%   L        regularization matrix
%   y_obs    observed data
%
% output:
%   alpha    optimal regularization parameter

% get size of vector x
n = size(L,1);

% define function handle for tikhonov regularized solution x_nu
x_nu = @(alpha) % ADD YOUR CODE HERE

% define function handle to compute regularization matrix such that
% x_nu = K_nu*y_obs
K_nu = @(alpha) % ADD YOUR CODE HERE

% residual for tikhonov solution
res = @(alpha) K*x_nu(alpha)-y_obs;

% trace of K*K_nu
tr  = @(alpha) trace(K*K_nu(alpha));

% objective function to be minimized with respect to alpha
fgcv = @(alpha) % ADD YOUR CODE HERE

% compute minimizer using matlab's fminbnd
alpha = fminbnd(fgcv, 0, 1);


end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
