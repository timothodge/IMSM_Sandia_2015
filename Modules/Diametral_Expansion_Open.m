function DE = Diametral_Expansion_Open(obj)

dm = obj.inner_diameter + obj.wire_diameter;
pitch = obj.length_at_no_compression / obj.total_number_of_coils;
A3 = -pi^2*(1+obj.poisson_ratio)*dm;
A2 = pi^4*(1+obj.poisson_ratio)*dm^2+3*pi^4*(1+obj.poisson_ratio)*obj.wire_diameter*dm...
    +pi^2*pitch*((1+obj.poisson_ratio)*pitch-obj.wire_diameter);
A1 = -2*pi^4*(1+obj.poisson_ratio)*obj.wire_diameter*dm^2-...
    pi^2*(1+3*pi^2)*(1+obj.poisson_ratio)*obj.wire_diameter^2*dm-...
    2*pi^2*obj.wire_diameter*pitch*((1+obj.poisson_ratio)*pitch-obj.wire_diameter);
A0 = pi^2*(pi^2*(1+obj.poisson_ratio)+1)*obj.wire_diameter^2*dm^2+...
    pi^2*(pi^2+1)*(1+obj.poisson_ratio)*obj.wire_diameter^3*dm+...
    obj.wire_diameter^2*pitch*((pi^2+1)*(pitch-obj.wire_diameter)+...
    pi^2*obj.poisson_ratio*pitch);
r = roots([A3 A2 A1 A0]);
index = abs(imag(r))<1E-10;
if length(index) == 1
    DE = r(index);
else
    sprintf('The cubic equation doesn''t have a unique solution.');
end

end