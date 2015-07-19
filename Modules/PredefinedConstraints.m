outer_diam_greater = Constraint;
outer_diam_greater.expression = @(Spring) Spring.inner_diameter - Spring.outer_diameter;
outer_diam_greater.direction = 1;
outer_diam_greater.dependicies = {'outer_diameter','inner_diameter'};

outer_diam_max = Constraint;
outer_diam_max.expression = @(Spring) Spring.inner_diameter+2*Spring.wire_diameter - Spring.maximum_outer_diameter;
outer_diam_max.direction = 1;
outer_diam_max.dependicies = {'wire_diameter','maximum_outer_diameter','inner_diameter'};

max_spring_index = Constraint;
max_spring_index.expression = @(Spring) Spring.inner_diameter/Spring.wire_diameter + 1 - Spring.maximum_spring_index; 
max_spring_index.direction = 2;
max_spring_index.dependicies = {'wire_diameter','maximum_spring_index','inner_diameter'};


max_closed_diametral_expansion = Constraint;
max_closed_diametral_expansion.expression = @(Spring) Spring.wire_diameter + sqrt((Spring.inner_diameter + Spring.wire_diameter)^2 + (((Spring.length_at_no_compression - 2*Spring.wire_diameter)/(Spring.total_number_of_coils - 2))^2 - Spring.wire_diameter^2)/pi^2) - Spring.maximum_outer_diameter;% d_expand -  Spring.maximum_outer_diameter;
max_closed_diametral_expansion.direction = 1;
max_closed_diametral_expansion.dependicies = {'maximum_outer_diameter','wire_diameter','inner_diameter','length_at_no_compression','total_number_of_coils'};

max_spring_rate = Constraint;
max_spring_rate.expression = @(Spring) Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3) - Spring.maximum_spring_rate;
max_spring_rate.direction = 2;
max_spring_rate.dependicies = {'shear_modulus','total_number_of_coils','wire_diameter','maximum_spring_rate','inner_diameter'};

eq_preload_force = Constraint;
eq_preload_force.expression = @(Spring) (Spring.length_at_no_compression - Spring.length_at_open_position)*Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3) - Spring.force_at_open_position;
eq_preload_force.direction = 3;
preload_force.dependicies = {'length_at_no_compression','length_at_open_position','shear_modulus','total_number_of_coils','wire_diameter','inner_diameter','force_at_open_position'};

min_coil_binding_gap = Constraint;
min_coil_binding_gap.expression = @(Spring) -(Spring.length_at_hard_stop_position - Spring.total_number_of_coils*Spring.wire_diameter)/(Spring.total_number_of_coils-1)+Spring.minimum_coil_binding_gap;
min_coil_binding_gap.direction = 2;
min_coil_binding_gap.dependicies = {'length_at_hard_stop_position','solid_height','total_number_of_coils','coil_binding_gap_min'};


buckling_slenderness = Constraint;
buckling_slenderness.expression = @(Spring) -pi*sqrt(2*(2*Spring.poisson_ratio+1)/(Spring.poisson_ratio+2))+Spring.length_at_no_compression/(Spring.inner_diameter+Spring.wire_diameter);
buckling_slenderness.direction = 1;
buckling_slenderness.dependicies = {'poisson_ratio','length_at_no_compression','inner_diameter','wire_diameter',};



max_shear_stress = Constraint;
max_shear_stress.expression = @(Spring) -Spring.ultimate_torsional_stress + Spring.shear_modulus*(Spring.length_at_no_compression-Spring.length_at_hard_stop_position)/4/pi/(Spring.total_number_of_coils-2)*Spring.wire_diameter*(4*Spring.inner_diameter^2+9.46*Spring.inner_diameter*Spring.wire_diameter+3*Spring.wire_diameter^2)/Spring.inner_diameter/((Spring.inner_diameter+Spring.wire_diameter)^3);
max_shear_stress.direction = 1;
max_shear_stress.dependicies = {'ultimate_torsional_stress','shear_modulus','length_at_no_compression','length_at_hard_stop_position','total_number_of_coils','wire_diameter','inner_diameter'};

%Assume time = 3E8 seconds for both stress relaxation and creep tests
min_stress_relaxation = Constraint;
min_stress_relaxation.expression = @(Spring) -hypergeom([4/Spring.Norton_Bailey_n 1/Spring.Norton_Bailey_n],...
    [(4+Spring.Norton_Bailey_n)/Spring.Norton_Bailey_n],Spring.Norton_Bailey_c*...
    (2*Spring.deflection/pi/Spring.active_number_of_coils/((Spring.inner_diameter+Spring.outer_diameter)/2)^2)^Spring.Norton_Bailey_n...
    *Spring.shear_modulus^(Spring.Norton_Bailey_n+1)*Spring.Norton_Bailey_n*(3E8)^Spring.Norton_Bailey_k*...
    Spring.wire_diameter^Spring.Norton_Bailey_n/2^Spring.Norton_Bailey_n/Spring.Norton_Bailey_k)+Spring.minimum_stress_relaxation;
min_stress_relaxation.direction = 1;
min_stress_relaxation.dependicies= {'Norton_Bailey_n','Norton_Bailey_c','Norton_Bailey_k','wire_diameter','inner_diameter','outer_diameter','deflection','active_number_of_coils','shear_modulus'};

max_creep = Constraint;
max_creep.expression = @(Spring) ((Spring.inner_diameter+Spring.outer_diameter)*Spring.creep_force...
    *(4+3*Spring.Norton_Bailey_n)/(Spring.Norton_Bailey_n+1)/pi)^(Spring.Norton_Bailey_n+1)...
    *pi*(Spring.inner_diameter+Spring.outer_diameter)^2*Spring.active_number_of_coils...
    *Spring.Norton_Bailey_c*(3E8)^Spring.Norton_Bailey_k/8/Spring.Norton_Bailey_k...
    /Spring.wire_diameter^(4+3*Spring.Norton_Bailey_n)-Spring.maximum_creep;
max_creep.direction = 1;
max_creep.dependicies= {'inner_diameter','outer_diameter','wire_diameter','active_number_of_coils','creep_force','Norton_Bailey_n','Norton_Bailey_k','Norton_Bailey_c'};

%% min and max constraints
inner_diam_min = Constraint;
inner_diam_min.expression = @(Spring) Spring.minimum_inner_diameter - Spring.inner_diameter;
inner_diam_min.direction = 1;
inner_diam_min.dependicies = {'minimum_inner_diameter','inner_diameter'};
