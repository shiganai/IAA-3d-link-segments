

%% kimura.pptx definition

syms theta1_ [1 3] real
syms l1 width1 real

addpath("..\")

R1 = find_z_rot_mat( theta1_(3) ) ...
    * find_y_rot_mat( theta1_(2) ) ...
    * find_x_rot_mat( theta1_(1) ) ...
    ;

seg1_corners = cat( 3, ...
    R1' * [0, width1, 0]', ...
    R1' * [0, width1, -l1]', ...
    R1' * [0, -width1, -l1]', ...
    R1' * [0, -width1, 0]' ...
    );

% reshape seg1_corners so that 
% dim2 matches corners
% dim3 matches x,y,z
seg1_corners = permute( seg1_corners, [2, 3, 1] );

func_seg1_corners = matlabFunction( seg1_corners, 'Vars', [l1,theta1_1,theta1_2,theta1_3,width1] );

% visualize

l1 = 1;
width1 = 0.2;
app = vizapp_1link(l1, width1, func_seg1_corners);
title(app.UIAxes, 'kimura.pptx')

%% EularAngle_Lagrangian.pdf definition

syms theta1_ [1 3] real
syms l1 width1 real

addpath("..\")

R1 = find_z_rot_mat( theta1_(3) ) ...
    * find_y_rot_mat( theta1_(2) ) ...
    * find_x_rot_mat( theta1_(1) ) ...
    ;

seg1_corners = cat( 3, ...
    [0, width1, 0] * R1, ...
    [0, width1, -l1] * R1, ...
    [0, -width1, -l1] * R1, ...
    [0, -width1, 0] * R1 ...
    );

% reshape seg1_corners so that 
% dim2 matches corners
% dim3 matches x,y,z
seg1_corners = permute( seg1_corners, [1, 3, 2] );

func_seg1_corners = matlabFunction( seg1_corners, 'Vars', [l1,theta1_1,theta1_2,theta1_3,width1] );

% visualize

l1 = 1;
width1 = 0.2;
app = vizapp_1link(l1, width1, func_seg1_corners);
title(app.UIAxes, 'EularAngle\_Lagrangian.pdf')