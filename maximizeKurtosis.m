function[wz] = maximizeKurtosis(X, epsilon)
%------------------------------------------------------------------------
%
% maximizeKurtosis.m:
%   Optimizes by maximizing kurtosis of the observed mixtures
%
% Inputs:
%   X: The observed audio mixtures
%   fs: The frequency of the audio mixtures
%   epsilon: Convergence criteria
%
% Outputs:
%   SS: The inferred sources S
%   AA: The inferred mixing matrix A
%
%------------------------------------------------------------------------

% Length of mixtures
n = size(X, 1);
m = size(X, 2);

% Obtain whitened mixtures
z = whiten(X);
% Initialize normalized b (w) to [1; 0; ...; 0]
w = zeros(n, 1);
w(1, 1) = 1;

% Initialize delta and whitened source
dw = ones(n, 1);

while all(abs(dw) > epsilon)
    % Get sign of kurtosis (can be substituted with 1 or -1 if distribution
    % type is known); sub- or supergaussian
    distType = sign(kurt(w'*z));
    % Get delta
    dw = distType*z*(w'*z.^3)'
    % Adjust w and normalize
    w = w + dw;
    w = w/norm(w);
end

wz = w'*z;

end