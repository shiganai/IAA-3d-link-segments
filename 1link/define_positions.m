

syms l1 real
syms lg1 real
syms width1 real

syms theta1_pre_(t) [1 3]
syms theta1_ omega1_ alpha1_ [1 3] real
theta1_pre_ = formula( theta1_pre_ );

syms seg1_top_pre_(t) [1 3]
syms seg1_top_ seg1_top_v_ seg1_top_a_ [1 3]
seg1_top_pre_ = formula( seg1_top_pre_ );

%%

syms_Replaced = [
    theta1_pre_ diff(theta1_pre_, t) diff(theta1_pre_, t, t), ...
    seg1_top_pre_ diff(seg1_top_pre_, t) diff(seg1_top_pre_, t, t), ...
    ];

syms_Replacing = [
    theta1_ omega1_ alpha1_ ...
    seg1_top_ seg1_top_v_ seg1_top_a_ ...
    ];

subs_pre = @(input) subs( input, syms_Replaced, syms_Replacing);
simplify_subs_pre = @(input) simplify( subs_pre( input ) );

%% prepare R1 and R2

% rotate alpha around x
seg1_rot_theta1_1 = [
    1,  0,              0;
    0,  cos(theta1_pre_(1)), sin(theta1_pre_(1));
    0,  -sin(theta1_pre_(1)), cos(theta1_pre_(1)); 
    ];
% seg1_rot_theta1_1 = [
%     cos(theta1_pre_(1)), sin(theta1_pre_(1)),     0;
%     -sin(theta1_pre_(1)), cos(theta1_pre_(1)),    0;
%     0,              0,                  1;
%     ];

R = seg1_rot_theta1_1;

% rotate beta around y
seg1_rot_theta1_2 = [
    cos(theta1_pre_(2)),  0, -sin(theta1_pre_(2));
    0,              1, 0;
    sin(theta1_pre_(2)), 0, cos(theta1_pre_(2));
    ];
% seg1_rot_theta1_2 = [
%     1, 0,               0;
%     0, cos(theta1_pre_(2)),   sin(theta1_pre_(2));
%     0, -sin(theta1_pre_(2)),  cos(theta1_pre_(2));
%     ];

R = R*seg1_rot_theta1_2;

% rotate gamma around z
seg1_rot_theta1_3 = [
    cos(theta1_pre_(3)), sin(theta1_pre_(3)),     0;
    -sin(theta1_pre_(3)), cos(theta1_pre_(3)),    0;
    0,              0,                  1;
    ];

R = seg1_rot_theta1_3 * seg1_rot_theta1_2 * seg1_rot_theta1_1;

%%
% express the position on a local axes.
% bottom of segment should be fixed since the local axes is fixed to the segment
seg1_bottom_local = [0, 0, -l1];
seg1_com_local = [0, 0, -lg1];
seg1_corners = cat( 3, ...
    [0, width1, 0], ...
    [0, width1, -l1], ...
    [0, -width1, -l1], ...
    [0, -width1, 0] ...
    );

%% rotate the vector from the segment axes to global ones

% refer to (11) on the pdf
% seg1_bottom on the left are on global axes
% seg1_bottom on the right are on segment axes
seg1_bottom_global = seg1_bottom_local * R;
seg1_com_global = seg1_com_local * R;

seg1_corners = cat(3, ...
    seg1_corners(:,:,1) * R, ...
    seg1_corners(:,:,2) * R, ...
    seg1_corners(:,:,3) * R, ...
    seg1_corners(:,:,4) * R ...
    );

%% move segment1

seg1_bottom_global = seg1_bottom_global + seg1_top_pre_;
seg1_com_global = seg1_com_global + seg1_top_pre_;
seg1_corners = seg1_corners + repmat( seg1_top_pre_, 1, 1, 4 );

%% take formula
seg1_bottom_global = formula(seg1_bottom_global);
seg1_com_global = formula(seg1_com_global);
seg1_corners = formula(seg1_corners);






































