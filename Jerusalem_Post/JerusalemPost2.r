## R code starts here
dat <- read.table(text="
                  Party NationalUnity RightWing HerzogLed
                  UTJ 6 6 6
                  Shas 7 7 5
                  Kulanu 10 10 10
                  Likud 27 27 NA
                  ZionistUnion 27 NA 27
                  BayitYehudi NA 8 NA
                  Meretz NA NA 5
                  YisraelBeytenu NA 5 NA
                  ", header=TRUE)

library(reshape2)
dat.long <- melt(dat, id.vars = "Party", variable.name = "Government", value.name = "Seats")

# cumsum ignoring NAs
f.cum.na <- function(x) {
  x[which(is.na(x))] <- 0
  return(cumsum(x))
}

library(plyr)
# calculate midpoints of bars
dat.long.plot <- ddply(dat.long, .(Government), transform, pos = f.cum.na(Seats) - (0.5 * Seats))

dat.long.plot$SeatsLabel <- paste(dat.long.plot$Party, " (", dat.long.plot$Seats, ")", sep="")

# The colorblind palette with grey
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# plot bars and add text
library(ggplot2)
p <- ggplot(dat.long.plot, aes(x = Government, y = Seats))
p <- p + geom_bar(aes(fill = Party), stat="identity")
p <- p + geom_text(aes(label = SeatsLabel, y = pos), size = 3)
p <- p + scale_fill_manual(values=cbPalette)
p <- p + theme(legend.position="none")
print(p)
## R code ends here