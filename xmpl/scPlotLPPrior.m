clear, close all;
% visualize landscape of ell^p prior / regularization functional
% for random points drawn from a vector in R^n for 0 < p <= 1

% dimensionality of vector
n = 256;

% number of draws from vector
ntrials = 5;

% dummy vector for evaluation of functional/prior
x = randn(n,1);

% order of norm
p = 0.1;

reg   = @(x) sum(abs(x).^p); % regularization functional

for i = 1 : ntrials
    % randomly draw indices
    id = randi([1,n],2,1);

    % compute landscape for two randomly drawn entries x_i
    lscape = compSurface(reg, x, id );

    % compute prior
    prior = exp(-lscape);

    % visualize landscape for regularizer and prior
    figure()
    subplot(1,2,1), surfc(lscape,'EdgeColor','None');
    subplot(1,2,2), surfc(prior,'EdgeColor','None');
end





function lscape = compSurface( reg, x, id )

% number of points of mesh to sample from
n = 256;
lscape = zeros([n,n]);

omega = 8; % extent of domain
h = (2*omega)/n; % step size
y = -omega:h:(omega-h); % coordinates to sample from

xtrial = x;
for i = 1 : n
    % perturb point 1
    xtrial( id(1) ) = x(id(1)) + y(i);
    for j = 1 : n
        % perturb point 2
        xtrial(id(2)) = x(id(2)) + y(j);

        % evaluate regularization functional
        lscape(i,j) = reg( xtrial );
    end
end

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
