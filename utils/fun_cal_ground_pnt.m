function [pos] = fun_cal_ground_pnt(bs_vec,loc_sate,dh)
%FUN_CAL_GROUND_PNT 计算惯性系位置函数
%   bs_vec:     目标惯性系视线
%   loc_sate：  卫星惯性系位置
%   dh:         目标高程
a=6378137/1e3;
b=6356752.3142/1e3;
a = a + dh;
b = b + dh;
to_sqrt__ = a^4*bs_vec(3)^2 + a^2*b^2*bs_vec(1)^2 + a^2*b^2*bs_vec(2)^2 - a^2*bs_vec(1)^2*loc_sate(3)^2 + 2*a^2*bs_vec(1)*bs_vec(3)*loc_sate(1)*loc_sate(3) - a^2*bs_vec(2)^2*loc_sate(3)^2 + 2*a^2*bs_vec(2)*bs_vec(3)*loc_sate(2)*loc_sate(3) - a^2*bs_vec(3)^2*loc_sate(1)^2 - a^2*bs_vec(3)^2*loc_sate(2)^2 - b^2*bs_vec(1)^2*loc_sate(2)^2 + 2*b^2*bs_vec(1)*bs_vec(2)*loc_sate(1)*loc_sate(2) - b^2*bs_vec(2)^2*loc_sate(1)^2;
if to_sqrt__ > 0
    sqrt__ = sqrt(to_sqrt__);
    x_num=[  (bs_vec(3)*loc_sate(1) - bs_vec(1)*loc_sate(3) + (bs_vec(1)*(b^2*bs_vec(1)^2*loc_sate(3) + b^2*bs_vec(2)^2*loc_sate(3) + b*bs_vec(3)*sqrt__ - b^2*bs_vec(1)*bs_vec(3)*loc_sate(1) - b^2*bs_vec(2)*bs_vec(3)*loc_sate(2)))/(a^2*bs_vec(3)^2 + b^2*bs_vec(1)^2 + b^2*bs_vec(2)^2))/bs_vec(3);
        -(bs_vec(1)*loc_sate(3) - bs_vec(3)*loc_sate(1) + (bs_vec(1)*(b*bs_vec(3)*sqrt__ - b^2*bs_vec(2)^2*loc_sate(3) - b^2*bs_vec(1)^2*loc_sate(3) + b^2*bs_vec(1)*bs_vec(3)*loc_sate(1) + b^2*bs_vec(2)*bs_vec(3)*loc_sate(2)))/(a^2*bs_vec(3)^2 + b^2*bs_vec(1)^2 + b^2*bs_vec(2)^2))/bs_vec(3)];
    y_num=[  (bs_vec(3)*loc_sate(2) - bs_vec(2)*loc_sate(3) + (bs_vec(2)*(b^2*bs_vec(1)^2*loc_sate(3) + b^2*bs_vec(2)^2*loc_sate(3) + b*bs_vec(3)*sqrt__ - b^2*bs_vec(1)*bs_vec(3)*loc_sate(1) - b^2*bs_vec(2)*bs_vec(3)*loc_sate(2)))/(a^2*bs_vec(3)^2 + b^2*bs_vec(1)^2 + b^2*bs_vec(2)^2))/bs_vec(3);
        -(bs_vec(2)*loc_sate(3) - bs_vec(3)*loc_sate(2) + (bs_vec(2)*(b*bs_vec(3)*sqrt__ - b^2*bs_vec(2)^2*loc_sate(3) - b^2*bs_vec(1)^2*loc_sate(3) + b^2*bs_vec(1)*bs_vec(3)*loc_sate(1) + b^2*bs_vec(2)*bs_vec(3)*loc_sate(2)))/(a^2*bs_vec(3)^2 + b^2*bs_vec(1)^2 + b^2*bs_vec(2)^2))/bs_vec(3)];
    z_num=[  (b^2*bs_vec(1)^2*loc_sate(3) + b^2*bs_vec(2)^2*loc_sate(3) + b*bs_vec(3)*sqrt__ - b^2*bs_vec(1)*bs_vec(3)*loc_sate(1) - b^2*bs_vec(2)*bs_vec(3)*loc_sate(2))/(a^2*bs_vec(3)^2 + b^2*bs_vec(1)^2 + b^2*bs_vec(2)^2);
        -(b*bs_vec(3)*sqrt__ - b^2*bs_vec(2)^2*loc_sate(3) - b^2*bs_vec(1)^2*loc_sate(3) + b^2*bs_vec(1)*bs_vec(3)*loc_sate(1) + b^2*bs_vec(2)*bs_vec(3)*loc_sate(2))/(a^2*bs_vec(3)^2 + b^2*bs_vec(1)^2 + b^2*bs_vec(2)^2)];

    if(norm([x_num(1),y_num(1),z_num(1)]-loc_sate) < norm([x_num(2),y_num(2),z_num(2)]-loc_sate))
        pos = [x_num(1),y_num(1),z_num(1)];
    else
        pos = [x_num(2),y_num(2),z_num(2)];
    end
else
    pos = [NaN,NaN,NaN];
end

end

