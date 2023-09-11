function [psr,carrFreq,unitVectors] = calcPsr(usrStates,satX,satY,satZ,satU,satV,satW)

dx = (satX - usrStates(1));
dy = (satY - usrStates(2));
dz = (satZ - usrStates(3));
usrVel = usrStates(4:6);
svVel = [satU;satV;satW];

range = sqrt(dx.^2 + dy.^2 + dz.^2);

psr = range;
unitVectors = [dx./range; dy./range; dz./range];

for i = 1:length(psr)

    carrFreq(i) =  1575.42 - (299792458/1575.42e6)*(svVel(:,i)'*unitVectors(:,i)) + (299792458/1575.42e6)*(usrVel'*unitVectors(:,i));

end

% Discard any satellites with a negative elevation
LLA = ecef2lla(usrStates(1:3)');
[~,el,~] = ecef2aer(satX,satY,satZ,LLA(1),LLA(2),LLA(3),wgs84Ellipsoid("meter"));

psr = psr(1,el > 0);
carrFreq = carrFreq(1,el > 0);
unitVectors = unitVectors(:,el > 0);

end

