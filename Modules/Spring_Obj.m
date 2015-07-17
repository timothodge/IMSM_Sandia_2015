classdef Spring_Obj
% This object is a container for all relevant parameters that a spring may
% have. 
%
% Note: For end conditions 0 denotes closed ground,
% 1 denotes open ground.
%
% Lengths and diameters are usually given in .0001 increments
%



    properties
        wire_diameter %d_w
        minimum_wire_diameter = 0;
        maximum_wire_diameter
        
        inner_diameter % d_i
        minimum_inner_diameter=0; % d_i_min
        maximum_inner_diameter;
        
        outer_diameter % d_o
        minimum_outer_diameter=0;
        maximum_outer_diameter % d_o_max
        end_conditions % ec
      
        length_at_no_compression %L_free
        minimum_length_at_no_comopression = 0;
        maximum_length_at_no_compression
        
        length_at_open_position %L_open
        minimum_length_at_open_position = 0;
        maximum_length_at_open_position
        
        length_at_close_position %L_close
        minimum_length_at_close_position = 0;
        maximum_length_at_close_position
        
        length_at_hard_stop_position %L_hard
        minimum_length_at_hard_stop_position = 0;
        maximum_length_at_hard_stop_position
        
        length_at_reset % L_reset
        minimum_length_at_reset=0;
        maximum_length_at_reset
        
        force_at_open_position %F_open
        minimum_force_at_open_position = 0;
        maximum_force_at_open_position
        
        force_at_reset % F_reset
        minimum_force_at_reset=0;
        maximum_force_at_reset
        
        shear_modulus % G
        minimum_shear_modulus=0;
        maximum_shear_modulus
        
        total_number_of_coils %N_t
        minimum_total_number_of_coils=0;
        maximum_total_number_of_coils
        
        minimum_coil_binding_gap = 0;%g_min
        
        %Derived from end conditions usually.
        active_number_of_coils % N_a
        minimum_active_number_of_coils = 0;
        maximum_active_number_of_coils
        
        pitch %p
        minimum_pitch = 0;
        maximum_pitch
        
        solid_height % L_solid
        minimum_solid_height=0;
        maximum_solid_height
        
        diametral_expansion % d_expand
        minimum_diametral_expansion = 0;
        maximum_diametral_expansion
        
        spring_rate % k
        minimum_spring_rate = 0;
        maximum_spring_rate %k_max
        
        spring_index % C
        minimum_spring_index=0;
        maximum_spring_index %C_max
        
        %Material
        youngs_modulus = 193; % E, default is 302 Stainless Steel
        minimum_youngs_modulus=0;
        maximum_youngs_modulus
        
        poisson_ratio = .27; % v, default is 302 Stainless Steel
        minimum_poisson_rate=0;
        maximum_poisson_rate
        
        ultimate_torsional_stress
        minimum_ultimate_torsional_stress
        maximum_ultimate_torsional_stress

    end
    
    properties(Constant)
        variable_list = {'wire_diameter','inner_diameter','minimum_inner_diameter','outer_diameter','maximum_outer_diameter','end_conditions','length_at_no_compression','length_at_open_position','length_at_close_position','length_at_hard_stop_position','length_at_reset','force_at_open_position','force_at_reset','shear_modulus','total_number_of_coils','coil_binding_gap_min','active_number_of_coils','pitch','solid_height','diametral_expansion','spring_rate','spring_index','maximum_spring_index','maximum_spring_rate','youngs_modulus','poisson_ratio','ultimate_torsional_stress'};
        minimum_variable_list = {'minimum_wire_diameter','minimum_inner_diameter','minimum_minimum_inner_diameter','minimum_outer_diameter','minimum_maximum_outer_diameter','minimum_end_conditions','minimum_length_at_no_compression','minimum_length_at_open_position','minimum_length_at_close_position','minimum_length_at_hard_stop_position','minimum_length_at_reset','minimum_force_at_open_position','minimum_force_at_reset','minimum_shear_modulus','minimum_total_number_of_coils','minimum_coil_binding_gap_min','minimum_active_number_of_coils','minimum_pitch','minimum_solid_height','minimum_diametral_expansion','minimum_spring_rate','minimum_spring_index','minimum_maximum_spring_index','minimum_maximum_spring_rate','minimum_youngs_modulus','minimum_poisson_ratio','minimum_ultimate_torsional_stress'};
        maximum_variable_list = {'maximum_wire_diameter','maximum_inner_diameter','maximum_minimum_inner_diameter','maximum_outer_diameter','maximum_maximum_outer_diameter','maximum_end_conditions','maximum_length_at_no_compression','maximum_length_at_open_position','maximum_length_at_close_position','maximum_length_at_hard_stop_position','maximum_length_at_reset','maximum_force_at_open_position','maximum_force_at_reset','maximum_shear_modulus','maximum_total_number_of_coils','maximum_coil_binding_gap_min','maximum_active_number_of_coils','maximum_pitch','maximum_solid_height','maximum_diametral_expansion','maximum_spring_rate','maximum_spring_index','maximum_maximum_spring_index','maximum_maximum_spring_rate','maximum_youngs_modulus','maximum_poisson_ratio','maximum_ultimate_torsional_stress'};
    end
    
    methods(Static)

     
    end
    
     methods
%         function obj = Spring_Obj(x)
%             %Constructor example, x has to be cell array
%             for k = 1:length(x)
%                 if isempty(x{k})
%                     obj.(obj.variable_list{k}) = [];
%                 else
%                     obj.(obj.variable_list{k}) = x(k);
%                 end
%             end
            
            
       % end
%         function obj = Spring_Obj()
%             
%         end
        function use_end_conditions(obj)
            if obj.end_conditions == 0
                %use close ground conditions
                obj.active_number_of_coils = obj.total_number_of_coils - 2;
                obj.pitch = (obj.length_at_no_compression - 2*obj.wire_diameter)/(obj.active_number_of_coils);
                obj.solid_height = (obj.active_number_of_coils + 2)*obj.wire_diameter;
                obj.diametral_expansion = sqrt((obj.inner_diameter + obj.wire_diameter)^2 + (obj.pitch^2 - obj.wire_diameter)/pi);
                
            elseif obj.end_conditions == 1
                %use open ground conditions
                obj.active_number_of_coils = obj.total_number_of_coils - 1;
                obj.pitch = (obj.length_at_no_compression)/(obj.active_number_of_coils + 1);
                obj.solid_height = (obj.active_number_of_coils + 1)*obj.wire_diameter;
               % obj.diametral_expansion 
            else
                sprintf('End conditions not specified.')
            end
                
        end
        
        function retval = eval_spring_rate(obj)
            %Given the needed values, we can compute the spring_rate.
            %
            % Will print unable to compute if one value is not known.
            if (isempty(obj.shear_modulus)|| isempty(obj.active_number_of_coils) || isempty(obj.wire_diameter) || isempty(obj.inner_diameter))
                sprintf('Unable to compute spring_rate, requires shear_modulus, active_number_of_coils, wire_diameter, inner_diameter.')
            else
                retval = ((obj.shear_modulus)/(8*obj.active_number_of_coils))*((obj.wire_diameter^4)/(obj.inner_diameter + obj.wire_diameter)^3);
            end
        end

        function retval = eval_spring_index(obj)
            %Given the needed values, we can compute the spring_index.
            %
            % Will print unable to compute if one value is not known.
            if (isempty(obj.inner_diameter) || isempty(obj.wire_diameter))
                sprintf('Unable to compute spring_index, requires inner_diameter and wire_diameter.')
            else
                retval = (obj.inner_diameter)/(obj.wire_diameter) + 1;
            end
        end

        function retval = eval_shear_modulus(obj)
            %Given the needed values, we can compute the shear_modulus.
            %
            % Will print unable to compute if one value is not known.
            if (isempty(obj.youngs_modulus) || isempty(obj.poisson_ratio))
                sprintf('Unable to compute shear_modulus, requires youngs_modulus and poisson_ratio')
            else
                retval = (obj.youngs_modulus)/(2*(1 + obj.poisson_ratio));
            end
                
        end
        
    end
    
end

