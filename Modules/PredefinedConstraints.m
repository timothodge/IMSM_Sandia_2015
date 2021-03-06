%%Predefined Constraints
% This is a list of constraints that can be used.
%
% Each constraint has the following: a name, expression, direction, list of dependicies.
%
% The direction is defining the inequality for the constraint. 
% For direction of constraint, 1 is < 0
%                              2 is <= 0
%                              3 is  = 0


maximum_outer_diameter = Constraint;
maximum_outer_diameter.expression = @(Spring) Spring.inner_diameter+2*Spring.wire_diameter - Spring.maximum_outer_diameter;
maximum_outer_diameter.direction = 1;
maximum_outer_diameter.dependicies = {'wire_diameter','maximum_outer_diameter','inner_diameter'};
maximum_outer_diameter.name = 'outerDiamMax';

minimum_outer_diameter = Constraint;
minimum_outer_diameter.expression = @(Spring) -Spring.inner_diameter-2*Spring.wire_diameter + Spring.minimum_outer_diameter;
minimum_outer_diameter.direction = 1;
minimum_outer_diameter.dependicies = {'wire_diameter','maximum_outer_diameter','inner_diameter'};
minimum_outer_diameter.name = 'outerDiamMin';
    
maximum_spring_index = Constraint;
maximum_spring_index.expression = @(Spring) Spring.inner_diameter/Spring.wire_diameter + 1 - Spring.maximum_spring_index; 
maximum_spring_index.direction = 2;
maximum_spring_index.dependicies = {'wire_diameter','maximum_spring_index','inner_diameter'};
maximum_spring_index.name = 'maxSpringIndex';

minimum_spring_index = Constraint;
minimum_spring_index.expression = @(Spring) - Spring.inner_diameter/Spring.wire_diameter - 1 + Spring.minimum_spring_index; 
minimum_spring_index.direction = 2;
minimum_spring_index.dependicies = {'wire_diameter','maximum_spring_index','inner_diameter'};
minimum_spring_index.name = 'minSpringIndex';

%%% DIAMETRAL EXPANSION CONSTRAINTS %%%

maximum_closed_diametral_expansion = Constraint;
maximum_closed_diametral_expansion.expression = @(Spring) Spring.wire_diameter + sqrt((Spring.inner_diameter + Spring.wire_diameter)^2 + (((Spring.length_at_no_compression - 2*Spring.wire_diameter)/(Spring.total_number_of_coils - 2))^2 - Spring.wire_diameter^2)/pi^2) - Spring.maximum_outer_diameter;% d_expand -  Spring.maximum_outer_diameter;
maximum_closed_diametral_expansion.direction = 1;
maximum_closed_diametral_expansion.dependicies = {'maximum_outer_diameter','wire_diameter','inner_diameter','length_at_no_compression','total_number_of_coils'};
maximum_closed_diametral_expansion.name = 'maxClosedDiametricalExpansion';

minimum_closed_diametral_expansion = Constraint;
minimum_closed_diametral_expansion.expression = @(Spring) - Spring.wire_diameter - sqrt((Spring.inner_diameter + Spring.wire_diameter)^2 + (((Spring.length_at_no_compression - 2*Spring.wire_diameter)/(Spring.total_number_of_coils - 2))^2 - Spring.wire_diameter^2)/pi^2) + Spring.minimum_outer_diameter;% d_expand -  Spring.maximum_outer_diameter;
minimum_closed_diametral_expansion.direction = 1;
minimum_closed_diametral_expansion.dependicies = {'maximum_outer_diameter','wire_diameter','inner_diameter','length_at_no_compression','total_number_of_coils'};
minimum_closed_diametral_expansion.name = 'minClosedDiametricalExpansion';

maximum_open_diametral_expansion = Constraint;
maximum_open_diametral_expansion.expression = @(Spring) Diametral_Expansion_Open(Spring) - Spring.maximum_outer_diameter;
maximum_open_diametral_expansion.direction = 1;
maximum_open_diametral_expansion.dependicies = {'maximum_outer_diameter','wire_diameter','inner_diameter','length_at_no_compression','total_number_of_coils','poisson_ratio'};
max_open_diametral_expansion.name = 'maxClosedDiametricalExpansion';

min_open_diametral_expansion = Constraint;
min_open_diametral_expansion.expression = @(Spring) -Diametral_Expansion_Open(Spring) + Spring.minimum_outer_diameter;
min_open_diametral_expansion.direction = 1;
min_open_diametral_expansion.dependicies = {'maximum_outer_diameter','wire_diameter','inner_diameter','length_at_no_compression','total_number_of_coils','poisson_ratio'};
min_open_diametral_expansion.name = 'minClosedDiametricalExpansion';

maximum_spring_rate = Constraint;
maximum_spring_rate.expression = @(Spring) Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3) - Spring.maximum_spring_rate;
maximum_spring_rate.direction = 2;
maximum_spring_rate.dependicies = {'shear_modulus','total_number_of_coils','wire_diameter','maximum_spring_rate','inner_diameter'};
maximum_spring_rate.name = 'maxSpringRate';

min_spring_rate = Constraint;
min_spring_rate.expression = @(Spring) -Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3) + Spring.minimum_spring_rate;
min_spring_rate.direction = 2;
min_spring_rate.dependicies = {'shear_modulus','total_number_of_coils','wire_diameter','maximum_spring_rate','inner_diameter'};
min_spring_rate.name = 'minSpringRate';

%%% FORCE CONSTRAINTS %%%

eq_preload_force = Constraint;
eq_preload_force.expression = @(Spring) (Spring.length_at_no_compression - Spring.length_at_open_position)*Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3) - Spring.force_at_open_position;
eq_preload_force.direction = 3;
eq_preload_force.dependicies = {'length_at_no_compression','length_at_open_position','shear_modulus','total_number_of_coils','wire_diameter','inner_diameter','force_at_open_position'};
eq_preload_force.name = 'eqPreloadForce';

max_preload_force = Constraint;
max_preload_force.expression = @(Spring) (Spring.length_at_no_compression - Spring.length_at_open_position)*Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3) - Spring.maximum_force_at_open_position;
max_preload_force.direction = 2;
max_preload_force.dependicies = {'length_at_no_compression','length_at_open_position','shear_modulus','total_number_of_coils','wire_diameter','inner_diameter','maximum_force_at_open_position'};
max_preload_force.name = 'maxPreloadForce';

min_preload_force = Constraint;
min_preload_force.expression = @(Spring) -(Spring.length_at_no_compression - Spring.length_at_open_position)*Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3) + Spring.minimum_force_at_open_position;
min_preload_force.direction = 2;
min_preload_force.dependicies = {'length_at_no_compression','length_at_open_position','shear_modulus','total_number_of_coils','wire_diameter','inner_diameter','minimum_force_at_open_position'};
min_preload_force.name = 'minPreloadForce';

eq_solid_force = Constraint;
eq_solid_force.expression = @(Spring) (Spring.length_at_no_compression - Spring.wire_diameter*Spring.total_number_of_coils)*Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3) - Spring.force_at_solid_position;
eq_solid_force.direction = 3;
eq_solid_force.dependicies = {'length_at_no_compression','shear_modulus','total_number_of_coils','wire_diameter','inner_diameter','force_at_solid_position'};
eq_solid_force.name = 'eqSolidForce';

max_solid_force = Constraint;
max_solid_force.expression = @(Spring) (Spring.length_at_no_compression - Spring.wire_diameter*Spring.total_number_of_coils)*Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3) - Spring.maximum_force_at_solid_position;
max_solid_force.direction = 2;
max_solid_force.dependicies = {'length_at_no_compression','shear_modulus','total_number_of_coils','wire_diameter','inner_diameter','maximum_force_at_solid_position'};
max_solid_force.name = 'maxSolidForce';

min_solid_force = Constraint;
min_solid_force.expression = @(Spring) -(Spring.length_at_no_compression - Spring.wire_diameter*Spring.total_number_of_coils)*Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3) + Spring.minimum_force_at_solid_position;
min_solid_force.direction = 2;
min_solid_force.dependicies = {'length_at_no_compression','shear_modulus','total_number_of_coils','wire_diameter','inner_diameter','minimum_force_at_solid_position'};
min_solid_force.name = 'minSolidForce';

eq_hard_force = Constraint;
eq_hard_force.expression = @(Spring) (Spring.length_at_no_compression - Spring.length_at_hard_stop_position)*Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3) - Spring.force_at_hard_position;
eq_hard_force.direction = 3;
eq_hard_force.dependicies = {'length_at_no_compression','length_at_hard_stop_position','shear_modulus','total_number_of_coils','wire_diameter','inner_diameter','force_at_hard_position'};
eq_hard_force.name = 'eqHardForce';

maximum_hard_force = Constraint;
maximum_hard_force.expression = @(Spring) (Spring.length_at_no_compression - Spring.length_at_hard_stop_position)*Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3) - Spring.maximum_hard_force;
maximum_hard_force.direction = 2;
maximum_hard_force.dependicies = {'length_at_no_compression','length_at_hard_stop_position','shear_modulus','total_number_of_coils','wire_diameter','inner_diameter','maximum_force_at_hard_position'};
maximum_hard_force.name = 'maxHardForce';

minimum_hard_force = Constraint;
minimum_hard_force.expression = @(Spring) -(Spring.length_at_no_compression - Spring.length_at_hard_stop_position)*Spring.shear_modulus/8/(Spring.total_number_of_coils-2)*Spring.wire_diameter^4/((Spring.inner_diameter+Spring.wire_diameter)^3) + Spring.minimum_hard_force;
minimum_hard_force.direction = 2;
minimum_hard_force.dependicies = {'length_at_no_compression','length_at_hard_stop_position','shear_modulus','total_number_of_coils','wire_diameter','inner_diameter','minimumforce_at_hard_position'};
minimum_hard_force.name = 'minHardForce';

%%% LENGTH INEQUALITY CONSTRAINTS %%%

free_greater_open = Constraint;
free_greater_open.expression = @(Spring) Spring.length_at_open_position - Spring.length_at_no_compression;
free_greater_open.direction = 1;
free_greater_open.dependicies = {'length_at_no_compression','length_at_open_position'};
free_greater_open.name = 'freeGreaterOpen';

open_greater_hard = Constraint;
open_greater_hard.expression = @(Spring) Spring.length_at_hard_stop_position - Spring.length_at_open_position;
open_greater_hard.direction = 1;
open_greater_hard.dependicies = {'length_at_open_position','length_at_open_position'};
open_greater_hard.name = 'openGreaterHard';

hard_greater_solid = Constraint;
hard_greater_solid.expression = @(Spring) Spring.wire_diameter*Spring.total_number_of_coils - Spring.length_at_hard_stop_position;
hard_greater_solid.direction = 1;
hard_greater_solid.dependicies = {'wire_diameter','total_number_of_coils','length_at_hard_stop_position'};
hard_greater_solid.name = 'open';

%%% COIL BINDING GAP CONSTRAINTS  %%%

minimum_coil_binding_gap = Constraint;
minimum_coil_binding_gap.expression = @(Spring) (Spring.total_number_of_coils*Spring.wire_diameter - Spring.length_at_hard_stop_position)/(Spring.total_number_of_coils-1) + Spring.minimum_coil_binding_gap;
minimum_coil_binding_gap.direction = 2;
minimum_coil_binding_gap.dependicies = {'length_at_hard_stop_position','wire_diameter','total_number_of_coils','minimum_coil_binding'};
minimum_coil_binding_gap.name = 'minCoilBindingGap';

max_coil_binding_gap = Constraint;
max_coil_binding_gap.expression = @(Spring) -(Spring.total_number_of_coils*Spring.wire_diameter - Spring.length_at_hard_stop_position)/(Spring.total_number_of_coils-1) - Spring.maximum_coil_binding_gap;
max_coil_binding_gap.direction = 2;
max_coil_binding_gap.dependicies = {'length_at_hard_stop_position','wire_diameter','total_number_of_coils','maximum_coil_binding'};
max_coil_binding_gap.name = 'maxCoilBindingGap';

maximum_buckling_slenderness = Constraint;
maximum_buckling_slenderness.expression = @(Spring) Spring.length_at_no_compression/(Spring.inner_diameter+Spring.wire_diameter) - pi*sqrt(2*(2*Spring.poisson_ratio+1)/(Spring.poisson_ratio+2));
maximum_buckling_slenderness.direction = 1;
maximum_buckling_slenderness.dependicies = {'poisson_ratio','length_at_no_compression','inner_diameter','wire_diameter',};
maximum_buckling_slenderness.name = 'maxBucklingSlenderness';

minimum_buckling_slenderness = Constraint;
minimum_buckling_slenderness.expression = @(Spring) -Spring.length_at_no_compression/(Spring.inner_diameter+Spring.wire_diameter) + pi*sqrt(2*(2*Spring.poisson_ratio+1)/(Spring.poisson_ratio+2));
minimum_buckling_slenderness.direction = 1;
minimum_buckling_slenderness.dependicies = {'poisson_ratio','length_at_no_compression','inner_diameter','wire_diameter',};
minimum_buckling_slenderness.name = 'minBucklingSlenderness';

maximum_shear_stress = Constraint;
maximum_shear_stress.expression = @(Spring) Spring.shear_modulus*(Spring.length_at_no_compression-Spring.length_at_hard_stop_position)/4/pi/(Spring.total_number_of_coils-2)*Spring.wire_diameter*(4*Spring.inner_diameter^2+9.46*Spring.inner_diameter*Spring.wire_diameter+3*Spring.wire_diameter^2)/Spring.inner_diameter/((Spring.inner_diameter+Spring.wire_diameter)^3) - Spring.maximum_ultimate_torsional_stress;
maximum_shear_stress.direction = 1;
maximum_shear_stress.dependicies = {'ultimate_torsional_stress','shear_modulus','length_at_no_compression','length_at_hard_stop_position','total_number_of_coils','wire_diameter','inner_diameter'};
maximum_shear_stress.name = 'maxShearStress';

minimum_shear_stress = Constraint;
minimum_shear_stress.expression = @(Spring) -Spring.shear_modulus*(Spring.length_at_no_compression-Spring.length_at_hard_stop_position)/4/pi/(Spring.total_number_of_coils-2)*Spring.wire_diameter*(4*Spring.inner_diameter^2+9.46*Spring.inner_diameter*Spring.wire_diameter+3*Spring.wire_diameter^2)/Spring.inner_diameter/((Spring.inner_diameter+Spring.wire_diameter)^3) + Spring.maximum_ultimate_torsional_stress;
minimum_shear_stress.direction = 1;
minimum_shear_stress.dependicies = {'ultimate_torsional_stress','shear_modulus','length_at_no_compression','length_at_hard_stop_position','total_number_of_coils','wire_diameter','inner_diameter'};
minimum_shear_stress.name = 'minShearStress';

min_stress_relaxation = Constraint;
min_stress_relaxation.expression = @(Spring) -Stress_Relaxation(Spring)+Spring.minimum_stress_relaxation;
min_stress_relaxation.direction = 1;
min_stress_relaxation.dependicies= {'Norton_Bailey_n','Norton_Bailey_c','Norton_Bailey_k','wire_diameter','inner_diameter','deflection','total_number_of_coils','shear_modulus_stress_relaxation', 'time_stress_relaxation', 'minimum_stress_relaxation'};
min_stress_relaxation.name = 'minStressRelaxation';

max_stress_relaxation = Constraint;
max_stress_relaxation.expression = @(Spring) Stress_Relaxation(Spring)-Spring.maxmimum_stress_relaxation;
max_stress_relaxation.direction = 1;
max_stress_relaxation.dependicies= {'Norton_Bailey_n','Norton_Bailey_c','Norton_Bailey_k','wire_diameter','inner_diameter','deflection','total_number_of_coils','shear_modulus_stress_relaxation', 'time_stress_relaxation', 'maximum_stress_relaxation'};
max_stress_relaxation.name = 'maxStressRelaxation';

% max_creep = Constraint;
% max_creep.expression = @(Spring) (2*(Spring.inner_diameter+Spring.wire_diameter)*Spring.creep_force...
%     *(4+3*Spring.Norton_Bailey_n)/(Spring.Norton_Bailey_n+1)/pi)^(Spring.Norton_Bailey_n+1)...
%     *pi*(2*(Spring.inner_diameter+Spring.wire_diameter))^2*(Spring.total_number_of_coils-2)...
%     *Spring.Norton_Bailey_c*Spring.time_creep^Spring.Norton_Bailey_k/8/Spring.Norton_Bailey_k...
%     /Spring.wire_diameter^(4+3*Spring.Norton_Bailey_n)-Spring.maximum_creep;
% max_creep.direction = 1;
% max_creep.dependicies= {'inner_diameter','outer_diameter','wire_diameter','active_number_of_coils','creep_force','Norton_Bailey_n','Norton_Bailey_k','Norton_Bailey_c'};
% 
% %% min and max constraints
% inner_diam_min = Constraint;
% inner_diam_min.expression = @(Spring) Spring.minimum_inner_diameter - Spring.inner_diameter;
% inner_diam_min.direction = 1;
% inner_diam_min.dependicies = {'minimum_inner_diameter','inner_diameter'};