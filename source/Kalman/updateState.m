function x_m = updateState(Z,L,x_m,time)

if mod(time,1/50) == 0

    x_m = x_m - L*Z;
else
    x_m = x_m;
end
end

