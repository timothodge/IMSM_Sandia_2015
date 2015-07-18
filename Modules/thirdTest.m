clear all
close all

%% initialization

S = Spring_Obj;
S = S.Set_Rest_Of_Properties;

% defined string properties
S.shear_modulus = 77e9;
S.youngs_modulus = 193;
S.poisson_ratio = 0.3;
S.length_at_hard_stop_position = 20e-3;
S.ultimate_torsional_stress = 0.7e9;
S.minimum_coil_binding_gap = 5e-4;
S.maximum_outer_diameter = 0.06;
S.end_conditions = 0;
S.maximum_spring_rate = 0;
S.maximum_spring_index = 0;
S.force_at_open_position = 0;

PredefinedConstraints;

% state variables and objective function parts
stateVar = {'inner_diameter', 'wire_diameter', 'total_number_of_coils', 'length_at_no_compression'};
objFcnParts = {preload_force};

%objective function weights
w = 1;

% state variable bounds
lB = [20e-3, 1e-3, 9, 30e-3];
uB = [40e-3, 5e-3, 17, 150e-3];

% constraints
consPart = {outer_diam_max, diametral_expansion, max_shear_stress, coil_binding_gap};

% %% fmincon
% 
% % linear bounds
% A = [1 2 0; -1 -1 0];
% b = [S.maximum_outer_diameter; -S.length_at_no_compression/pi*sqrt((S.poisson_ratio+2)/(4*S.poisson_ratio+2))];
% 
% % initial conditions
% x0 = [1e-3; 5e-3; 7];
% 
% objectiveFunction =@(x) objFcnBuilder(x, stateVar, S, w, objFcnParts);
% constraintEquation =@(x) conFcnBuilder(x, stateVar, S, {max_shear_stress,coil_binding_gap}, {});
% 
% options = optimoptions('fmincon', 'MaxIter', 5000, 'TolFun', 10e-10, 'MaxFunEvals', 5000, 'TolX', 10e-10, 'TolCon', 10e-10);
% [xOpt, fOpt] = fmincon(objectiveFunction, x0, A, b, [], [], lB, uB, constraintEquation, options);

%% Direct

objective = ObjectiveFunction(objFcnParts, w, stateVar);
objHandle =@(x) objective.objFcnEvaluator(x,S);
constraints = constraintSystem(consPart);
constraintSys = constraints.constraintSystemBuilder(objective,S); 

% constraintEquation1 =@(x) [1 2 0]*x - S.maximum_outer_diameter;
% constraintEquation2 =@(x) [-1 -1 0]*x + S.length_at_no_compression/pi*sqrt((S.poisson_ratio+2)/(4*S.poisson_ratio+2));
% constraintEquation3 =@(x) conFcnBuilder(x, stateVar, S, {max_shear_stress}, {});
% constraintEquation4 =@(x) conFcnBuilder(x, stateVar, S, {coil_binding_gap}, {});

Problem.f = objHandle;
Problem.numconstraints = length(consPart);
for k = 1:length(consPart)
    Problem.constraint(k).func = constraintSys{k};
    Problem.constraint(k).penalty = 1e8;
end

bounds = [lB', uB'];

opts.ep = 1e-5;
opts.maxevals = 1e4;
opts.maxits = 1e4;
opts.maxdeep = 1e4;
opts.testflag = 0;
opts.showits = 0;

[fMin, xMin, history] = Direct(Problem, bounds, opts);