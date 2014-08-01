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
b = 0.49*min(abs(nonzeros(A)));
N = -b + 2*b.*rand(n);
A = A + N;

end