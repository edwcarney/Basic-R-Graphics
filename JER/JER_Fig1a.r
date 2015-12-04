## @knitr Fig1All
rm(list=ls())
jardata=read.csv("jar.csv",header=TRUE)

#par(xpd=NA, mfcol=c(3,1),oma=c(rep(.5,4)),mar=c(rep(.5,4)))
windows(height=7.3,width=14)
par(xpd=NA, mfcol=c(3,1),oma=c(rep(.2,4)))
par(mar=c(3,6,4,2.75))

# Line 1
# first we plot the Task Completion Opportunities
# no axes--we add our own
plot(jardata$TCxval,jardata$TC,pch=1,ylim=c(-20,120),xlim=c(0,210),cex=.6,
  xlab='Opportunity',
  bty="l",xaxs='i',axes=FALSE,ann=FALSE)
axis(1,at=c(1,seq(10,210,10)), cex.axis=.6,tcl=-.3,padj=-2,
     labels <- c("1",as.character(seq(10,210,10))))
axis(2,at=seq(0,120,20),las=1,cex.axis=.6,
     labels=as.character(seq(0,120,20)))
# add a y axis label with a rotation of 90 degrees
text(-8,60,"Cumulative Correct",cex=.85,adj=c(0.5,0),srt=90)

# Line 2
# Now, we plot the requests for assistance
points(jardata$RAxval,jardata$RA,pch=19,cex=.6)

# Probes
# set the size of the bars we intend to plot
cexbars=.6
points(jardata$RAxval,jardata$RAProbes+16,pch='|',cex=cexbars,font=2)

# add the missing axis corner
lines(c(0,0),c(-25.6,0),type='l')
lines(c(0,1),c(-25.6,-25.6),type='l')

# add vertical dashed lines at three locations to indicate
# specific landmarks
setlwd=1.5
lines(c(32.5,32.5),c(-20,125),type='l',lty=2)
lines(c(73.5,73.5),c(-20,125),type='l',lty=2)
lines(c(108.5,108.5),c(-20,125),type='l',lty=2)

# Phase I
# Lines indicating phases cross the boundaries of the graph
# each graph is done in a separate space, so we have to add these
# before moving on to the next
lines(c(5.5,5.5),c(-65,125),type='l',lwd=setlwd)
lines(c(5.5,58.5),c(-65,-65),type='l',lwd=setlwd)
lines(c(58.5,58.5),c(-65,-100),type='l',lwd=setlwd)

# Phase II
lines(c(58.5,58.5),c(-55,125),type='l',lwd=setlwd)
lines(c(58.5,83.5),c(-55,-55),type='l',lwd=setlwd)
lines(c(83.5,83.5),c(-55,-100),type='l',lwd=setlwd)

# arrows point where troubleshooting took place
arrows(150,45,150,68,length=.04,angle=20,code=2)
text(150,35,"Troubleshoot",adj=c(0.5,0),cex=.75)


# add the main label
text(190,5,"Open Jar",cex=1.3)

# Label Baseline and add an arrow
text(2,120,"Baseline",cex=.85,adj=c(0,0),srt=270)
arrows(2.4,70,2.4,50,length=.05,angle=60,code=2)

# Label Phase I space
text(8,155,"Phase I: Teach \"Help\"",cex=.7,adj=c(0,1),font=2)
# add the specific labels for the sub-intervals
text(8,135,"RA: Verbal prompt\nTC: HOH",cex=.63,adj=c(0,1))
text(33,135,"RA: Time Delay",cex=.63,adj=c(0,1))

# Label Phase II
text(60,155,"Phase II: Teach Task completion",cex=.7,adj=c(0,1),font=2)
# and sub-intervals
text(60,135,"TC: 1/2 turn lid\nPartial\nPhysical",cex=.63,adj=c(0,1))
text(75,135,"TC: 1/2 turn lid\nTime Delay",cex=.63,adj=c(0,1))
text(110,135,"TC: Full turn lid\nTime Delay",cex=.63,adj=c(0,1))

# add a legend
legend(175,75, c("Request assistance opportunities","Task completion opportunities","Probes"),
    pch=c(19,1,124),cex=.9)


# graph2
source("JER_Fig1b.r")

# graph3
source("JER_Fig1c.r")
