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
inputFile = uigetfile('*.yaml','Select Input File',configDir);
inputFilePath = append(configDir,inputFile);

%% Initializing Simulation
initializeSim;
%% Starting Simulation
simText;

run = sim("DA40_Flight_Model.slx");

%% Plotting
time = (Start_Time:Time_Step:End_Time)';
simPlot(run,time);