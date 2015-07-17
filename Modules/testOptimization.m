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
ineqConPart = {max_spring_index};
eqConPart = {};

w = 1;

objectiveFunction =@(x) objFcnBuilder(x, stateVar, S, w, objFcnPart);
constraintEquation =@(x) conFcnBuilder(x, stateVar, S, ineqConPart, eqConPart);

[xOpt, fOpt] = fmincon(objectiveFunction, 12, [], [], [], [], 0, inf, constraintEquation);

x = 1:.1:100;
f = arrayfun(objectiveFunction, x);
plot(x, f, '-', xOpt, fOpt, '.', 'MarkerSize', 20);
xlabel('Wire Diameter'), ylabel('Spring Rate');