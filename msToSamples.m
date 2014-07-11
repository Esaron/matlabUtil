%------------------------------------------------------------------------
%
% msToSamples.m:
%   Converts the provided matrix of time delays in ms into a matrix of
%   time delays in samples using the provided frequency.
%
% Inputs:
%   TIn: Square matrix of time delays in ms
%   fs: Frequency to use for conversion to number of samples
%
% Outputs:
%   TOut: A square matrix of time delays in samples
%
%------------------------------------------------------------------------

function[TSamples] = msToSamples(Tms, fs)

% samples = ms * frequency/1000
TSamples = ceil(Tms.*(fs/1000));

end