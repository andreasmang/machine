function [Ur,Sr,Vr] = tSVD( K, r )
%TRUNSVD compute truncated SVD
%
% input:
%   r       target rank
%
% output:
%   Ur      left singular vectors
%   Sr      singular values
%   Vr      right singular vectors

% compute singular value decomposition
[U,S,V] = % ADD YOUR CODE HERE

% compute low rank approximation
Ur = % ADD YOUR CODE HERE
Sr = % ADD YOUR CODE HERE
Vr = % ADD YOUR CODE HERE

% truncation (numerical accuracy)
Sr ( Sr < 1e-14 ) = 1e-14;

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
