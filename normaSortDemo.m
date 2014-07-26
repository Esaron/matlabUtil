function[X, PI, A] = permMatDemo(n)
%------------------------------------------------------------------------
%
% permMatDemo.m:
%   Creates an an arbitrary permutation matrix, scrambled random diagonal
%   matrix, normalizes it, and sorts it such that it is diagonal.
%
% Inputs:
%   n: The size of the permutation matrix
%
% Outputs:
%   X: The normalized, sorted diagonal matrix
%   PI: The permutation matrix
%   A: The scrambled diagonal matrix
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
% Normalize and sort
X = normaSort(A);

end