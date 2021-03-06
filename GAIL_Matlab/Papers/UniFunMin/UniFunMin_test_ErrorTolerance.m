%This script describes the Experiment 1:
%  Bump test functions with epsilon=10^(-8) & delta=0.
% 
%  Generates Table 3.1 in the thesis
%
%  Xin Tong, A Guaranteed, Adaptive, Automatic Algorithm for Univatiate
%  Function Minimization, July 2014.

%% Garbage collection and initialization
clearvars -except testCase  %clear all variables except testCase
close all
tstart = tic;

%% Program parameters
in_param.abstol = 10^(-8); %error tolerance
in_param.TolX = 0; %X tolerance
in_param.nmax = 10^7; %cost budget

%% Simulation parameters
nrep = 10000; %number of times to test used in the thesis
if (nrep >= 1000)
    warning(' Need more than one hour to replicate the result! ')
    warning('off','MATLAB:funmin_g:exceedbudget');
    warning('off','MATLAB:funmin_g:peaky');
end;
a = 10.^(-4+3*rand(nrep,1));
z = 2.*a+(1-4*a).*rand(nrep,1);
x0 = z-2*a;
x1 = z+2*a;
tauvec = [11 101 1001]; %cone condition tau
ntau = length(tauvec);
ratio = 1./a;
gnorm = 1./a;
exactmin = -1;

%% Simulation
ntrapmat = zeros(nrep,ntau);
trueerrormat = ntrapmat;
truesolumat = ntrapmat;
newtaumat = ntrapmat;
tauchangemat = ntrapmat;
exceedmat = ntrapmat;

for i=1:ntau;
    for j=1:nrep;
        f = @(x) 0.5/a(j)^2*(-4*a(j)^2-(x-z(j)).^2-(x-z(j)-a(j)).*...
            abs(x-z(j)-a(j))+(x-z(j)+a(j)).*abs(x-z(j)+a(j))).*...
            (x>=z(j)-2*a(j)).*(x<=z(j)+2*a(j)); %test function
        in_param.nlo = (tauvec(i)+1)/2+1;
        in_param.nhi = in_param.nlo;
        [fmin,out_param] = funmin_g(f,in_param);
        ntrapmat(j,i) = out_param.npoints;
        newtaumat(j,i) = out_param.tau;
        estmin = fmin;
        trueerrormat(j,i) = abs(estmin-exactmin);
        tauchangemat(j,i) = out_param.tauchange;
        exceedmat(j,i) = out_param.exceedbudget;
    end
end

probinit = mean(repmat(ratio,1,ntau)<=repmat(tauvec,nrep,1),1); 
probfinl = mean(repmat(ratio,1,ntau)<=newtaumat,1); 
succnowarn = mean((trueerrormat<=in_param.abstol)&(~exceedmat),1); 
succwarn = mean((trueerrormat<=in_param.abstol)&(exceedmat),1);    
failnowarn = mean((trueerrormat>in_param.abstol)&(~exceedmat),1);  
failwarn = mean((trueerrormat>in_param.abstol)&(exceedmat),1);

%% Output the table
% To just re-display the output, load the .mat file and run this section
% only
display(' ')
display('        Probability    Success   Success   Failure  Failure')
display(' tau      In Cone    No Warning  Warning No Warning Warning')
for i=1:ntau
    display(sprintf(['%5.0f %5.2f%%->%5.2f%% %7.2f%%' ...
        '%10.2f%% %7.2f%% %7.2f%% '],...
        [tauvec(i) 100*[probinit(i) probfinl(i) succnowarn(i) ...
        succwarn(i) failnowarn(i) failwarn(i)]])) 
end

 
%% Save Output
[GAILPATH,~,PATHNAMESEPARATOR] = GAILstart(0);
path = strcat(GAILPATH,'OutputFiles' , PATHNAMESEPARATOR);
filename = strcat(GAILPATH,'OutputFiles',PATHNAMESEPARATOR,...
                  'UniFunMinOutput',PATHNAMESEPARATOR',...
                  'ErrorToleranceTest-',...
                  datestr(now,'dd-mmm-yyyy-HH-MM-SS'),'.mat');
save(filename)

toc(tstart)

%% The following output was obtained on 2014-May
%        Probability    Success   Success   Failure  Failure
%  tau      In Cone    No Warning  Warning No Warning Warning
%    11  1.28%->21.22%   21.22%      0.00%   78.78%    0.00% 
%   101 34.02%->53.20%   53.18%      0.02%   46.79%    0.01% 
%  1001 67.04%->85.79%   81.20%      2.59%   14.19%    2.02% 
% Elapsed time is 4383.064010 seconds.
