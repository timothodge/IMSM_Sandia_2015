classdef Spring_Obj
% This object is a container for all relevant parameters that a spring may
% have. 
%
% Note: For end conditions 0 denotes closed ground,
% 1 denotes open ground.
%
% Lengths and diameters are usually given in .0001 increments
%
%
%
%



    properties
        wire_diameter %d_w
        inner_diameter % d_i
        outer_diameter % d_o
        end_conditions % ec
        force_at_open_position %F_open
        shear_modulus % G
        length_at_no_compression %L_free
        length_at_open_position %L_open
        length_at_close_position %L_close
        length_at_hard_stop_position %L_hard
        total_number_of_coils %N_t
        
        %Derived from end conditions usually.
        active_number_of_coils % N_a
        pitch %p
        solid_height % L_solid
        diametral_expansion % d_expand
        spring_rate % k
        spring_index % C
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
            retval = ((obj.shear_modulus)/(8*obj.active_number_of_coils))*((obj.wire_diameter^4)/(obj.inner_diameter + obj.wire_diameter)^3);
         
        end

        function retval = eval_spring_index(obj)
           retval = (obj.inner_diameter)/(obj.wire_diameter) + 1;
        end

        
    end
    
end

