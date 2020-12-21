library(tidyverse)
library(ggplot2)
library(ggsignif)

predictresults <-read.csv("C:/Users/Mayna/Documents/Research/AllResultsNoise.csv")


#  MCLUT error
BVF_MCLUT_error <- abs ((predictresults$BVF.MCLUT - predictresults$BVF.true))
musp_MCLUT_error <- abs ((predictresults$musp.MCLUT - predictresults$musp.true))
B_MCLUT_error <- abs ((predictresults$B.MCLUT - predictresults$B.true)) 
Mel_MCLUT_error <- abs((predictresults$Mel.MCLUT - predictresults$Mel.true))
O2_MCLUT_error <- abs((predictresults$O2.MCLUT - predictresults$O2.true)) 

BVF_MCLUT_avg <- mean(BVF_MCLUT_error)
musp_MCLUT_avg <- mean(musp_MCLUT_error)
B_MCLUT_avg <- mean(B_MCLUT_error)
Mel_MCLUT_avg <- mean(Mel_MCLUT_error)
O2_MCLUT_avg <- mean(O2_MCLUT_error)

#  DL
BVF_DL_error <- abs ((predictresults$BVF.DL - predictresults$BVF.true))
musp_DL_error <- abs ((predictresults$musp.DL - predictresults$musp.true))
B_DL_error <- abs ((predictresults$B.DL - predictresults$B.true)) 
Mel_DL_error <- abs((predictresults$Mel.DL - predictresults$Mel.true))
O2_DL_error <- abs((predictresults$O2.DL - predictresults$O2.true)) 

BVF_DL_avg <- mean(BVF_DL_error)
musp_DL_avg <- mean(musp_DL_error)
B_DL_avg <- mean(B_DL_error)
Mel_DL_avg <- mean(Mel_DL_error)
O2_DL_avg <- mean(O2_DL_error)

BVF_DL_MASE <- BVF_DL_avg/BVF_MCLUT_avg
musp_DL_MASE <- musp_DL_avg/musp_MCLUT_avg
B_DL_MASE <- B_DL_avg/B_MCLUT_avg
Mel_DL_MASE <- Mel_DL_avg/Mel_MCLUT_avg
O2_DL_MASE <- O2_DL_avg/O2_MCLUT_avg

BVF_sub <- BVF_MCLUT_error - BVF_DL_error
musp_sub <- musp_MCLUT_error - musp_DL_error
B_sub <- B_MCLUT_error - B_DL_error
Mel_sub <- Mel_MCLUT_error - Mel_DL_error
O2_sub <- O2_MCLUT_error - O2_DL_error



# Individual Parameter Data Frames
BVF_df <- data.frame(Model = "Deep Learning",
                     BVFtruth = (predictresults$BVF.true),
                     musptruth = (predictresults$musp.true),
                     Btruth = (predictresults$B.true),
                     Meltruth = (predictresults$Mel.true),
                     O2truth = (predictresults$O2.true),
                     BVF_DL_error,
                     BVF_MCLUT_error,
                     scaled_error = BVF_DL_error/BVF_MCLUT_error,
                     sub=BVF_sub)

musp_df <- data.frame(Model = "Deep Learning",
                      BVFtruth = (predictresults$BVF.true),
                      musptruth = (predictresults$musp.true),
                      Btruth = (predictresults$B.true),
                      Meltruth = (predictresults$Mel.true),
                      O2truth = (predictresults$O2.true),
                      musp_DL_error,
                      musp_MCLUT_error,
                      scaled_error = musp_DL_error/musp_MCLUT_error,
                      sub=musp_sub)

B_df <- data.frame(Model = "Deep Learning",
                   BVFtruth = (predictresults$BVF.true),
                   musptruth = (predictresults$musp.true),
                   Btruth = (predictresults$B.true),
                   Meltruth = (predictresults$Mel.true),
                   O2truth = (predictresults$O2.true),
                   B_DL_error,
                   B_MCLUT_error,
                   scaled_error = B_DL_error/B_MCLUT_error,
                   sub=B_sub)

Mel_df <- data.frame(Model = "Deep Learning",
                     BVFtruth = (predictresults$BVF.true),
                     musptruth = (predictresults$musp.true),
                     Btruth = (predictresults$B.true),
                     Meltruth = (predictresults$Mel.true),
                     O2truth = (predictresults$O2.true),
                     Mel_DL_error,
                     Mel_MCLUT_error,
                     scaled_error = Mel_DL_error/Mel_MCLUT_error,
                     sub=Mel_sub)

O2_df <- data.frame(Model = "Deep Learning",
                    BVFtruth = (predictresults$BVF.true),
                    musptruth = (predictresults$musp.true),
                    Btruth = (predictresults$B.true),
                    Meltruth = (predictresults$Mel.true),
                    O2truth = (predictresults$O2.true),
                    O2_DL_error,
                    O2_MCLUT_error,
                    scaled_error = O2_DL_error/O2_MCLUT_error,
                    sub=O2_sub)



# to plot dotplot of both models against parameter values
BVF_bothmodels <- data.frame(Model = rep(c("Deep Learning", "MCLUT"), each = 30000),
                             BVFtruth = predictresults$BVF.true,
                             error = c(BVF_DL_error,BVF_MCLUT_error))

musp_bothmodels <- data.frame(Model = rep(c("Deep Learning", "MCLUT"), each = 30000),
                              musptruth = predictresults$musp.true,
                              error = c(musp_DL_error,musp_MCLUT_error))

B_bothmodels <- data.frame(Model = rep(c("Deep Learning", "MCLUT"), each = 30000),
                           Btruth = predictresults$B.true,
                           error = c(B_DL_error,B_MCLUT_error))

Mel_bothmodels <- data.frame(Model = rep(c("Deep Learning", "MCLUT"), each = 30000),
                             Meltruth = predictresults$Mel.true,
                             error = c(Mel_DL_error,Mel_MCLUT_error))

O2_bothmodels <- data.frame(Model = rep(c("Deep Learning", "MCLUT"), each = 30000),
                            O2truth = predictresults$O2.true,
                            error = c(O2_DL_error,O2_MCLUT_error))

BVF_bothmodels$BVFtruth<-format(round(BVF_bothmodels$BVFtruth, 2), nsmall = 2)
musp_bothmodels$musptruth<-format(round(musp_bothmodels$musptruth, 2), nsmall = 1)
B_bothmodels$Btruth<-format(round(B_bothmodels$Btruth, 2), nsmall = 2)
Mel_bothmodels$Meltruth<-format(round(Mel_bothmodels$Meltruth, 2), nsmall = 2)
O2_bothmodels$O2truth<-format(round(O2_bothmodels$O2truth, 2), nsmall = 1)
cols <-c("blue","orange")


#BVF
errors_dotplot<-ggplot(data=BVF_bothmodels) +
  geom_dotplot(mapping = aes(x=as.factor(BVFtruth), y=error, color=Model, fill=Model), binwidth=.0025,binaxis='y', position=position_dodge()) + scale_fill_brewer(palette="Paired") + theme_classic() + 
  labs(x="BVF (%)", y = "Absolute Error") +
  theme(text = element_text(size=20))  + scale_colour_manual(values = cols) + theme(legend.position = "none") +
  theme(axis.text.x = element_text(size=18), axis.text.y = element_text(size=18))+
  geom_text(data  = BVF_text,mapping = aes(x = x, y = y, label = label),inherit.aes = FALSE, size = 5) 
errors_dotplot 



#musp
errors_dotplot<-ggplot(data=musp_bothmodels) +
  geom_dotplot(mapping = aes(x=as.factor(musptruth), y=error, color=Model, fill=Model), binwidth=.02,binaxis='y', position=position_dodge()) + scale_fill_brewer(palette="Paired") + theme_classic() + 
  labs(x=expression(paste(mu[s], "'", " (", cm^-1, ")")), y = "Absolute Error") +
  theme(text = element_text(size=20)) + scale_colour_manual(values = cols) + theme(legend.position = "none")+
  theme(axis.text.x = element_text(size=18), axis.text.y = element_text(size=18))
errors_dotplot 

#B
errors_dotplot<-ggplot(data=B_bothmodels) +
  geom_dotplot(mapping = aes(x=as.factor(Btruth), y=error, color=Model, fill=Model), binwidth=.002,binaxis='y', position=position_dodge()) + scale_fill_brewer(palette="Paired") + theme_classic() + 
  labs(x="B", y = "Absolute Error") +
  theme(text = element_text(size=20)) + scale_colour_manual(values = cols) + theme(legend.position = "none")+
  theme(axis.text.x = element_text(size=18), axis.text.y = element_text(size=18))
errors_dotplot 
#mel
errors_dotplot<-ggplot(data=Mel_bothmodels) +
  geom_dotplot(mapping = aes(x=as.factor(Meltruth), y=error, color=Model, fill=Model), binwidth=.001,binaxis='y', position=position_dodge()) + scale_fill_brewer(palette="Paired") + theme_classic() + 
  labs(x="[Mel] (mg/ml)", y = "Absolute Error") +
  theme(text = element_text(size=20)) + scale_colour_manual(values = cols) + theme(legend.position = "none")+
  theme(axis.text.x = element_text(size=18), axis.text.y = element_text(size=18))
errors_dotplot 
#o2
errors_dotplot<-ggplot(data=O2_bothmodels) +
  geom_dotplot(mapping = aes(x=as.factor(O2truth), y=error, color=Model, fill=Model), binwidth=.06,binaxis='y', position=position_dodge()) + scale_fill_brewer(palette="Paired") + theme_classic() + 
  labs(x=expression(paste(O[2], " (%)")), y = "Absolute Error") +
  theme(text = element_text(size=20)) + scale_colour_manual(values = cols) + theme(legend.position = "none")+
  theme(axis.text.x = element_text(size=18), axis.text.y = element_text(size=18))
errors_dotplot 


##### PLOT SUBTRACTION OF MCLUT & DL ERROR by param
# Separate plots by color
cols <-c("blue","tomato")
BVF_df$color <- sign(BVF_df$sub)
BVF_df$color[BVF_df$color == "-1"] <- "red"
BVF_df$color[BVF_df$color == "1"] <- "blue"
BVF_df$BVFtruth<-format(round(BVF_df$BVFtruth, 2), nsmall = 2)
#levels(BVF_df$) <- c("mu*minute[s]~'(cm'^-1~')'","'BVF (%)'","'[mel] (mg/ml)'","alpha~'(%)'","r[vess]~'('~mu*m*')'","B")
#levels(data$Parameter) <- c("mu*minute[s]~'(cm'^-1~')'","'BVF (%)'","'[mel] (mg/ml)'","alpha~'(%)'","r[vess]~'('~mu*m*')'","B")

musp_df$color <- sign(musp_df$sub)
musp_df$color[musp_df$color == "-1"] <- "red"
musp_df$color[musp_df$color == "1"] <- "blue"
musp_df$musptruth<-format(round(musp_df$musptruth, 1), nsmall = 1)

B_df$color <- sign(B_df$sub)
B_df$color[B_df$color == "-1"] <- "red"
B_df$color[B_df$color == "1"] <- "blue"
B_df$Btruth<-format(round(B_df$Btruth, 2), nsmall = 2)

Mel_df$color <- sign(Mel_df$sub)
Mel_df$color[Mel_df$color == "-1"] <- "red"
Mel_df$color[Mel_df$color == "1"] <- "blue"
Mel_df$Meltruth<-format(round(Mel_df$Meltruth, 2), nsmall = 2)

O2_df$color <- sign(O2_df$sub)
O2_df$color[O2_df$color == "-1"] <- "red"
O2_df$color[O2_df$color == "1"] <- "blue"
O2_df$O2truth<-format(round(O2_df$O2truth, 1), nsmall = 1)


BVF_text <- data.frame(
  label = c("91%", "95%","94%","94%","93%","89%","88%","90%","95%","92%"),
  x     = c(1.2, 2.2, 3.2, 4.2, 5.2, 6.2, 7.2, 8.2, 9.2, 10.1),
  y     = c(1, 1.2, 1.4, 1.6, 1.8, 2, 2.2, 2.4, 2.6, 2.8)
)

#BVF
BVF_dotplot<-ggplot(data=BVF_df) +
  geom_dotplot(mapping = aes(x=as.factor(BVFtruth), y=sub, color=color), binwidth=.0055,binaxis='y')  + theme_classic() + 
  labs(x="BVF (%)", y = "") +
  theme(text = element_text(size=20))  + scale_colour_manual(values = cols) + theme(legend.position = "none") +
  theme(axis.text.x = element_text(size=19), axis.text.y = element_text(size=19)) +
  geom_text(data  = BVF_text,mapping = aes(x = x, y = y, label = label),inherit.aes = FALSE, size = 8) 
BVF_dotplot 

# ylab(expression(paste("C", H[4], " (", mu,"mol ", L^-1,")"))) 

musp_text <- data.frame(
  label = c("86%", "86%","85%", "84%", "82%","83%","85%","86%","93%","89%"),
  x     = c(1.2, 2.2, 3.2, 4.2, 5.2, 6.2, 7.2, 8.2, 9.2, 10.1),
  y     = c(30, 28, 26, 24, 22, 20, 18, 16, 14, 16)
)

#musp
musp_dotplot<-ggplot(data=musp_df) +
  geom_dotplot(mapping = aes(x=as.factor(musptruth), y=sub, color=color), binwidth=.05,binaxis='y') + scale_fill_brewer(palette="Paired") + theme_classic() + 
  labs(x=expression(paste(mu[s], "'", " (", cm^-1, ")")), y = "") +
  theme(text = element_text(size=20)) + scale_colour_manual(values = cols) + theme(legend.position = "none")+
  theme(axis.text.x = element_text(size=19), axis.text.y = element_text(size=19)) +
  geom_text(data  = musp_text,mapping = aes(x = x, y = y, label = label),inherit.aes = FALSE, size = 8) 
musp_dotplot 


B_text <- data.frame(
  label = c("62%", "71%","74%", "78%", "82%","84%","84%","83%","80%","82%"),
  x     = c(1.2, 2.2, 3.2, 4.2, 5.2, 6.2, 7.2, 8.2, 9.2, 10.1),
  y     = c(1.4, 1.25, 1.1, 0.95, 1.1, 1.25, 1.4, 1.55, 1.7, 1.85)
)

#B
B_dotplot<-ggplot(data=B_df) +
  geom_dotplot(mapping = aes(x=as.factor(Btruth), y=sub, color=color), binwidth=.005,binaxis='y') + scale_fill_brewer(palette="Paired") + theme_classic() + 
  labs(x="B", y="") +
  theme(text = element_text(size=20)) + scale_colour_manual(values = cols) + theme(legend.position = "none")+
  theme(axis.text.x = element_text(size=19), axis.text.y = element_text(size=19)) +
  geom_text(data  = B_text,mapping = aes(x = x, y = y, label = label),inherit.aes = FALSE, size = 8) 
B_dotplot 

Mel_text <- data.frame(
  label = c("98%", "100%","97%", "72%", "76%","82%","78%","79%","83%","74%"),
  x     = c(1.2, 2.2, 3.2, 4.2, 5.2, 6.2, 7.2, 8.2, 9.2, 10.1),
  y     = c(1, 1.25, 1.5, 1.6, 1.5, 1.4, 1.3, 1.1, 0.9, 0.8)
)


#mel
Mel_dotplot<-ggplot(data=Mel_df) +
  geom_dotplot(mapping = aes(x=as.factor(Meltruth), y=sub, color=color), binwidth=.003,binaxis='y') + scale_fill_brewer(palette="Paired") + theme_classic() + 
  labs(x="[Mel] (mg/ml)", y="") +
  theme(text = element_text(size=20)) + scale_colour_manual(values = cols) + theme(legend.position = "none")+
  theme(axis.text.x = element_text(size=19), axis.text.y = element_text(size=19)) +
  geom_text(data  = Mel_text,mapping = aes(x = x, y = y, label = label),inherit.aes = FALSE, size = 8) 
Mel_dotplot 

O2_text <- data.frame(
  label = c("83%", "94%","99%", "100%", "100%","100%","100%","100%","100%","100%"),
  x     = c(1.2, 2.2, 3.2, 4.2, 5.2, 6.2, 7.2, 8.2, 9.2, 10.1),
  y     = c(24, 28, 32, 36, 41, 45, 50, 54, 58, 62)
)
#o2
O2_dotplot<-ggplot(data=O2_df) +
  geom_dotplot(mapping = aes(x=as.factor(O2truth), y=sub, color=color), binwidth=.15,binaxis='y') + scale_fill_brewer(palette="Paired") + theme_classic() + 
  labs(x=expression(paste(O[2], " (%)")), y="") +
  theme(text = element_text(size=20)) + scale_colour_manual(values = cols) + theme(legend.position = "none")+
  theme(axis.text.x = element_text(size=19), axis.text.y = element_text(size=19)) +
  geom_text(data  = O2_text,mapping = aes(x = x, y = y, label = label),inherit.aes = FALSE, size = 8) 
O2_dotplot 

