clear, close all;

s = -3; % order of smallest eigenvalue (lmin = 10^s), s < 0
n = 512; % size of SPD matrix
K = getSPDMat(n,s); % compute SPD matrix

% get condition number
c = cond(K);
fprintf('condition number of K: %e\n', c);

% compute random vector xtrue
xtrue = rand(n,1);

% compute RHS/data y given xtrue
y = K*xtrue;

% solve linear system Kx = y
xsol1 = pcg(K, y, 1e-6);
xsol2 = runCG(K,y,1e-6);

% compute relative error between true solution and numerical solution
err1 = norm(xsol1(:)-xtrue(:)) / norm(xtrue(:));
fprintf('relative error: %e\n',err1);
err2 = norm(xsol2(:)-xtrue(:)) / norm(xtrue(:));
fprintf('relative error: %e\n',err2);

% plot xtrue versus numerical solutions
figure()
plot(xsol1)
hold on;
plot(xsol2,'ro');
plot(xtrue,'kx');
hold off;

% display matrix K
figure()
subplot(2,1,1), imagesc(K);
subplot(2,1,2), imagesc(abs(log(K)));




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
