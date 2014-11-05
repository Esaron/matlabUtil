classdef FIRMatrix
    properties
        fir
    end
    methods
        FIRMatrix(m, n, k)
        methodName
    end
end

function A = FIRMatrix(m, n, k)
%------------------------------------------------------------------------
%
% FIRMatrix.m:
%   A class used to perform FIR Linear Algebra
%
% Inputs:
%   m: The number of sources
%   n: The number of microphones
%   k: The number of samples
%
% Outputs:
%   A: The Finite Impulse Response matrix
%
%------------------------------------------------------------------------

A = zeros(m, n, k);

end

function A = set.fir(i, j, fir)



end