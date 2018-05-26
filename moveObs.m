% moveObs  Moves all files to their respective folders.
%          Folder naming format : [File Type]_[hour]_[minute]_[second]
% Version: 2014-328
% Usage:   moveObs(fileType)
% Input:   fileType     - File type to be moved
% Output:   
% Copyright (c) 2014, Garrett Seepersad
% All rights reserved.
% Email: Garrett@Seepersad.org
function moveObs(fileType)

if  strcmp(fileType,'d')
    folderName = 'obs';
    filExt = 'o';
end

if  strcmp(fileType,'n')
    folderName = 'nav';
    filExt = 'n';
end
if  strcmp(fileType,'s')
    folderName = 'teq';
    filExt = 's';
end
if  strcmp(fileType,'g')
    folderName = 'glo';
    filExt = 'g';
end

if  strcmp(fileType,'clk_30s')
    folderName = 'clk';
    filExt = 'clk_30s';
end
if  strcmp(fileType,'clk')
    folderName = 'clk';
    filExt = 'clk';
end

if  strcmp(fileType,'sp3')
    folderName = 'sp3';
    filExt = 'sp3';
end

c=clock;
time= [num2str(c(4)) '_' num2str(c(5)) '_' num2str(fix(c(6)))];

fid =    fopen('move.bat', 'w');
fprintf(fid,'mkdir "%s%s"\n',folderName,time) ;

FileList = dir(['*.*' filExt]);
for i=1:size( FileList,1)
    fprintf(fid,'move %s "%s%s" \n',FileList(i).name, folderName, time) ;
    
    
end

fclose(fid);

system( 'move.bat')
 
% delete('move.bat');
end