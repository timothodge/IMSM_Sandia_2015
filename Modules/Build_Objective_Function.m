function f = Build_Objective_Function(S,w,varargin)
    f = 0;
    
    for k = 1:nargin-2
        f = @(S) (f + w(k)*varargin{k}(S));
    end
    

end