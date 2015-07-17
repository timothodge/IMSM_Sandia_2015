function [f,g] = conFcnSpring(S, varargin)

f = zeros(nargin-1, 1);
for k = 1:nargin-1
    f(k,1) = varargin{k}.eval(S);
end
g = [];

end