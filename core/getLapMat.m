function L = getLapMat(n, dim, h)
% GETLAPMAT get negative laplacian operator (in matrix form)
% for a domain defined by omega = [0,1] or omega = [0,1] x [0,1]
% in the one or two dimensional casee, respectively we assume zero
%  dirichlet boundary conditions
%
% input:
%   n     number of grid points along each axis
%   dim   dimensionality of ambient space
%   h     spatial step size (optional; for FD approx)
%
% output:
%   L     laplacian operator

if ~exist('h','var'), h = ones([dim,1]); end


% identity matrix
id  = @(j) speye( n(j) );

% get 1D laplaican operator
del = @(j) getLapOp1D( n(j), h(j) );

% implementations for one and two-dimensional ambient space
switch dim
    case 1, L = % ADD YOUR CODE
    case 2, L = % ADD YOUR CODE
end

end % end of function



function dxx = getLapOp1D(n,h)
% construct 1D laplacian operator

dxx = % ADD YOUR CODE HERE

% zero dirichlet boundary conditions
dxx(  1,  1) = 2/(h*h);
dxx(end,end) = 2/(h*h);

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
