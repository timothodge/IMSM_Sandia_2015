inner_diam_min = Constraint;
inner_diam_min.expression = @(Spring) Spring.minimum_inner_diameter - Spring.inner_diameter;
inner_diam_min.direction = 1;

outer_diam_greater = Constraint;
outer_diam_greater.expression = @(Spring) Spring.inner_diameter - Spring.outer_diameter;
outer_diam_greater.direction = 1;

outer_diam_max = Constraint;
outer_diam_max.expression = @(Spring) Spring.inner_diameter+2*Spring.wire_diameter - Spring.maximum_outer_diameter;
outer_diam_max.direction = 1;

max_spring_index = Constraint;
max_spring_index.expression = @(Spring) Spring.inner_diameter/Spring.wire_diameter + 1 - Spring.maximum_spring_index; 
max_spring_index.direction = 2;

diametral_expansion = Constraint;
diametral_expansion.expression = @(Spring) Spring.diametral_expansion -  Spring.maximum_outer_diameter;
diametral_expansion.direction = 1;

max_spring_rate = Constraint;
max_spring_rate.expression = @(Spring) Spring.shear_modulus/8/Spring.active_number_of_coils*Spring.wire_diameter^4/(Spring.inner_diameter+Spring.wire_diameter)^3 - Spring.maximum_spring_rate;
max_spring_rate.direction = 2;

preload_force = Constraint;
preload_force.expression = @(Spring) (Spring.length_at_no_compression - Spring.length_at_open_position)*Spring.shear_modulus/8/Spring.active_number_of_coils*Spring.wire_diameter^4/(Spring.inner_diameter+Spring.wire_diameter)^3 - Spring.force_at_open_position;
preload_force.direction = 3;

coil_binding_gap = Constraint;
coil_binding_gap.expression = @(Spring) -(Spring.length_at_hard_stop_position - Spring.solid_height)/(Spring.total_number_of_coils-1)+Spring.coil_binding_gap_min;
coil_binding_gap.direction = 2;

buckling_slenderness = Constraint;
buckling_slenderness.expression = @(Spring) -pi*sqrt(2*(2*Spring.poisson_ratio+1)/(Spring.poisson_ratio+2))+Spring.length_at_no_compression/(Spring.inner_diameter+Spring.wire_diameter);
buckling_slenderness.direction = 1;

max_shear_stress = Constraint;
max_shear_stress.expression = @(Spring) -Spring.Ultimate_Torsional_Stress + Spring.shear_modulus*(Spring.length_at_no_compression-Spring.length_at_hard_stop_position)/4/pi/Spring.active_number_of_coils*(Spring.wire_diameter*(4*Spring.inner_diameter^2+9.46*Spring.inner_diameter*Spring.wire_diameter+3*Spring.wire_diameter^2)/Spring.inner_diameter/(Spring.inner_diameter+Spring.wire_diameter)^3);
max_shear_stress.direction = 1;

