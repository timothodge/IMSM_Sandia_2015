function [xMin] = GUI_Optimize_Function(StateVariables,StateVariableBounds,Constants,ConstantsValues,Constraints,ConstraintsValues,Objectives, Weights)

fprintf('Initializing spring object and problem statement ... ');

S = Spring_Obj;
S = S.Set_Rest_Of_Properties;

%load libraries
PredefinedObjectives;
PredefinedConstraints;

%% designVariables %%%
stateVar = StateVariables;

lB = zeros(1,length(StateVariables));
uB = zeros(1,length(StateVariables));
for j=1:length(StateVariables)
   lB(j) = str2num(StateVariableBounds{1,j});
   uB(j) = str2num(StateVariableBounds{2,j});
end

%%% designVariable Constants %%%

% initialize user specified constants
for k = 1:length(Constants)
    S.(Constants{k}) = str2num(ConstantsValues{k});
end

%%% Constraint Values %%%
consPart = cell(1,1);
for i=1:length(Constraints)
    consPart{i} = eval(Constraints{i});
end
% set values for constraints values
for k = 1:length(ConstraintsValues)
   S.(Constraints{k}) = str2num(ConstraintsValues{k}); 
end

%%% Objective Function %%%
objFcnParts = cell(length(Objectives),1);
for k=1:length(Objectives)
    objFcnParts{k} = eval(Objectives{k});
end

% set weights for objective function
w = zeros(length(Objectives),1);
for j=1:length(Objectives)
    w(j) = str2num(Weights{j});
end

fprintf('done.\n');

%% Check feasibility and setup Direct

fprintf('Checking if a feasible solution exists ... ');
bounds = [lB', uB'];
OP = OptimizationProblem(stateVar,objFcnParts,w,consPart,S,bounds);
Problem = OP.setDirect();
isProblemFeasible = OP.isProblemFeasible(bounds,S);

if (isProblemFeasible == 0)
    fprintf('no such region found.\n');
else
    fprintf('there is such a region.\n');
end

%plottingStateVars = {'inner_diameter','wire_diameter','total_number_of_coils'};
%OP.constraints.plotConstraints(S,plottingStateVars, ...
%                                [[20e-3,40e-3],[1e-3,5e-3],[9,17]])

%plottingStateVars = {'inner_diameter','wire_diameter'};
%OP.constraints.plotConstraints(S,plottingStateVars, ...
%                                [[20e-3,40e-3],[1e-3,5e-3]])

%% Direct solver options %%
opts.ep = 1e-5;
opts.maxevals = 1e4;
opts.maxits = 1e4;
opts.maxdeep = 1e4;
opts.testflag = 0;
opts.showits = 0;

%% ***This line runs the direct global optimization algorithm on the problem ***

fprintf('Running Direct optimization method ...\n');

[fMin, xMin, history] = Direct(Problem, bounds, opts);

fprintf('... done.\n');

%% *** This line runs the General_SA algorithm for optimization problem

%fprintf('Performing sensitivity analysis ... ');

%nsamples = 1000;
%[SA_Indices] = General_SA(bounds,OP.objective,OP.constraints,S,nsamples);

%fprintf('done.\n');

end