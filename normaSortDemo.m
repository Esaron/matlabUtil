function[X, PI, A] = normaSortDemo(n)
%------------------------------------------------------------------------
%
% normaSortDemo.m:
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

% Generate random diagonal mixing matrix
[A PI] = randMixingMat(n);
% Normalize and sort
X = normaSort(A);

end