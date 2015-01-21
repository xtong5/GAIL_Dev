function save_mat(subdir, filename, varargin)
% SAVE_MAT: Save data to a MAT file in a subdirectory in 'OutputFiles'
% 
% Inputs:
%   subdir          name of subdirectory 
%   filename        filename of mat file
%   variable_names  names of variables in work space to save
%   
% Example:
%   save_mat('ConesPaperOutput','ConesPaperFunAppxTest', ...
%   'tauvec','pini','pfin','succnowarn', 'succwarn','failnowarn','failwarn');

[GAILPATH,~,PATHNAMESEPARATOR] = GAILstart(0);
filename = strcat(GAILPATH,'OutputFiles',PATHNAMESEPARATOR,...
    subdir, PATHNAMESEPARATOR', filename,'-',...
    datestr(now,'dd-mmm-yyyy-HH-MM-SS'),'.mat');
save(filename, varargin)