clear all
close all

%{
    Objectives: Max spring index and Max spring rate
    
    Constraints: outer_diam_max, max_shear_stress, buckling_slenderness, coil_binding_gap

    State Variables: 'inner_diameter', 'wire_diameter', 'total_number_of_coils'

    Status: Works!


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
objFcnParts = {max_spring_rate,max_spring_index};
% objective function weights (don't forget to normalize weights)
kMax = 20;
cMax = 10;
w = [0.5/kMax; 0.5/cMax];

%% define stateVariables
stateVar = {'inner_diameter', 'wire_diameter', 'total_number_of_coils'};
% state variable bounds
lB = [20e-3, 1e-3, 9];
uB = [40e-3, 5e-3, 17];

% set constraints using names given in PredefinedConstraints
consPart = {outer_diam_max, stress_relaxation};


%% Check feasibility and setup Direct
OP = OptimizationProblem(stateVar,objFcnParts,w,consPart,S);
Problem = OP.setDirect();
bounds = [lB', uB'];
isProblemFeasible = OP.isProblemFeasible(bounds,S);

if (isProblemFeasible == 0)
    disp('No Feasible Solution Found');
end

keyboard
%% Direct solver options
opts.ep = 1e-5;
opts.maxevals = 1e4;
opts.maxits = 1e4;
opts.maxdeep = 1e4;
opts.testflag = 0;
opts.showits = 0;

%% *** This line runs the direct global optimization algorithm on the problem ***
[fMin, xMin, history] = Direct(Problem, bounds, opts);

%% *** This line runs the General_SA algorithm for optimization problem ***
nsamples = 1000;
[SA_Indices] = General_SA(bounds,OP.objective,OP.constraints,S,nsamples);