function[xx] = whiten(x)
%------------------------------------------------------------------------
%
% whiten.m:
%   Whitens the input vectors (makes the covariance matrix the identity
%   matrix; IE - WW'=I).  Faster and simpler than whiten2.
%
% Inputs:
%   X: Vectors to whiten as rows
%   epsilon: Step size
%
% Outputs:
%   W: The whitened vectors as rows
%
%------------------------------------------------------------------------

c=cov(x');
sq=inv(sqrtm(c));
mx=mean(x');
xx=x-mx'*ones(1,size(x,2));
xx=2*sq*xx;

end