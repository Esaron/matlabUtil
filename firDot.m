function[C] = firDot(A, B)
%------------------------------------------------------------------------
%
% firDot.m:
%   Calculates the product of two FIR matrices according to FIR Linear
%   Algebra notation.  IE - the third dimension of input matrices A and B
%   corresponds to the time domain of finite impulse response functions
%   between source (1D) and sensor (2D).  The product of A and B is defined
%   as the convolution of each operand that would normally be multiplied
%   together in the dot product of the matrices A' and B', where A' and B'
%   are the first two dimensions of A and B.
%
% Inputs:
%   A: First FIR matrix
%   B: Second FIR matrix
%
% Outputs:
%   C: FIR dot product of A and B
%
%------------------------------------------------------------------------

addpath('../util');
sizeA = size(A);
sizeB = size(B);
C = zeros(sizeA(1), sizeB(2), sizeB(3));
for i=1:sizeA(1)
    for j=1:sizeB(2)
        for k=1:sizeA(2)
            filtered = convTrimEnd(squeeze(B(k, j, :))',...
                squeeze(A(i, k, :))');
            C(i, j, :) = C(i, j, :)...
                + reshape(filtered, [1,1,sizeB(3)]);
        end
    end
end

end