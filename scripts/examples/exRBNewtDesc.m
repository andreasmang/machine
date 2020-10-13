clear, close all;
% illustration of convergenc of newton's method for rosenbrock function

xtrue = [1;1];        % true solution
a     = [3;1];        % parameters
x0    = [-0.1; -0.2]; % initial guess
[x1,x2] = meshgrid(-.5:.01:1.5);

% evaluate objective function for all x
fx = a(1)*(x1.^2 - x2).^2 + (x1 - a(2)).^2;

% function handle to evaluate gradient
g1 = @(x)  4*a(1)*x(1)*(x(1)^2-x(2)) + 2*x(1)-2*a(2); % d_1 f(x)
g2 = @(x) -2*a(1)*(x(1)^2 - x(2));                  % d_2 f(x)
grad = @(x) [ g1(x); g2(x) ];

% function handle to evaluate hessian
h11 = @(x)  4*a(1)*(x(1)^2 - x(2)) + 8*a(1)*x(1)^2+2;
h12 = @(x) -4*a(1)*x(1);
h21 = @(x) -4*a(1)*x(1);
h22 = @(x)  2*a(1);
hess = @(x) [ h11(x), h12(x); h21(x), h22(x) ];


% plot objective function
figure(1);
subplot(1,2,1);
h = surf( x1, x2, fx );
set( h, 'edgecolor', 'none' );
axis tight;
title('objective function');
colormap winter;

% set initial guess
x = x0;

for k = 1 : 6
    df  = grad( x ); % evaluate gradient
    d2f = hess( x ); % evaluate hessian

    % compute quadratic approximation
    x1p = x1 - x(1); % perturbation in x1 dir
    x2p = x2 - x(2); % perturbation in x2 dir
    ptg  = df(1)*x1p + df(2)*x2p;
    pthp = 0.5*(x1p.*x1p*d2f(1,1)+2*d2f(1,2)*x1p.*x2p+d2f(2,2)*x2p.*x2p);
    qx = ptg + pthp;

    % compute gradient descent search direction
    sdir = -df;
    xg_new = x + sdir;

    % compute newton step and update
    sdir   = -d2f \ df;
    xn_new = x + sdir;

    vizStatus( x1, x2, qx, fx, xtrue, x, xg_new, xn_new );

    % update newton step
    x = xn_new;

end




%///////////////////////////////////////////////////////
function vizStatus(x1, x2, qx, fx, xtrue, x, xg_new, xn_new )
% VIZSTATUS visualization of current iterate and search direction
%
% input:
%   x1       x1 coordinates
%   x2       x2 coordinates
%   qx       local quadratic approximation of objective
%   fx       objective function values
%   xtrue    true solution
%   x        current iterate
%   xg_new   next iterate (gradient descent)
%   xn_new   next iterate (newton)


figure(1);
subplot(1,2,2);
h = surf( x1, x2, qx );
set( h, 'edgecolor', 'none' );
colormap winter;
title('quadratic approximation');

figure(2);
contour( x1, x2, fx, 30, 'lineWidth', 1, 'DisplayName', 'f(x)' );
colormap(jet(5));
hold on;
contour( x1, x2, qx, 20, 'r', 'LineWidth', 1, 'DisplayName', 'q(x)'  );
plot( xtrue(1), xtrue(2), 'kx', 'LineWidth', 2, 'MarkerSize', 14, 'DisplayName', 'x_{true}' );
plot( x(1), x(2), 'bx', 'LineWidth', 2, 'MarkerSize', 14, 'DisplayName', 'x_k' );
plot( [x(1),xg_new(1)], [x(2),xg_new(2)], 'g', 'LineWidth', 2, 'DisplayName', 'gradient descent'  );
xlim([-.5,1.5]); ylim([-.5,1.5]);
plot( [x(1),xn_new(1)], [x(2),xn_new(2)], 'b', 'Linewidth', 2, 'DisplayName', 'newton' );
legend('FontSize', 14, 'Location', 'bestoutside');
axis equal tight;
hold off;
drawnow;
pause(1.0);


end
%///////////////////////////////////////////////////////




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
