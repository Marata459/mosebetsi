library(ggplot2)
library(lubridate)
library(ape)
library(epicalc)

# Total Number of cases notified for Seboche in Q2 2009, Q2 2010, Q2 2011, Q2 2012, Q2 2013,Q1 2014 and Q2 2014 
TotNotif <-c(109,53,74,77,69,57,55) 
plot(TotNotif, type = "o", col=rgb(0,0.5,0), axes=FALSE,ann=FALSE)
Quarter <- c("Q2_2009", "Q2_2010", "Q2_2011", "Q2_2012", "Q2_2013","Q1_2014", "Q2_2014")
axis(1, at=1:7, lab=Quarter)
axis(2, las=1, at=10*0:100)
title(main="TRENDS MOKHOTLONG TB NOTIFICATIONS", col.main=rgb(0,0.5,0), font.main=3)
box()
title(xlab="QUARTER", col.lab=rgb(0,0.5,0), font.lab =3)
title(ylab="NUMBER OF CASES", col.lab=rgb(0,0.5,0),font.lab =3)
# Total Number of new cases notified for Seboche in Q2 2009, Q2 2010, Q2 2011, Q2 2012, Q2 2013,Q1 2014 and Q2 2014
NewNotif <- c(101,49,65,66,62,51,46)
#Newpulm  <- c(25,39,35,30,35,16,41)

# Total Number of new bacteriologically confirmed cases notified for Seboche in Q2 2009, Q2 2010, Q2 2011, Q2 2012, Q2 2013,Q1 2014 and Q2 2014
NewBpos <- c(19,18,20,29,29,23,23)
Retcases <- c(8,4,9,11,7,6,9)
HTCMkg <- c(82.6,96.2,94.6,90.9,89.9,100)
HTCLes <- c(70.5, 82.5, 80.9, 87.9, 92,91)
HIVPosMkg <- c(71,70.6,61,68.6,80.6,80)
HIVPosLes <- c(77.2,75.7,76.5,75.5,73.7,72.7)
ARTMkg <- c(17, 44.4,60.5,83.3,84,68)
ARTLs <- c(31,24.6,33,49.9,72.5,68.7)

g_range <- range(0, 100)

# Graph Type using y axis that ranges from 0 to max 
# value in cars or trucks vector.  Turn off axes and 
# annotations (axis labels) so we can specify them ourself
plot(HTCMkg, type="o", col=26, ylim=g_range, 
     axes=FALSE, ann=FALSE)

# Make x axis using Years labels
axis(1, at=1:6, lab=c(2009,2010,2011,2012,2013,2014))

# Make y axis with horizontal labels that display ticks at 
# every 4 marks. 4*0:g_range[2] is equivalent to c(0,4,8,12).
axis(2, las=1, at=10*0:g_range[2])

# Create box around plot
box()

# Graph trucks with red dashed line and square points
lines(HTCLes, type="o", pch=22, lty=2, col=12)
#lines(RetrA, type="o", pch=22, lty=2, col=454)
lines(HIVPosMkg, type="o", pch=22, lty=2, col=32)
lines(HIVPosLes, type="o", pch=22, lty=2, col="magenta")
lines(ARTMkg, type="o", pch=22, lty=2, col="brown")
lines(ARTLs, type="o", pch=22, lty=2, col="sienna1")
#lines(RetrB, type="o", pch=22, lty=2, col=57)
# Create a title with a red, bold/italic font
title(main="Mokhotlong TB/HIV Activities", col.main="red", font.main=3)
# Label the x and y axes with dark green text
title(xlab="Years", col.lab=rgb(0,0.5,0), font.lab =3)
title(ylab="%", col.lab=rgb(0,0.5,0),font.lab =3)

# Create a legend at (1, g_range[2]) that is slightly smaller 
# (cex) and uses the same line colors and points used by 
# the actual plots 
legend("bottomright",c("HTC Mokhotlong", "HTC Lesotho","HIV Positive Mokhotlong", "HIV Positive Lesotho","ART Mokhotlong","ART Lesotho"), cex=0.8, 
       col=c(26,12,32,"magenta", "brown", "sienna1"), pch=21:22, lty=1:2);

#.............................Treatment Outcomes...................................#
Years <- c(2009,2010,2011,2012,2013,2014)
BposA <- c() # Treatment success rate among New B+ patients
NewA<- c() # Treatment success rate among all New patients
RetrA <- c() # Treatment success rate among Retreatment cases
BposB <- c() # Death rate among New B+ patients
NewB <-c() # Death rate among All New cases 
RetrB <- c() # Death rate among Retreatment cases
