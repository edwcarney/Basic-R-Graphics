pantsdata=read.csv("pants.csv",header=TRUE)
pantsdata$TC[47]=2
pantsdata$TC[48]=2
pantsdata$RA[47]=10
pantsdata$RA[48]=10

pantsTCindex=which(pantsdata$TCProbes>=0)
pantsTCindexI=which(pantsdata$TCProbes[pantsTCindex]==pantsdata$TC[pantsTCindex-1])
pantsTCindexC=which(pantsdata$TCProbes[pantsTCindex]>pantsdata$TC[pantsTCindex-1])

xx=c(rep("C",length(pantsTCindexC)),rep("I",length(pantsTCindexI)))
xxx=c(pantsTCindexC,pantsTCindexI)
sortxxx=order(xxx)
pantsTCcum=data.frame(cumval=sortxxx,corr=xx[sortxxx])
cumall=0
for (i in seq(1:length(pantsTCcum$cumval))) {
    if (pantsTCcum$corr[i]=="C") cumall=cumall+1
    pantsTCcum$cumval[i]=cumall
}
par(mar=c(4,6,3,2.75))

plot(pantsdata$TCxval[pantsTCindex[pantsTCindexI]]+.25,
pantsTCcum$cumval[which(pantsTCcum$corr=="I")],
  pch=pchTCI,cex=symsizTC,ylim=c(0,50),xlim=c(1,length(jardata$TCxval)),
  xlab='',axes=FALSE,ann=FALSE)
axis(2,at=seq(0,50,10),las=1,cex.axis=.6,line=-1,lwd=1.1,
    labels=c("0","10","20","30","40","50"))
axis(1,at=c(1,seq(10,210,10)), cex.axis=.6,tcl=-.3,padj=-2,lwd=1,
   labels=c("1","10","20","30","40","50","60",
    "70","80","90","100","110","120",
    "130","140","150","160","170","180","190","200","210"))
text(-15,25,"Cumulative Probe Correct",cex=.85,adj=c(0.5,0),srt=90)
points(pantsdata$TCxval[pantsTCindex[pantsTCindexC]]+.25,
pantsTCcum$cumval[which(pantsTCcum$corr=="C")],
   pch=pchTCC,cex=symsizTC)

pantsRAindex=which(pantsdata$RAProbes>=0)
pantsRAindexI=which(pantsdata$RAProbes[pantsRAindex]==pantsdata$RA[pantsRAindex-1])
pantsRAindexC=which(pantsdata$RAProbes[pantsRAindex]>pantsdata$RA[pantsRAindex-1])
xx=c(rep("C",length(pantsRAindexC)),rep("I",length(pantsRAindexI)))
xxx=c(pantsRAindexC,pantsRAindexI)
sortxxx=order(xxx)
pantsRAcum=data.frame(cumval=sortxxx,corr=xx[sortxxx])
cumall=0
for (i in seq(1:length(pantsRAcum$cumval))) {
    if (pantsRAcum$corr[i]=="C") cumall=cumall+1
    pantsRAcum$cumval[i]=cumall
}
points(pantsdata$RAxval[pantsRAindex[which(pantsRAcum$corr=="I")]]-.25,
pantsRAcum$cumval[which(pantsRAcum$corr=="I")],
   pch=pchRAI, cex=symsizRA)
points(pantsdata$RAxval[pantsRAindex[which(pantsRAcum$corr=="C")]]-.25,
pantsRAcum$cumval[which(pantsRAcum$corr=="C")],
   pch=pchRAC, cex=symsizRA)

# finish off the axis corner
lines(c(-4.37,-4.37),c(-2.03,0),type='l',lwd=1.1)
lines(c(-4.37,1),c(-2.03,-2.03),type='l',lwd=1.1)

# lines
# solid
# broken lines
setlwd=1.5
#lines(c(124.5,124.5),c(-2,45),type='l',lty=2)
#lines(c(163.5,163.5),c(-2,45),type='l',lty=2)
#lines(c(191.5,191.5),c(-2,45),type='l',lty=2)

# first "L"
lines(c(97.5,97.5),c(0,65),type='l',lwd=setlwd)

# second "L"
lines(c(136.5,136.5),c(0,65),type='l',lwd=setlwd)

# main label
text(1,10,"Unfasten Pants",adj=c(0,0),cex=1.3)

# Label Mass teaching
text(137,23,"Mass teaching opp.\noff body",cex=.7,adj=c(0,1))
arrows(138,15,138,8,length=.04,angle=20,code=2)

# Label Phase I
text(99,50,"Phase I",cex=.7,adj=c(0,0),font=2)

# Label Phase II
text(142,50,"Phase II",cex=.7,adj=c(0,0),font=2)

# reminder
text(165,42,"Verbal reminder\n\"You need to try.\"",cex=.7,adj=c(0,1))
arrows(169,33,169,15,length=.04,angle=20,code=2)
arrows(169,33,170,15,length=.04,angle=20,code=2)

text(105,-13,"Teaching Opportunities",adj=c(.5,0),cex=.9)


