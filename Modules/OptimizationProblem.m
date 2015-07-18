classdef OptimizationProblem
    %Stores information and methods related to
    % an arbitrary optimziation problem
    
    properties
        objective
        constraints
        spring
    end
    
    methods

        function obj = OptimizationProblem(stateVar,objFcnParts,w,consPart,S)
           %% initialize an optimization problem given a set of stateVariables
           %% objective function, weights, and constraint Parts
            obj.spring = S;
            obj.objective = ObjectiveFunction(objFcnParts,w,stateVar);
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
    end
    
end