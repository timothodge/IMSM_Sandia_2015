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
                                          stateVarBnds)
            %% this function plots the feasible points of the
            %% constraint system

            numPlottingStateVars = length(plottingStateVars);
            for i=1:numPlottingStateVars
                plottingStateVarsLabel(i) = strrep(plottingStateVars(i),'_',' ');
            end
            %% plotting function only designed for 2 and 3 variables
            if numPlottingStateVars~=2 && numPlottingStateVars~=3
                fprintf('method only implemented for 2 or 3 state vars.\n');
            end
            
            numConstraints = obj.numConstraints;
            figure
            %% TO DO -- need to determine dimensions for optimal subplot graph
            subplot(3,2,1)
            %% number of mesh points
            mesh_size = 10;

            % creates a list with cooridnates spanning each statevariable
            % range
            stateVarpts = zeros(numPlottingStateVars,mesh_size);
            for j = 1:numPlottingStateVars
                stateVarpts(j,:) = linspace(stateVarBnds(2*j-1), ...
                    stateVarBnds(2*j),mesh_size);
            end
      
            if numPlottingStateVars == 2
                %%% ******* plot two variables ********* %%%
                points = zeros(1,2);
                numFeasiblePoints = 0;
 
                [X,Y] = meshgrid(stateVarpts(1,:),stateVarpts(2,:));
 
                for k = 1:mesh_size
                    for j = 1:mesh_size
                       Spring.(plottingStateVars{1}) = X(k,j);
                       Spring.(plottingStateVars{2}) = Y(k,j);       
                       if(obj.pointIsValid(Spring) == 1) 
                           numFeasiblePoints = numFeasiblePoints + 1;
                           points(numFeasiblePoints,1) = X(k,j);
                           points(numFeasiblePoints,2) = Y(k,j);
                       end
                    end            
                end
                
            plot(points(:,1),points(:,2),'.','MarkerSize', 5)
                %imagesc(stateVarpts(1),stateVarpts(2),Z)
            title('Feasible Region')
            axis([stateVarBnds(1),stateVarBnds(2),stateVarBnds(3),stateVarBnds(4)])
            xlabel(plottingStateVars(1))
            ylabel(plottingStateVars(2))
            
            %%% ******* end plot two variables ********* %%%
            
            %%% ******* plot three variables ********* %%%
            elseif numPlottingStateVars == 3
                
                points = zeros(0,3);
                numFeasiblePoints = 0;
 
                [X,Y,Z] = meshgrid(stateVarpts(1,:),stateVarpts(2,:), ...
                                    stateVarpts(3,:));
                for k = 1:mesh_size
                    for j = 1:mesh_size
                        for i = 1:mesh_size
                            Spring.(plottingStateVars{1}) = X(k,j,i);
                            Spring.(plottingStateVars{2}) = Y(k,j,i);     
                            Spring.(plottingStateVars{3}) = Z(k,j,i);
                            if(obj.pointIsValid(Spring) == 1) 
                                numFeasiblePoints = numFeasiblePoints + 1;
                                points(numFeasiblePoints,1) = X(k,j,i);
                                points(numFeasiblePoints,2) = Y(k,j,i);
                                points(numFeasiblePoints,3) = Z(k,j,i);
                            end
                        end
                   end            
                end
                
            plot3(points(:,1),points(:,2),points(:,3),'.','MarkerSize', 5)
            title('Feasible Region')
            axis([stateVarBnds(1),stateVarBnds(2),stateVarBnds(3), ... 
                 stateVarBnds(4), stateVarBnds(5),stateVarBnds(6)])
             
            xlabel(plottingStateVarsLabel(1))
            ylabel(plottingStateVarsLabel(2))
            zlabel(plottingStateVarsLabel(3))
            
            
            %%% ******* end plot three variables ********* %%%
                
                               
            end          
            
            for j = 1:numConstraints
                subplot(3,2,j+1)
                obj.constraintList{j}.plotConstraint(Spring, ...
                plottingStateVars, stateVarBnds)
                title(obj.constraintList{j}.name)
            end
            
        end        
        
    end
end
