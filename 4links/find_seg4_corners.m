function [p_seg4_corners_1,p_seg4_corners_2,p_seg4_corners_3,p_seg4_corners_4] = find_seg4_corners(l1,l2,l3,l4,seg1_top_1,seg1_top_2,seg1_top_3,theta1_1,theta1_2,theta2_1,theta2_2,theta3_1,theta3_2,theta4_1,theta4_2,theta4_3,width4)
%FIND_SEG4_CORNERS
%    [P_SEG4_CORNERS_1,P_SEG4_CORNERS_2,P_SEG4_CORNERS_3,P_SEG4_CORNERS_4] = FIND_SEG4_CORNERS(L1,L2,L3,L4,SEG1_TOP_1,SEG1_TOP_2,SEG1_TOP_3,THETA1_1,THETA1_2,THETA2_1,THETA2_2,THETA3_1,THETA3_2,THETA4_1,THETA4_2,THETA4_3,WIDTH4)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    16-Jun-2022 14:59:04

t2 = cos(theta1_1);
t3 = cos(theta1_2);
t4 = cos(theta2_1);
t5 = cos(theta2_2);
t6 = cos(theta3_1);
t7 = cos(theta3_2);
t8 = cos(theta4_1);
t9 = cos(theta4_2);
t10 = cos(theta4_3);
t11 = sin(theta1_1);
t12 = sin(theta1_2);
t13 = sin(theta2_1);
t14 = sin(theta2_2);
t15 = sin(theta3_1);
t16 = sin(theta3_2);
t17 = sin(theta4_1);
t18 = sin(theta4_2);
t19 = sin(theta4_3);
t20 = l1.*t12;
t21 = l2.*t14;
t22 = l3.*t16;
t23 = l4.*t18;
t24 = t8.*t10;
t25 = t10.*t17;
t26 = l1.*t2.*t3;
t27 = l2.*t4.*t5;
t28 = l3.*t6.*t7;
t29 = l4.*t8.*t9;
t30 = l1.*t3.*t11;
t31 = l2.*t5.*t13;
t32 = l3.*t7.*t15;
t33 = l4.*t9.*t17;
t34 = t9.*t19.*width4;
t39 = t8.*t18.*t19;
t40 = t17.*t18.*t19;
t35 = -t20;
t36 = -t21;
t37 = -t22;
t38 = -t23;
t41 = -t26;
t42 = -t27;
t43 = -t28;
t44 = -t29;
t45 = -t34;
t46 = -t40;
t47 = t25+t39;
t48 = t47.*width4;
t49 = t24+t46;
t50 = t49.*width4;
p_seg4_corners_1 = [seg1_top_1+t35+t36+t37+t45,seg1_top_2+t30+t31+t32+t50,seg1_top_3+t41+t42+t43+t48];
if nargout > 1
    p_seg4_corners_2 = [seg1_top_1+t35+t36+t37+t38+t45,seg1_top_2+t30+t31+t32+t33+t50,seg1_top_3+t41+t42+t43+t44+t48];
end
if nargout > 2
    t51 = -t48;
    t52 = -t50;
    p_seg4_corners_3 = [seg1_top_1+t34+t35+t36+t37+t38,seg1_top_2+t30+t31+t32+t33+t52,seg1_top_3+t41+t42+t43+t44+t51];
end
if nargout > 3
    p_seg4_corners_4 = [seg1_top_1+t34+t35+t36+t37,seg1_top_2+t30+t31+t32+t52,seg1_top_3+t41+t42+t43+t51];
end