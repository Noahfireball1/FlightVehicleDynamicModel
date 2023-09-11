function R = formR(variance)
count = 1;
Rtmp = [];
varCarr = variance(length(variance)/2:end);
varPsr = variance(1:length(variance)/2);

for i = 1:2:length(obj.y)

    Rtmp = [Rtmp varCarr(count) varPsr(count)];

    count = count + 1;
end

R = diag(Rtmp);
end

