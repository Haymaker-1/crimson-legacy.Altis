
clear
close all
clc

% nTanks per hour
littlebird.fuelConsRate = 3600*(0.991-0.862)/(364-52);
%littlebird.tankVolume
littlebird.nMinutesOnATank = 60*1/littlebird.fuelConsRate


% 40 tph

% fueltruck 0.17

hellcat.fuelConsRate = 3600*(0.998-0.966)/(368-42);
hellcat.nMinutesOnATank = 60*1.0/hellcat.fuelConsRate



