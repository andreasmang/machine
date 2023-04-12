clear, close all; clc;

% 1D independent (but not identically distributed) increment case
% with x_{i+1}-x_i ~ N(0,w_i), where w_n/2 = 0.05 and w_i=1 otherwise
% that is, we implement sampling from an IGMRF  field in a one-dimensional
% setting; the precision matrix defines a probability distribution that
% models a prior that preserves rapid changes (jumps) in the to be
% reconstructed signal; the precision matrix does not allow for a cholesky
% factorization


n = 128; % number of points (discretization)
ndraws = 6; % number of draws
gamma = sqrt(eps); % perturbation factor

% get gradient operator with neumann BC
D = getGradMat(n, 1);

% get normaly distributed random vector v
v = randn(n-1, ndraws);

% compute square of weight matrix
W = speye(n-1);
W(n/2,n/2) = sqrt(0.0025);

% compute matrix \tilde{D}
WD = % ADD YOUR CODE HERE
M = % ADD YOUR CODE HERE

% compute cholesky factorization of \tilde{D}^T\tilde{D} + eps*I
C = % ADD YOUR CODE HERE

% compute samples
idsmp = % ADD YOUR CODE HERE

% visualize zamples
figure()
s = linspace(0,1,n);
plot(s, idsmp)
legend('sample 1', 'sample 2', 'sample 3', ...
'sample 4', 'sample 5', 'sample 6');




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
