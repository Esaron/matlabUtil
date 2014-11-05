function [s] = makeZeroMeanUnitVar(s)

% s should be column vector
% find mean
me = mean(s);

% find std
st = std(s,1);

for i=1:size(s, 2);
    s(i,:) = s(i,:) - me(i);
    s(i,:) = s(i,:) - st(i);
end

end