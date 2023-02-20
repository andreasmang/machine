function [alpha,res] = evalDisPrinc( K, ydelta, solve, alphalist, delta )
%EVALDISPRINC evaluate discrepancy principle
%
% input:
%   K           matrix operator
%   ydelta      perturbed data
%   solve       function handle to solve for x_alpha (for different values of alpha)
%   delta       amplitude of perturbation
%   alphalist   list of regularization parameters to be considered
%
% output:
%   alpha       optimal regularization parameter

m = length( alphalist );
res = zeros( m, 1 );

% sort list of trial parameters
alphalist = sort(alphalist, 'descend');

alpha = -1;

% apply mor
for i = 1 : m
    alpha_trial = alphalist( i );
    x_alpha = solve( alpha_trial );

    % compute error
    err = % ADD YOUR CODE HERE
    res(i) = err;

    % store optimal regularization paramter
    if ( err < delta && alpha == -1 )
        alpha = alpha_trial;
        fprintf( 'err = %e <= %e = delta\n', err, delta );
        fprintf( 'optimal regularization parameter: %e\n', alpha );
        if nargout < 2, return; end
    end
end

figure();
semilogx( alphalist, res, 'kx', 'MarkerSize', 10, 'Linewidth', 2 ); hold on;
semilogx( alphalist, res, 'k-', 'Linewidth', 1 ); grid on;
semilogx( alphalist, delta*ones(m,1), 'r-', 'Linewidth', 1  )
ylabel( '$||Kx_{\alpha} - y^{\delta}||_2$', 'FontSize', 19, 'interpreter', 'latex' );
xlabel( '$\alpha$', 'FontSize', 19, 'interpreter', 'latex' );
title( 'discrepancy principle', 'FontSize', 19 );
hold off;

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
