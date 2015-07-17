clear all
close all

%% initialization

S = Spring_Obj;
PredefinedConstraints;

% defined string properties
S.shear_modulus = 77e9;
S.youngs_modulus = 193;
S.poisson_ratio = S.youngs_modulus/(2*S.shear_modulus)-1;
S.length_at_no_compression = 0.085;
S.length_at_hard_stop_position = 0.02;
S.ultimate_torsional_stress = 0.7e9;
S.coil_binding_gap_min = 5e-4;
S.maximum_outer_diameter = 5e-2;
S.end_conditions = 0;

% state variable bounds
lB = [1e-2, 1e-4, 10];
uB = [5e-2, 1e-3, 22];

%objective function weights
kMax = 10;
cMax = 20;
w = [0.2/kMax; 0.8/cMax];

%% fmincon

% linear bounds
A = [1 2 0; -1 -1 0];
b = [S.maximum_outer_diameter; -S.length_at_no_compression/(pi*sqrt(2*(2*S.poisson_ratio+1)/(S.poisson_ratio+1)))];

% initial conditions
x0 = [1e-3; 5e-3; 7];

objectiveFunction =@(x) log(objFcnConverter(@(S) objFcnSpring(S,w,max_spring_rate,max_spring_index), S, {'inner_diameter', 'wire_diameter', 'total_number_of_coils'}, x));
constraintEquation =@(x) conFcnConverter(@(S) conFcnSpring(S,max_shear_stress,coil_binding_gap), S, {'inner_diameter', 'wire_diameter', 'total_number_of_coils'}, x);

options = optimoptions('fmincon', 'MaxIter', 5000, 'TolFun', 10e-10, 'MaxFunEvals', 5000, 'TolX', 10e-10, 'TolCon', 10e-10);
[xOpt, fOpt] = fmincon(objectiveFunction, x0, A, b, [], [], lB, uB, constraintEquation, options);

%% Direct

objectiveFunction =@(x) log(objFcnConverter(@(S) objFcnSpring(S,w,max_spring_rate,max_spring_index), S, {'inner_diameter', 'wire_diameter', 'total_number_of_coils'}, x));

constraintEquation1 =@(x) [1 2 0]*x - S.maximum_outer_diameter;
constraintEquation2 =@(x) [-1 -1 0]*x + S.length_at_no_compression/(pi*sqrt(2*(2*S.poisson_ratio+1)/(S.poisson_ratio+1)));
constraintEquation3 =@(x) conFcnConverter(@(S) conFcnSpring(S,max_shear_stress), S, {'inner_diameter', 'wire_diameter', 'total_number_of_coils'}, x);
constraintEquation4 =@(x) conFcnConverter(@(S) conFcnSpring(S,coil_binding_gap), S, {'inner_diameter', 'wire_diameter', 'total_number_of_coils'}, x);

Problem.f = '@objectiveFunction';
Problem.numconstraints = 4;
Problem.constraint(1).func = '@constraintEquation1';
Problem.constraint(1).penalty = 1e8;
Problem.constraint(2).func = '@constraintEquation2';
Problem.constraint(2).penalty = 1e8;
Problem.constraint(3).func = '@constraintEquation3';
Problem.constraint(3).penalty = 1e8;
Problem.constraint(4).func = '@constraintEquation4';
Problem.constraint(4).penalty = 1e8;

bounds = [lB', uB'];

opts.ep = 1e-5;
opts.maxevals = 1e4;
opts.maxits = 1e4;
opts.maxdeep = 1e4;
opts.testflag = 0;
opts.showits = 0;

[fMin, xMin, history] = Direct(Problem, bounds, opts);