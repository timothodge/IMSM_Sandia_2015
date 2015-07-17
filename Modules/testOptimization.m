clear all
close all

S = Spring_Obj;
PredefinedConstraints;

S.wire_diameter = 1;
S.shear_modulus = 1;
S.total_number_of_coils = 7;
S.maximum_spring_index = 10;
S.maximum_spring_rate = 0;

w = 1;

objectiveFunction =@(x) objFcnSpring(x, {'inner_diameter'}, S, w, {max_spring_rate});
constraintEquation =@(x) conFcnSpring(x, {'inner_diameter'}, S, {max_spring_index}, {});

[xOpt, fOpt] = fmincon(objectiveFunction, 12, [], [], [], [], 0, inf, constraintEquation);