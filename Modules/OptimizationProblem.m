classdef OptimizationProblem
    %Stores information and methods related to
    % an arbitrary optimziation problem
    
    properties
        objective
        constraints
        spring
    end
    
    methods

        function obj = OptimizationProblem(stateVar,objFcnParts,w,consPart,S,bounds)
           %% initialize an optimization problem given a set of stateVariables
           %% objective function, weights, and constraint Parts
            obj.spring = S;
            obj.objective = ObjectiveFunction(objFcnParts,w,stateVar,bounds);
            obj.constraints = constraintSystem(consPart);
        end
    
        function Problem = setDirect(obj)
           %  initialize the problem struct for Direct
           Problem.f =@(x) obj.objective.objFcnEvaluator(x,obj.spring);
           
           constraintSys = obj.constraints.constraintSystemBuilder(obj.objective,obj.spring);
           Problem.numconstraints = length(obj.constraints.constraintList);
            for k = 1:length(obj.constraints.constraintList)
                Problem.constraint(k).func = constraintSys{k};
                Problem.constraint(k).penalty = 1e8;
            end
            
        end
        
        function bool = isProblemFeasible(obj,varBounds,S)
           %  Uses a latinHypercube algorithm to test whether a 
           %  given optimization problem is feasible
           nsamples = 1000;
           numVariables = obj.objective.numStateVariables;
           bool = 0;
           
           %  Start by creating a latin hypercube sample
           xsamples = bsxfun(@plus,varBounds(:,1), ...
               bsxfun(@times,varBounds(:,2)-varBounds(:,1), ...
               lhsdesign(nsamples,numVariables)'))';
           
           for k1 = 1:nsamples
               S = S.update_state_variables(obj.objective.stateVar,xsamples(k1,:));
               if (obj.constraints.pointIsValid(S))
                  bool = 1;
                  break
               end
           end
        end
                
    end
        
    
end