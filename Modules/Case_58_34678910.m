clear all
close all

%{
    Objectives: spring_rate, coil_binding_gap
    
    Constraints: max_outer_diam, max_closed_diametral_expansion,
    min_coil_binding_gap, max_buckling_slenderness, max_shear_stress,
    max_preload_force

    State Variables: 'inner_diameter', 'wire_diameter',
    'total_number_of_coils', 'length_at_hard_stop_position'

    Status: xMin = 0.0274 0.0003 21.444 0.0164 fMin = 0.0514. Works!

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

S.maximum_outer_diameter = 80E-3;
S.maximum_spring_index = 100;
S.minimum_coil_binding_gap = .5e-3;
S.maximum_ultimate_torsional_stress = .7e9;

S.end_conditions = 0;
S.poisson_ratio  =0.3;
S.shear_modulus = 77e9;
S.length_at_no_compression=85.5E-3;
S.length_at_open_position=25E-3;
S.force_at_open_position=0.05;

% using the constraint names given in PredefinedConstraints to specify 
% the objective function parts
objFcnParts = {spring_rate, coil_binding_gap};
% objective function weights (don't forget to normalize weights)
kMax = 60;
gMax = 5E-3;
w = [0.5/kMax; 0.5/gMax];

%% define stateVariables
stateVar = {'inner_diameter', 'wire_diameter', 'total_number_of_coils','length_at_hard_stop_position'};
% state variable bounds
lB = [20e-3, 0.2e-3, 7 ,10E-3];
uB = [60e-3, 5e-3, 22,50E-3];

% set constraints using names given in PredefinedConstraints
consPart = {max_outer_diam, max_closed_diametral_expansion, max_spring_index, min_coil_binding_gap, max_buckling_slenderness, max_shear_stress, max_preload_force};

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
%                                 [[20e-3,60e-3],[0.2e-3,5e-3],[7,22]])

% plottingStateVars = {'inner_diameter','wire_diameter'};
% OP.constraints.plotConstraints(S,plottingStateVars, ...
%                                 [20e-3,40e-3],[1e-3,5e-3])

%% Direct solver options %%
opts.ep = 1e-5;
opts.maxevals = 2e4;
opts.maxits = 2e4;
opts.maxdeep = 2e4;
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