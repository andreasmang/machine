clear, close all; clc;

% example to illustrate ill-posedness of cauchy problem for
% laplace equation lap(u) = 0, u(x1,0) = 0, d_x2 u(x1,0) = g(x1)

% number of discretization points
n = 256;

% example for stability of laplace equation
u = @(x,n) (1/n^2)*sin(n.*x(:,:,1)).*sinh(n.*x(:,:,2));
g = @(x,n) (1/n)*sin(n*x);

% compute step size
h = 2*pi / n;

% compute coordinates
xs = (0:h:2*pi-h);
[x1,x2] = meshgrid( xs, xs );
x = zeros( [n, n, 2] );
x(:,:,1) = x1;
x(:,:,2) = x2;

% compute analytics solution
sol1 = u( x,  1 );
sol2 = u( x,  2 );
sol3 = u( x,  4 );
sol4 = u( x, 16 );

% visualize solution for increasing n
figure();
subplot(2,2,1), imagesc( sol1 ), colorbar(), title( 'solution u(x) for n=1'  );
subplot(2,2,2), imagesc( sol2 ), colorbar(), title( 'solution u(x) for n=2'  );
subplot(2,2,3), imagesc( sol3 ), colorbar(), title( 'solution u(x) for n=4'  );
subplot(2,2,4), imagesc( sol4 ), colorbar(), title( 'solution u(x) for n=16' );

% visualize solution (surface plot) for increasing n
figure();
subplot(2,2,1), surfc( sol1 ), shading interp, title( 'solution u(x) for n=1'  );
subplot(2,2,2), surfc( sol2 ), shading interp, title( 'solution u(x) for n=2'  );
subplot(2,2,3), surfc( sol3 ), shading interp, title( 'solution u(x) for n=4'  );
subplot(2,2,4), surfc( sol4 ), shading interp, title( 'solution u(x) for n=16' );

% visualize boundary condition g(x)
% for increasing n
figure();
plot( xs, g( xs, 1 ) );
hold on;
plot( xs, g( xs, 2 ) );
plot( xs, g( xs, 4 ) );
plot( xs, g( xs, 16 ) );
hold off;
legend('n=1', 'n=2', 'n=4', 'n=16');
title('boundary condition g(x) for different n');




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
