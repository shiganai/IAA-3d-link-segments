

clear all

constants.m1 = 1;
constants.g = 10;

constants.l1 = 2;
constants.lg1 = 1;

constants.I1 = [1,1,1];
constants.width1 = 0.2;

m1 = constants.m1;
g = constants.g;
l1 = constants.l1;
lg1 = constants.lg1;
I1 = constants.I1;
width1 = constants.width1;

I1x = I1(1);
I1y = I1(2);
I1z = I1(3);

func_RJT = @(t) [0,0,0];

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

q0 = [th1_0, omega1_0]';

[time, q] = ode45(ode_fun, t, q0);

theta1_1 = q(:,1);
theta1_2 = q(:,2);
theta1_3 = q(:,3);

omega1_1 = q(:,4);
omega1_2 = q(:,5);
omega1_3 = q(:,6);

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

f1 = find_f1(alpha1_1,alpha1_2,g,lg1,m1,omega1_1,omega1_2,seg1_top_a_1,seg1_top_a_2,seg1_top_a_3,theta1_1,theta1_2);

%% plot
dockfig
plot(time, f1)

%% anime

[p_seg1_corners_1,p_seg1_corners_2,p_seg1_corners_3,p_seg1_corners_4] = find_seg1_corners(l1,seg1_top_1,seg1_top_2,seg1_top_3,theta1_1,theta1_2,theta1_3,width1);
p_seg1_corners = ...
    [
        permute( p_seg1_corners_1, [1,3,2] ), ...
        permute( p_seg1_corners_2, [1,3,2] ), ...
        permute( p_seg1_corners_3, [1,3,2] ), ...
        permute( p_seg1_corners_4, [1,3,2] ), ...
    ];

xArray = p_seg1_corners(:,:,1);
yArray = p_seg1_corners(:,:,2);
zArray = p_seg1_corners(:,:,3);

addpath("..\")
anime_fig = SimplestAnime_exported(time, xArray, yArray, zArray);
anime_fig.axAnime.XLim = [-l1, l1]*1.2;
anime_fig.axAnime.YLim = [-l1, l1]*1.2;
anime_fig.axAnime.ZLim = [-l1, l1]*1.2;
view(anime_fig.axAnime, [1,1,1])
grid(anime_fig.axAnime, 'on')



















