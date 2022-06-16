function dotq = ddt_ode45(t,q, constants, func_seg1_top, func_RJT)

g = constants.g;

m1 = constants.m1;
l1 = constants.l1;
lg1 = constants.lg1;
I1 = constants.I1;
width1 = constants.width1;

m2 = constants.m2;
l2 = constants.l2;
lg2 = constants.lg2;
I2 = constants.I2;
width2 = constants.width2;

m3 = constants.m3;
l3 = constants.l3;
lg3 = constants.lg3;
I3 = constants.I3;
width3 = constants.width3;

m4 = constants.m4;
l4 = constants.l4;
lg4 = constants.lg4;
I4 = constants.I4;
width4 = constants.width4;

I1x = I1(1);
I1y = I1(2);
I1z = I1(3);

I2x = I2(1);
I2y = I2(2);
I2z = I2(3);

I3x = I3(1);
I3y = I3(2);
I3z = I3(3);

I4x = I4(1);
I4y = I4(2);
I4z = I4(3);

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

theta2_1 = q(7);
theta2_2 = q(8);
theta2_3 = q(9);
omega2_1 = q(10);
omega2_2 = q(11);
omega2_3 = q(12);

theta3_1 = q(13);
theta3_2 = q(14);
theta3_3 = q(15);
omega3_1 = q(16);
omega3_2 = q(17);
omega3_3 = q(18);

theta4_1 = q(19);
theta4_2 = q(20);
theta4_3 = q(21);
omega4_1 = q(22);
omega4_2 = q(23);
omega4_3 = q(24);

%% hirashima
I_hirashima = find_I_hirashima(I1x,I2x,I3x,I4x,I1y,I2y,I3y,I4y,I1z,I2z,I3z,I4z,l1,l2,l3,lg1,lg2,lg3,lg4,m1,m2,m3,m4,theta1_1,theta1_2,theta1_3,theta2_1,theta2_2,theta2_3,theta3_1,theta3_2,theta3_3,theta4_1,theta4_2,theta4_3);
G_hirashima = find_G_hirashima(l1,l2,l3,lg1,lg2,lg3,lg4,m1,m2,m3,m4,theta1_1,theta1_2,theta2_1,theta2_2,theta3_1,theta3_2,theta4_1,theta4_2);
V_hirashima = find_V_hirashima(I1x,I2x,I3x,I4x,I1y,I2y,I3y,I4y,I1z,I2z,I3z,I4z,l1,l2,l3,lg1,lg2,lg3,lg4,m1,m2,m3,m4,omega1_1,omega1_2,omega1_3,omega2_1,omega2_2,omega2_3,omega3_1,omega3_2,omega3_3,omega4_1,omega4_2,omega4_3,seg1_top_a_1,seg1_top_a_2,seg1_top_a_3,theta1_1,theta1_2,theta1_3,theta2_1,theta2_2,theta2_3,theta3_1,theta3_2,theta3_3,theta4_1,theta4_2,theta4_3);

% alpha1 = inv(I_hirashima) * ( RJT1(:) + G_hirashima * g + V_hirashima );
alpha_vec = I_hirashima \ ( RJT + G_hirashima * g + V_hirashima );
alpha1_1 = alpha_vec(1);
alpha1_2 = alpha_vec(2);
alpha1_3 = alpha_vec(3);
alpha2_1 = alpha_vec(4);
alpha2_2 = alpha_vec(5);
alpha2_3 = alpha_vec(6);
alpha3_1 = alpha_vec(7);
alpha3_2 = alpha_vec(8);
alpha3_3 = alpha_vec(9);
alpha4_1 = alpha_vec(10);
alpha4_2 = alpha_vec(11);
alpha4_3 = alpha_vec(12);

%% output

dotq = [...
    omega1_1, omega1_2, omega1_3, ...
    alpha1_1, alpha1_2, alpha1_3, ...
    omega2_1, omega2_2, omega2_3, ...
    alpha2_1, alpha2_2, alpha2_3, ...
    omega3_1, omega3_2, omega3_3, ...
    alpha3_1, alpha3_2, alpha3_3, ...
    omega4_1, omega4_2, omega4_3, ...
    alpha4_1, alpha4_2, alpha4_3, ...
    ]';

end

