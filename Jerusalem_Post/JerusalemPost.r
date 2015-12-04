# set up data for each government type
NU <- c(6,7,10,27,27,NA)
# use cumsum() to help position text labels
NUcum <- cumsum(NU)
RW <- c(6,7,10,27,8,5)
RWcum <- cumsum(RW)
Herzog <- c(6,7,10,27,5,NA)
Herzogcum <- cumsum(Herzog)
Parties <- c('UTJ (6)','Shas (7)','Kulanu (10)','Zionist Union (27)','Likud (27)','Bayit Yehudi (8)','Meretz (5)','Yisrael Beytenu (5)')

# put data into a matrix
dat <- cbind(NU,RW,Herzog)
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
bp <- barplot(dat,ylab='',las=1,ylim=c(0,85),axes=F,col=cbPalette,xpd=NA)
# parameterize text size and adj for text()
cex.val <- 0.9
adj.val <- c(0.5,0.5)
# labels will appear in the middle of each stacked box
text(bp[1],NU[1]/2,paste(Parties[1]),adj=c(0.5,.5),col='black',cex=cex.val)
# use cumsum() values to scaffold the next value
text(bp[1],NUcum[1]+NU[2]/2,Parties[2],adj=adj.val,col='black',cex=cex.val)
text(bp[1],NUcum[2]+NU[3]/2,Parties[3],adj=adj.val,col='black',cex=cex.val)
text(bp[1],NUcum[3]+NU[4]/2,Parties[5],adj=adj.val,col='white',cex=cex.val)
text(bp[1],NUcum[4]+NU[5]/2,Parties[4],adj=adj.val,col='black',cex=cex.val)
text(bp[2],RW[1]/2,Parties[1],adj=adj.val,col='black',cex=cex.val)
text(bp[2],RWcum[1]+RW[2]/2,Parties[2],adj=adj.val,col='black',cex=cex.val)
text(bp[2],RWcum[2]+RW[3]/2,Parties[3],adj=adj.val,col='black',cex=cex.val)
text(bp[2],RWcum[3]+RW[4]/2,Parties[5],adj=adj.val,col='white',cex=cex.val)
text(bp[2],RWcum[4]+RW[5]/2,Parties[6],adj=adj.val,col='black',cex=cex.val)
text(bp[2],RWcum[5]+RW[6]/2,Parties[8],adj=adj.val,col='white',cex=cex.val)
text(bp[3],Herzog[1]/2,Parties[1],adj=adj.val,col='black',cex=cex.val)
text(bp[3],Herzogcum[1]+Herzog[2]/2,Parties[2],adj=adj.val,col='black',cex=cex.val)
text(bp[3],Herzogcum[2]+Herzog[3]/2,Parties[3],adj=adj.val,col='black',cex=cex.val)
text(bp[3],Herzogcum[3]+Herzog[4]/2,Parties[4],adj=adj.val,col='white',cex=cex.val)
text(bp[3],Herzogcum[4]+Herzog[5]/2,Parties[7],adj=adj.val,col='black',cex=cex.val)
# add text labels to the top of each stack
text(bp[1],83,'77 mandates')
text(bp[2],69,'63 mandates')
text(bp[3],61,'55 mandates')