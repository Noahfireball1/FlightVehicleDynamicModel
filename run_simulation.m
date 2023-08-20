%% Formatting
clc
clear
close all
format shortg

%% Adding Directories Based on User's Paths
projectRoot = fileparts(which(mfilename));
addpath(genpath(projectRoot))
configDir = append(projectRoot,filesep,'config',filesep);
srcDir = append(projectRoot,filesep,'source',filesep);
waypointsDir = append(projectRoot,filesep,'waypoints',filesep);
outputDir = append(projectRoot,filesep,'output',filesep);

%% Initial Text to Console
initialText;

%% Selecting Configuration File


%% Initializing Simulation
initializeSim;
%% Starting Simulation
simText;


for i = 1:numRuns

currentSeed = randi(1e6,1);

run = sim("DA40_Flight_Model.slx");

time = (Start_Time:Time_Step:End_Time)';
imuTime = (Start_Time:imuTimeStep:End_Time)';

figure
tiledlayout(3,1)
nexttile
hold on
plot(imuTime,run.ACC1(:,1))
plot(imuTime,run.ACC2(:,1))
plot(imuTime,run.ACC3(:,1))
plot(time,run.noiseACC(:,1))

nexttile
hold on
plot(imuTime,run.ACC1(:,2))
plot(imuTime,run.ACC2(:,2))
plot(imuTime,run.ACC3(:,2))
plot(time,run.noiseACC(:,2))

nexttile
hold on
plot(imuTime,run.ACC1(:,3))
plot(imuTime,run.ACC2(:,3))
plot(imuTime,run.ACC3(:,3))
plot(time,run.noiseACC(:,3))

figure
tiledlayout(3,1)
nexttile
hold on
plot(imuTime,run.GYRO1(:,1))
plot(imuTime,run.GYRO2(:,1))
plot(imuTime,run.GYRO3(:,1))
plot(time,run.noiseGYRO(:,1))

nexttile
hold on
plot(imuTime,run.GYRO1(:,2))
plot(imuTime,run.GYRO2(:,2))
plot(imuTime,run.GYRO3(:,2))
plot(time,run.noiseGYRO(:,2))

nexttile
hold on
plot(imuTime,run.GYRO1(:,3))
plot(imuTime,run.GYRO2(:,3))
plot(imuTime,run.GYRO3(:,3))
plot(time,run.noiseGYRO(:,3))

end

%% Plotting




% simPlot(run,time);