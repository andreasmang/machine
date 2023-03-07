function x = runCG( K, y, tol, maxiter )
%RUNCG execute conjugate gradient method to solve
%linear system of equations of form K*x = y
%
% input:
%   K        n x n matrix or function handle for matvec
%   y        right hand side (must be of size n x 1)
%   tol      tolerance for solver
%   maxiter  max iteration count (if not set, defaults to n)

% determine whether K is a matrix or a function
ktype = getOpType( K );

% setup up according to matrix type
if strcmp( ktype, 'matrix' )
    % check inputs for appropriate sizes
    [m,n] = size( K );
    if (m ~= n), error( 'matrix not square' ); end
    if ~isequal( size( y ), [m,1] ), error( 'size mismatch' ); end
    % define matrix vector product
    matvec = @(x) K*x;
else
    m = size( y, 1 ); n = m;
    if ~iscolumn( y ), error( 'y is not a colum vector' ); end

    % define matrix vector product
    matvec = @(x) K( x );
end

% set to default
if nargin < 4, maxiter = n; end

% set initial guess for CG
x = zeros( n,1 );

% main function executing CG
r = matvec( x ) - y;
d = -r;
rsold = r'*r;

% main CG loop
for i = 1 : maxiter
    kd = matvec( d );
    dtkd = d'*kd;
    alpha = % ADD YOUR CODE HERE

    % curvature condition; if hessian matrix is negative definite,
    % stop iteration (former step is guaranteed to be a descent
    % direction, so we're doing OK)
    if ( dtkd < 0 )
        if i == 1, x = d; end
        warning( 'negative curvature detected' );
        break;
    end

    x = % ADD YOUR CODE HERE
    r = % ADD YOUR CODE HERE
    rsnew = r'*r;

    % uncomment to debug
%    fprintf(' i = %4d: PCG residual %e\n', i, rsnew);

    if sqrt(rsnew) < tol, break; end

    beta = % ADD YOUR CODE HERE
    d = % ADD YOUR CODE HERE
    rsold = rsnew;
end

fprintf('CG residual %e at iteration %d of %d\n', sqrt(rsnew), i, maxiter );

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
