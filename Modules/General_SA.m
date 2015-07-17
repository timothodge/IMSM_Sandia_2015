% Sensitivity Analysis Generalized Code

function SA_Indices = General_SA(xbounds, objFcn, conFcn)
% bounds is a m x 2 matrix
% m design variables
% Each row has the lower and upper bounds of a design variable
% f is a function handle of the objective function

nsam = 10;
[m,~] = size(xbounds);
xsamples = zeros(nsam,m);
NumberOfVaribles = m;
NumberOfSamples = nsam;
SA_Indices = zeros(1,m);

% for k1 =1:NumberOfVaribles
%     xsamples(:,k1) = unifrnd(xbounds(k1,1),xbounds(k1,2),nsam,1);
% end

% xsamples = bsxfun(@plus, xbounds(:,1), bsxfun(@times, xbounds(:,2)-xbounds(:,1), lhsdesign(nsam, NumberOfVaribles)'))';

for k1 = 1:NumberofSamples
    [inEqVal, eqVal] = feval(conFcn,xsamples(k1,:));
    if sum(inEqVal > 0
    end

Y = zeros(nsam,1);
for k1 = 1:NumberOfSamples
    Y(k1) = feval(objFcn,xsamples(k1,:));
end
    
Var_Y = (std(Y)^2);

for k1 = 1:NumberOfVaribles
    E_Y_Xi = zeros(NumberOfSamples,1);
    for k2 = 1:NumberOfSamples
        Y_Xi_temp = zeros(NumberOfSamples,1);
        for k3 = 1:NumberOfSamples
            input = xsamples(k3,:);
            input(k1) = xsamples(k2,k1);
            Y_Xi_temp(k3)= feval(objFcn, input);
        end
        E_Y_Xi(k2) = mean(Y_Xi_temp);
    end
    Var_E_Y_Xi = (std(E_Y_Xi)^2);
    SA_Indices(k1) = Var_E_Y_Xi/Var_Y;
end
                
                