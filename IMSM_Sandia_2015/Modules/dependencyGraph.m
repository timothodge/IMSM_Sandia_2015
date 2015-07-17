spring1 = Spring_Obj;
constraintSystem1 = constraintSystem;

constraintSystem1.constraint_list = {'buckling_slenderness', ...
    'coil_binding_gap', 'diametral_expansion', 'inner_diam_min', ...
    'max_shear_stress', 'max_spring_index', 'max_spring_rate',...
    'outer_diam_greater', 'outer_diam_max', 'preload_force'};



A = size(spring.variable_list);
num_variables = A(2);
