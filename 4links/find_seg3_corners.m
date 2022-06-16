function [p_seg3_corners_1,p_seg3_corners_2,p_seg3_corners_3,p_seg3_corners_4] = find_seg3_corners(l1,l2,l3,seg1_top_1,seg1_top_2,seg1_top_3,theta1_1,theta1_2,theta2_1,theta2_2,theta3_1,theta3_2,theta3_3,width3)
%FIND_SEG3_CORNERS
%    [P_SEG3_CORNERS_1,P_SEG3_CORNERS_2,P_SEG3_CORNERS_3,P_SEG3_CORNERS_4] = FIND_SEG3_CORNERS(L1,L2,L3,SEG1_TOP_1,SEG1_TOP_2,SEG1_TOP_3,THETA1_1,THETA1_2,THETA2_1,THETA2_2,THETA3_1,THETA3_2,THETA3_3,WIDTH3)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    16-Jun-2022 14:59:04

t2 = cos(theta1_1);
t3 = cos(theta1_2);
t4 = cos(theta2_1);
t5 = cos(theta2_2);
t6 = cos(theta3_1);
t7 = cos(theta3_2);
t8 = cos(theta3_3);
t9 = sin(theta1_1);
t10 = sin(theta1_2);
t11 = sin(theta2_1);
t12 = sin(theta2_2);
t13 = sin(theta3_1);
t14 = sin(theta3_2);
t15 = sin(theta3_3);
t16 = l1.*t10;
t17 = l2.*t12;
t18 = l3.*t14;
t19 = t6.*t8;
t20 = t8.*t13;
t21 = l1.*t2.*t3;
t22 = l2.*t4.*t5;
t23 = l3.*t6.*t7;
t24 = l1.*t3.*t9;
t25 = l2.*t5.*t11;
t26 = l3.*t7.*t13;
t27 = t7.*t15.*width3;
t31 = t6.*t14.*t15;
t32 = t13.*t14.*t15;
t28 = -t16;
t29 = -t17;
t30 = -t18;
t33 = -t21;
t34 = -t22;
t35 = -t23;
t36 = -t27;
t37 = -t32;
t38 = t20+t31;
t39 = t38.*width3;
t40 = t19+t37;
t41 = t40.*width3;
p_seg3_corners_1 = [seg1_top_1+t28+t29+t36,seg1_top_2+t24+t25+t41,seg1_top_3+t33+t34+t39];
if nargout > 1
    p_seg3_corners_2 = [seg1_top_1+t28+t29+t30+t36,seg1_top_2+t24+t25+t26+t41,seg1_top_3+t33+t34+t35+t39];
end
if nargout > 2
    t42 = -t39;
    t43 = -t41;
    p_seg3_corners_3 = [seg1_top_1+t27+t28+t29+t30,seg1_top_2+t24+t25+t26+t43,seg1_top_3+t33+t34+t35+t42];
end
if nargout > 3
    p_seg3_corners_4 = [seg1_top_1+t27+t28+t29,seg1_top_2+t24+t25+t43,seg1_top_3+t33+t34+t42];
end