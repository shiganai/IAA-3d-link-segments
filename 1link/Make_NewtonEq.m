
% this scripts is based on 'EularAngle_Lagrangian.pdf' in the folder
% read the pdf along with this code.
% assume that the local axes (G' on the pdf) are fixed to the segment
% adn that the global axes (G on the pdf) are fixed to the segment


clear all
tic

define_positions

parallel.defaultClusterProfile('local');
c = parcluster();

syms m1 real
syms g real

syms I1x I1y I1z real

syms RJT1_ [1 3] real


%%
I1 = [
    I1x, 0, 0;
    0, I1y, 0;
    0, 0, I1z;
    ];

%%
fprintf('check alpha rotation, rotate [0,1,0] on segment axes into global ones\n')
simplify_subs_pre( [0, 1, 0] * subs( R, theta1_pre_( [2, 3] ), [0,0] ) )

fprintf('check beta rotation, rotate [0,0,1] on segment axes into global ones\n')
simplify_subs_pre( [0, 0, 1] * subs( R, theta1_pre_( [1, 3] ), [0,0] ) )

fprintf('check gamma rotation, rotate [1,0,0] on segment axes into global ones\n')
simplify_subs_pre( [1, 0, 0] * subs( R, theta1_pre_( [1, 2] ), [0,0] ) )

%% calc Omega on global axes
R = formula(R);
dR = diff(R, t);

% R = subs(R, syms_Replaced, syms_Replacing);
% dR = subs(dR, syms_Replaced, syms_Replacing);

% Omega_global = subs( R' * dR, syms_Replaced, syms_Replacing );
Omega_global = R' * dR;

fprintf('check if the diag of Omega is 0\n')
simplify_subs_pre( diag(Omega_global) )

% assume that Omega = [ 
%     0,          omega_z,    -omega_y;
%     -omega_z,   0,          omega_x;
%     omega_y,    -omega_x,   0;
%     ]
% refer to (22) and (41) 
% *(41) are bit mistaken. dR*R' is not correct
% these omega1_* are on global axes
omega1_x = Omega_global(2, 3);
omega1_y = Omega_global(3, 1);
omega1_z = Omega_global(1, 2);

% define omega1 on global axes
omega1_global = [omega1_x, omega1_y, omega1_z];
alpha1_global = diff( omega1_global, t );

seg1_v_bottom_global = formula( diff(seg1_bottom_global, t) );
seg1_v_com_global = formula( diff(seg1_com_global, t) );
seg1_a_com_global = formula( diff(seg1_v_com_global, t) );

fprintf('check (45)\n')
simplify_subs_pre( (seg1_v_bottom_global - seg1_top_v_)' - cross( omega1_global', (seg1_bottom_global - seg1_top_)') )

%% calc Omega on local axes
% Omega_local = subs( dR * R', syms_Replaced, syms_Replacing );
Omega_local = dR * R';

fprintf('check if the diag of Omega is 0\n')
simplify_subs_pre( diag(Omega_local) )

% assume that Omega = [ 
%     0,          omega_z,    -omega_y;
%     -omega_z,   0,          omega_x;
%     omega_y,    -omega_x,   0;
%     ]
% refer to (53) and (55)
omega1_x = Omega_local(2, 3);
omega1_y = Omega_local(3, 1);
omega1_z = Omega_local(1, 2);

% define omega1 on global axes
omega1_local = [omega1_x, omega1_y, omega1_z];

fprintf('check (65)\n')
simplify_subs_pre( omega1_local' - R*omega1_global' )

%% check hirashima supplementary
% note that the R in hirashima supplementary
% is equal to the R' in EularAngle_Lagrangian.pdf
x = R(1,:); dx = dR(1,:);
y = R(2,:); dy = dR(2,:);
z = R(3,:); dz = dR(3,:);
omega_tmp = dy*z' * x + dz*x' * y + dx*y' * z;

fprintf('check segment angular velocity')
simplify_subs_pre( omega_tmp' - omega1_global' )

ii = x; dii = diff( ii, t );
jj = cross( [0, 0, 1], ii ); djj = diff( jj, t );
kk = cross( ii, jj ); dkk = diff( kk, t );

Omega_tmp = djj*kk' * ii + dkk*ii' * jj + dii*jj' * kk;

fprintf('see if omega1_local is equal to Omega1 of hirashima supp')
simplify_subs_pre( omega1_local' - Omega_tmp' )

fprintf('check (S7)')
simplify_subs_pre( ...
    alpha1_global' - 0 ...
    - alpha1_' ...
    - cross( Omega_tmp', omega1_' ) ...
    )

return

%% define Inertia on global axes
% refer to (10) of tensor_of_inertia_rot.pdf
% note that I' of tensor_of_inertia_rot.pdf is inertia on global axes
% so 
I1_global = R' * I1 * R;

%% define eqations

% f1 works between segment 1 and fixed point
syms f1 [1 3] real
f2 = [0, 0, 0];
g_vec = [0, 0, -g];

% equations about f
f_eq = [
    m1 * seg1_a_com_global' == f1' - f2' + m1 * g_vec';
    ];

f_var = [f1];

[A, B] = equationsToMatrix( f_eq, f_var );

f_solved = inv(A) * B;

f1 = f_solved(1:3)';

RJT2_ = [0, 0, 0];

% equations about tau
% % tau_eq = [
% %     I1_global * alpha1_global' + cross( omega1_global', I1_global * omega1_global') ...
% %         == RJT1_' - RJT2_' + cross(             - seg1_com, f1' ) + cross( seg1_bottom - seg1_com, -f1' );
% %     I2_global * alpha2_global' + cross( omega2_global', I2_global * omega2_global') ...
% %         == RJT2_' - RJT3_' + cross( seg1_bottom - seg2_com, f1' ) + cross( seg2_bottom - seg2_com, -f2' );
% %     ];

% 0 = tau_eq_alpha + tau_eq_non_alpha_V + tau_eq_non_alpha_RJT
tau_eq_alpha = [
    -I1_global * alpha1_global' + cross( seg1_top_pre_' - seg1_com_global', f1' ) + cross( seg1_bottom_global' - seg1_com_global', -f2' );
    ];

tau_eq_non_alpha_V = [
    - cross( omega1_global', I1_global * omega1_global');
    ];

tau_eq_non_alpha_RJT = [
    RJT1_' - RJT2_';
    ];

tau_eq_alpha = subs( tau_eq_alpha, syms_Replaced, syms_Replacing );
tau_eq_non_alpha_V = subs( tau_eq_non_alpha_V, syms_Replaced, syms_Replacing );
tau_eq_non_alpha_RJT = subs( tau_eq_non_alpha_RJT, syms_Replaced, syms_Replacing );

addpath("..\")
[Coeffs_alpha, Terms_alpha] = coeffs_Vector( tau_eq_alpha, [alpha1_, g] );
rmpath("..\")

I_hirashima = -Coeffs_alpha(:, 1:3);
G_hirashima = Coeffs_alpha(:, 4);
V_hirashima = Coeffs_alpha(:, 5) + tau_eq_non_alpha_V;

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


%% make function files for positions
%{
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
%}

























