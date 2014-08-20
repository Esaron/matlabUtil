function[loglike_X] = loglike(A, S)
%------------------------------------------------------------------------
%
% loglike.m:
%   Calculates the log likelihood of a set of sources (S) given a mixing
%   matrix A.
%
% Inputs:
%   A: The mixing matrix
%   S: A matrix of sources
%
% Outputs:
%   loglike_X: The log likelihood
%
%------------------------------------------------------------------------

% Calculate determinant of A
detA = det(A);
% Calculate P(s)
Ps = prod(laplacePdf(0, 1, S), 2);
% Calculate (log) likelihood
loglike_x = log(Ps/abs(detA));
% Calculate (log) likelihood of data ensemble
loglike_X = prod(loglike_x);

end