classdef Constraint < Objective % Constraint inherits from Objective
    % Constraint is a class that inherits from objective. 
    %
    %isViolated will check if the constraints expression holds given
    %a direction.
    % 
    %There is also a list of dependicies inherited from objective that
    %is used for ease of knowing what dependicies are.
    %
    
    properties
        direction
    end
    
    methods
        function TF = isViolated(obj,Spring)
            % isViolated will check if the constraint has been violated. 
            %
            % Make sure that there exists an expression for the constraint.
            %
            %Input: Spring_Obj
            %output: 1 if true, 0 is false
            %
            %For direction of constraint, 1 is < 0
            %                             2 is <= 0
            %                             3 is  = 0
            
            if obj.direction == 1
                TF  = ~(obj.objEval(Spring)<10*eps);
            elseif obj.direction == 2
                TF = ~(obj.objEval(Spring)<=10*eps);
            elseif obj.direction == 3
                TF = ~(abs(obj.objEval(Spring))<10*eps);
            end
        end
    
        function [f] = FcnBuilder(obj,x,objFunction,Spring)
            Spring = Spring.update_state_variables(objFunction.stateVar,x);
            f = obj.objEval(Spring);
        end
    end
end