

clear all

constants.g = 10;

constants.m1 = 1;
constants.l1 = 2;
constants.lg1 = 1;
constants.I1 = [2,3,1];
constants.width1 = 0.2;

constants.m2 = 2;
constants.l2 = 2;
constants.lg2 = 1;
constants.I2 = [2,3,1];
constants.width2 = 0.2;

constants.m3 = 2;
constants.l3 = 2;
constants.lg3 = 1;
constants.I3 = [2,3,1];
constants.width3 = 0.2;

constants.m4 = 2;
constants.l4 = 2;
constants.lg4 = 1;
constants.I4 = [2,3,1];
constants.width4 = 0.2;

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

func_RJT1 = @(t) [0,0,0];
func_RJT2 = @(t) [0,0,0];
func_RJT3 = @(t) [0,0,0];
func_RJT4 = @(t) [0,0,0];
func_RJT = @(t) [func_RJT1(t), func_RJT2(t), func_RJT3(t), func_RJT4(t)];

ext_omega = 2;
func_seg1_top_x = @(t) [cos(ext_omega*t),             zeros(size(t)), zeros(size(t))];
func_seg1_top_v = @(t) [-ext_omega*sin(ext_omega*t),    zeros(size(t)), zeros(size(t))];
func_seg1_top_a = @(t) [-ext_omega^2*cos(ext_omega*t),  zeros(size(t)), zeros(size(t))];
func_seg1_top = @(t) [func_seg1_top_x(t), func_seg1_top_v(t), func_seg1_top_a(t)];

ode_fun = @(t,q) ddt_ode45(t,q, constants, func_seg1_top, func_RJT);

t = 0:1e-2:10;
t = t(:);

th1_0 = [0,0,0];
omega1_0 = [0,0,0];
th2_0 = [0,0,0];
omega2_0 = [0,0,0];
th3_0 = [0,0,0];
omega3_0 = [0,0,0];
th4_0 = [0,0,0];
omega4_0 = [0,0,0];

q0 = [
    th1_0, omega1_0, ...
    th2_0, omega2_0, ...
    th3_0, omega3_0, ...
    th4_0, omega4_0, ...
    ]';

[time, q] = ode45(ode_fun, t, q0);

theta1_1 = q(:,1);
theta1_2 = q(:,2);
theta1_3 = q(:,3);
omega1_1 = q(:,4);
omega1_2 = q(:,5);
omega1_3 = q(:,6);

theta2_1 = q(:,7);
theta2_2 = q(:,8);
theta2_3 = q(:,9);
omega2_1 = q(:,10);
omega2_2 = q(:,11);
omega2_3 = q(:,12);

theta3_1 = q(:,13);
theta3_2 = q(:,14);
theta3_3 = q(:,15);
omega3_1 = q(:,16);
omega3_2 = q(:,17);
omega3_3 = q(:,18);

theta4_1 = q(:,19);
theta4_2 = q(:,20);
theta4_3 = q(:,21);
omega4_1 = q(:,22);
omega4_2 = q(:,23);
omega4_3 = q(:,24);

seg1_top = func_seg1_top(t);
seg1_top_1 = seg1_top(:,1);
seg1_top_2 = seg1_top(:,2);
seg1_top_3 = seg1_top(:,3);
seg1_top_v_1 = seg1_top(:,4);
seg1_top_v_2 = seg1_top(:,5);
seg1_top_v_3 = seg1_top(:,6);
seg1_top_a_1 = seg1_top(:,7);
seg1_top_a_2 = seg1_top(:,8);
seg1_top_a_3 = seg1_top(:,9);

% spline for temporary
alpha1_1 = fnval( fnder( spline( time, omega1_1 ) ), time );
alpha1_2 = fnval( fnder( spline( time, omega1_2 ) ), time );
alpha1_3 = fnval( fnder( spline( time, omega1_3 ) ), time );
alpha2_1 = fnval( fnder( spline( time, omega2_1 ) ), time );
alpha2_2 = fnval( fnder( spline( time, omega2_2 ) ), time );
alpha2_3 = fnval( fnder( spline( time, omega2_3 ) ), time );
alpha3_1 = fnval( fnder( spline( time, omega3_1 ) ), time );
alpha3_2 = fnval( fnder( spline( time, omega3_2 ) ), time );
alpha3_3 = fnval( fnder( spline( time, omega3_3 ) ), time );
alpha4_1 = fnval( fnder( spline( time, omega4_1 ) ), time );
alpha4_2 = fnval( fnder( spline( time, omega4_2 ) ), time );
alpha4_3 = fnval( fnder( spline( time, omega4_3 ) ), time );

%% anime

[p_seg1_corners_1,p_seg1_corners_2,p_seg1_corners_3,p_seg1_corners_4] = find_seg1_corners(l1,seg1_top_1,seg1_top_2,seg1_top_3,theta1_1,theta1_2,theta1_3,width1);
p_seg1_corners = ...
    [
        permute( p_seg1_corners_1, [1,3,2] ), ...
        permute( p_seg1_corners_2, [1,3,2] ), ...
        permute( p_seg1_corners_3, [1,3,2] ), ...
        permute( p_seg1_corners_4, [1,3,2] ), ...
    ];

[p_seg2_corners_1,p_seg2_corners_2,p_seg2_corners_3,p_seg2_corners_4] = find_seg2_corners(l1,l2,seg1_top_1,seg1_top_2,seg1_top_3,theta1_1,theta1_2,theta2_1,theta2_2,theta2_3,width2);
p_seg2_corners = ...
    [
        permute( p_seg2_corners_1, [1,3,2] ), ...
        permute( p_seg2_corners_2, [1,3,2] ), ...
        permute( p_seg2_corners_3, [1,3,2] ), ...
        permute( p_seg2_corners_4, [1,3,2] ), ...
    ];

[p_seg3_corners_1,p_seg3_corners_2,p_seg3_corners_3,p_seg3_corners_4] = find_seg3_corners(l1,l2,l3,seg1_top_1,seg1_top_2,seg1_top_3,theta1_1,theta1_2,theta2_1,theta2_2,theta3_1,theta3_2,theta3_3,width3);
p_seg3_corners = ...
    [
        permute( p_seg3_corners_1, [1,3,2] ), ...
        permute( p_seg3_corners_2, [1,3,2] ), ...
        permute( p_seg3_corners_3, [1,3,2] ), ...
        permute( p_seg3_corners_4, [1,3,2] ), ...
    ];

[p_seg4_corners_1,p_seg4_corners_2,p_seg4_corners_3,p_seg4_corners_4] = find_seg4_corners(l1,l2,l3,l4,seg1_top_1,seg1_top_2,seg1_top_3,theta1_1,theta1_2,theta2_1,theta2_2,theta3_1,theta3_2,theta4_1,theta4_2,theta4_3,width4);
p_seg4_corners = ...
    [
        permute( p_seg4_corners_1, [1,3,2] ), ...
        permute( p_seg4_corners_2, [1,3,2] ), ...
        permute( p_seg4_corners_3, [1,3,2] ), ...
        permute( p_seg4_corners_4, [1,3,2] ), ...
    ];

NaN_array = NaN( size( p_seg1_corners(:,1,1) ) );

xArray = [p_seg1_corners(:,:,1), NaN_array, p_seg2_corners(:,:,1), NaN_array, p_seg3_corners(:,:,1), NaN_array, p_seg4_corners(:,:,1)];
yArray = [p_seg1_corners(:,:,2), NaN_array, p_seg2_corners(:,:,2), NaN_array, p_seg3_corners(:,:,2), NaN_array, p_seg4_corners(:,:,2)];
zArray = [p_seg1_corners(:,:,3), NaN_array, p_seg2_corners(:,:,3), NaN_array, p_seg3_corners(:,:,3), NaN_array, p_seg4_corners(:,:,3)];

addpath("..\")
anime_fig = SimplestAnime_exported(time, xArray, yArray, zArray);

range = [ -1.1, 1.1 ] * (l1 + l2 + l3 + l4);
anime_fig.axAnime.XLim = range;
anime_fig.axAnime.YLim = range;
anime_fig.axAnime.ZLim = range;
view(anime_fig.axAnime, [1,1,1])
grid(anime_fig.axAnime, 'on')



















