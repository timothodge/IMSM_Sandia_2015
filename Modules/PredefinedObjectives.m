outer_diam = Constraint;
outer_diam.expression = @(Spring) Spring.inner_diameter+2*Spring.wire_diameter;
outer_diam.direction = 1;
outer_diam.dependicies = {'wire_diameter','inner_diameter'};

spring_index = Constraint;
spring_index.expression = @(Spring) Spring.inner_diameter/Spring.wire_diameter + 1; 
spring_index.direction = 2;
spring_index.dependicies = {'wire_diameter','inner_diameter'};

closed_diametral_expansion = Constraint;
closed_diametral_expansion.expression = @(Spring) Spring.wire_diameter + sqrt((Spring.inner_diameter + Spring.wire_diameter)^2 + (((Spring.length_at_no_compression - 2*Spring.wire_diameter)/(Spring.total_number_of_coils - 2))^2 - Spring.wire_diameter^2)/pi^2) ;% d_expand -  Spring.maximum_outer_diameter;
closed_diametral_expansion.direction = 1;
closed_diametral_expansion.dependicies = {'wire_diameter','inner_diameter','length_at_no_compression','total_number_of_coils'};


preload_force = Constraint;
preload_force.expression = @(Spring) (Spring.length_at_no_compression - Spring.length_at_open_position)*Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3);
preload_force.direction = 3;
preload_force.dependicies = {'length_at_no_compression','length_at_open_position','shear_modulus','total_number_of_coils','wire_diameter','inner_diameter','force_at_open_position'};

spring_rate = Constraint;
spring_rate.expression = @(Spring) Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3);
spring_rate.direction = 2;
spring_rate.dependicies = {'shear_modulus','total_number_of_coils','wire_diameter','inner_diameter'};

coil_binding_gap = Constraint;
coil_binding_gap.expression = @(Spring) -(Spring.length_at_hard_stop_position - Spring.total_number_of_coils*Spring.wire_diameter)/(Spring.total_number_of_coils-1);
coil_binding_gap.direction = 2;
coil_binding_gap.dependicies = {'length_at_hard_stop_position','solid_height','total_number_of_coils'};

shear_stress = Constraint;
shear_stress.expression = @(Spring)   Spring.shear_modulus*(Spring.length_at_no_compression-Spring.length_at_hard_stop_position)/4/pi/(Spring.total_number_of_coils-2)*Spring.wire_diameter*(4*Spring.inner_diameter^2+9.46*Spring.inner_diameter*Spring.wire_diameter+3*Spring.wire_diameter^2)/Spring.inner_diameter/((Spring.inner_diameter+Spring.wire_diameter)^3);
shear_stress.direction = 1;
shear_stress.dependicies = {'shear_modulus','length_at_no_compression','length_at_hard_stop_position','total_number_of_coils','wire_diameter','inner_diameter'};

%Assume time = 3E8 seconds for both stress relaxation and creep tests
stress_relaxation = Constraint;
stress_relaxation.expression = @(Spring) -hypergeom([4/Spring.Norton_Bailey_n 1/Spring.Norton_Bailey_n],...
    (4+Spring.Norton_Bailey_n)/Spring.Norton_Bailey_n,Spring.Norton_Bailey_c*...
    (2*Spring.deflection/pi/Spring.active_number_of_coils/((Spring.inner_diameter+Spring.outer_diameter)/2)^2)^Spring.Norton_Bailey_n...
    *Spring.shear_modulus^(Spring.Norton_Bailey_n+1)*Spring.Norton_Bailey_n*(3E8)^Spring.Norton_Bailey_k*...
    Spring.wire_diameter^Spring.Norton_Bailey_n/2^Spring.Norton_Bailey_n/Spring.Norton_Bailey_k);
stress_relaxation.direction = 1;
stress_relaxation.dependicies= {'Norton_Bailey_n','Norton_Bailey_c','Norton_Bailey_k','wire_diameter','inner_diameter','outer_diameter','deflection','active_number_of_coils','shear_modulus'};

creep = Constraint;
creep.expression = @(Spring) ((Spring.inner_diameter+Spring.outer_diameter)*Spring.creep_force...
    *(4+3*Spring.Norton_Bailey_n)/(Spring.Norton_Bailey_n+1)/pi)^(Spring.Norton_Bailey_n+1)...
    *pi*(Spring.inner_diameter+Spring.outer_diameter)^2*Spring.active_number_of_coils...
    *Spring.Norton_Bailey_c*(3E8)^Spring.Norton_Bailey_k/8/Spring.Norton_Bailey_k...
    /Spring.wire_diameter^(4+3*Spring.Norton_Bailey_n);
creep.direction = 1;
creep.dependicies= {'inner_diameter','outer_diameter','wire_diameter','active_number_of_coils','creep_force','Norton_Bailey_n','Norton_Bailey_k','Norton_Bailey_c'};

