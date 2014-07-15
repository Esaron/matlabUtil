function[samples] = sample(blockSize, mixtures)
%------------------------------------------------------------------------
%
% sample.m:
%   Obtains random samples of the provided block size.
%
% Inputs:
%   blockSize: The block size to use
%   mixtures: Matrix of mixtures from which to sample
%
% Outputs:
%   samples: The samples
%
%------------------------------------------------------------------------

% Get the number of mixtures and their length
numMixtures = size(mixtures, 1);
mixtureLength = size(mixtures, 2);
% Initialize sample matrix
samples = zeros(numMixtures, blockSize);
for i=1:blockSize
    % Generate random indices for block
    r = ceil(mixtureLength * rand(1, 1));
    % Get mixtures for r
    samples(:, i) = mixtures(:, r);
end

end