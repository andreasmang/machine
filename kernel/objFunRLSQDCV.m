function [f,df,d2f] = objFunRLSQDCV( x, K, y, alpha )
%OBJFUNRLSQDCV implementation of objective function for
%regularized least squares problem
%
% inputs:
%   K          structure with operators along x1 and x2 directions
%   y          right hand side (vector)
%   x          current iterate
%   alpha      regularization parameter
%
% outputs:
%   f          objective value
%   df         gradient
%   d2f        hessian

if nargin < 1, runSelfTest(); return; end

% evaluate objective functional
f = % ADD YOUR CODE HERE

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
K = getKernel2D( [n,n] );

b  = rand( [ n, n] );
x0 = rand( [ n*n, 1] );

% define function handle for objective function
objfun = @(x) objFunRLSQDCV( x, K, b, 0.1 );

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
