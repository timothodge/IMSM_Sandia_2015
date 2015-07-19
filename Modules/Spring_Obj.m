classdef Spring_Obj
% This object is a container for all relevant parameters that a spring may
% have. 
%
% Note: We assume closed ground and total number of coils given.
%
% To get a default spring, make object and then from there S.Set
%

    properties
        wire_diameter = 2.5e-3; %d_w in meters
        minimum_wire_diameter = eps;
        maximum_wire_diameter = 5e-3;
        
        inner_diameter = .5e-1;% d_i in meters
        minimum_inner_diameter=eps; % d_i_min
        maximum_inner_diameter = 1e-1; %d_i_max
        
        outer_diameter = 1e-1; % d_o in meters
        minimum_outer_diameter=eps; %d_o_min
        maximum_outer_diameter = 2e-1% d_o_max
        end_conditions = eps;% ec
      
        length_at_no_compression = 85e-3; %L_free in meters
        minimum_length_at_no_compression = 30e-3;
        maximum_length_at_no_compression = 150e-3;
        
        length_at_open_position = 25e-3; %L_open in meters
        minimum_length_at_open_position = 20e-3;
        maximum_length_at_open_position = 60e-3
        
        length_at_close_position = 40e-3; %L_close in meters
        minimum_length_at_close_position = 20e-3;
        maximum_length_at_close_position = 60e-3;
        
        length_at_hard_stop_position = 30e-3; %L_hard in meters
        minimum_length_at_hard_stop_position = 10e-3;
        maximum_length_at_hard_stop_position = 50e-3;
        
        total_number_of_coils = 10;%N_t
        minimum_total_number_of_coils = 5;
        maximum_total_number_of_coils = 20;
        
        youngs_modulus = 193e9; % E, default is 302 Stainless Steel
        minimum_youngs_modulus = 193e9;
        maximum_youngs_modulus = 193e9;
        
        poisson_ratio = .27; % v, default is 302 Stainless Steel
        minimum_poisson_ratio = .27;
        maximum_poisson_ratio = .27;
    
 

        active_number_of_coils
        minimum_active_number_of_coils; 
        maximum_active_number_of_coils;
        
        length_at_reset; 
        minimum_length_at_reset;
        maximum_length_at_reset;
        

        
        solid_height 
        minimum_solid_height; 
        maximum_solid_height;
        
        shear_modulus;
        minimum_shear_modulus; 
        maximum_shear_modulus; 
        
        force_at_open_position; 
        minimum_force_at_open_position; 
        maximum_force_at_open_position; 
        
        spring_rate % k
        minimum_spring_rate
        maximum_spring_rate %k_max   
        
                
        spring_index % C
        minimum_spring_index
        maximum_spring_index %C_max
%         
%         force_at_reset % F_reset
%         minimum_force_at_reset=0;
%         maximum_force_at_reset
%         
% 
%         
% 
         coil_binding_gap 
         minimum_coil_binding_gap%g_min
         maximum_coil_binding_gap
%        

%         %Derived from end conditions usually.
% 
%         
        pitch %p
        minimum_pitch
        maximum_pitch
        

        
        diametral_expansion % d_expand
        minimum_diametral_expansion
        maximum_diametral_expansion
        
        %for stress relaxation test
        stress_relaxation
        minimum_stress_relaxation = 0.85;
        time_stress_relaxation = 3E6
        shear_modulus_stress_relaxation = 6E10;
        Norton_Bailey_c = 8.875E-11;
        Norton_Bailey_n = 1.5;
        Norton_Bailey_k = 1;
        deflection = 30E-3;
        %for creep test
        creep
        time_creep = 3E6;
        creep_force = 4E8;
        maximum_creep
        
        ultimate_torsional_stress
        minimum_ultimate_torsional_stress
        maximum_ultimate_torsional_stress

    end
    
    properties(Constant)
        variable_list = {'wire_diameter','inner_diameter','minimum_inner_diameter',...
            'outer_diameter','maximum_outer_diameter','end_conditions','length_at_no_compression',...
            'length_at_open_position','length_at_close_position','length_at_hard_stop_position',...
            'length_at_reset','force_at_open_position','force_at_reset','shear_modulus',...
            'total_number_of_coils','coil_binding_gap','active_number_of_coils','pitch',...
            'solid_height','diametral_expansion','spring_rate','spring_index',...
            'maximum_spring_index','maximum_spring_rate','youngs_modulus','poisson_ratio',...
            'ultimate_torsional_stress','stress_relaxation','Norton_Bailey_c','Norton_Bailey_n',...
            'Norton_Bailey_k','deflection','creep','creep_force'};
        minimum_variable_list = {'minimum_wire_diameter','minimum_inner_diameter','minimum_minimum_inner_diameter','minimum_outer_diameter','minimum_maximum_outer_diameter','minimum_end_conditions','minimum_length_at_no_compression','minimum_length_at_open_position','minimum_length_at_close_position','minimum_length_at_hard_stop_position','minimum_length_at_reset','minimum_force_at_open_position','minimum_force_at_reset','minimum_shear_modulus','minimum_total_number_of_coils','minimum_coil_binding_gap','minimum_active_number_of_coils','minimum_pitch','minimum_solid_height','minimum_diametral_expansion','minimum_spring_rate','minimum_spring_index','minimum_maximum_spring_index','minimum_maximum_spring_rate','minimum_youngs_modulus','minimum_poisson_ratio','minimum_ultimate_torsional_stress','minimum_stress_relaxation'};
        maximum_variable_list = {'maximum_wire_diameter','maximum_inner_diameter','maximum_minimum_inner_diameter','maximum_outer_diameter','maximum_maximum_outer_diameter','maximum_end_conditions','maximum_length_at_no_compression','maximum_length_at_open_position','maximum_length_at_close_position','maximum_length_at_hard_stop_position','maximum_length_at_reset','maximum_force_at_open_position','maximum_force_at_reset','maximum_shear_modulus','maximum_total_number_of_coils','maximum_coil_binding_gap','maximum_active_number_of_coils','maximum_pitch','maximum_solid_height','maximum_diametral_expansion','maximum_spring_rate','maximum_spring_index','maximum_maximum_spring_index','maximum_maximum_spring_rate','maximum_youngs_modulus','maximum_poisson_ratio','maximum_ultimate_torsional_stress','maximum_creep'};
    end
        
     methods

        function Spring =  Set_Rest_Of_Properties(obj)
         obj.active_number_of_coils = obj.total_number_of_coils - 2;% N_a
         obj.minimum_active_number_of_coils = obj.minimum_total_number_of_coils - 2;
         obj.maximum_active_number_of_coils = obj.maximum_total_number_of_coils - 2;
        
         obj.length_at_reset = obj.length_at_open_position; % L_reset in meters
         obj.minimum_length_at_reset= 20e-3;
         obj.maximum_length_at_reset = 60e-3;

        
        obj.solid_height = obj.total_number_of_coils*obj.wire_diameter;% L_solid
        obj.minimum_solid_height = obj.minimum_total_number_of_coils*obj.minimum_wire_diameter;
        obj.maximum_solid_height = obj.maximum_total_number_of_coils*obj.maximum_wire_diameter;
        
        obj.shear_modulus = obj.youngs_modulus/(2 + 2*obj.poisson_ratio); % G
        obj.minimum_shear_modulus = obj.minimum_youngs_modulus/(2 + 2*obj.maximum_poisson_ratio);
        obj.maximum_shear_modulus = obj.maximum_youngs_modulus/(2 + 2*obj.minimum_poisson_ratio);
        
        obj.force_at_open_position = (obj.length_at_no_compression - obj.length_at_open_position)*obj.shear_modulus/8/(obj.total_number_of_coils-2)*obj.wire_diameter^4/(obj.inner_diameter+obj.wire_diameter)^3;%F_open in meters
        obj.minimum_force_at_open_position = (obj.minimum_length_at_no_compression - obj.minimum_length_at_open_position)*obj.minimum_shear_modulus/8/(obj.maximum_total_number_of_coils-2)*obj.minimum_wire_diameter^4/(obj.maximum_inner_diameter+obj.maximum_wire_diameter)^3;
        obj.maximum_force_at_open_position = (obj.maximum_length_at_no_compression - obj.maximum_length_at_open_position)*obj.maximum_shear_modulus/8/(obj.minimum_total_number_of_coils-2)*obj.maximum_wire_diameter^4/(obj.minimum_inner_diameter+obj.minimum_wire_diameter)^3;
        
         obj.spring_rate = obj.shear_modulus/8/(obj.total_number_of_coils-2)*obj.wire_diameter^4/(obj.inner_diameter+obj.wire_diameter)^3; % k
        obj.minimum_spring_rate = obj.maximum_shear_modulus/8/(obj.maximum_total_number_of_coils-2)*obj.minimum_wire_diameter^4/(obj.maximum_inner_diameter+obj.maximum_wire_diameter)^3;
        obj.maximum_spring_rate = obj.minimum_shear_modulus/8/(obj.minimum_total_number_of_coils-2)*obj.maximum_wire_diameter^4/(obj.minimum_inner_diameter+obj.minimum_wire_diameter)^3;%k_max   

        obj.spring_index = obj.inner_diameter/obj.wire_diameter + 1; % C
        obj.minimum_spring_index = obj.minimum_inner_diameter/obj.maximum_wire_diameter + 1;
        obj.maximum_spring_index = obj.maximum_inner_diameter/obj.minimum_wire_diameter + 1; %C_max
        
        obj.coil_binding_gap = max((obj.length_at_hard_stop_position - obj.total_number_of_coils*obj.wire_diameter)/(obj.total_number_of_coils-1),0);
        obj.minimum_coil_binding_gap = eps;
        obj.maximum_coil_binding_gap = 5e-4;
        
        obj.pitch = (obj.length_at_no_compression - 2*obj.wire_diameter)/obj.active_number_of_coils;
        obj.minimum_pitch = (obj.minimum_length_at_no_compression - 2*obj.maximum_wire_diameter)/obj.maximum_active_number_of_coils;
        obj.maximum_pitch = (obj.maximum_length_at_no_compression - 2*obj.minimum_wire_diameter)/obj.minimum_active_number_of_coils;
        
        obj.diametral_expansion = obj.wire_diameter + sqrt((obj.inner_diameter + obj.wire_diameter)^2 + (obj.pitch^2 - obj.wire_diameter^2)/pi^2);% d_expand
        obj.minimum_diametral_expansion = obj.minimum_wire_diameter + sqrt((obj.minimum_inner_diameter + obj.minimum_wire_diameter)^2 + (obj.maximum_pitch^2 - obj.minimum_wire_diameter^2)/pi^2);
        obj.maximum_diametral_expansion = obj.maximum_outer_diameter;%obj.maximum_wire_diameter + sqrt((obj.maximum_inner_diameter + obj.maximum_wire_diameter)^2 + (obj.minimum_pitch^2 - obj.maximum_wire_diameter^2)/pi^2);

        obj.ultimate_torsional_stress = obj.shear_modulus*(obj.length_at_no_compression-obj.length_at_hard_stop_position)/4/pi/(obj.total_number_of_coils-2)*obj.wire_diameter*(4*obj.inner_diameter^2+9.46*obj.inner_diameter*obj.wire_diameter+3*obj.wire_diameter^2)/obj.inner_diameter/((obj.inner_diameter+obj.wire_diameter)^3);
        obj.minimum_ultimate_torsional_stress = .1e9;
        obj.maximum_ultimate_torsional_stress = 1.5e9;

        
        %         
%         force_at_reset % F_reset
%         minimum_force_at_reset=0;
%         maximum_force_at_reset
            Spring = obj;
            
        end

        function use_end_conditions(obj)
            if obj.end_conditions == 0
                %use close ground conditions
                obj.active_number_of_coils = obj.total_number_of_coils - 2;
                obj.pitch = (obj.length_at_no_compression - 2*obj.wire_diameter)/(obj.active_number_of_coils);
                obj.solid_height = (obj.active_number_of_coils + 2)*obj.wire_diameter;
                obj.diametral_expansion = sqrt((obj.inner_diameter + obj.wire_diameter)^2 + (obj.pitch^2 - obj.wire_diameter^2)/pi^2);
                
            elseif obj.end_conditions == 1
                %use open ground conditions
                obj.active_number_of_coils = obj.total_number_of_coils - 1;
                obj.pitch = (obj.length_at_no_compression)/(obj.active_number_of_coils + 1);
                obj.solid_height = (obj.active_number_of_coils + 1)*obj.wire_diameter;
                obj.diametral_expansion = Diametral_Expansion_Open(obj);
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
        
        function obj = update_state_variables(obj,stateVariables,vals)
            for k = 1:length(vals)
               obj.(stateVariables{k}) = vals(k); 
            end
        end
        
    end
    
end

