function[h] = dynamicSlider(varargin)
% DYNAMICSLIDER Creates a new slider uicontrol that executes its callback
% continuously.
%
% See also UICONTROL.

callbackIndex = find(strcmp(varargin, 'Callback'));
if isempty(callbackIndex)
    throw(MException('dynamicSlider:IllegalArgument', ['Must provide a '...
        'callback. If you do not need a callback function, use '...
        '''uicontrol'' with ''Style'' as ''slider''.']));
end
callback = varargin{callbackIndex+1};
varargin(callbackIndex:callbackIndex+1) = [];

styleIndex = find(strcmp(varargin, 'Style'));
if ~isempty(styleIndex)
    if ~strcmp(varargin{styleIndex+1}, 'slider')
        disp('''Style'' must be ''slider''. Ignoring provided ''Style''');
    end
    varargin(styleIndex:styleIndex+1) = [];
end

h = uicontrol('Style', 'slider');
for i=1:2:size(varargin, 2)
    name = varargin{i};
    value = varargin{i+1};
    set(h, name, value);
end
listener = handle.listener(h, 'ActionEvent', callback);
setappdata(h, 'listener', listener);

end