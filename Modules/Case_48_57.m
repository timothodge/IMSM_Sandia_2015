clear all
close all
%{
    Objectives: d_expand and coil_binding_gap
    
    Constraints: Max spring index and F_open

    State Variables: Wire diameter

    Status: Works, but there is no feasible solution.


%}
%% initialization

S = Spring_Obj;
S = S.Set_Rest_Of_Properties;
PredefinedConstraints;

% if you want something different than the default setting, uncomment and
% change the string's attribute below
%% *** TO DO -- Add all spring attributes ****

S.shear_modulus = 77e9;
S.youngs_modulus = 193;
S.poisson_ratio = 0.3;
S.length_at_no_compression = 85.5e-3;
S.length_at_hard_stop_position = 20e-3;
S.ultimate_torsional_stress = 0.7e9;
S.minimum_coil_binding_gap = 5e-4;
S.maximum_outer_diameter = 0.06;
S.end_conditions = 0;
S.maximum_spring_rate = 0;
S.maximum_spring_index = 0;

% using the constraint names given in PredefinedConstraints to specify 
% the objective function parts
objFcnParts = {diametral_expansion,coil_binding_gap};
% objective function weights (don't forget to normalize weights)
kMax = 20;
cMax = 10;
w = [1; 1];

%% define stateVariables
stateVar = {'wire_diameter'};
% state variable bounds
lB = [20e-3];
uB = [5e-2];



% set constraints using names given in PredefinedConstraints
consPart = {max_spring_index, preload_force};


%% Direct
OP = OptimizationProblem(stateVar,objFcnParts,w,consPart,S);
Problem = OP.setDirect();
bounds = [lB', uB'];

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