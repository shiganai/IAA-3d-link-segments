
clear all

define_positions
seg1_corners = subs_pre( seg1_corners );
seg2_corners = subs_pre( seg2_corners );

seg1_corners = subs( seg1_corners, seg1_top_, sym([1,0.5,0]) );
seg2_corners = subs( seg2_corners, seg1_top_, sym([1,0.5,0]) );

% reshape seg1_corners so that 
% dim2 matches corners
% dim3 matches x,y,z
seg1_corners = permute( seg1_corners, [1, 3, 2] );
seg2_corners = permute( seg2_corners, [1, 3, 2] );

func_seg1_corners = matlabFunction( seg1_corners, 'Vars', ...
    [ ...
        l1,theta1_1,theta1_2,theta1_3,width1 ...
    ] ...
    );
func_seg2_corners = matlabFunction( seg2_corners, 'Vars', ...
    [ ...
        l1,theta1_1,theta1_2,theta1_3,width1 ...
        l2,theta2_1,theta2_2,theta2_3,width2 ...
    ] ...
    );

%% visualize
% verify that func_seg1_corners takes (l1,theta1_1,theta1_2,theta1_3,width1) as input
func_seg1_corners

% verify that func_seg2_corners takes (l1,theta1_1,theta1_2,theta1_3,width1) as input
func_seg2_corners

l1 = 1;
width1 = 0.2;
l2 = 1;
width2 = 0.2;

app = vizapp_2link( ...
    l1, width1, func_seg1_corners, ...
    l2, width2, func_seg2_corners ...
    );
title(app.UIAxes, 'EularAngle\_Lagrangian.pdf')