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
inputFile = uigetfile({'*.yaml'},'Select Input File',configDir);
inputFilePath = append(configDir,inputFile);

%% Initializing Simulation
initializeSim;
%% Starting Simulation
simText;

run = sim("DA40_Flight_Model.slx");

% Converting Body States to ECEF
for i = 1:length(run.tout)
    rcvrStates(:,i) = body2ecef(refLLA(1:2),run.states(i,:));
    controls(:,i) = run.controls(i,:);
end

save(append(outputDir,sprintf('rcvr_%s',inputFile(1:end-5)),'.mat'),"controls","rcvrStates")

%% Plotting
geoplot(run.trueLAT,run.trueLONG)
