classdef Constraint < Objective
    properties
        direction
    end
    
    methods
        function TF = isViolated(obj,Spring)
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