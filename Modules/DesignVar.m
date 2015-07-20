zfunction springProperties = DesignVar(objFcn)
%objFcn is the objective function, varargin is the argument list of
%constraints. The output springProperties is the cell array of design
%variables' property names which can be fed into the objFcnConverter

S=Initialize();
springProperties = {};

Target = objFcn(S);
for k = 1:length(S.variable_list)
%    if ~strcmp(S.variable_list{k},'variable_list')
        S.(S.variable_list{k}) = 0;
        S.use_end_conditions();
        S.spring_rate = S.eval_spring_rate();
        S.spring_index = S.eval_spring_index();
        S.shear_modulus = S.eval_shear_modulus();
        Compare = objFcn(S);
        if( abs(Target - Compare)>1E-10 )
            springProperties = [springProperties S.variable_list{k}];
        end
        S(S.variable_list{k}) = 1;
%    end
end

end

function S=Initialize()
S=Spring_Obj;
for k = 1:length(S.variable_list)
%    if ~strcmp(S.variable_list{k},'variable_list')
        S.(S.variable_list{k}) = 1;
%    end
end
end