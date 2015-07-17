clear all
close all

S = Spring_Obj;
PredefinedConstraints;

S.wire_diameter = 1;
S.shear_modulus = 1;
S.active_number_of_coils = 5;
S.maximum_spring_index = 10;

w = 1;

objectiveFunction =@(x) objFcnConverter(@(S) objFcnSpring(S,w,max_spring_rate), S, {'inner_diameter'}, x);
constraintEquation =@(x) objFcnConverter(@(S) max_spring_index.eval(S), S, {'inner_diameter'}, x);

options = optimoptions(@fmincon,'PlotFcn',@optimplotfval);
[xOpt, fOpt] = fmincon(objectiveFunction, 12, 1, 9, [], [], 0, inf, [], options);

