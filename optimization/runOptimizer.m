function [xsol] = runOptimizer( objfun, x0, method )
%RUNOPTIMIZER main function to solve optimization problem
%
% input:
%   objfun    function handle for objective function
%   x0        initial guess
%   method    flag for optimization method
%
% output:
%   xsol      solution of optimization problem

sepstr = sprintf('%s \n', ones(1,65)*char('='));

fprintf( sepstr );
fprintf(" solving optimization problem\n");
fprintf( sepstr );

% get initial gradient
[fc, dfc] = objfun( x0 );
df0 = dfc;

% if initial gradient is too small, return home
if norm( df0(:) ) <= 1e-6
    xsol = x0;
    fprintf( 'norm(g0) = %e <= 1e-6', norm( df0(:) ) ); return;
end

% initialize variables
converged = false;
iter  = 0;   % iteration counter
tol   = 1e-6;  % tolerance for stoping conditions
maxit = 10000; % max number of iterations

% display iteration message
dispIter( fc, df0, dfc, iter, 1 );

xc = x0;
while ~converged
    % compute search direction
    sdir =  % ADD YOUR CODE HERE

    % do line search
    tc = % ADD YOUR CODE HERE
    if tc ~= 0.0
        xc = xc + tc*sdir;
    else, break;
    end

    % evaluate objective function for new iterate
    [fc, dfc] = objfun( xc );

    % increment iteration counter
    iter = iter + 1;

    % display iteration information
    dispIter( fc, dfc, df0, iter, tc );

    % evaluate stopping condition
    converged = % ADD YOUR CODE HERE
end

if converged
    fprintf( sepstr );
    fprintf(" solver converged\n");
    fprintf( [sepstr,'\n\n'] );
end

% asign solution
xsol = xc;

end % end of function




%//////////////////////////////////////////////////////
function dispIter( fc, dfc, df0, iter, gamma )
%DISPITER display iteration log
%
% input:
%   fc     current objective value
%   dfc    current gradient
%   df0    initial gradient
%   iter   iteration count
%   gamma  step size

% compute relative gradient
ndf    = norm( dfc(:) );
ndfrel = ndf / norm( df0(:) );

if iter == 0
    fprintf('[ %-6s %-12s %-12s %-12s %-12s ]\n', 'iter','fc','||df||','||df||_rel','step');
end

fprintf('[ %-6d %12e %12e %12e %12e ]\n', iter, fc, ndf, ndfrel, gamma );

end % end of function
%//////////////////////////////////////////////////////




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################

