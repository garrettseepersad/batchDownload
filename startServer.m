% ftpServer  Starts FTP connection. Server defaults to CDDIS
% Version: 2014-328
% Usage:   startServer(username) 
% Input:   username - email address to access FTP server 
% Copyright (c) 2014, Garrett Seepersad
% All rights reserved.
% Email: Garrett@Seepersad.org

function [ftpServer] = startServer(username,highRateTF) 

host        = 'cddis.gsfc.nasa.gov';
password    = 'anonymous'; 

if (highRateTF==1)
    host        = 'garner.ucsd.edu';
password    = 'anonymous'; 
end
ftpServer   = ftp(host,password,username);

end