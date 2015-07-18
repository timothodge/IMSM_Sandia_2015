classdef constraintSystem

    properties
       constraintList   %% names of constraint equations
    end
    
    methods

        function obj = constraintSystem(constraintFunctionList)
            obj.constraintList = constraintFunctionList;
        end
        
        function retVal = pointIsValid(obj,inputSpring)
            %% tests whether a point is feasible
            %% inputSpring - spring with points to test
            %% retVal - returns 1 if point is feasible
            %%        - returns 0 if point is not feasible
            retVal = 1;
            % determine the number of constraints
            num_constraints = size(obj.constraintList, 2);
            % run predefinedConstraints to initialize
            PredefinedConstraints

            for i = 1:num_constraints
                satisfied = obj.constraintList{i}.isViolated(inputSpring);
                if(satisfied == 1)
                   retVal = 0; 
                end
            end
        end     
        
        function [constraintSystem] = constraintSystemBuilder(obj,objFunction,Spring)
            %% Returns an array of variable length with function handles
            %% for all input constraints
            num_constraints = size(obj.constraintList,2); 
            PredefinedConstraints
            constraintSystem = cell(num_constraints,1);
            
            for i = 1:num_constraints
                constraintSystem{i} =@(x) obj.constraintList{i}.FcnBuilder(x,objFunction,Spring);
            end
        end
        
        function retVal = plotConstraints(obj,spring,variable1,variable2)
            %% this function will return a collection of 
            %% level plots for two input variables
        end
        
    end
end