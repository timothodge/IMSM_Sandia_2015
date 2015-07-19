clear all
close all
%{
    Objectives: max stress relaxation
    
    Constraints: outer_diam_max, diametral expansion, coil binding gap

    State Variables: inner diameter wire diameter total number of coils

    Status:


%}
%% initialization

S = Spring_Obj;
S = S.Set_Rest_Of_Properties;
PredefinedConstraints;
PredefinedObjectives;

% if you want something different than the default setting, uncomment and
% change the string's attribute below
%% *** TO DO -- Add all spring attributes ****

S.shear_modulus = 77e9;
S.shear_modulus_stress_relaxation = 6E10;
S.youngs_modulus = 193;
S.poisson_ratio = 0.3;
S.minimum_coil_binding_gap = 1e-4;
S.maximum_outer_diameter = 0.09;
S.end_conditions = 0;

% using the constraint names given in PredefinedConstraints to specify 
% the objective function parts
objFcnParts = {stress_relaxation};
% objective function weights (don't forget to normalize weights)
w = -1;

%% define stateVariables
stateVar = {'inner_diameter', 'wire_diameter','total_number_of_coils'};
% state variable bounds
lB = [1e-3, 1e-4, 3];
uB = [1e-1,5e-3,20];

% set constraints using names given in PredefinedConstraints
consPart = {outer_diam_max,max_closed_diametral_expansion,min_coil_binding_gap};


%% Direct
bounds = [lB', uB'];
OP = OptimizationProblem(stateVar,objFcnParts,w,consPart,S,bounds);
Problem = OP.setDirect();


isProblemFeasible = OP.isProblemFeasible(bounds,S);

if (isProblemFeasible == 0)
    'No Feasible Solution Found'
end


%% Direct solver options %%
opts.ep = 1e-5;
opts.maxevals = 1e4;
opts.maxits = 1e4;
opts.maxdeep = 1e4;
opts.testflag = 0;
opts.showits = 0;

%% ***This line runs the direct global optimization algorithm on the problem ***
[fMin, xMin, history] = Direct(Problem, bounds, opts);

%% *** This line runs the General_SA algorithm for optimization problem
nsamples = 1000;
[SA_Indices] = General_SA(bounds,OP.objective,OP.constraints,S,nsamples);