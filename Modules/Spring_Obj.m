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
        inner_diameter % d_i
        minimum_inner_diameter % d_i_min
        outer_diameter % d_o
        maximum_outer_diameter % d_o_max
        end_conditions % ec
      
        length_at_no_compression %L_free
        length_at_open_position %L_open
        length_at_close_position %L_close
        length_at_hard_stop_position %L_hard
        length_at_reset % L_reset
        
        force_at_open_position %F_open
        force_at_reset % F_reset
        
        shear_modulus % G
        total_number_of_coils %N_t
        coil_binding_gap_min %g_min
        
        %Derived from end conditions usually.
        active_number_of_coils % N_a
        pitch %p
        solid_height % L_solid
        diametral_expansion % d_expand
        spring_rate % k
        spring_index % C
        
        %Material
        youngs_modulus = 193; % E, default is 302 Stainless Steel
        poisson_ratio = .27; % v, default is 302 Stainless Steel
        

    end
    
    methods(Static)

     
    end
    
    methods
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

