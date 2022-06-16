
clear all

define_positions
seg1_corners = subs_pre( seg1_corners );

seg1_corners = subs( seg1_corners, seg1_top_, sym([0.5,0.25,0]) );

% reshape seg1_corners so that 
% dim2 matches corners
% dim3 matches x,y,z
seg1_corners = permute( seg1_corners, [1, 3, 2] );

func_seg1_corners = matlabFunction( seg1_corners, 'Vars', ...
    [ ...
        l1,theta1_1,theta1_2,theta1_3,width1 ...
    ] ...
    );

% visualize

l1 = 1;
width1 = 0.2;
app = vizapp_1link(l1, width1, func_seg1_corners);
title(app.UIAxes, 'EularAngle\_Lagrangian.pdf')