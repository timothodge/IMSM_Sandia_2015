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
                satisfied = obj.constraintList{i}.constraintSatisfied(inputSpring);
                if(satisfied == 0)
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
        
        function int = numConstraints(obj)
            % returns the number of constraints in the constraint system
           int = length(obj.constraintList) ;
        end
        
        function retVal = plotConstraints(obj,Spring,plottingStateVars, ...
                stateVar1Bnd,stateVar2Bnd)
            %% this function plots the feasible points of the
            %% constraint system

            PredefinedConstraints
            numConstraints = obj.numConstraints;
            figure
            subplot(3,2,1)
            
            stateVar1pts = linspace(stateVar1Bnd(1),stateVar1Bnd(2),10);
            stateVar2pts = linspace(stateVar2Bnd(1),stateVar1Bnd(2),10);
            [axis1,axis2] = meshgrid(stateVar1pts,stateVar2pts);
            Z = zeros(length(stateVar1pts),length(stateVar2pts));
      
            for k = 1:length(stateVar1pts)
                for j = 1:length(stateVar2pts)
                   Spring.(plottingStateVars{1}) = axis1(k,j);
                   Spring.(plottingStateVars{2}) = axis2(k,j);
                   Z(k,j) = obj.pointIsValid(Spring);
                end            
            end
            
            imagesc(stateVar1Bnd,stateVar2Bnd,Z)
            title('Feasible Region')
            colormap(gray)
            
            for j = 1:numConstraints
                subplot(3,2,j+1)
                obj.constraintList{j}.plotConstraint(Spring, ...
                plottingStateVars,stateVar1Bnd,stateVar2Bnd)
                title(obj.constraintList{j}.name)
            end
        end
        
    end
end