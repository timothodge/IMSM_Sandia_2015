function S = Stress_Relaxation( Spring )
%Compute the stress relaxation when defelction, inner diameter, wire
%diameter, shear modulus stress relaxation, Norton Bailey c,k,n, time
%stress relaxation is available.

formula = [-0.984183054718588   0.040484004765316
             -0.917598399222978   0.092121499837728
             -0.801578090733310   0.138873510219787
             -0.642349339440340   0.178145980761946
             -0.448492751036446   0.207816047536889
             -0.230458315955135   0.226283180262897
              0.000000000000000   0.232551553230874
              0.230458315955135   0.226283180262897
              0.448492751036446   0.207816047536889
              0.642349339440340   0.178145980761946
              0.801578090733310   0.138873510219787
              0.917598399222978   0.092121499837728
              0.984183054718588   0.040484004765316];

r=(formula(:,1)+1)/2*Spring.wire_diameter;
w=formula(:,2)/2;

theta = 2*Spring.deflection/pi/(Spring.total_number_of_coils-2)/(Spring.inner_diameter+Spring.wire_diameter)^2;
Constant1 = 4/Spring.shear_modulus_stress_relaxation/theta/Spring.wire_diameter^4;
Constant2 = ((Spring.Norton_Bailey_c/Spring.Norton_Bailey_k)*...
    Spring.shear_modulus_stress_relaxation*Spring.Norton_Bailey_n...
    *Spring.time_stress_relaxation^Spring.Norton_Bailey_k).^(-1/Spring.Norton_Bailey_n);

S = sum(Constant1*(w.*r.^2.*((Spring.shear_modulus_stress_relaxation*theta*r).^(-Spring.Norton_Bailey_n)+Constant2).^(-1/Spring.Norton_Bailey_n)));


end

