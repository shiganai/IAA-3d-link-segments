function [p_seg1_corners_1,p_seg1_corners_2,p_seg1_corners_3,p_seg1_corners_4] = find_seg1_corners(l1,seg1_top_1,seg1_top_2,seg1_top_3,theta1_1,theta1_2,theta1_3,width1)
%FIND_SEG1_CORNERS
%    [P_SEG1_CORNERS_1,P_SEG1_CORNERS_2,P_SEG1_CORNERS_3,P_SEG1_CORNERS_4] = FIND_SEG1_CORNERS(L1,SEG1_TOP_1,SEG1_TOP_2,SEG1_TOP_3,THETA1_1,THETA1_2,THETA1_3,WIDTH1)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    16-Jun-2022 14:59:02

t2 = cos(theta1_1);
t3 = cos(theta1_2);
t4 = cos(theta1_3);
t5 = sin(theta1_1);
t6 = sin(theta1_2);
t7 = sin(theta1_3);
t8 = l1.*t6;
t9 = t2.*t4;
t10 = t4.*t5;
t11 = l1.*t2.*t3;
t12 = l1.*t3.*t5;
t13 = t3.*t7.*width1;
t15 = t2.*t6.*t7;
t16 = t5.*t6.*t7;
t14 = -t8;
t17 = -t11;
t18 = -t13;
t19 = -t16;
t20 = t10+t15;
t21 = t20.*width1;
t22 = t9+t19;
t23 = t22.*width1;
p_seg1_corners_1 = [seg1_top_1+t18,seg1_top_2+t23,seg1_top_3+t21];
if nargout > 1
    p_seg1_corners_2 = [seg1_top_1+t14+t18,seg1_top_2+t12+t23,seg1_top_3+t17+t21];
end
if nargout > 2
    t24 = -t21;
    t25 = -t23;
    p_seg1_corners_3 = [seg1_top_1+t13+t14,seg1_top_2+t12+t25,seg1_top_3+t17+t24];
end
if nargout > 3
    p_seg1_corners_4 = [seg1_top_1+t13,seg1_top_2+t25,seg1_top_3+t24];
end