function [A] = getSPDMat( n, s )
% CREATESPDMAT creates a positive definite matrix
%
% input
%   n       size of n x n matrix
%   s       order of smallest eigenvalue, i.e., lmin = 10^s

if s >= 0
    warning('s should be in (-infty,0)')
    s = -6;
end

% construct SPD matrix
U = orth( rand( n, n ) );
d = logspace( 0, s, n );

A = U*diag(d)*U';

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################