## @knitr Fig2All
rm(list=ls())

windows(height=7.3,width=14)
#par(xpd=NA,las=1,mfcol=c(3,1),oma=c(rep(.5,4)),mar=c(5,4,2,2))
par(xpd=NA, mfcol=c(3,1),mar=c(.5,3,1,2),pin=c(6,1.25),oma=c(rep(.2,4)))
#par(mar=c(3,6,4,2.75))
par(mar=c(3,6,4,2.75))

jardata=read.csv("jar.csv",header=TRUE)
# extract the probe values
jarTCindex=which(jardata$TCProbes>=0)
jarTCindexI=which(jardata$TCProbes[jarTCindex]==jardata$TC[jarTCindex-1])
jarTCindexC=which(jardata$TCProbes[jarTCindex]>jardata$TC[jarTCindex-1])

xx=c(rep("C",length(jarTCindexC)),rep("I",length(jarTCindexI)))
xxx=c(jarTCindexC,jarTCindexI)
sortxxx=order(xxx)
jarTCcum=data.frame(cumval=sortxxx,corr=xx[sortxxx])
cumall=0
for (i in seq(1:length(jarTCcum$cumval))) {
  if (jarTCcum$corr[i]=="C") cumall=cumall+1
  jarTCcum$cumval[i]=cumall
}

# pullvals=seq(1,length(jardata$TC))
# symbol size for each set of data
symsizRA=.9
symsizTC=.9
# characters for TC/RA
# unfilled circles
pchTCC <- pchTCI <- 1
# filled circles
pchRAI <- pchRAC <- 19

# task completed
plot(jardata$TCxval[jarTCindex[jarTCindexI]]+.25,jarTCcum$cumval[which(jarTCcum$corr=="I")],
     pch=pchTCI,cex=symsizTC,ylim=c(0,50),xlim=c(1,length(jardata$TCxval)),
     xlab='',axes=FALSE,ann=FALSE)
axis(2,at=seq(0,50,10),las=1,cex.axis=.6,line=-1,lwd=1.1,
     labels=c("0","10","20","30","40","50"))
axis(1,at=c(1,seq(10,210,10)), cex.axis=.6,tcl=-.3,padj=-2,lwd=1.1,
     labels=c("1",as.character(seq(10,210,10))))
# y axis label
text(-15,25,"Cumulative Probe Correct",cex=.85,adj=c(0.5,0),srt=90)

points(jardata$TCxval[jarTCindex[jarTCindexC]]+.25,
       jarTCcum$cumval[which(jarTCcum$corr=="C")],
       pch=pchTCC,cex=symsizTC)

jarRAindex=which(jardata$RAProbes>=0)
jarRAindexI=which(jardata$RAProbes[jarRAindex]==jardata$RA[jarRAindex-1])
jarRAindexC=which(jardata$RAProbes[jarRAindex]>jardata$RA[jarRAindex-1])
xx=c(rep("C",length(jarRAindexC)),rep("I",length(jarRAindexI)))
xxx=c(jarRAindexC,jarRAindexI)
sortxxx=order(xxx)
jarRAcum=data.frame(cumval=sortxxx,corr=xx[sortxxx])
cumall=0
for (i in seq(1:length(jarRAcum$cumval))) {
  if (jarRAcum$corr[i]=="C") cumall=cumall+1
  jarRAcum$cumval[i]=cumall
}
points(jardata$RAxval[jarRAindex[which(jarRAcum$corr=="I")]]-.25,jarRAcum$cumval[which(jarRAcum$corr=="I")],
       pch=pchRAI, cex=symsizRA)
points(jardata$RAxval[jarRAindex[which(jarRAcum$corr=="C")]]-.25,jarRAcum$cumval[which(jarRAcum$corr=="C")],
       pch=pchRAC, cex=symsizRA)

# finish off the axis corner
lines(c(-4.37,-4.37),c(-2.03,0),type='l',lwd=1.1)
lines(c(-4.37,1),c(-2.03,-2.03),type='l',lwd=1.1)

# lines
# solid
# broken lines
setlwd=1.5

# first "L"
lines(c(5,5),c(-15,50),type='l',lwd=setlwd)
lines(c(5,58.5),c(-15,-15),type='l',lwd=setlwd)
lines(c(58.5,58.5),c(-15,-25),type='l',lwd=setlwd)

# second "L"
lines(c(58.5,58.5),c(-10,50),type='l',lwd=setlwd)
lines(c(58.5,83.5),c(-10,-10),type='l',lwd=setlwd)
lines(c(83.5,83.5),c(-10,-25),type='l',lwd=setlwd)
arrows(149,32,149,24,length=.04,angle=20,code=2)
text(149,35,"Troubleshoot",adj=c(0.5,0),cex=.75)

# main label
text(190,50,"Open Jar",cex=1.3)

# Label Phase I
text(8,50,"Phase I: Teach \"Help\"",cex=.7,adj=c(0,0),font=2)

# Label Phase II
text(60,50,"Phase II: Teach Task completion",cex=.7,adj=c(0,0),font=2)

legend(100,55, c("Task Completion Probes",
                 "Request Assistance Probes"),
       pch=c(pchTCC,pchRAC),cex=.9)

# graph2
source("JER_Fig2b.r")

# graph3
source("JER_Fig2c.r")
