function [Ur,Sr,Vr] = tSVDTH( K, alpha )
%TSVDTH compute truncated SVD
%
% input:
%   r       target rank
%
% output:
%   Ur      left singular vectors (truncated)
%   Sr      singular values (truncated)
%   Vr      right singular vectors (truncated)

% compute SVD
[U,S,V] = svd( K );
% get singular values
sigma = diag( S );

% find id for cutting SVD
r = % ADD YOUR CODE HERE

% if there is no value smaller than alpha, use all
% singular vectors and singular values
if isempty( r ), r = numel( sigma ); end

% compute low rank approximation
Ur = % ADD YOUR CODE HERE
Sr = % ADD YOUR CODE HERE
Vr = % ADD YOUR CODE HERE

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
