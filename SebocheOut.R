library(ggplot2)
# Seboche death rate and TSR
Years <- c(2009,2010,2011,2012,2013,2014 )
BposA <- c(79.2,52.9,78.3,76.9,82.4,54) # Treatment success rate among New B+ patients
NewA<- c(69.9,61.5,82.5,71,72.5,60) # Treatment success rate among all New patients
RetrA <- c(100,75,33.3,69.4,66.7,50) # Treatment success rate among Retreatment cases
BposB <- c(12.5,35.2,13,11.5,11.8,23) # Death rate among New B+ patients
NewB <-c(21.4,28.2,7,19.4,22.5,29) # Death rate among All New cases 
RetrB <- c(0,0,50,40,0,25) # Death rate among Retreatment cases
TSR <- data.frame(BposA,NewA,RetrA)
Death <- data.frame(BposB,NewB,RetrB)
Type <- data.frame(TSR,Death)


#---------------------------------------------------------------------------#
# Calculate range from 0 to max value of cars and trucks
g_range <- range(0, 100)

# Graph Type using y axis that ranges from 0 to max 
# value in cars or trucks vector.  Turn off axes and 
# annotations (axis labels) so we can specify them ourself
plot(BposA, type="o", col=26, ylim=g_range, 
     axes=FALSE, ann=FALSE)

# Make x axis using Years labels
axis(1, at=1:6, lab=c(2009,2010,2011,2012,2013,2014))

# Make y axis with horizontal labels that display ticks at 
# every 4 marks. 4*0:g_range[2] is equivalent to c(0,4,8,12).
axis(2, las=1, at=10*0:g_range[2])

# Create box around plot
box()

# Graph trucks with red dashed line and square points
lines(NewA, type="o", pch=22, lty=2, col=12)
#lines(RetrA, type="o", pch=22, lty=2, col=454)
lines(NewB, type="o", pch=22, lty=2, col=32)
lines(BposB, type="o", pch=22, lty=2, col="magenta")
#lines(RetrB, type="o", pch=22, lty=2, col=57)
# Create a title with a red, bold/italic font
title(main="SEBOCHE TB TREATMENT OUTCOMES", col.main="red", font.main=3)
abline(h =85, col="green",lty=1)
abline(h =5, col="green",lty=1)
# Label the x and y axes with dark green text
title(xlab="Years", col.lab=rgb(0,0.5,0), font.lab =3)
title(ylab="% Outcome", col.lab=rgb(0,0.5,0),font.lab =3)

# Create a legend at (1, g_range[2]) that is slightly smaller 
# (cex) and uses the same line colors and points used by 
# the actual plots 
legend("center",c("TSR New B+", "TSR New","Death New", "Death New B+"), cex=0.8, 
       col=c(26,12,32,"magenta"), pch=21:22, lty=1:2);