function [rotm] = fun_ypr2rotm(y,p,r,mod)
%FUN_YPR2ROTM 将YPR转换为旋转矩阵
%   输入：yaw pith roll mod
%   输出：旋转矩阵，原坐标系×输出矩阵 = 旋转后坐标系
%                  旋转矩阵×原坐标系坐标 = 旋转后坐标系坐标

% roll
Rx = [1 0 0;
    0 cosd(r) sind(r);
    0 -sind(r) cosd(r)];

% pitch
Ry = [cosd(p) 0 -sind(p);
    0 1 0;
    sind(p) 0 cosd(p)];

% yaw
Rz = [cosd(y) sind(y) 0;
    -sind(y) cosd(y) 0;
    0 0 1];


if nargin == 3
    rotm = Rz*Ry*Rx;
else
    if mod == 321
        rotm = Rz*Ry*Rx;
    elseif mod == 123
        rotm = Rx*Ry*Rz;
    end
end
end

