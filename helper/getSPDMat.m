function [A] = getSPDMat( n, s )
% CREATESPDMAT creates a positive definite matrix
%
% input
%   n       size of n x n matrix
%   s       smallest eigenvalue

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