function rcvrStates = body2ecef(refLL,states)

DCM_b_n = genDCM('rad',[states(12) states(11) states(10)],[3 2 1]);

pos_NED = DCM_b_n*states(7:9)';
vel_NED = DCM_b_n*states(1:3)';

[x,y,z] = ned2ecef(pos_NED(1),pos_NED(2),pos_NED(3),refLL(1),refLL(2),0,wgs84Ellipsoid("meter"),"degrees");
[u,v,w] = ned2ecefv(vel_NED(1),vel_NED(2),vel_NED(3),refLL(1),refLL(2),"degrees");


rcvrStates = [x,u,y,v,z,w,0,0];

end