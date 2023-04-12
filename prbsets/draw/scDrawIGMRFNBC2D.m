clear, close all; clc;

% 2D independent (but not identically distributed) increment case
% x_{i+1,j}-x_{i,j} ~ N(0,w_ij) and x_{i,j+1}-x_{i,j} ~ N(0,w_ij),
% where w_ij=0.05 on the boundary of a circle and w_ij=1 otherwise

% that is, we implement sampling from an IGMRF field in a two-dimensional
% setting; the precision matrix defines a probability distribution that
% models a prior that preserves rapid changes (jumps) in the to be
% reconstructed signal; the precision matrix does not allow for a cholesky
% factorization

n = 128; % number of points (discretization)
ndraws = 6; % number of draws
gamma = sqrt(eps); % perturbation factor

% get gradient operator with neumann BC
[D,D1,D2] = getGradMat([n,n], 2);

% compute W
W = getW( n, D1, D2 );

%compute [WD_1; WD_2]
WD = % ADD YOUR CODE HERE

% compute matrix \tilde{D}^T\tilde{D} + eps*I
M = % ADD YOUR CODE HERE

% compute cholesky factorization of M
C = % ADD YOUR CODE HERE

m = size(D,1); % get number of rows

figure()
for i = 1 : ndraws
    % get normaly distributed random vector v
    v = % ADD YOUR CODE HERE

    % draw x
    x = % ADD YOUR CODE HERE

    subplot(2,3,i), imagesc(reshape(x,[n,n]));
    axis square, colormap gray;
end




function W = getW( n, D1, D2 )
% GETW compute weight matrix
%
% input:
%   n     number of grid points
%
% output:
%   W     weight matrix

% compute weight matrix W
% compute 2 norm centered at (0.5,0.5); domain is [0,1] x [0,1]
h = 1/(n+1); % compute spatial step size
x = h:h:1-h; % compute 1D axis
[x1,x2] = meshgrid(x); % compute 2D mesh

r = (x1 - 0.5).^2 + (x2 - 0.5).^2;
cid = ( r(:) <.1 ); % indicator function on a circle
grcid = sqrt( (D1*cid).^2 + (D2*cid).^2 ); % compute boundary of circle

w = ones(n*(n-1),1); % compute diagonal of weight matrix
w(grcid > 0) = sqrt(0.0025); % set boundary of circle to 0.05

W = spdiags(w,0,n*(n-1),n*(n-1));

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
