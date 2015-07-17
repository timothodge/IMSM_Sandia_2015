clear all
close all

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

%objective function weights
kMax = 20;
cMax = 10;
w = [0.5/kMax; 0.5/cMax];

constraintFunctionList = {outer_diam_max,coil_binding_gap, ...
                            buckling_slenderness,max_shear_stress};

% state variable bounds
lB = [20e-3, 1e-3, 9];
uB = [40e-3, 5e-3, 17];
xBounds = [lB', uB'];

objective = ObjectiveFunction(objFcnParts, w, stateVar);
constraint = constraintSystem(constraintFunctionList);

SA_Indices = General_SA(xBounds, objective, constraint, S, 500);