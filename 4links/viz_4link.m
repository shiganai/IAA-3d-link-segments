
clear all

define_positions
seg1_corners = subs_pre( seg1_corners );
seg2_corners = subs_pre( seg2_corners );
seg3_corners = subs_pre( seg3_corners );
seg4_corners = subs_pre( seg4_corners );

seg1_corners = subs( seg1_corners, seg1_top_, sym([2,1,0]) );
seg2_corners = subs( seg2_corners, seg1_top_, sym([2,1,0]) );
seg3_corners = subs( seg3_corners, seg1_top_, sym([2,1,0]) );
seg4_corners = subs( seg4_corners, seg1_top_, sym([2,1,0]) );

% reshape seg1_corners so that 
% dim2 matches corners
% dim3 matches x,y,z
seg1_corners = permute( seg1_corners, [1, 3, 2] );
seg2_corners = permute( seg2_corners, [1, 3, 2] );
seg3_corners = permute( seg3_corners, [1, 3, 2] );
seg4_corners = permute( seg4_corners, [1, 3, 2] );

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
func_seg3_corners = matlabFunction( seg3_corners, 'Vars', ...
    [ ...
        l1,theta1_1,theta1_2,theta1_3,width1 ...
        l2,theta2_1,theta2_2,theta2_3,width2 ...
        l3,theta3_1,theta3_2,theta3_3,width3 ...
    ] ...
    );
func_seg4_corners = matlabFunction( seg4_corners, 'Vars', ...
    [ ...
        l1,theta1_1,theta1_2,theta1_3,width1 ...
        l2,theta2_1,theta2_2,theta2_3,width2 ...
        l3,theta3_1,theta3_2,theta3_3,width3 ...
        l4,theta4_1,theta4_2,theta4_3,width4 ...
    ] ...
    );

%% visualize

l1 = 1;
width1 = 0.2;
l2 = 1;
width2 = 0.2;
l3 = 1;
width3 = 0.2;
l4 = 1;
width4 = 0.2;

app = vizapp_4link( ...
    l1, width1, func_seg1_corners, ...
    l2, width2, func_seg2_corners, ...
    l3, width3, func_seg3_corners, ...
    l4, width4, func_seg4_corners ...
    );
title(app.UIAxes, 'EularAngle\_Lagrangian.pdf')