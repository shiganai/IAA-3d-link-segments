function [p_seg2_corners_1,p_seg2_corners_2,p_seg2_corners_3,p_seg2_corners_4] = find_seg2_corners(l1,l2,seg1_top_1,seg1_top_2,seg1_top_3,theta1_1,theta1_2,theta2_1,theta2_2,theta2_3,width2)
%FIND_SEG2_CORNERS
%    [P_SEG2_CORNERS_1,P_SEG2_CORNERS_2,P_SEG2_CORNERS_3,P_SEG2_CORNERS_4] = FIND_SEG2_CORNERS(L1,L2,SEG1_TOP_1,SEG1_TOP_2,SEG1_TOP_3,THETA1_1,THETA1_2,THETA2_1,THETA2_2,THETA2_3,WIDTH2)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    16-Jun-2022 14:59:03

t2 = cos(theta1_1);
t3 = cos(theta1_2);
t4 = cos(theta2_1);
t5 = cos(theta2_2);
t6 = cos(theta2_3);
t7 = sin(theta1_1);
t8 = sin(theta1_2);
t9 = sin(theta2_1);
t10 = sin(theta2_2);
t11 = sin(theta2_3);
t12 = l1.*t8;
t13 = l2.*t10;
t14 = t4.*t6;
t15 = t6.*t9;
t16 = l1.*t2.*t3;
t17 = l2.*t4.*t5;
t18 = l1.*t3.*t7;
t19 = l2.*t5.*t9;
t20 = t5.*t11.*width2;
t23 = t4.*t10.*t11;
t24 = t9.*t10.*t11;
t21 = -t12;
t22 = -t13;
t25 = -t16;
t26 = -t17;
t27 = -t20;
t28 = -t24;
t29 = t15+t23;
t30 = t29.*width2;
t31 = t14+t28;
t32 = t31.*width2;
p_seg2_corners_1 = [seg1_top_1+t21+t27,seg1_top_2+t18+t32,seg1_top_3+t25+t30];
if nargout > 1
    p_seg2_corners_2 = [seg1_top_1+t21+t22+t27,seg1_top_2+t18+t19+t32,seg1_top_3+t25+t26+t30];
end
if nargout > 2
    t33 = -t30;
    t34 = -t32;
    p_seg2_corners_3 = [seg1_top_1+t20+t21+t22,seg1_top_2+t18+t19+t34,seg1_top_3+t25+t26+t33];
end
if nargout > 3
    p_seg2_corners_4 = [seg1_top_1+t20+t21,seg1_top_2+t18+t34,seg1_top_3+t25+t33];
end
