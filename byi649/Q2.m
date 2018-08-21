x1 = [-1, -4];
epsilon = 0.1;
n = 2;

%[x,val] = HookeJeeves(@f_Q2,@DirectionalGoldenSectionSearch,n,x1,epsilon,true);
%[x,val,gradient] = SteepestDescent(@f_Q2,@grad_Q2,@DirectionalGoldenSectionSearch,n,x1,epsilon,true);
[x,val,gradient] = Newton(@f_Q2,@grad_Q2,@hessian_Q2 ,@DirectionalGoldenSectionSearch,n,x1,epsilon,true);

f_wrapper = @(x1, x2) f_Q2([x1, x2]);
fcontour(f_wrapper, 'LevelList', logspace(log10(0.0001),log10(4000),50)-50)
colorbar
hold on
plot(x(1,:), x(2,:))
title("Q2 - Newton's Method: Limited")

