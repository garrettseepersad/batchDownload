% getData function handles all the subroutines to retrieve different file
%         types
% Version: 2014-328
% Copyright (c) 2014, Garrett Seepersad
% All rights reserved.
% Email: Garrett@Seepersad.org

function getData (obsTF,navTF,teqTF,gloTF,sp3TF,clkTF,clk30sTF,AC,year,DOY,noOfDays, username,siteList,highRateTF)
 
%% Start FTP connection
ftpServer=startServer(username,highRateTF);
%% Observation file

if  (obsTF ==1 )
    fileType    = 'd';  
    downloadRecFiles(year,noOfDays,DOY,siteList,fileType,ftpServer,highRateTF)
    unZipObs
    uncompressObs
    moveObs(fileType)
end

%% GPS Navigation file
if  (navTF ==1 )
    fileType    = 'n';  
    downloadRecFiles(year,noOfDays,DOY,siteList,fileType,ftpServer,highRateTF)
    unZipObs
    moveObs(fileType)
end

%% TEQC status file
if  (teqTF ==1 )
    fileType    = 's';  
    downloadRecFiles(year,noOfDays,DOY,siteList,fileType,ftpServer,highRateTF)
    unZipObs
    moveObs(fileType)
end

%% Glonass navigation file
if  (gloTF ==1 )
    fileType    = 'g'; 
    downloadRecFiles(year,noOfDays,DOY,siteList,fileType,ftpServer,highRateTF)
    unZipObs
    moveObs(fileType)
end
%% SP3 orbit file
if  (sp3TF ==1 )
    fileType = 'sp3';  
    downloadSatFiles  (year,noOfDays,DOY ,fileType,AC,ftpServer)
    unZipObs
    moveObs(fileType)
end
%% CLK file at 5 min data rate
if  (clkTF ==1 )
    fileType = 'clk'; %
    downloadSatFiles  (year,noOfDays,DOY ,fileType,AC,ftpServer)
    unZipObs
    moveObs(fileType)
end
%% CLK at 30 sec data rate
if  (clk30sTF ==1 )
    fileType = 'clk_30s'; 
    downloadSatFiles  (year,noOfDays,DOY ,fileType,AC,ftpServer)
    unZipObs
    moveObs(fileType)
end
%% End FTP connection
close (ftpServer)

end