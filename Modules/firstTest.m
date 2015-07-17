clear all
close all

%% initialization

S = Spring_Obj;
PredefinedConstraints;

% defined string properties
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

% state variables and objective function parts
stateVar = {'inner_diameter', 'wire_diameter', 'total_number_of_coils'};
objFcnParts = {max_spring_rate,max_spring_index};

% state variable bounds
lB = [20e-3, 1e-3, 9];
uB = [40e-3, 5e-3, 17];

%objective function weights
kMax = 20;
cMax = 10;
w = [0.5/kMax; 0.5/cMax];

%% fmincon

% linear bounds
A = [1 2 0; -1 -1 0];
b = [S.maximum_outer_diameter; -S.length_at_no_compression/pi*sqrt((S.poisson_ratio+2)/(4*S.poisson_ratio+2))];

% initial conditions
x0 = [1e-3; 5e-3; 7];

objectiveFunction =@(x) objFcnBuilder(x, stateVar, S, w, objFcnParts);
constraintEquation =@(x) conFcnBuilder(x, stateVar, S, {max_shear_stress,coil_binding_gap}, {});

options = optimoptions('fmincon', 'MaxIter', 5000, 'TolFun', 10e-10, 'MaxFunEvals', 5000, 'TolX', 10e-10, 'TolCon', 10e-10);
[xOpt, fOpt] = fmincon(objectiveFunction, x0, A, b, [], [], lB, uB, constraintEquation, options);

%% Direct

objectiveFunction =@(x) objFcnBuilder(x, stateVar, S, w, objFcnParts);

constraintEquation1 =@(x) [1 2 0]*x - S.maximum_outer_diameter;
constraintEquation2 =@(x) [-1 -1 0]*x + S.length_at_no_compression/pi*sqrt((S.poisson_ratio+2)/(4*S.poisson_ratio+2));
constraintEquation3 =@(x) conFcnBuilder(x, stateVar, S, {max_shear_stress}, {});
constraintEquation4 =@(x) conFcnBuilder(x, stateVar, S, {coil_binding_gap}, {});

Problem.f = objectiveFunction;
Problem.numconstraints = 4;
Problem.constraint(1).func = constraintEquation1;
Problem.constraint(1).penalty = 1e8;
Problem.constraint(2).func = constraintEquation2;
Problem.constraint(2).penalty = 1e8;
Problem.constraint(3).func = constraintEquation3;
Problem.constraint(3).penalty = 1e8;
Problem.constraint(4).func = constraintEquation4;
Problem.constraint(4).penalty = 1e8;

bounds = [lB', uB'];

opts.ep = 1e-5;
opts.maxevals = 1e4;
opts.maxits = 1e4;
opts.maxdeep = 1e4;
opts.testflag = 0;
opts.showits = 0;

[fMin, xMin, history] = Direct(Problem, bounds, opts);