function rcvrStates = body2ecef(refLL,states)

DCM_b_n = genDCM('rad',flipud(states(10:12)),[3 2 1]);

pos = DCM_b_n*states(7:9);
vel = DCM_b_n*states(1:3);

[x,y,z] = ned2ecef(states(7),states(8),states(9),refLL(1),refLL(2),0,wgs84Ellipsoid("meter"),"degrees");
[u,v,w] = ned2ecefv(states(1),states(2),states(3),refLL(1),refLL(2),"degrees");


rcvrStates = [u,v,w,x,y,z,0,0];

end