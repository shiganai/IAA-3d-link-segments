function y_rot_mat = find_y_rot_mat(target_rad)
% return 3 x 3 matrix that rotate target_rad along with x axes

y_rot_mat = [
    cos(target_rad),    0, -sin(target_rad);
    0,                  1, 0;
    sin(target_rad),    0, cos(target_rad);
    ];

end

