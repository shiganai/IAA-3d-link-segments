function G_hirashima = find_G_hirashima(l1,l2,lg1,lg2,lg3,m1,m2,m3,theta1_1,theta1_2,theta2_1,theta2_2,theta3_1,theta3_2)
%find_G_hirashima
%    G_hirashima = find_G_hirashima(L1,L2,LG1,LG2,LG3,M1,M2,M3,THETA1_1,THETA1_2,THETA2_1,THETA2_2,THETA3_1,THETA3_2)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    16-Jun-2022 15:05:02

G_hirashima = [-(m2+m3).*(l1.*cos(theta1_2).*sin(theta1_1)-lg1.*cos(theta1_2).*sin(theta1_1))-lg1.*cos(theta1_2).*sin(theta1_1).*(m1+m2+m3);-(m2+m3).*(l1.*sin(theta1_2)-lg1.*sin(theta1_2))-lg1.*sin(theta1_2).*(m1+m2+m3);0.0;-m3.*(l2.*cos(theta2_2).*sin(theta2_1)-lg2.*cos(theta2_2).*sin(theta2_1))-lg2.*cos(theta2_2).*sin(theta2_1).*(m2+m3);-m3.*(l2.*sin(theta2_2)-lg2.*sin(theta2_2))-lg2.*sin(theta2_2).*(m2+m3);0.0;-lg3.*m3.*cos(theta3_2).*sin(theta3_1);-lg3.*m3.*sin(theta3_2);0.0];
