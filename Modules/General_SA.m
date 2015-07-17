% Sensitivity Analysis Generalized Code

function [SA_Indices,NumberOfSamples] = General_SA(xbounds, objObj, conObj, S)
% bounds is a m x 2 matrix
% m design variables
% Each row has the lower and upper bounds of a design variable
% f is a function handle of the objective function

nsam = 500;
[m,~] = size(xbounds);
xsamples = zeros(nsam,m);
NumberOfVaribles = m;
NumberOfSamples = nsam;
SA_Indices = zeros(1,m);

for k1 =1:NumberOfVaribles
    xsamples(:,k1) = unifrnd(xbounds(k1,1),xbounds(k1,2),nsam,1);
end

% xsamples = bsxfun(@plus, xbounds(:,1), bsxfun(@times, xbounds(:,2)-xbounds(:,1), lhsdesign(nsam, NumberOfVaribles)'))';

feasibleCheck = false(NumberOfSamples,1);
for k1 = 1:NumberOfSamples
    S = S.update_state_variables(objObj.stateVar,xsamples(k1,:));
    feasibleCheck(k1) = conObj.pointIsValid(S);
end
xsamples = xsamples(feasibleCheck, :);
NumberOfSamples = size(xsamples, 1);

Y = zeros(NumberOfSamples,1);
for k1 = 1:NumberOfSamples
    Y(k1) = objObj.objFcnEvaluator(xsamples(k1,:),S);
end
    
Var_Y = (std(Y)^2);

for k1 = 1:NumberOfVaribles
    E_Y_Xi = zeros(NumberOfSamples,1);
    for k2 = 1:NumberOfSamples
        Y_Xi_temp = zeros(NumberOfSamples,1);
        for k3 = 1:NumberOfSamples
            input = xsamples(k3,:);
            input(k1) = xsamples(k2,k1);
            Y_Xi_temp(k3)= objObj.objFcnEvaluator(input,S);
        end
        E_Y_Xi(k2) = mean(Y_Xi_temp);
    end
    Var_E_Y_Xi = (std(E_Y_Xi)^2);
    SA_Indices(k1) = Var_E_Y_Xi/Var_Y;
end
                
                