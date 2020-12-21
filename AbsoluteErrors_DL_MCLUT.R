library(tidyverse)
library(ggplot2)
library(ggsignif)
predictresults <-read.csv("C:/Users/Mayna/Documents/Research/PredictResults.csv")

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


#for barplot
df1 <- data.frame(Model = rep(c("Deep Learning", "MCLUT"), each = 5),
                  param = c("BVF (%)","탎' (cm^-1)","B", "[Mel] (mg/ml)","O2 (%)"),
                  error = c(BVF_DL_avg,
                            musp_DL_avg,
                            B_DL_avg,
                            Mel_DL_avg,
                            O2_DL_avg,
                            BVF_MCLUT_avg, 
                            musp_MCLUT_avg, 
                            B_MCLUT_avg, 
                            Mel_MCLUT_avg, 
                            O2_MCLUT_avg),
                  sd = c(sd(BVF_DL_error),
                         sd(musp_DL_error),
                         sd(B_DL_error),
                         sd(Mel_DL_error),
                         sd(O2_DL_error),
                         sd(BVF_MCLUT_error), 
                         sd(musp_MCLUT_error), 
                         sd(B_MCLUT_error), 
                         sd(Mel_MCLUT_error), 
                         sd(O2_MCLUT_error)) )

df1$param_f = factor(df1$param, levels=c("BVF (%)","탎' (cm^-1)","B", "[Mel] (mg/ml)","O2 (%)"))
levels(df1$param_f) <- c("'BVF (%)'","mu*minute[s]~'(cm'^-1~')'","B","'[Mel] (mg/ml)'","O[2]~'(%)'")

annotation_df_bar <- data.frame(param_f=c("'BVF (%)'","mu*minute[s]~'(cm'^-1~')'","B","'[Mel] (mg/ml)'","O[2]~'(%)'"),
                            start = c(0.8, 0.8, 0.8, 0.8, 0.8),
                            end = c(1.2, 1.2, 1.2, 1.2, 1.2),
                            y= c(1.5,11.5,0.9,0.65,47),
                            label = c("***","***","***","***","***") )

errors_barplot<-ggplot(data=df1, aes(x=param, y=error, fill = Model)) +
  geom_bar(stat="identity", position=position_dodge()) + scale_fill_brewer(palette="Paired") + theme_classic() + 
  ylab("Mean Absolute Error")+
  theme(text = element_text(size=18)) + geom_errorbar(aes(ymin=error-sd, ymax=error+sd), width=.2, position=position_dodge(.9))  + 
  geom_signif(data=annotation_df_bar,  aes(xmin=start, xmax=end, annotations=label, y_position=y),  inherit.aes = FALSE, textsize = 5, vjust = 0.3,   manual=TRUE)
errors_barplot <- errors_barplot +  facet_wrap(~param_f,scales = "free", strip.position = "bottom", labeller = label_parsed) +
  theme(legend.position = c(0.85, 0.25))  + theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())
errors_barplot








# for boxplot
df2 <- data.frame(Model = rep(c("Deep Learning", "MCLUT"), each = 150000),
                  param = rep(c("BVF", "musp", "B", "Mel", "O2"), each=30000),
                  error = c(BVF_DL_error,
                            musp_DL_error,
                            B_DL_error,
                            Mel_DL_error,
                            O2_DL_error,
                            BVF_MCLUT_error, 
                            musp_MCLUT_error, 
                            B_MCLUT_error, 
                            Mel_MCLUT_error, 
                            O2_MCLUT_error)
)
# boxplot, significance stars
annotation_df <- data.frame(param=c("BVF", "musp","B", "Mel", "O2"),
                            start = c(0.8, 0.8, 0.8, 0.8, 0.8),
                            end = c(1.2, 1.2, 1.2, 1.2, 1.2),
                            y= c(3.4,34,2,2,67),
                            label = c("***","***","***","***","***") )

levels(df2$param)<-  c("BVF (%)","탎' (cm^-1)","B", "[Mel] (mg/ml)","O2 (%)")
levels(annotation_df$param)<-  c("BVF (%)","탎' (cm^-1)","B", "[Mel] (mg/ml)","O2 (%)")

errors_boxplot<-ggplot(data=df2) +
  geom_boxplot(mapping = aes(x=param, y=error, fill = Model), position=position_dodge()) + scale_fill_brewer(palette="Paired") + theme_classic() + 
  labs( y = "Absolute Error") + theme(text = element_text(size=18)) + 
  geom_signif(data=annotation_df, aes(xmin=start, xmax=end, annotations=label, y_position = y), textsize = 5, vjust = 0.3,manual=TRUE) +
 facet_wrap(~param,scales = "free", strip.position = "bottom") + theme(legend.position = c(0.82, 0.3)) + theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())
errors_boxplot 
