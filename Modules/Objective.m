classdef Objective
% Objective class has an expression, evaluator, and a list of dependices. 
%
%Note: Any expression, must have Spring as input, 
%and use Spring_Obj properties as the parameters in 
%expression.
%
    properties
        %Expression that is to be evaluated.
        expression
        dependicies
    end
    
    methods
        function retval = objEval(obj,Spring)
            % Eval, evaluate the objectives expresssion.
            %
            %Input: Spring_Obj
            %
            %Output: Evaluated expression, will print if unable to 
            %evaluate.
            %
           
            retval = obj.expression(Spring);
            
            if (isempty(retval)) 
               sprintf('Unable to evaluate expression')
            else
                
            end        
        end        
        function retval = isInObjective(obj,parameter)
        %% this function checks whether a parameter belongs
        %% to an expression
        %% Input -- string with the parameter name
        %% Output -- boolean 0 (false) or 1 (true)
                retval = 0;
                S = size(obj.dependicies);
                num_dependencies = S(2);
                %% cycle through depenendcy list
                for i = 1:num_dependencies
                    obj.dependicies(i)
                    if strcmp(parameter,obj.dependicies(i)) == 1
                       retval = 1; 
                    end
                end
            end
    end
    
end