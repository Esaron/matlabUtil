function[samples] = sampleContiguously(blockSize, mixtures)
%------------------------------------------------------------------------
%
% sampleContiguously.m:
%   Obtains contiguous samples of the provided block size that start at
%   random indices.
%
% Inputs:
%   blockSize: The block size to use
%   mixtures: Matrix of mixtures from which to sample
%
% Outputs:
%   samples: The samples
%
%------------------------------------------------------------------------

% We are randomly sampling the starting index for a block
validIndices = size(mixtures, 2) - blockSize;
% Generate random index for block
r = ceil(validIndices * rand(1, 1));
% Get mixtures for r
samples(:, 1:blockSize) = mixtures(:, r:r+blockSize-1);

end