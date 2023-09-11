%% Formatting
clc
clear
close all
format shortg

%% Adding Directories Based on User's Paths
projectRoot = fileparts(which(mfilename));
addpath(genpath(projectRoot))
dir.config = append(projectRoot,filesep,'config',filesep);
dir.src = append(projectRoot,filesep,'source',filesep);
dir.rinex = append(dir.src,'Satellites',filesep,'rinex',filesep);
dir.waypoints = append(projectRoot,filesep,'waypoints',filesep);
dir.output = append(projectRoot,filesep,'output',filesep);

%% Initial Text to Console
initialText;

%% Selecting Configuration File
inputFile = uigetfile({'*.yaml'},'Select Input File',dir.config);
inputFilePath = append(dir.config,inputFile);

%% Initializing Simulation
initializeSim;
%% Starting Simulation
simText;

% Generating Satellite States
satStates = genSatellitesStates(End_Time,date,dir);

run = sim("DA40_Flight_Model.slx");

% Converting Body States to ECEF
for i = 1:length(run.tout)
    rcvrStates(:,i) = body2ecef(refLLA(1:2),run.states(i,:));
    conStates(:,i) = lla2ecef([run.trueLAT(i) run.trueLONG(i) run.trueALT(i)],'WGS84');
    controls(:,i) = run.controls(i,:);
end

save(append(outputDir,sprintf('rcvr_%s',inputFile(1:end-5)),'.mat'),"controls","rcvrStates")

%% Plotting
geoplot(run.trueLAT,run.trueLONG)


