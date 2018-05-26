% main  Runs the different sub-routines to download requested receiver
%       and satellite files for data processing. Script was designed to
%       function only using 'cddis.gsfc.nasa.gov' FTP server as filing
%       structure varies for different AC storage centers.
% Version: 2014-328
% Usage:   
% Input:   year     - calendar year (4-digit including century)
%          DOY      - GPS day of yearcalendar day
%          noOfDays - number of days data is required
%          username - email address to access FTP server
%          siteList - list of reference stations
% Output:  DownloadError - Log file listing all sites information was not available for
% Copyright (c) 2014, Garrett Seepersad
% All rights reserved.
% Email: Garrett@Seepersad.org
%% Prepare workspace
clc;
clear all;
fclose all;

addpath(genpath('geodetic295/geodetic/'));

%% Input data
siteList    = importdata ('SiteList.csv');

year        = 2014;
DOY         = 250;
noOfDays    = 1;
username    = 'User@Server.com';

% 1= Download
% 0= Do not download

obsTF       = 0; %Observation file
navTF       = 0; %GPS Navigation file
teqTF       = 0; %TEQC quality file
gloTF       = 0; %GLONASS Navigation file
sp3TF       = 1; %sp3 orbits
clkTF       = 0; %clk at 5 min data rate
clk30sTF    = 1; %clk at 30 sec data rate 
AC          = 'igs'; % Analysis centre producing orbit and clock information
highRateTF  = 0;
getData (obsTF,navTF,teqTF,gloTF,sp3TF,clkTF,clk30sTF,AC,year,DOY,noOfDays, username,siteList,highRateTF)

% Note: weekly status file from the directory isn't downloaded