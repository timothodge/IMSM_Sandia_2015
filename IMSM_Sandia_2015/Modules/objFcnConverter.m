function [f] = objFcnConverter(objFcn, S, springProperties, x)

for k = 1:length(x)
    eval(['S.' springProperties{k} '=' num2str(x(k)) ';']);
end
f = objFcn(S);

end
