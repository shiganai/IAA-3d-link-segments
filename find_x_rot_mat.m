function x_rot_mat = find_x_rot_mat(target_rad)
% return 3 x 3 matrix that rotate target_rad along with x axes

x_rot_mat = [
    1,  0,                  0;
    0,  cos(target_rad),    sin(target_rad);
    0,  -sin(target_rad),   cos(target_rad); 
    ];

end

