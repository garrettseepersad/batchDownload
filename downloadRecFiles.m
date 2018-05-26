% downloadSatFiles  Downloads satellite orbit and clock information
% Version: 2014-328
% Usage:   downloadRecFiles( year,noOfDays,DOY,siteList,fileType,ftpServer)
% Input:   year     - calendar year (4-digit including century)
%          noOfDays - no of days to download data for
%          DOY      - GPS day of yearcalendar day
%          siteList - list of reference stations data is required
%          fileType - file type to download
%          ftpServer- matlab initialized FTP connection
% Output:
% Copyright (c) 2014, Garrett Seepersad
% All rights reserved.
% Email: Garrett@Seepersad.org

function downloadRecFiles( year,noOfDays,DOY,siteList,fileType,ftpServer,highRateTF)

fid         = fopen('DownloadError.log','a');
yearSt      = num2str(year);
if (highRateTF ==0)
    cd(ftpServer,['/pub/gps/data/daily/' num2str(year)  ]);
    
else
    cd(ftpServer,['/archive/garner/highrate/cache/rinex/' num2str(year)  ]);
end
currentTime = date;
fprintf(fid,'----------------------------------------\n') ;
fprintf(fid,'%s - %s \n',currentTime,fileType) ;

for days =1:noOfDays
    if (highRateTF ==0)
        cd(ftpServer,[sprintf('%03i',(DOY+days-1)) '/' num2str(yearSt(3:4)) fileType]);
    else
        cd(ftpServer,[sprintf('%03i',(DOY+days-1)) '/']);
    end
    for site=1:size(siteList,1)
        File     = {strcat(siteList(site), sprintf('%03i',(DOY+days-1)),'0.', yearSt(3:4), fileType , '.Z')} ;
        FileChar = char(File{1});
        try
            m= mget(ftpServer, FileChar  );
            disp(['File : ' FileChar 'found']);
            fprintf(fid,'downloaded %s\n',FileChar) ;
        catch
            disp(['File : ' FileChar ' not found']);
            fprintf(fid,'missing %s\n',FileChar) ;
        end
    end
    cd(ftpServer,'..');
    if (highRateTF ==0)
    cd(ftpServer,'..');
    end
end
fclose(fid);
end