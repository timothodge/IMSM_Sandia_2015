clear all
close all

S = Spring_Obj;
PredefinedConstraints;

S.wire_diameter = 1;
S.shear_modulus = 1;
S.total_number_of_coils = 7;
S.maximum_spring_index = 10;
S.maximum_spring_rate = 0;

stateVar = {'inner_diameter'};
objFcnPart = {max_spring_rate};
w = 1;

consPart = {max_spring_index};

objective = ObjectiveFunction(objFcnPart, w, stateVar);
objHandle =@(x) objective.objFcnEvaluator(x,S);
constraints = constraintSystem(consPart);
constraintSys = constraints.constraintSystemBuilder(objective,S); 

Problem.f = objHandle;
Problem.numconstraints = 1;
Problem.constraint(1).func = constraintSys{1};
Problem.constraint(1).penalty = 1e8;
bounds = [0, 1000];

opts.ep = 1e-5;
opts.maxevals = 1e4;
opts.maxits = 1e4;
opts.maxdeep = 1e4;
opts.testflag = 0;
opts.showits = 0;

[fMin, xMin, history] = Direct(Problem, bounds, opts);

x = 1:.1:100;
f = arrayfun(objHandle, x);
plot(x, f, '-', xMin, fMin, '.', 'MarkerSize', 20);
xlabel('Wire Diameter'), ylabel('Spring Rate');