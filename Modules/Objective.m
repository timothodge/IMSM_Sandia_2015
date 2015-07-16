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
        function retval = eval(obj,Spring)
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
    end
end