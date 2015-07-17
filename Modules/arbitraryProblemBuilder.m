PredefinedConstraints;

objectiveFunctionList = {'max_spring_index','max_spring_rate'};
objectiveFunctionWgts = {0.5,0.5};
objectiveFunctionStateVars = {'inner_diameter','wire_diameter', ...
                               'total_number_of_coils'};

objective = ObjectiveFunction(objectiveFunctionList,objectiveFunctionWgts, ...
                                objectiveFunctionStateVars);
                       
constraintFunctionList = {'outer_diam_max','coil_binding_gap', ...
                            'buckling_slenderness','max_shear_stress'};

constraint = constraintSystem(constraintFunctionList);