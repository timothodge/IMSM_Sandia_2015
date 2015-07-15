classdef Objective
    properties
        expression
    end
    
    methods
        function retval = eval(obj,Spring)
            retval = obj.expression(Spring);
        end
    end
end