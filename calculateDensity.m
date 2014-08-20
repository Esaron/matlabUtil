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

srcConst = 4;
pdfSize = 101;
n = ceil(srcConst*rand) + 1;
m = 100000;
mu = 0;
spacer = zeros(n, pdfSize);
S = zeros(n, m);
for i=1:n
    b = pdfSize*rand;
    S(i, :) = real(randlaplace(mu, b, 1, m));
    stddev = sqrt(2)*b;
    figure;
    spacer(i,:) = linspace(-5*stddev, 5*stddev, pdfSize);
    hist(S(i,:)', spacer(i,:));
    title(['Source ' num2str(i)]);
end
A = randMixingMat(n);
X = A*S;
for i=1:n
    figure;
    hist(X(i,:)', spacer(i, :));
    title(['Mixture ' num2str(i)]);
end
B = inv(A);
psi = zeros(n, m);
for i=1:n
    psi(i, :) = laplacePdf(mu, b(i), S(i, :));
end
ps = prod(psi);
px = abs(det(B))*ps;

end