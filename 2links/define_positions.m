

syms l1 l2 real
syms lg1 lg2 real
syms width1 width2 real

syms theta1_pre_(t) [1 3]
syms theta1_ omega1_ alpha1_ [1 3] real
theta1_pre_ = formula( theta1_pre_ );

syms theta2_pre_(t) [1 3]
syms theta2_ omega2_ alpha2_ [1 3] real
theta2_pre_ = formula( theta2_pre_ );

syms seg1_top_pre_(t) [1 3]
syms seg1_top_ seg1_top_v_ seg1_top_a_ [1 3]
seg1_top_pre_ = formula( seg1_top_pre_ );

%%

syms_Replaced = [
    theta1_pre_ diff(theta1_pre_, t) diff(theta1_pre_, t, t), ...
    theta2_pre_ diff(theta2_pre_, t) diff(theta2_pre_, t, t), ...
    seg1_top_pre_ diff(seg1_top_pre_, t) diff(seg1_top_pre_, t, t), ...
    ];

syms_Replacing = [
    theta1_ omega1_ alpha1_ ...
    theta2_ omega2_ alpha2_ ...
    seg1_top_ seg1_top_v_ seg1_top_a_ ...
    ];

subs_pre = @(input) subs( input, syms_Replaced, syms_Replacing);
simplify_subs_pre = @(input) simplify( subs_pre( input ) );

%% prepare R1 and R2

addpath("..\")

R1 = find_z_rot_mat( theta1_pre_(3) ) ...
    * find_y_rot_mat( theta1_pre_(2) ) ...
    * find_x_rot_mat( theta1_pre_(1) ) ...
    ;

R2 = find_z_rot_mat( theta2_pre_(3) ) ...
    * find_y_rot_mat( theta2_pre_(2) ) ...
    * find_x_rot_mat( theta2_pre_(1) ) ...
    ;

%% prepare segment 1 and 2 positions

seg1_bottom = [0, 0, -l1] * R1;
seg1_com = [0, 0, -lg1] * R1;
seg1_corners = cat( 3, ...
    [0, width1, 0] * R1, ...
    [0, width1, -l1] * R1, ...
    [0, -width1, -l1] * R1, ...
    [0, -width1, 0] * R1 ...
    );

seg2_bottom = [0, 0, -l2] * R2;
seg2_com = [0, 0, -lg2] * R2;
seg2_corners = cat( 3, ...
    [0, width2, 0] * R2, ...
    [0, width2, -l2] * R2, ...
    [0, -width2, -l2] * R2, ...
    [0, -width2, 0] * R2 ...
    );

%% move segment1

seg1_bottom = seg1_bottom + seg1_top_pre_;
seg1_com = seg1_com + seg1_top_pre_;
seg1_corners = seg1_corners + repmat( seg1_top_pre_, 1, 1, 4 );

%% move segment2
seg2_bottom = seg2_bottom + seg1_bottom;
seg2_com = seg2_com + seg1_bottom;
seg2_corners = seg2_corners + repmat( seg1_bottom, 1, 1, 4 );

%% take formula
seg1_bottom = formula( seg1_bottom );
seg1_com = formula( seg1_com );
seg1_corners = formula( seg1_corners );

seg2_bottom = formula( seg2_bottom );
seg2_com = formula( seg2_com );
seg2_corners = formula( seg2_corners );