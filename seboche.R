library(ggplot2)
library(lubridate)
library(ape)
library(epicalc)

# Total Number of cases notified for Seboche in Q2 2009, Q2 2010, Q2 2011, Q2 2012, Q2 2013,Q1 2014 and Q2 2014 
TotNotif <-c(47,67,99,41,76,41,63) 

# Total Number of new cases notified for Seboche in Q2 2009, Q2 2010, Q2 2011, Q2 2012, Q2 2013,Q1 2014 and Q2 2014
NewNotif <- c(43,60,94,39,71,34,61)
Newpulm  <- c(25,39,35,30,35,16,41)

# Total Number of new bacteriologically confirmed cases notified for Seboche in Q2 2009, Q2 2010, Q2 2011, Q2 2012, Q2 2013,Q1 2014 and Q2 2014
NewBpos <- c(19,25,26,9,9,10,22)
Retcases <- c(4,4,5,2,6,7,2)

# Assignments to symplify manipulation
x <- as.numeric(TotNotif)
y <- as.numeric(NewNotif)
p <- as.numeric(Newpulm)
z <- as.numeric(NewBpos)
v <- as.numeric(Retcases)
w <- as.numeric(y/x)
r <- as.numeric(z/p)
q <- as.numeric(v/x)
Quarter <- c("Q2_2009", "Q2_2010", "Q2_2011", "Q2_2012", "Q2_2013","Q1_2014", "Q2_2014")


######  
ggplot(data=W, aes(x=Quarter, y=x, group=2)) + 
  geom_line(colour="red", linetype="dotted", size=1.5) + 
  geom_point(colour="red", size=4, shape=21, fill="white")+ xlab("Quarter Of the year") + ylab("Number Of patients") +
  ggtitle("Trends in Seboche Hosp Notification")+theme_bw()
# A line graph
ggplot(data=W, aes(x=Quarter, y=x, group =1)) + 
    geom_line() +         
  ylim(0, max(W$x)) +             # Set y range
  scale_colour_hue(name="Number of patients",      # Set legend title
                   l=30)  +                  # Use darker colors (lightness=30)
    ggtitle("Trends in Notification For Seboche Hospital") +  # Set title
  theme_bw() +
  theme(legend.position=c(.7, .4)) # Position legend inside

# Constructing datasets
combo1 <- rbind(x,y,p,z,v)
combo2 <- rbind(w,r,q)
W<- data.frame(Quarter,x,y,p,z,v)
W
TSR <-as.numeric(c(79.2,52.9,78.3,76.9,82.4,82.0,53.8))
Death <- as.numeric(c(12.5,35.2,13.0,11.5,11.8,14.0,23.0))
LTF <- as.numeric(c(8.3,11.8,8.7,7.7,5.9,0,15.0)) #Inclusive of Not Evaluated
Failure <- as.numeric(c(0,0,0,3.8,0,4,8))
RxOutcomes <- data.frame(TSR,Death,LTF,Failure)
colnames(RxOutcomes) <- c("Q2_2009", "Q2_2010", "Q2_2011", "Q2_2012", "Q2_2013","Q1_2014", "Q2_2014")
Treatment_Outcomes <- read.csv("C:/Users/Tseliso/Desktop/Treatment_Outcomes.csv")

ggplot(data=Treatment_Outcomes, aes(x=Treatment.Outcome, y=Q2_2014)) + 
  geom_bar(colour="black", stat="identity",
           position=position_dodge(),
           size=.3) +                        # Thinner lines
  xlab("Treatment Outcome") + ylab("% Of patients") + # Set axis labels
  ggtitle("Seboche Treatment Outcomes For 2nd Quarter 2014") +  # Set title
  theme_bw()
###


  
