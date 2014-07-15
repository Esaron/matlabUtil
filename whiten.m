function[W] = whiten(X, epsilon)
%------------------------------------------------------------------------
%
% whiten.m:
%   Whitens the input vectors (makes the covariance matrix the identity
%   matrix; IE - WW'=I
%
% Inputs:
%   X: Vectors to whiten as rows
%   epsilon: Step size
%
% Outputs:
%   W: The whitened vectors as rows
%
% Adapted from the work of Colorado Reed, colorado-reed@uiowa.edu
%   Original code: http://www.mathworks.com/matlabcentral
%       /fileexchange/34471-data-matrix-whitening/content/whiten.m
%
%------------------------------------------------------------------------

if ~exist('epsilon','var')
    epsilon = 0.0001;
end

mu = mean(X, 2); 
X = bsxfun(@minus, X, mu);
A = X'*X;
[V,D] = svd(A);
whMat = sqrt(size(X,1)-1)*V*sqrtm(inv(D + eye(size(D))*epsilon))*V';
W = X*whMat;  
%invMat = pinv(whMat);

end