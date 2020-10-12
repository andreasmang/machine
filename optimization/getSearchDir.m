function sdir = getSearchDir( objfun, xc, dfc, df0, flag )
%GETSEARCHDIR compute search direction
%
% input:
%    objfun  function handle for objective function
%    xc      current iterate
%    dfc     current estimate of gradient
%    flag    identifier for method to compute search direction
%
% output:
%  sdir      search direction

sdir = [];

if strcmp( flag, 'gdsc' )
    % comupte search direction for gradient descent

    % ADD YOUR CODE HERE

elseif strcmp( flag, 'newton' )
    % compute newton step

    % ADD YOUR CODE HERE

elseif strcmp( flag, 'bfgs' )
    % compute bfgs search direction

    % ADD YOUR CODE HERE

else
    error( ['search direction ', flag, ' not defined'] );
end

end % end of function





%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
