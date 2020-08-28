function [f,df,d2f] = objFunLSQ( x, A, b )
%OBJFUNLSQ implementation of objective function for
%least squares problem
%
% inputs:
%    A         n x m matrix
%    b         right hand side (vector)
%    x         current iterate
%
% outputs:
%    f         objective value
%    df        gradient
%    d2f       hessian

if nargin < 1, runSelfTest(); return; end

% evaluate objective functional f(x) = 0.5*||Ax-b||^2_2
dr = A*x - b;
f  = 0.5*dr(:)'*dr(:);

% evaluate gradient
if nargout > 1
    df = A'*dr;
end

% compute hessian A^T A
if nargout > 2
    d2f = A'*A;
end

end % end function




%//////////////////////////////////////////////////////
function runSelfTest()

n = 100;

% construct solution
x0 = rand( n, 1 );

% create SPD matrix
d = logspace( 0, -6, n );
A = sprandsym( n, 1, d );

% construct right hand side (we add small perturbation
% so that b is not (likely) in col(A))
eta = 1e-3;
b   = A*x0 + eta*rand(n,1);

% define function handle for objective function
objfun = @(x) objFunLSQ( x, A, b );

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
