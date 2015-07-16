%%% a toy spring initialized with some values for testing %%%
toy_spring = Spring_Obj;
toy_spring.inner_diameter = 2;
toy_spring.minimum_inner_diameter = 1;

testSystem = constraintSystem;
testSystem.constraintList = {'inner_diam_min'};

test1 = testSystem.pointIsValid(toy_spring);
if (test1 ~= 1)
    'test1 failed'
else
    'test1 passed'
end

