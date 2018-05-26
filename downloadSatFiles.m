% downloadSatFiles  Downloads satellite orbit and clock information
% Version: 2014-328
% Usage:   downloadSatFiles  (year,noOfDays,DOY, fileType,AC,ftpServer)
% Input:   year     - calendar year (4-digit including century)
%          DOY      - GPS day of yearcalendar day
%          fileType - file type to download
%          AC       - analysis center
%          ftpServer- matlab initialized FTP connection
% Output:   
% Copyright (c) 2014, Garrett Seepersad
% All rights reserved.
% Email: Garrett@Seepersad.org

function downloadSatFiles  (year,noOfDays,DOY, fileType,AC,ftpServer)


fid         = fopen('DownloadError.log','a');
cd(ftpServer, '/pub/gps/products/' );
currentTime = date;
fprintf(fid,'----------------------------------------\n') ;
fprintf(fid,'%s - %s \n',currentTime,fileType) ;

for days =1:noOfDays
    dataDOY = (DOY+days-1);
    JD = doy2jd(year,dataDOY);
    GPSweek =  jd2gps(JD);
    DOW    =jd2dow(JD)-1;
    cd(ftpServer, num2str(GPSweek) );
    FileChar     = [ AC num2str(GPSweek) num2str(DOW) '.' fileType '.Z'  ] ;
    try
        mget(ftpServer, FileChar  )
    catch
        disp(['File : ' FileChar ' not found']);
        fprintf(fid,'missing %s\n',FileChar) ;
    end
    cd(ftpServer,'..');
end
fclose(fid);
end