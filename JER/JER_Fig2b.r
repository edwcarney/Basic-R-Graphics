wrapdata=read.csv("wrap.csv",header=TRUE)
wrapTCindex=which(wrapdata$TCProbes>=0)
wrapTCindexI=which(wrapdata$TCProbes[wrapTCindex]==wrapdata$TC[wrapTCindex-1])
wrapTCindexC=which(wrapdata$TCProbes[wrapTCindex]>wrapdata$TC[wrapTCindex-1])

xx=c(rep("C",length(wrapTCindexC)),rep("I",length(wrapTCindexI)))
xxx=c(wrapTCindexC,wrapTCindexI)
sortxxx=order(xxx)
wrapTCcum=data.frame(cumval=sortxxx,corr=xx[sortxxx])
cumall=0
for (i in seq(1:length(wrapTCcum$cumval))) {
    if (wrapTCcum$corr[i]=="C") cumall=cumall+1
    wrapTCcum$cumval[i]=cumall
}
par(mar=c(3.5,6,3.5,2.75))

plot(wrapdata$TCxval[wrapTCindex[wrapTCindexI]]+.25,
wrapTCcum$cumval[which(wrapTCcum$corr=="I")],
  pch=pchTCC,cex=symsizTC,ylim=c(0,50),xlim=c(1,length(jardata$TCxval)),
  xlab='',axes=FALSE,ann=FALSE)
axis(2,at=seq(0,50,10),las=1,cex.axis=.6,line=-1,lwd=1.1,
labels=c("0","10","20","30","40","50"))
axis(1,at=c(1,seq(10,210,10)), cex.axis=.6,tcl=-.3,padj=-2,lwd=1.1,
labels=c("1","10","20","30","40","50","60",
    "70","80","90","100","110","120",
    "130","140","150","160","170","180","190","200","210"))
text(-15,25,"Cumulative Probe Correct",cex=.85,adj=c(0.5,0),srt=90)
points(wrapdata$TCxval[wrapTCindex[wrapTCindexC]]+.25,
wrapTCcum$cumval[which(wrapTCcum$corr=="C")],
pch=pchTCI,cex=symsizTC)

wrapRAindex=which(wrapdata$RAProbes>=0)
wrapRAindexI=which(wrapdata$RAProbes[wrapRAindex]==wrapdata$RA[wrapRAindex-1])
wrapRAindexC=which(wrapdata$RAProbes[wrapRAindex]>wrapdata$RA[wrapRAindex-1])
xx=c(rep("C",length(wrapRAindexC)),rep("I",length(wrapRAindexI)))
xxx=c(wrapRAindexC,wrapRAindexI)
sortxxx=order(xxx)
wrapRAcum=data.frame(cumval=sortxxx,corr=xx[sortxxx])
cumall=0
for (i in seq(1:length(wrapRAcum$cumval))) {
    if (wrapRAcum$corr[i]=="C") cumall=cumall+1
    wrapRAcum$cumval[i]=cumall
}
points(wrapdata$RAxval[wrapRAindex[which(wrapRAcum$corr=="I")]]-.25,
wrapRAcum$cumval[which(wrapRAcum$corr=="I")],
pch=pchRAI, cex=symsizRA)
points(wrapdata$RAxval[wrapRAindex[which(wrapRAcum$corr=="C")]]-.25,
wrapRAcum$cumval[which(wrapRAcum$corr=="C")],
pch=pchRAC, cex=symsizRA)

# finish off the axis corner
lines(c(-4.37,-4.37),c(-2.03,0),type='l',lwd=1.1)
lines(c(-4.37,1),c(-2.03,-2.03),type='l',lwd=1.1)

# lines
# solid
# broken lines
setlwd=1.5

# first "L"
lines(c(58.5,58.5),c(-15,65),type='l',lwd=setlwd)
lines(c(58.5,97.5),c(-15,-15),type='l',lwd=setlwd)
lines(c(97.5,97.5),c(-15,-25),type='l',lwd=setlwd)

# second "L"
lines(c(83.5,83.5),c(-10,65),type='l',lwd=setlwd)
lines(c(83.5,136.5),c(-10,-10),type='l',lwd=setlwd)
lines(c(136.5,136.5),c(-10,-25),type='l',lwd=setlwd)

# main label
text(1,10,"Open Wrapper",adj=c(0,0),cex=1.3)

# Label Phase I
text(61,50,"Phase I",cex=.7,adj=c(0,0),font=2)

# Label Phase II
text(85,50,"Phase II",cex=.7,adj=c(0,0),font=2)

