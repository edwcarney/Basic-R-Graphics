wrapdata=read.csv("wrap.csv",header=TRUE)

# Line 1
# first we plot the Task Completion Opportunities
# no axes--we add our own
plot(wrapdata$TCxval,wrapdata$TC,pch=1,
    ylim=c(-20,120),xlim=c(0,210),cex=.6,
    ylab='Correct Response',xlab='Opportunity',
    bty="l",xaxs='i',axes=FALSE,ann=FALSE)
axis(1,at=c(1,seq(10,210,10)), cex.axis=.6,tcl=-.3,padj=-2,
     labels <- c("1",as.character(seq(10,210,10))))
axis(2,at=seq(0,120,20),las=1,cex.axis=.6,
     labels=as.character(seq(0,120,20)))
# y axis label
text(-8,60,"Cumulative Correct",cex=.85,adj=c(0.5,0),srt=90)

# Line 2
# Now, we plot the requests for assistance
points(wrapdata$RAxval,wrapdata$RA,pch=19,cex=.6)

# Probes
# Now, we plot the probes
points(wrapdata$TCxval,wrapdata$TCProbes+10,pch=124,cex=cexbars,font=2)

# finish off the axis corner
lines(c(0,0),c(-25.6,0),type='l')
lines(c(0,1),c(-25.6,-25.6),type='l')

# add vertical dashed lines at three locations to indicate
# specific landmarks
lines(c(70.5,70.5),c(-20,125),type='l',lty=2)
lines(c(161.5,161.5),c(-20,125),type='l',lty=2)

# Phase I for this section
lines(c(58.5,58.5),c(-55,180),type='l',lwd=setlwd)
lines(c(58.5,97.5),c(-55,-55),type='l',lwd=setlwd)
lines(c(97.5,97.5),c(-55,-80),type='l',lwd=setlwd)

# sub-intervals
text(61,145,"Phase I",cex=.7,adj=c(0,0),font=2)
text(61,138,"RA: Verbal\nprompt\nTC: HOH",cex=.63,adj=c(0,1))
text(72,138,"RA: Time\nDelay",cex=.63,adj=c(0,1))

# Phase II for this section
lines(c(83.5,83.5),c(-45,180),type='l',lwd=setlwd)
lines(c(83.5,136.5),c(-45,-45),type='l',lwd=setlwd)
lines(c(136.5,136.5),c(-45,-80),type='l',lwd=setlwd)

# Label Phase II
text(85,145,"Phase II",cex=.7,adj=c(0,0),font=2)
text(85,138,"TC: Partially torn wrapper\nTime delay",cex=.63,adj=c(0,1))
text(163,138,"TC: Fully sealed wrapper (child determines difficulty)",cex=.63,adj=c(0,1))

# main label
text(190,5,"Open Wrapper",cex=1.3)