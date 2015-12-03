# this version uses tuneR
require(tuneR)
# delete the PNG file, if it exists
# if (file.exists('tooth.png')) {
#   system('c:\\util\\rm tooth.png')
#   print('File deleted.')
# }
# use tuneR function readWave to read up the data
toothbrush = readWave('toothtdh.wav')
# data are stored in an S4 class
# we can pull out the data using "slot"
if (!slot(toothbrush,'stereo')) {
  data=slot(toothbrush,'left')
# calculate the number of samples
  nsamples = length(data)
}
# construct a range in ms; this helps with the labels
maxms <- ceiling(nsamples/20/100)/10
# open a PNG file for output
#png('tooth.png',width=500,height=350)
# plot the waveform without axes
par(xpd=NA)
plot(toothbrush,
     axes=F,ylab='',xlab='Time (ms)',
     ylim=c(-22000,50000),xlim=c(0,1.4),col='slateblue')
# set the labels for the x axis
axis(1,at=seq(0,maxms,.2),labels=c('0','200','400','600','800','1000','1200'))
# set some values that will be used a lot
yval=-21000    # to line up the IPA
cexval = 1.1   # to set their size
posval = 3     # position of character w.r.t. x & y    
xpos = -.09
# use Unicode values for IPA (http://en.wikipedia.org/wiki/International_Phonetic_Alphabet)
text(xpos+.11,yval,'\u0074',pos=posval,cex=cexval)  # t
text(xpos+.28,yval,'\u0075',pos=posval,cex=cexval)  # oo
text(xpos+.43,yval,'\u03b8',pos=posval,cex=cexval)  # th
text(xpos+.68,yval,'\u0062',pos=posval,cex=cexval)  # b
text(xpos+.72,yval,'\u0072',pos=posval,cex=cexval)  # r
text(xpos+.82,yval,'\u028c',pos=posval,cex=cexval)  # u
text(xpos+1.05,yval,'\u0283',pos=posval,cex=cexval) # sh
# plot(1.3,yval,pch=-0x028cL)
#graphics.off()