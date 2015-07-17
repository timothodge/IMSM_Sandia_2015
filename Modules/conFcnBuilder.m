function [f, g] = conFcnBuilder(x, springProperties, S, ineqConParts, eqConParts)

for k = 1:length(x)
    S.(springProperties{k}) = x(k);
end

f = cellfun(@objEval, ineqConParts, repmat({S},size(ineqConParts)));

% n = length(ineqConParts);
% f = zeros(n, 1);
% for k = 1:n
%     f(k, 1) = ineqConParts{k}.objEval(S);
% end

g = cellfun(@objEval, eqConParts, repmat({S},size(eqConParts)));

% n = length(eqConParts);
% g = zeros(n, 1);
% for k = 1:n
%     g(k, 1) = eqConParts{k}.objEval(S);
% end

end