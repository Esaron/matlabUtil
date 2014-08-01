function[px] = calculateDensity()
%------------------------------------------------------------------------
%
% calculateDensity.m:
%   Calculates the density px of the mixture vector x=As.
%
% Inputs:
%   N/A
%
% Outputs:
%   px: Density of the mixture
%
%------------------------------------------------------------------------

n = ceil(5*rand) + 1;
m = 1000*rand;
mu = zeros(n, 1);
b = zeros(n, 1);
S = zeros(n, m);
for i=1:n
    mu(i) = 2*rand-1;
    b(i) = 5*rand;
    S(i, :) = real(randlaplace(mu(i), b(i), 1, m));
end
sortS = sort(S, 2);
A = randMixingMat(n);
B = inv(A);
psi = zeros(n, m);
for i=1:n
    psi(i, :) = laplacePdf(mu(i), b(i), sortS(i, :));
    plot(psi(i, :), 'Color','blue');
    hold on;
end
ps = prod(psi);
px = abs(det(B))*ps;
figure;
plot(ps, 'Color','red');
hold on;
plot(px, 'Color','green');

end