%Run TestcubMC on the step function
clear all, close all
format compact

fun.funtype='geomean';
fun.S0=100;
fun.K=100;
fun.T=1;
fun.r=0.03;
param.measure='Gaussian';
param.impyes=false;
param.tol=2e-2;
param.n0=1024;

test.nrep=50;
test.howoftenrep=5;
dimchoice=[1 2 4 8 16 32 64]';
ndim=size(dimchoice,1);
test.randch.dim=dimchoice(randi(ndim,test.nrep,1));
sigmin=0.1;
sigmax=3;
test.randch.sigoverall=sigmin*(sigmax/sigmin).^rand(test.nrep,1);
test.randchoicefun=@randchoiceGeoCall;
%test.whichsample={'iid','iidheavy','Sobol'};
test.whichsample={'iid','iidheavy','Sobol','Sobolheavy'};
TestcubMCDiffSettings(test,fun,param);
