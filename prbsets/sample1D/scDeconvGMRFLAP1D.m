clear, close all;
clc;
% one dimensional deconvolution problem with independent increment
% IGMRF prior: the associated Gaussian posterior density function is
% sampled using a Cholesky factorization of the precision matrix
%
% after the samples are computed, the sample mean is used as an estimator
% of the unknown dataset; empirical quantiles are used to compute 95%
%  credibility intervals for every unknown

ns = 1000; % number of samples to be drawn
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

% compute solution for "optimal" regularization parameter (parameter can
% be found using various criteria; here we simply used trial and error)
x_alpha = ((K'*K) + alpha*L) \ K'*y_obs;


% estimate lambda and delta given solution of inverse problem
r = y_obs - K*x_alpha;
tau = 1 / var(r);
beta = alpha*tau;

% compute cholesky decomposition
C = % ADD YOUR CODE HERE

% compute MAP point by solving optimality condition
x_map = % ADD YOUR CODE HERE

% next draw samples from the posterior distribution pi(x|y_obs,tau,beta)
% the proposed implementation uses a matrix representation; one can
% also draw the samples using a loop
v = randn( n, ns );
v0 = repmat( x_map, 1, ns);

% draw samples
x_samp = % ADD YOUR CODE HERE

% compute mean
x_mean = % ADD YOUR CODE HERE

% compute 95% credibility intervals
x_quant = getEmpQuant(x_samp', [0.025,0.975])';

% visualize results / data
figure()
subplot(1,2,1), plot(s,x_true,'k',s,y_obs,'rx');
legend('true solution', 'observation');
subplot(1,2,2), plot(s,x_true,'k',s,x_map,'r-');
legend('true solution', 'map estimate');


% visualize map and uncertainties
figure()
plot(s,x_true);
hold on;
plot(s,x_quant(:,1),'k--',s,x_quant(:,2),'k--');
plot(s,x_mean,'r-');
legend('true solution', '0.025%', '0.975%', 'mean')
hold off;




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
