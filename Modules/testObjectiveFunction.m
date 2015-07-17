clear all
close all

S = Spring_Obj;
PredefinedConstraints;

S.maximum_spring_index = 0;
S.maximum_spring_rate = 0;
S.shear_modulus = 8;
S.total_number_of_coils = 3;

stateVar = {'wire_diameter'; 'inner_diameter'};
objFcnParts = {max_spring_index,max_spring_rate};

wireDiameters = 1:10;
innerDiameters = 1:10;
[X,Y] = meshgrid(wireDiameters,innerDiameters);

w = [1; 1];

objectiveFunction =@(x) objFcnBuilder(x, stateVar, S, w, objFcnParts);

C = zeros(size(X));
for i = 1:length(innerDiameters)
    for j = 1:length(wireDiameters)
        C(i,j) = objectiveFunction([X(i,j);Y(i,j)]);
    end
end

contour(X,Y,C,25);
barHandle = colorbar;
barHandle.Label.String = 'Spring Index + Spring Rate';
xlabel('Wire Diameter'), ylabel('Inner Diameter');