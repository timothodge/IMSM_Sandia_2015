%%Predefined Objectives
% This is a list of objectives that can be used.
%
%Each constraint has the following: a name, expression, and list of dependicies.
%

outer_diam = Constraint;
outer_diam.expression = @(Spring) Spring.inner_diameter+2*Spring.wire_diameter;
outer_diam.dependicies = {'wire_diameter','inner_diameter'};

spring_index = Constraint;
spring_index.expression = @(Spring) Spring.inner_diameter/Spring.wire_diameter + 1; 
spring_index.dependicies = {'wire_diameter','inner_diameter'};

closed_diametral_expansion = Constraint;
closed_diametral_expansion.expression = @(Spring) Spring.wire_diameter + sqrt((Spring.inner_diameter + Spring.wire_diameter)^2 + (((Spring.length_at_no_compression - 2*Spring.wire_diameter)/(Spring.total_number_of_coils - 2))^2 - Spring.wire_diameter^2)/pi^2);
closed_diametral_expansion.dependicies = {'wire_diameter','inner_diameter','length_at_no_compression','total_number_of_coils'};

open_diametral_expansion = Constraint;
open_diametral_expansion.expression = @Diametral_Expansion_Open;
open_diametral_expansion.dependicies = {'wire_diameter','inner_diameter','length_at_no_compression','total_number_of_coils','poisson_ratio'};

preload_force = Constraint;
preload_force.expression = @(Spring) (Spring.length_at_no_compression - Spring.length_at_open_position)*Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3);
preload_force.dependicies = {'length_at_no_compression','length_at_open_position','shear_modulus','total_number_of_coils','wire_diameter','inner_diameter'};

solid_force = Constraint;
solid_force.expression = @(Spring) (Spring.length_at_no_compression - Spring.wire_diameter*Spring.total_number_of_coils)*Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3);
solid_force.dependicies = {'length_at_no_compression','shear_modulus','total_number_of_coils','wire_diameter','inner_diameter','force_at_solid_position'};

hard_force = Constraint;
hard_force.expression = @(Spring) (Spring.length_at_no_compression - Spring.length_at_hard_stop_position)*Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3) - Spring.force_at_hard_position;
hard_force.dependicies = {'length_at_no_compression','length_at_hard_stop_position','shear_modulus','total_number_of_coils','wire_diameter','inner_diameter','force_at_hard_position'};

spring_rate = Constraint;
spring_rate.expression = @(Spring) Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3);
spring_rate.dependicies = {'shear_modulus','total_number_of_coils','wire_diameter','inner_diameter'};

coil_binding_gap = Constraint;
coil_binding_gap.expression = @(Spring) (Spring.length_at_hard_stop_position - Spring.total_number_of_coils*Spring.wire_diameter)/(Spring.total_number_of_coils-1);
coil_binding_gap.dependicies = {'length_at_hard_stop_position','wire_diameter','total_number_of_coils'};

shear_stress = Constraint;
shear_stress.expression = @(Spring)   Spring.shear_modulus*(Spring.length_at_no_compression-Spring.length_at_hard_stop_position)/4/pi/(Spring.total_number_of_coils-2)*Spring.wire_diameter*(4*Spring.inner_diameter^2+9.46*Spring.inner_diameter*Spring.wire_diameter+3*Spring.wire_diameter^2)/Spring.inner_diameter/((Spring.inner_diameter+Spring.wire_diameter)^3);
shear_stress.dependicies = {'shear_modulus','length_at_no_compression','length_at_hard_stop_position','total_number_of_coils','wire_diameter','inner_diameter'};

stress_relaxation = Constraint;
stress_relaxation.expression = @Stress_Relaxation;
stress_relaxation.dependicies= {'Norton_Bailey_n','Norton_Bailey_c','Norton_Bailey_k','wire_diameter','inner_diameter','deflection','total_number_of_coils','shear_modulus_stress_relaxation', 'time_stress_relaxation'};

creep = Constraint;
creep.expression = @(Spring) (2*(Spring.inner_diameter+Spring.wire_diameter)*Spring.creep_force...
    *(4+3*Spring.Norton_Bailey_n)/(Spring.Norton_Bailey_n+1)/pi)^(Spring.Norton_Bailey_n+1)...
    *pi*(2*(Spring.inner_diameter+Spring.wire_diameter))^2*(Spring.total_number_of_coils-2)...
    *Spring.Norton_Bailey_c*Spring.time_creep^Spring.Norton_Bailey_k/8/Spring.Norton_Bailey_k...
    /Spring.wire_diameter^(4+3*Spring.Norton_Bailey_n);
creep.dependicies= {'inner_diameter','wire_diameter','total_number_of_coils','time_creep','creep_force','Norton_Bailey_n','Norton_Bailey_k','Norton_Bailey_c'};
