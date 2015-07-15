classdef Constraint < Objective % Constraint inherits from Objective
    % Constraint is a class that inherits from objective. 
    %
    %It has the added functionality to tell if an inequality condition is 
    %violated.
    %
    % 
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
            %For direction of constraint, 1 is >
            %                             2 is >=
            %                             3 is < 
            
            if obj.direction == 1
                TF  = obj.eval(Spring)>-10*eps;
            elseif obj.direction == 2
                TF = obj.eval(Spring)>=-10*eps;
            elseif obj.direction == 3
                TF = abs(obj.eval(Spring))<10*eps;
            end
        end
    end
end