function dotq = ddt_ode45(t, q, constants, func_seg1_top, func_RJT)

m1 = constants.m1;
g = constants.g;
l1 = constants.l1;
lg1 = constants.lg1;
I1 = constants.I1;

I1x = I1(1);
I1y = I1(2);
I1z = I1(3);

RJT = func_RJT(t);

seg1_top = func_seg1_top(t);
seg1_top_1 = seg1_top(1);
seg1_top_2 = seg1_top(2);
seg1_top_3 = seg1_top(3);
seg1_top_v_1 = seg1_top(4);
seg1_top_v_2 = seg1_top(5);
seg1_top_v_3 = seg1_top(6);
seg1_top_a_1 = seg1_top(7);
seg1_top_a_2 = seg1_top(8);
seg1_top_a_3 = seg1_top(9);

theta1_1 = q(1);
theta1_2 = q(2);
theta1_3 = q(3);

omega1_1 = q(4);
omega1_2 = q(5);
omega1_3 = q(6);

%% hirashima
I_hirashima = find_I_hirashima(I1x,I1y,I1z,lg1,m1,theta1_1,theta1_2,theta1_3);
G_hirashima = find_G_hirashima(lg1,m1,theta1_1,theta1_2);
V_hirashima = find_V_hirashima(I1x,I1y,I1z,lg1,m1,omega1_1,omega1_2,omega1_3,seg1_top_a_1,seg1_top_a_2,seg1_top_a_3,theta1_1,theta1_2,theta1_3);

% alpha1 = inv(I_hirashima) * ( RJT1(:) + G_hirashima * g + V_hirashima );
alpha1 = I_hirashima \ ( RJT(:) + G_hirashima * g + V_hirashima );
alpha1_1 = alpha1(1);
alpha1_2 = alpha1(2);
alpha1_3 = alpha1(3);

%% output

dotq = [omega1_1, omega1_2, omega1_3, alpha1_1, alpha1_2, alpha1_3]';

end

