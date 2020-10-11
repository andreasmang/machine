function [f,df,d2f] = objFunRLSQ( x, A, b, L, alpha )
%OBJFUNRLSQ implementation of objective function for
%regularized least squares problem
%
% inputs:
%   A          n x m matrix
%   b          right hand side (vector)
%   x          current iterate
%   L          regularization operator (n x n matrix)
%   alpha      regularization parameter
%
% outputs:
%    f         objective value
%    df        gradient
%    d2f       hessian

if nargin < 1, runSelfTest(); return; end

% evaluate objective functional
f  = % ADD YOUR CODE HERE

% evaluate gradient of f(x)
if nargout > 1
    df = % ADD YOUR CODE HERE
end

% evaluate hessian matrix of f(x)
if nargout > 2
    d2f = % ADD YOUR CODE HERE
end

end % end function




%//////////////////////////////////////////////////////
function runSelfTest()

% problem dimension
n = 100;

% construct solution
x0 = rand( n, 1 );

% create SPD matrix
d = logspace( 0, -6, n );
A = sprandsym( n, 1, d );

% construct right hand side (we add small perturbation
% so that b is not (likely) in col(A))
eta = 1e-3;
b = A*x0 + eta*rand(n,1);

% construct regulariation operator
L = eye( n );

% define function handle for objective function
objfun = @(x) objFunRLSQ( x, A, b, L, 0.1 );

% perform derivative check
checkDerivative( objfun, x0 );

end % end function
%//////////////////////////////////////////////////////




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
