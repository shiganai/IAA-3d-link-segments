function p_seg4_bottom = find_seg4_bottom(l1,l2,l3,l4,seg1_top_1,seg1_top_2,seg1_top_3,theta1_1,theta1_2,theta2_1,theta2_2,theta3_1,theta3_2,theta4_1,theta4_2)
%FIND_SEG4_BOTTOM
%    P_SEG4_BOTTOM = FIND_SEG4_BOTTOM(L1,L2,L3,L4,SEG1_TOP_1,SEG1_TOP_2,SEG1_TOP_3,THETA1_1,THETA1_2,THETA2_1,THETA2_2,THETA3_1,THETA3_2,THETA4_1,THETA4_2)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    16-Jun-2022 14:59:04

t2 = cos(theta1_2);
t3 = cos(theta2_2);
t4 = cos(theta3_2);
t5 = cos(theta4_2);
p_seg4_bottom = [seg1_top_1-l1.*sin(theta1_2)-l2.*sin(theta2_2)-l3.*sin(theta3_2)-l4.*sin(theta4_2),seg1_top_2+l1.*t2.*sin(theta1_1)+l2.*t3.*sin(theta2_1)+l3.*t4.*sin(theta3_1)+l4.*t5.*sin(theta4_1),seg1_top_3-l1.*t2.*cos(theta1_1)-l2.*t3.*cos(theta2_1)-l3.*t4.*cos(theta3_1)-l4.*t5.*cos(theta4_1)];
