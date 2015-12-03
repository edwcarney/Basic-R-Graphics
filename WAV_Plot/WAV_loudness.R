# display the WAV file contents with IPA, first
source('C:/Clients/Bert_Schlauch/Heekyung_Han/Loudness_Model/TDH_Filtered/WAVBinary.R')

# now, add the loudness model data to the plot
# read up the sones/phons data
loud <- read.csv('toothtdh.csv',header=T)
# remove any values for long-term that are < 1
# this is to remove negative values of log10()
loud=loud[loud$lt_sones>=1,]

# extract the long/short-term sones data
# take the log10() and scale it to make the waveform cover more space in 
# the y dimension 
scale_sones = 10000
lt_sones<-data.frame(ms=loud$ms,lt_sones=log10(loud$lt_sones)*scale_sones)
st_sones<-data.frame(ms=loud$ms,st_sones=log10(loud$st_sones)*scale_sones)

# display the long-term loudness model output (lt_sones)
yoffset = 15000
# Long-term loudness
text(-2000,yoffset+5000,'Long-term\nAvg',cex=.9)
# scale the data to 20 points per ms and offset it by yoffset to
# move it up the page
lines(lt_sones$ms*20,lt_sones$lt_sones+yoffset,lwd=2)
# put a line at the top value and the lowest value
lines(c(0,24750),c(min(lt_sones$lt_sones)+yoffset,min(lt_sones$lt_sones)+yoffset),lty=3)
lines(c(0,24750),c(max(lt_sones$lt_sones)+yoffset,max(lt_sones$lt_sones)+yoffset),lty=3)
# put the label next to the min/max value lines
# label has to come from the original sone values (not the log10 values)
text(24700,min(lt_sones$lt_sones)+yoffset,paste(min(loud$lt_sones),'sones'),pos=4,cex=.8)
text(24700,max(lt_sones$lt_sones)+yoffset,paste(max(loud$lt_sones),'sones'),pos=4,cex=.8)

# display the short-term loudness model output (st_sones)
yoffset = 40000
# Short-term loudness
text(-2000,yoffset+5000,'Short-term\nAvg',cex=.9)
# scale the data to 20 points per ms and offset it by yoffset to
# move it up the page
lines(st_sones$ms*20,st_sones$st_sones+yoffset,lwd=2)
# put a line at the top value and the lowest value
lines(c(0,24750),c(min(st_sones$st_sones)+yoffset,min(st_sones$st_sones)+yoffset),lty=3)
lines(c(0,24750),c(max(st_sones$st_sones)+yoffset,max(st_sones$st_sones)+yoffset),lty=3)
# put the label next to the min/max value lines
# label has to come from the original sone values (not the log10 values)
text(24700,min(st_sones$st_sones)+yoffset,paste(min(loud$st_sones),'sones'),pos=4,cex=.8)
text(24700,max(st_sones$st_sones)+yoffset,paste(max(loud$st_sones),'sones'),pos=4,cex=.8)
