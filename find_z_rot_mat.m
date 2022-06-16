function z_rot_mat = find_z_rot_mat(target_rad)
% return 3 x 3 matrix that rotate target_rad along with x axes

z_rot_mat = [
    cos(target_rad),    sin(target_rad),    0;
    -sin(target_rad),   cos(target_rad),    0;
    0,                  0,                  1;
    ];

end

