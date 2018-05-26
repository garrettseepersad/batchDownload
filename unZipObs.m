% unZipObs  Unzips all files in directory using GZIP
% Version: 2014-328
% Usage:   
% Input:   
% Copyright (c) 2014, Garrett Seepersad
% All rights reserved.
% Email: Garrett@Seepersad.org


function unZipObs
FileList = dir('*.z');
fid =    fopen('unZip.bat', 'w');
for i=1:size( FileList,1)
    fprintf(fid,'gzip -d -f %s \n',FileList(i).name) ;
end
system( 'unZip.bat')
fclose(fid);
% delete('unZip.bat');
end