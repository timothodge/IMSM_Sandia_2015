classdef ObjectiveFunction
    %ObjectiveFunction encapsulates the objective function class.
    
    properties
        equationList %% list of objective function variables
        stateVar %% state variables for objective function
        bounds %% bounds for state variables
        weights  %% weights applied to the objective functions
    end
    
    methods
        
        function obj = ObjectiveFunction(objFuncList,objFuncWghts, ...
                                         StateVars, StateVarBnds)
            %%% initializes an objective function object given
            %%% user specifications
            obj.equationList = objFuncList;
            obj.stateVar = StateVars;
            obj.bounds = StateVarBnds;
            obj.weights = objFuncWghts;        
        end
        
        function [f] = objFcnEvaluator(obj,x,S)
           %% *** creates a handle for the objective function ***
           %% inputs:
           %% x - evaluation point
           %% spring - spring object
           %% outputs:
           %% f - function handle
            S = S.update_state_variables(obj.stateVar,x);
            f = dot(obj.weights, cellfun(@objEval,obj.equationList,repmat({S},size(obj.equationList))));
        end
        
        function [lB,uB] = getStateVariableBounds(obj,Spring)
           %% returns the upper and lower bound vectors for the
           %% state variables
        end

        function [n] = numStateVariables(obj)
           n = length(obj.stateVar);
        end
    end
    
end

