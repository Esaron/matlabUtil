function [A PI] = randMixingMat(n)
%------------------------------------------------------------------------
%
% randMixingMat.m:
%   Creates an an random normal arbitrary mixing matrix.
%
% Inputs:
%   n: The size of the mixing matrix
%
% Outputs:
%   PI: The permutation matrix
%   A: The scrambled diagonal mixing matrix
%
%------------------------------------------------------------------------

% Create random normal vector
a = randn(n, 1);
% Diagonalize
aa = diag(a);
% Create arbitrary permutation matrix
PI = permMat(n);
% Scramble diagonal matrix
A = PI*aa;
% Introduce random noise
% Find minimum magnitude of elements and halve it to avoid exceeding
% existing elements in all cases.
alpha = 0.45;
b = alpha*nonzeros(A');
N = b*ones(1,n).*rand(n);
nega = 2.*binornd(1, 0.5, n) - 1;
N = nega.*N;
A = A + N;

end