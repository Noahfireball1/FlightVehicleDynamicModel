function p_m = updateCovariance(p_m,L,H,time)

if mod(time,1/50) == 0

    p_m = (eye(size(p_m)) - L*H)*p_m;
else
    p_m = p_m;
end
end

