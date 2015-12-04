pantsdata=read.csv("pants.csv",header=TRUE)

# Line 1
# first we plot the Task Completion Opportunities
# no axes--we add our own
plot(pantsdata$TCxval,pantsdata$TC,pch=1,
ylim=c(-20,100),xlim=c(0,210),cex=.6,
ylab='Correct Response',xlab='Opportunity',
bty="l",xaxs='i',axes=FALSE,ann=FALSE)
# x axis
axis(1,at=c(1,seq(10,210,10)), cex.axis=.6,tcl=-.3,padj=-2,
     labels = c("1",as.character(seq(10,210,10))))
# y axis
axis(2,at=seq(0,120,20),las=1,cex.axis=.6,
     labels=as.character(seq(0,120,20)))
# y axis label
text(-8,50,"Cumulative Correct",cex=.85,adj=c(0.5,0),srt=90)

# x axis label serves for all three plots
text(105,-50,"Teaching Opportunities",cex=.85,adj=c(0.5,0))

# Line 2
# requests for assistance
points(pantsdata$RAxval,pantsdata$RA,pch=19,cex=.6)

# Probes
points(pantsdata$RAxval,pantsdata$RAProbes+10,pch=124,cex=cexbars,font=2)

# finish off the axis corner
lines(c(0,0),c(-25,0),type='l')
lines(c(0,1),c(-25,-25),type='l')

# add vertical dashed lines at three locations to indicate
# specific landmarks
lines(c(124.5,124.5),c(-20,110),type='l',lty=2)
lines(c(163.5,163.5),c(-20,110),type='l',lty=2)
lines(c(191.5,191.5),c(-20,110),type='l',lty=2)

# Phase I
lines(c(97.5,97.5),c(-25,150),type='l',lwd=setlwd)

# Label Phase I
text(99,125,"Phase I",cex=.7,adj=c(0,0),font=2)
text(99,120,"RA: Verbal\nTC: HOH",cex=.63,adj=c(0,1))
text(127,120,"RA: TD\nTC: HOH",cex=.63,adj=c(0,1))

# Phase II
lines(c(136.5,136.5),c(-25,150),type='l',lwd=setlwd)

# Label Phase II
text(142,125,"Phase II",cex=.7,adj=c(0,0),font=2)
text(142,120,"TC: HOH",cex=.63,adj=c(0,1))
text(167,120,"TC: Time delay",cex=.63,adj=c(0,1))
text(195,120,"Fade prompt\n\"Unsnap Pants\"",cex=.63,adj=c(0,1))

# main label
text(5,95,"Unfasten Pants",cex=1.3,adj=c(0,0))

# Label Mass teaching opportunity
# note, the newline character ('\n') to split the line
text(137,55,"Mass teaching opp.\noff body",cex=.6,adj=c(0,1))
arrows(138,38,138,20,length=.04,angle=20,code=2)

# show where reminder was needed
text(172.5,-5,"Verbal reminder\n\"You need to try.\"",cex=.75,adj=c(0,1))
arrows(172,-8,169,1,length=.04,angle=20,code=2)
arrows(172,-8,170,2,length=.04,angle=20,code=2)

