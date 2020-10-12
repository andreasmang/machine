function [t] = doLineSearch( objfun, xc, sdir )
%DOLINESEARCH perform backtracking linesearch subject to armijo
%condition
%
% input:
%   objfun   function handle for objective function
%   xc       current iterate
%   sdir     search direction
%
% output:
%   t        lin search parameter

% evaluate objective function
[fc, dfc] = objfun( xc );

% initialize flag
success = false;

% set max number of linesearch iterations
maxit = 24;

% set initial step size and line search parameters
t = 1.0;
c = 1e-4;

% do linesearch
for i = 1 : maxit
    % ADD YOUR CODE HERE
end

% display message to user
if ~success, disp('line search failed'); t = 0.0; end

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
