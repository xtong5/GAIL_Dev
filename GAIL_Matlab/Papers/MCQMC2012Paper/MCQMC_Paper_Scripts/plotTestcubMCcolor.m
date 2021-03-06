function plotTestcubMCcolor(plotTest,param)
figure
ntot=length(plotTest.err);
colorscatter=repmat(plotTest.defaultcolor,ntot,1);
if isfield(plotTest,'kurtvec') && isfield(plotTest,'kurtmax')
    smallkurt=plotTest.kurtvec<=plotTest.kurtmax;
    colorscatter(smallkurt,:)=repmat([0 0 1],sum(smallkurt),1);
end
if isfield(plotTest,'exit')
    bigsample=plotTest.exit==1;
    colorscatter(bigsample,:)=repmat([0.65 0.35 0],sum(bigsample),1);
end
erraug=[plotTest.errlowlimit; sort(plotTest.err); plotTest.errhilimit];
timeaug=[plotTest.timelowlimit; sort(plotTest.time); plotTest.timehilimit];
probaug=[0; ((0:ntot-1)'+1/2)/ntot; 1];
scatter(plotTest.err,plotTest.time,plotTest.ptsize,colorscatter,'.');
ax1 = gca;
set(ax1,'XColor','k','YColor','k',...
    'XLim',[plotTest.errlowlimit plotTest.errhilimit],...
    'YLim',[plotTest.timelowlimit plotTest.timehilimit],...
    'LineWidth',plotTest.linewidth, ...
    'XScale','log','Yscale','log', ...
    'XTick',10.^(plotTest.logerrlo:plotTest.logerrhi))
    %'XGrid','on','YGrid','on','GridLineStyle','--',...
line([param.tol param.tol],[plotTest.timelowlimit plotTest.timehilimit],...
    'color','k','linestyle','--','linewidth',plotTest.linewidth)
wherexsuccess=-0.02+0.75*(log10(param.tol)-plotTest.logerrlo)/...
    (plotTest.logerrhi-plotTest.logerrlo);
wherexfailure=0.28+0.75*(log10(param.tol)-plotTest.logerrlo)/...
    (plotTest.logerrhi-plotTest.logerrlo);
whereysuccess=0.2;
whereyfailure=0.85;
annotation('textarrow',[wherexsuccess,0.15],whereysuccess*[1 1],...
    'String','Success','FontWeight','bold',...
    'linewidth',2);
annotation('textarrow',[wherexfailure,0.88],whereyfailure*[1 1],...
    'String','Failure','FontWeight','bold',...
    'linewidth',2);
xlabel('Error')
ylabel('Time (seconds)')
axes('Position',get(ax1,'Position'),...
           'XAxisLocation','bottom',...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','k','YColor',[0 0.7 0],...
           'XLim',[plotTest.errlowlimit plotTest.errhilimit],...
           'Xscale','log','Xtick',[],...
           'YLim',[0 1],'Linewidth',plotTest.linewidth);
%ylabel('Probability')
line(erraug,probaug,'color',[0 0.7 0],'linewidth',plotTest.linewidth)
axes('Position',get(ax1,'Position'),...
           'XAxisLocation','top',...
           'YAxisLocation','left',...
           'Color','none',...
           'XColor','m','YColor','k',...
           'YLim',[plotTest.timelowlimit plotTest.timehilimit],...
           'Yscale','log','Ytick',[],...
           'XLim',[0 1],'Linewidth',plotTest.linewidth);
%xlabel('Probability')
line(probaug,timeaug,'color','m','linewidth',plotTest.linewidth)
[GAILPATH,~,PATHNAMESEPARATOR] = GAILstart(0);
path = strcat(GAILPATH,'OutputFiles',PATHNAMESEPARATOR,...
    'MCQMCPaperOutput',PATHNAMESEPARATOR,'Results',PATHNAMESEPARATOR);
print('-depsc',[path,...
     plotTest.name '.eps'])
% print('-depsc', ['./Results/' plotTest.name '.eps'])


