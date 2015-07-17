classdef constraintSystem
    properties
       constraintList
    end
    
    methods

        function retVal = pointIsValid(obj,inputSpring)
            %% takes a point and checks whether or not it is feasible
            %%
            
            retVal = 1;
            % determine the number of constraints
            S = size(obj.constraintList);
            num_constraints = S(2);
            % run predefinedConstraints to initialize
            PredefinedConstraints

            for i = 1:num_constraints
                constraint_obj = objEval(obj.constraintList{1});
                satisfied = constraint_obj.isViolated(inputSpring);
                if(satisfied == 1)
                   retVal = 0; 
                end
            end
        end
        function retVal = plotConstraints(obj,spring,variable1,variable2)
            %% plots images of design space
        end
    end
end