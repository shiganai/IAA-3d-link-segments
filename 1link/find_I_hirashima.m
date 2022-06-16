function I_hirashima = find_I_hirashima(I1x,I1y,I1z,lg1,m1,theta1_1,theta1_2,theta1_3)
%find_I_hirashima
%    I_hirashima = find_I_hirashima(I1x,I1y,I1z,LG1,M1,THETA1_1,THETA1_2,THETA1_3)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    16-Jun-2022 12:02:53

et1 = -(cos(theta1_2).*cos(theta1_3).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))-cos(theta1_2).*sin(theta1_3).*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3))+cos(theta1_1).*cos(theta1_2).*sin(theta1_2)).*(I1x.*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2)).^2+I1y.*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3)).^2+I1z.*cos(theta1_1).^2.*cos(theta1_2).^2)+(cos(theta1_2).^2.*sin(theta1_1).^2+(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2)).^2+(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3)).^2).*(I1z.*cos(theta1_1).*cos(theta1_2).*sin(theta1_2)+I1x.*cos(theta1_2).*cos(theta1_3).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))-I1y.*cos(theta1_2).*sin(theta1_3).*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3)));
et2 = -lg1.^2.*m1.*cos(theta1_1).*cos(theta1_2).*sin(theta1_2);
et3 = -(I1x.*(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2)).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))+I1y.*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3)).*(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3))-I1z.*cos(theta1_1).*cos(theta1_2).^2.*sin(theta1_1)).*(cos(theta1_2).*cos(theta1_3).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))-cos(theta1_2).*sin(theta1_3).*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3))+cos(theta1_1).*cos(theta1_2).*sin(theta1_2));
et4 = -(cos(theta1_2).^2.*sin(theta1_1).^2+(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2)).^2+(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3)).^2).*(I1z.*cos(theta1_2).*sin(theta1_1).*sin(theta1_2)-I1x.*cos(theta1_2).*cos(theta1_3).*(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2))+I1y.*cos(theta1_2).*sin(theta1_3).*(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3)))+lg1.^2.*m1.*cos(theta1_2).*sin(theta1_1).*sin(theta1_2);
et5 = (sin(theta1_1).*sin(theta1_2).^2+cos(theta1_2).^2.*cos(theta1_3).^2.*sin(theta1_1)+cos(theta1_2).^2.*sin(theta1_1).*sin(theta1_3).^2).*(I1x.*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2)).^2+I1y.*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3)).^2+I1z.*cos(theta1_1).^2.*cos(theta1_2).^2)+(cos(theta1_1).*cos(theta1_2).^2-cos(theta1_3).*sin(theta1_2).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))+sin(theta1_2).*sin(theta1_3).*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3))).*(I1x.*(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2)).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))+I1y.*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3)).*(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3))-I1z.*cos(theta1_1).*cos(theta1_2).^2.*sin(theta1_1));
et6 = (-cos(theta1_1).*cos(theta1_2).*cos(theta1_3).*(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2))+cos(theta1_1).*cos(theta1_2).*sin(theta1_3).*(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3))+cos(theta1_1).*cos(theta1_2).*sin(theta1_1).*sin(theta1_2)).*(I1z.*cos(theta1_1).*cos(theta1_2).*sin(theta1_2)+I1x.*cos(theta1_2).*cos(theta1_3).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))-I1y.*cos(theta1_2).*sin(theta1_3).*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3)))+lg1.^2.*m1.*cos(theta1_2).^2.*sin(theta1_1)+lg1.^2.*m1.*sin(theta1_1).*sin(theta1_2).^2;
et7 = -(-cos(theta1_1).*cos(theta1_2).*cos(theta1_3).*(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2))+cos(theta1_1).*cos(theta1_2).*sin(theta1_3).*(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3))+cos(theta1_1).*cos(theta1_2).*sin(theta1_1).*sin(theta1_2)).*(I1z.*cos(theta1_2).*sin(theta1_1).*sin(theta1_2)-I1x.*cos(theta1_2).*cos(theta1_3).*(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2))+I1y.*cos(theta1_2).*sin(theta1_3).*(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3)));
et8 = (cos(theta1_1).*cos(theta1_2).^2-cos(theta1_3).*sin(theta1_2).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))+sin(theta1_2).*sin(theta1_3).*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3))).*(I1x.*(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2)).^2+I1y.*(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3)).^2+I1z.*cos(theta1_2).^2.*sin(theta1_1).^2)+(I1x.*(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2)).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))+I1y.*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3)).*(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3))-I1z.*cos(theta1_1).*cos(theta1_2).^2.*sin(theta1_1)).*(sin(theta1_1).*sin(theta1_2).^2+cos(theta1_2).^2.*cos(theta1_3).^2.*sin(theta1_1)+cos(theta1_2).^2.*sin(theta1_1).*sin(theta1_3).^2);
et9 = lg1.^2.*m1.*cos(theta1_1).*cos(theta1_2).^2+lg1.^2.*m1.*cos(theta1_1).*sin(theta1_2).^2;
et10 = -(cos(theta1_1).*cos(theta1_2).^2-cos(theta1_3).*sin(theta1_2).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))+sin(theta1_2).*sin(theta1_3).*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3))).*(I1z.*cos(theta1_2).*sin(theta1_1).*sin(theta1_2)-I1x.*cos(theta1_2).*cos(theta1_3).*(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2))+I1y.*cos(theta1_2).*sin(theta1_3).*(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3)))+(-cos(theta1_1).*cos(theta1_2).*cos(theta1_3).*(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2))+cos(theta1_1).*cos(theta1_2).*sin(theta1_3).*(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3))+cos(theta1_1).*cos(theta1_2).*sin(theta1_1).*sin(theta1_2)).*(I1z.*sin(theta1_2).^2+I1x.*cos(theta1_2).^2.*cos(theta1_3).^2+I1y.*cos(theta1_2).^2.*sin(theta1_3).^2);
et11 = (sin(theta1_1).*sin(theta1_2).^2+cos(theta1_2).^2.*cos(theta1_3).^2.*sin(theta1_1)+cos(theta1_2).^2.*sin(theta1_1).*sin(theta1_3).^2).*(I1z.*cos(theta1_1).*cos(theta1_2).*sin(theta1_2)+I1x.*cos(theta1_2).*cos(theta1_3).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))-I1y.*cos(theta1_2).*sin(theta1_3).*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3)));
et12 = -(cos(theta1_2).*cos(theta1_3).*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3))+cos(theta1_2).*sin(theta1_3).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))).*(I1x.*(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2)).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))+I1y.*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3)).*(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3))-I1z.*cos(theta1_1).*cos(theta1_2).^2.*sin(theta1_1));
et13 = (cos(theta1_2).*cos(theta1_3).*(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3))+cos(theta1_2).*sin(theta1_3).*(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2))).*(I1x.*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2)).^2+I1y.*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3)).^2+I1z.*cos(theta1_1).^2.*cos(theta1_2).^2)+((cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2)).*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3))-(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3)).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))).*(I1z.*cos(theta1_1).*cos(theta1_2).*sin(theta1_2)+I1x.*cos(theta1_2).*cos(theta1_3).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))-I1y.*cos(theta1_2).*sin(theta1_3).*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3)));
et14 = -((cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2)).*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3))-(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3)).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))).*(I1z.*cos(theta1_2).*sin(theta1_1).*sin(theta1_2)-I1x.*cos(theta1_2).*cos(theta1_3).*(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2))+I1y.*cos(theta1_2).*sin(theta1_3).*(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3)));
et15 = (cos(theta1_2).*cos(theta1_3).*(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3))+cos(theta1_2).*sin(theta1_3).*(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2))).*(I1x.*(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2)).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))+I1y.*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3)).*(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3))-I1z.*cos(theta1_1).*cos(theta1_2).^2.*sin(theta1_1));
et16 = -(cos(theta1_2).*cos(theta1_3).*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3))+cos(theta1_2).*sin(theta1_3).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))).*(I1x.*(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2)).^2+I1y.*(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3)).^2+I1z.*cos(theta1_2).^2.*sin(theta1_1).^2);
et17 = ((cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2)).*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3))-(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3)).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))).*(I1z.*sin(theta1_2).^2+I1x.*cos(theta1_2).^2.*cos(theta1_3).^2+I1y.*cos(theta1_2).^2.*sin(theta1_3).^2)+(cos(theta1_2).*cos(theta1_3).*(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3))+cos(theta1_2).*sin(theta1_3).*(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2))).*(I1z.*cos(theta1_1).*cos(theta1_2).*sin(theta1_2)+I1x.*cos(theta1_2).*cos(theta1_3).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))-I1y.*cos(theta1_2).*sin(theta1_3).*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3)));
et18 = (cos(theta1_2).*cos(theta1_3).*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3))+cos(theta1_2).*sin(theta1_3).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))).*(I1z.*cos(theta1_2).*sin(theta1_1).*sin(theta1_2)-I1x.*cos(theta1_2).*cos(theta1_3).*(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2))+I1y.*cos(theta1_2).*sin(theta1_3).*(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3)));
mt1 = [-(I1z.*cos(theta1_1).*cos(theta1_2).*sin(theta1_2)+I1x.*cos(theta1_2).*cos(theta1_3).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))-I1y.*cos(theta1_2).*sin(theta1_3).*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3))).*(cos(theta1_2).*cos(theta1_3).*(sin(theta1_1).*sin(theta1_3)-cos(theta1_1).*cos(theta1_3).*sin(theta1_2))-cos(theta1_2).*sin(theta1_3).*(cos(theta1_3).*sin(theta1_1)+cos(theta1_1).*sin(theta1_2).*sin(theta1_3))+cos(theta1_1).*cos(theta1_2).*sin(theta1_2))+(cos(theta1_2).^2.*sin(theta1_1).^2+(cos(theta1_1).*sin(theta1_3)+cos(theta1_3).*sin(theta1_1).*sin(theta1_2)).^2+(cos(theta1_1).*cos(theta1_3)-sin(theta1_1).*sin(theta1_2).*sin(theta1_3)).^2).*(I1z.*sin(theta1_2).^2+I1x.*cos(theta1_2).^2.*cos(theta1_3).^2+I1y.*cos(theta1_2).^2.*sin(theta1_3).^2)+lg1.^2.*m1.*cos(theta1_1).^2.*cos(theta1_2).^2+lg1.^2.*m1.*cos(theta1_2).^2.*sin(theta1_1).^2];
mt2 = [et3+et4,et1+et2,et10+et11,et7+et8+et9,et5+et6,et17+et18,et14+et15+et16,et12+et13];
I_hirashima = reshape([mt1,mt2],3,3);
