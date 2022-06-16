
% this scripts is based on 'EularAngle_Lagrangian.pdf' in the folder
% read the pdf along with this code.
% assume that the local axes (G' on the pdf) are fixed to the segment
% adn that the global axes (G on the pdf) are fixed to the segment

clear all
tic

define_positions

parallel.defaultClusterProfile('local');
c = parcluster();

syms m1 m2 m3 real
syms g real

syms I1x I1y I1z real
syms I2x I2y I2z real
syms I3x I3y I3z real

syms RJT1_ [1 3] real
syms RJT2_ [1 3] real
syms RJT3_ [1 3] real

%%
I1 = [
    I1x, 0, 0;
    0, I1y, 0;
    0, 0, I1z;
    ];

I2 = [
    I2x, 0, 0;
    0, I2y, 0;
    0, 0, I2z;
    ];

I3 = [
    I3x, 0, 0;
    0, I3y, 0;
    0, 0, I3z;
    ];

%% make function file for positions
%{a
seg1_bottom = simplify_subs_pre( seg1_bottom );
job = createJob(c);
createTask(job, @matlabFunction, 1, ...
    { ...
        seg1_bottom, ...
        'file', 'find_seg1_bottom.m', ...
        'outputs', {'p_seg1_bottom'} ...
    });
submit(job)
job.Tasks

seg1_corners = simplify_subs_pre( formula( seg1_corners ) );
job = createJob(c);
createTask(job, @matlabFunction, 1, ...
    { ...
        seg1_corners(:,:,1), ...
        seg1_corners(:,:,2), ...
        seg1_corners(:,:,3), ...
        seg1_corners(:,:,4), ...
        'file', 'find_seg1_corners.m', ...
        'outputs', { ...
                    'p_seg1_corners_1', ...
                    'p_seg1_corners_2', ...
                    'p_seg1_corners_3', ...
                    'p_seg1_corners_4' ...
        } ...
    });
submit(job)
job.Tasks

seg2_bottom = simplify_subs_pre( seg2_bottom );
job = createJob(c);
createTask(job, @matlabFunction, 1, ...
    { ...
        seg2_bottom, ...
        'file', 'find_seg2_bottom.m', ...
        'outputs', {'p_seg2_bottom'} ...
    });
submit(job)
job.Tasks

seg2_corners = simplify_subs_pre( formula( seg2_corners ) );
job = createJob(c);
createTask(job, @matlabFunction, 1, ...
    { ...
        seg2_corners(:,:,1), ...
        seg2_corners(:,:,2), ...
        seg2_corners(:,:,3), ...
        seg2_corners(:,:,4), ...
        'file', 'find_seg2_corners.m', ...
        'outputs', { ...
                    'p_seg2_corners_1', ...
                    'p_seg2_corners_2', ...
                    'p_seg2_corners_3', ...
                    'p_seg2_corners_4' ...
        } ...
    });
submit(job)
job.Tasks

seg3_bottom = simplify_subs_pre( seg3_bottom );
job = createJob(c);
createTask(job, @matlabFunction, 1, ...
    { ...
        seg3_bottom, ...
        'file', 'find_seg3_bottom.m', ...
        'outputs', {'p_seg3_bottom'} ...
    });
submit(job)
job.Tasks

seg3_corners = simplify_subs_pre( formula( seg3_corners ) );
job = createJob(c);
createTask(job, @matlabFunction, 1, ...
    { ...
        seg3_corners(:,:,1), ...
        seg3_corners(:,:,2), ...
        seg3_corners(:,:,3), ...
        seg3_corners(:,:,4), ...
        'file', 'find_seg3_corners.m', ...
        'outputs', { ...
                    'p_seg3_corners_1', ...
                    'p_seg3_corners_2', ...
                    'p_seg3_corners_3', ...
                    'p_seg3_corners_4' ...
        } ...
    });
submit(job)
job.Tasks
%}

%% prepare segment 1 and 2 velocity

seg1_v_com = formula( diff(seg1_com, t) );
seg2_v_com = formula( diff(seg2_com, t) );
seg3_v_com = formula( diff(seg3_com, t) );

seg1_a_com = formula( diff(seg1_v_com, t) );
seg2_a_com = formula( diff(seg2_v_com, t) );
seg3_a_com = formula( diff(seg3_v_com, t) );

%% calc Omega of segment 1 on global axes
dR1 = diff( R1, t );
Omega1 = R1' * dR1 ;

% assume that Omega = [ 
%     0,          omega_z,    -omega_y;
%     -omega_z,   0,          omega_x;
%     omega_y,    -omega_x,   0;
%     ]
% refer to (53) and (55)
omega1_x = Omega1(2, 3);
omega1_y = Omega1(3, 1);
omega1_z = Omega1(1, 2);

% define omega1 on global axes
omega1 = [omega1_x, omega1_y, omega1_z];
alpha1 = diff( omega1, t );

%% calc Omega of segment 2 on global axes
dR2 = diff( R2, t );
Omega2 = R2' * dR2;

% assume that Omega = [ 
%     0,          omega_z,    -omega_y;
%     -omega_z,   0,          omega_x;
%     omega_y,    -omega_x,   0;
%     ]
% refer to (53) and (55)
omega2_x = Omega2(2, 3);
omega2_y = Omega2(3, 1);
omega2_z = Omega2(1, 2);

% define omega1 on global axes
omega2 = [omega2_x, omega2_y, omega2_z];
alpha2 = diff( omega2, t );

%% calc Omega of segment 2 on global axes
dR3 = diff( R3, t );
Omega3 = R3' * dR3;

% assume that Omega = [ 
%     0,          omega_z,    -omega_y;
%     -omega_z,   0,          omega_x;
%     omega_y,    -omega_x,   0;
%     ]
% refer to (53) and (55)
omega3_x = Omega3(2, 3);
omega3_y = Omega3(3, 1);
omega3_z = Omega3(1, 2);

% define omega1 on global axes
omega3 = [omega3_x, omega3_y, omega3_z];
alpha3 = diff( omega3, t );

%% define Inertia on global axes
% refer to (10) of tensor_of_inertia_rot.pdf
% note that I' of tensor_of_inertia_rot.pdf is inertia on global axes
% so 
I1_global = R1' * I1 * R1;
I2_global = R2' * I2 * R2;
I3_global = R3' * I3 * R3;

%% define eqations

% F1 works between segment 1 and fixed point
% F2 works between segment 1 and segment 2
% F3 works between segment 2 and segment 3
syms f1 f2 f3 [1 3] real
f4 = [0, 0, 0];
g_vec = [0, 0, -g];

% equations about f
f_eq = [
    m1 * seg1_a_com' == f1' - f2' + m1 * g_vec';
    m2 * seg2_a_com' == f2' - f3' + m2 * g_vec';
    m3 * seg3_a_com' == f3' - f4' + m3 * g_vec';
    ];

f_var = [f1, f2, f3];

[A, B] = equationsToMatrix( f_eq, f_var );

f_solved = inv(A) * B;

f1 = f_solved(1:3)';
f2 = f_solved(4:6)';
f3 = f_solved(7:9)';

RJT4_ = [0, 0, 0];

% equations about tau
% % tau_eq = [
% %     I1_global * alpha1_global' + cross( omega1', I1_global * omega1') ...
% %         == RJT1_' - RJT2_' + cross(             - seg1_com, f0' ) + cross( seg1_bottom - seg1_com, -f1' );
% %     I2_global * alpha2_global' + cross( omega2', I2_global * omega2') ...
% %         == RJT2_' - RJT3_' + cross( seg1_bottom - seg2_com, f1' ) + cross( seg2_bottom - seg2_com, -f2' );
% %     ];

% 0 = tau_eq_alpha + tau_eq_non_alpha_V + tau_eq_non_alpha_RJT
tau_eq_alpha = [
    -I1_global * alpha1' + cross( seg1_top_pre_' - seg1_com', f1' ) + cross( seg1_bottom' - seg1_com', -f2' );
    -I2_global * alpha2' + cross( seg1_bottom'   - seg2_com', f2' ) + cross( seg2_bottom' - seg2_com', -f3' );
    -I3_global * alpha3' + cross( seg2_bottom'   - seg3_com', f3' ) + cross( seg3_bottom' - seg3_com', -f4' );
    ];

tau_eq_non_alpha_V = [
    - cross( omega1', I1_global * omega1');
    - cross( omega2', I2_global * omega2');
    - cross( omega3', I3_global * omega3');
    ];

tau_eq_non_alpha_RJT = [
    RJT1_' - RJT2_';
    RJT2_' - RJT3_';
    RJT3_' - RJT4_';
    ];

tau_eq_alpha = subs( tau_eq_alpha, syms_Replaced, syms_Replacing );
tau_eq_non_alpha_V = subs( tau_eq_non_alpha_V, syms_Replaced, syms_Replacing );
tau_eq_non_alpha_RJT = subs( tau_eq_non_alpha_RJT, syms_Replaced, syms_Replacing );

addpath("..\")
[Coeffs_alpha, Terms_alpha] = coeffs_Vector( tau_eq_alpha, [alpha1_, alpha2_, alpha3_, g] );
rmpath("..\")

I_hirashima = -Coeffs_alpha(:, 1:9);
G_hirashima = Coeffs_alpha(:, 10);
V_hirashima = Coeffs_alpha(:, 11) + tau_eq_non_alpha_V;

job = createJob(c);
createTask(job, @matlabFunction, 1, ...
    { ...
        I_hirashima, ...
        'file', 'find_I_hirashima.m', ...
        'outputs', {'I_hirashima'}, ...
        'Optimize', false ...
    });
submit(job)
job.Tasks

job = createJob(c);
createTask(job, @matlabFunction, 1, ...
    { ...
        G_hirashima, ...
        'file', 'find_G_hirashima.m', ...
        'outputs', {'G_hirashima'}, ...
        'Optimize', false ...
    });
submit(job)
job.Tasks

job = createJob(c);
createTask(job, @matlabFunction, 1, ...
    { ...
        V_hirashima, ...
        'file', 'find_V_hirashima.m', ...
        'outputs', {'V_hirashima'}, ...
        'Optimize', false ...
    });
submit(job)
job.Tasks

%% output f

f1 = simplify_subs_pre( f1 );
job = createJob(c);
createTask(job, @matlabFunction, 1, ...
    { ...
        f1, ...
        'file', 'find_f1.m', ...
        'outputs', {'f1'}, ...
        'Optimize', false ...
    });
submit(job)
job.Tasks

f2 = simplify_subs_pre( f2 );
job = createJob(c);
createTask(job, @matlabFunction, 1, ...
    { ...
        f2, ...
        'file', 'find_f2.m', ...
        'outputs', {'f2'}, ...
        'Optimize', false ...
    });
submit(job)
job.Tasks

f3 = simplify_subs_pre( f3 );
job = createJob(c);
createTask(job, @matlabFunction, 1, ...
    { ...
        f3, ...
        'file', 'find_f3.m', ...
        'outputs', {'f3'}, ...
        'Optimize', false ...
    });
submit(job)
job.Tasks





























