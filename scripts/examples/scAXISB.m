clear, close all;

n = 256;

% create positive definite matrix
K = getSPDMat( n, -3 );

% create random vector
x_true = rand([n, 1]);
y = K * x_true;

t = (0:n-1)';

% solve linear system
x1 = K \ y;

% solve linear system using matlab's pcg
x2 = pcg( K, y, 1e-12, n ); 

% solve linear system using own cg
x3 = runCG( K, y, 1e-12, n );

% print errors
fprintf('error = %e\n', norm(x_true(:) - x1(:)));
fprintf('error = %e\n', norm(x_true(:) - x2(:)));
fprintf('error = %e\n', norm(x_true(:) - x3(:)));


% plot results
figure()
subplot(2,1,1);
plot( t, x_true, t, x1, 'x', t, x2, 'o', t, x3, 'd' );
xlim([0,n-1]);
subplot(2,1,2);
plot( t, abs(x_true - x3));
xlim([0,n-1]);




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################