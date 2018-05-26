% uncompressObs  Uncompresses observation .d files to .o
% Version: 2014-328
% Usage:   
% Input:
% Copyright (c) 2014, Garrett Seepersad
% All rights reserved.
% Email: Garrett@Seepersad.org

function uncompressObs

fid =    fopen('uncompressObs.bat', 'w');
FileList = dir('*d');
for i=1:size( FileList,1)
    fprintf(fid,'crx2rnx -f %s  \n',FileList(i).name) ;
    fprintf(fid,'del %s\n',FileList(i).name) ;
end
system( 'uncompressObs.bat')
fclose(fid);
% delete('uncompressObs.bat');
end
