clear, close all; clc;
% visualize SVD of kernel matrices; the right singular vector of
% K2 \otimes K1 (i.e., the columns of V1 \otimes V2) can be expressed
% as vec(v1i v2j^T), where v1i is the i-th column of V1 and v2j is the
% j-th column of V2

% problem dimension
n = 256;

% get 2D kernel matrix
K = getKernel2D( n );

% compute SVD of convolution operators
% ADD YOUR CODE HERE

% compute outer product
SST = % ADD YOUR CODE HERE

% visualize outer product (log scale)
figure()
subplot(1,2,1), imagesc(log(SST)); colorbar()
subplot(1,2,2), surf(log(SST)); shading interp;

% plot right singular vectors of K2 \otimes K1 based on v1i v2j^T for
% i,j = 1,4,16
id = {1,4,16};
m = numel(id);


figure()
k = 1;
for i = 1 : m
    for j = 1 : m
        v1 = % ADD YOUR CODE HERE
        v2 = % ADD YOUR CODE HERE
        % plot right singular vector
        subplot(3,3,k), imagesc(v1*v2');
        k = k + 1;
    end
end




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
