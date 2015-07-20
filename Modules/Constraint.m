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
        function TF = constraintSatisfied(obj,Spring)
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
            TF = ~TF;
        end
    
        function [f] = FcnBuilder(obj,x,objFunction,Spring)
            Spring = Spring.update_state_variables(objFunction.stateVar,x);
            f = obj.objEval(Spring);
        end
        
        function ret = plotConstraint(obj,Spring,plottingStateVars,...
                stateVarBnds)
        numPlottingStateVars = length(plottingStateVars); 
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
 
                keyboard
                for k = 1:mesh_size
                    for j = 1:mesh_size
                       Spring.(plottingStateVars{1}) = X(k,j);
                       Spring.(plottingStateVars{2}) = Y(k,j);       
                       if(obj.constraintSatisfied(Spring) == 1) 
                           numFeasiblePoints = numFeasiblePoints + 1;
                           points(numFeasiblePoints,1) = X(k,j);
                           points(numFeasiblePoints,2) = Y(k,j);
                       end
                    end            
                end
                
            plot(points(:,1),points(:,2),'.','MarkerSize', 5)
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
                            if(obj.constraintSatisfied(Spring) == 1) 
                                numFeasiblePoints = numFeasiblePoints + 1;
                                points(numFeasiblePoints,1) = X(k,j,i);
                                points(numFeasiblePoints,2) = Y(k,j,i);
                                points(numFeasiblePoints,3) = Z(k,j,i);
                            end
                        end
                   end            
                end
                
            plot3(points(:,1),points(:,2),points(:,3),'.','MarkerSize', 5)
            axis([stateVarBnds(1),stateVarBnds(2),stateVarBnds(3), ... 
                 stateVarBnds(4), stateVarBnds(5),stateVarBnds(6)])
            xlabel(plottingStateVars(1))
            ylabel(plottingStateVars(2))
            zlabel(plottingStateVars(3))
            
            
            %%% ******* end plot three variables ********* %%%
                
                               
            end          
        
        end         
        
    end
end