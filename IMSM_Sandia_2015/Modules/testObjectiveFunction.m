clear all
close all

S = Spring_Obj;
PredefinedConstraints;

S.maximum_spring_index = 0;
S.maximum_spring_rate = 0;
S.shear_modulus = 8;
S.active_number_of_coils = 1;

wireDiameters = 1:10;
innerDiameters = 1:10;
[X,Y] = meshgrid(wireDiameters,innerDiameters);

C = zeros(size(X));

w = [1; 1];
objectiveFunction =@(x) objFcnConverter(@(S) objFcnSpring(S,w,max_spring_index, max_spring_rate), S, {'wire_diameter'; 'inner_diameter'}, x);

for i = 1:length(innerDiameters)
    for j = 1:length(wireDiameters)
        C(i,j) = objectiveFunction([X(i,j);Y(i,j)]);
    end
end

contour(X,Y,C,25);
colorbar;
xlabel('d_w'), ylabel('d_i');