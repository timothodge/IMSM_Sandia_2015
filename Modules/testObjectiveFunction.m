clear all
close all

S = Spring_Obj;
S = S.Set_Rest_Of_Properties;
PredefinedConstraints;

% S.maximum_spring_index = 0;
% S.maximum_spring_rate = 0;
% S.shear_modulus = 8;
% S.total_number_of_coils = 3;
% S.length_at_no_compression = 90e-3;

% stateVar = {'wire_diameter'; 'inner_diameter'};
stateVar = {'length_at_no_compression', 'total_number_of_coils', 'wire_diameter', 'inner_diameter'}; 
% objFcnParts = {max_spring_index,max_spring_rate};
objFcnParts = {preload_force};

noCompLengths = linspace(30e-3,150e-3,100);
totalCoils = linspace(5,20,100);
wireDiameters = linspace(0.01,5e-2,100);
innerDiameters = linspace(0.01,1e-1,100);
% wireDiameters = 0.01:.01:5e-2;
% innerDiameters = 0.01:0.01:1e-1;
% [X,Y] = meshgrid(wireDiameters,innerDiameters);

% w = [1; 1];
w = 1;

objective = ObjectiveFunction(objFcnParts, w, stateVar);

% C = zeros(size(X));
% for i = 1:length(innerDiameters)
%     for j = 1:length(wireDiameters)
%         C(i,j) = objective.objFcnEvaluator([X(i,j); Y(i,j)], S);
%     end
% end

for i = 1:100
    objective.objFcnEvaluator([noCompLengths(i); totalCoils(i); wireDiameters(i); innerDiameters(i)], S);
end

% contour(X,Y,C,25);
% barHandle = colorbar;
% barHandle.Label.String = 'Spring Index + Spring Rate';
% xlabel('Wire Diameter'), ylabel('Inner Diameter');