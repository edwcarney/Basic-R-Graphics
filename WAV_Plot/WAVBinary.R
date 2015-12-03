# this method loads a WAV file as a binary file
# no need for tuneR
#
# un-comment if you wish to output to a PNG file
# delete the PNG file, if it exists
# if (file.exists('wavFile.png')) {
#   system('c:\\util\\rm wavFile.png')
#   print('File deleted.')
# }
# put the desired file name in a variable
currFile <- 'toothtdh.wav'
# open the file as a binary file ('b') for reading ('r')
wavFile = file(currFile,'rb')
# skip down to the size of the data (stored in bytes 41-44)
# where is added to the current location, which is byte 1
# so, we end up at byte 41
seek(wavFile,where=40)
# the number of data bytes is stored as 4 bytes in "little-endian" form
# each sample takes 2 bytes, so, we divide by 2
nsamples <- readBin(wavFile,integer(),size=4,endian='little')/2
# we can now read in the data using the value that we calculated
wavData <- readBin(wavFile,integer(),n=nsamples,size=2)
# close the file
close(wavFile)
# construct a range in ms; this helps with the labels
maxms <- ceiling(nsamples/20/100)*100
# open a PNG file for output, if desired
#png('wavFile.png',width=500,height=350)
# plot the waveform without axes
par(xpd=NA)
plot(wavData[1:length(wavData)], type = 'l',
     axes=F,ylab='',xlab='Time (ms)',
     ylim=c(-22000,50000),xlim=c(1,20*maxms+2000),col='slateblue')
# this is a sequence in ms, given 20 samples/ms at 20 kHz
msSeq = seq(0,maxms*20,200*20)
# put the x axis in
axis(1,at=msSeq,labels=c('0','200','400','600','800','1000','1200'))
# set some values that will be used a lot
yval=-20000
cexval = 1.1
posval = 3
# use Unicode values for IPA (http://en.wikipedia.org/wiki/International_Phonetic_Alphabet)
text(msSeq[1]+500,yval,'\u0074',pos=posval,cex=cexval)   # t
text(msSeq[2]-500,yval,'\u0075',pos=posval,cex=cexval)   # oo
text(msSeq[3]-900,yval,'\u03b8',pos=posval,cex=cexval)   # th
text(msSeq[4]-500,yval,'\u0062',pos=posval,cex=cexval)   # b
text(msSeq[4]+600,yval,'\u0072',pos=posval,cex=cexval)   # r
text(msSeq[5]-1000,yval,'\u028c',pos=posval,cex=cexval)  # u
text(msSeq[6],yval,'\u0283',pos=posval,cex=cexval)       # sh
#graphics.off()