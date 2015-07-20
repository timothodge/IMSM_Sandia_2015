clear all
close all

%{
    Objectives: stress_relaxation
    
    Constraints: max_outer_diam, max_closed_diametral_expansion, min_coil_binding_gap

    Variables: 'inner_diameter', 'wire_diameter', 'total_number_of_coils'

    Status: xMin = 0.05 0.0001 20.000, fMin = -0.8551, Works!

%}
%% initialization

fprintf('Initializing spring object and problem statement ... ');

S = Spring_Obj;
S = S.Set_Rest_Of_Properties;
PredefinedObjectives;
PredefinedConstraints;

% if you want something different than the default setting, uncomment and
% change the string's attribute below
%% *** TO DO -- Add all spring attributes ****

S.minimum_coil_binding_gap = .5e-3;

S.Norton_Bailey_c = 3.5E-13;
% S.shear_modulus = 77e9;
% S.youngs_modulus = 193;
% S.poisson_ratio = 0.3;
% S.length_at_no_compression = 85.5e-3;
% S.length_at_hard_stop_position = 20e-3;
% S.ultimate_torsional_stress = 0.7e9;
% S.minimum_coil_binding_gap = 5e-4;
% S.maximum_outer_diameter = 0.06;
% S.end_conditions = 0;
% S.maximum_spring_rate = 0;
% S.maximum_spring_index = 0;

% using the constraint names given in PredefinedConstraints to specify 
% the objective function parts
objFcnParts = {stress_relaxation};
% objective function weights (don't forget to normalize weights)
w = -1;

%% define stateVariables
stateVar = {'inner_diameter', 'wire_diameter', 'total_number_of_coils'};
% state variable bounds
lB = [10e-3, 1e-4, 3];
uB = [50e-3, 5e-3, 20];

% set constraints using names given in PredefinedConstraints
consPart = {max_outer_diam, max_closed_diametral_expansion, min_coil_binding_gap};

fprintf('done.\n');

%% Check feasibility and setup Direct

fprintf('Checking if a feasible solution exists ... ');

bounds = [lB', uB'];
OP = OptimizationProblem(stateVar,objFcnParts,w,consPart,S,bounds);
Problem = OP.setDirect();
isProblemFeasible = OP.isProblemFeasible(bounds,S);

% if (isProblemFeasible == 0)
%     fprintf('no such region found.\n');
% else
%     fprintf('there is such a region.\n');
% end
% 
% plottingStateVars = {'inner_diameter','wire_diameter','total_number_of_coils'};
% OP.constraints.plotConstraints(S,plottingStateVars, ...
%                                 [[20e-3,40e-3],[1e-3,5e-3],[9,17]])

% plottingStateVars = {'inner_diameter','wire_diameter'};
% OP.constraints.plotConstraints(S,plottingStateVars, ...
%                                 [[20e-3,40e-3],[1e-3,5e-3]])

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

% fprintf('Performing sensitivity analysis ... ');
% 
% nsamples = 1000;
% [SA_Indices] = General_SA(bounds,OP.objective,OP.constraints,S,nsamples);
% 
% fprintf('done.\n');