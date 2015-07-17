function [f] = objFcnBuilder(x, springProperties, S, w, objParts)

for k = 1:length(x)
    S.(springProperties{k}) = x(k);
end

f = dot(w, cellfun(@objEval,objParts,repmat({S},size(objParts))));

% f = 0;
% for k = 1:length(objParts)
%     f = f + w(k)*objParts{k}.objEval(S);
% end

end