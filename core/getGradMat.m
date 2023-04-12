function [D,D1,D2] = getGradMat(n, dim, h)
% GETGRADMAT get gradient matrix
%
% input:
%   n     number of grid points along each axis
%   dim   dimensionality of ambient space
%   h     spatial step size (optional; for FD approx)
%
% output:
%   D     gradient operator

if ~exist('h','var'), h = ones([dim,1]); end

% identity matrix
id = @(j) speye( n(j) );

% get 1D laplaican operator
grd = @(j) getGradOp1D( n(j), h(j) );

% implementations for one and two-dimensional ambient space
switch dim
    case 1
        D = grd(1);
    case 2
        D1 = kron(id(2),grd(1));
        D2 = kron(grd(2),id(1));
        D = [D1; D2];
end

end % end of function



function dx = getGradOp1D(n,h)
% construct 1D gradient operator (neumann boundary conditions)
%
% input:
%   n     number of grid points along each axis
%   h     spatial step size (optional; for FD approx)
%
% output:
%   dx    one dimensional gradient operator

dx = spdiags([-ones(n,1) ones(n,1)],[0 1],n-1,n)./h;

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
