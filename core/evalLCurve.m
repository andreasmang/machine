function evalLCurve( K, y_delta, solve, alphalist )
%EVALLCURVE compute and display l-curve
%
% input:
%   K           matrix operator
%   ydelta      perturbed data
%   solve       function handle to solve for x_alpha as a
%               function of the regularization parameter alpha
%   alphalist   list of trial regularization parameters

% problem setup
m  = length( alphalist );
res = zeros( m, 1 );
reg = zeros( m, 1 );

% define matrix vector product based on input
if isa( K, 'function_handle' ), matvec = @(x) K(x);
else,                           matvec = @(x) K*x;
end

for i = 1 : m
    % get regularization parameter from list
    alpha = alphalist( i );

    % solve inverse problem for selected alpha
    x_alpha = solve( alpha );

    % compute criteria/values for l-curve
    res(i) = % ADD YOUR CODE HERE
    reg(i) = % ADD YOUR CODE HERE

    fprintf('alpha=%e:  ||r|| = %e  ||x||=%e \n', alpha, res(i), reg(i));
end

% PLOT L-CURVE
figure();
loglog( res, reg, 'kx', 'MarkerSize', 10, 'Linewidth', 2 ); hold on;
loglog( res, reg, 'k-', 'Linewidth', 1 ); grid on;
xlabel( '||K*x_{\alpha} - y^{\delta}||_2', 'FontSize', 14, 'Interpreter','tex' );
ylabel( '||x_{\alpha}||', 'FontSize', 14 );
title( 'L-curve', 'FontSize', 14 );
hold off;

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
