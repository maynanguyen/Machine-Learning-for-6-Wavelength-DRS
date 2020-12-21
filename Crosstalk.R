library(tidyverse)
library(ggplot2)
library(ggsignif)
library(ggthemes)
library(pBrackets) 
library(ggpubr)
predictresults <-read.csv("C:/Users/Mayna/Documents/Research/PredictResults.csv")


# #  MCLUT error
# BVF_MCLUT_error <- abs ((predictresults$BVF.MCLUT - predictresults$BVF.true))
# musp_MCLUT_error <- abs ((predictresults$musp.MCLUT - predictresults$musp.true))
# B_MCLUT_error <- abs ((predictresults$B.MCLUT - predictresults$B.true)) 
# Mel_MCLUT_error <- abs((predictresults$Mel.MCLUT - predictresults$Mel.true))
# O2_MCLUT_error <- abs((predictresults$O2.MCLUT - predictresults$O2.true)) 
# 
# BVF_MCLUT_avg <- mean(BVF_MCLUT_error)
# musp_MCLUT_avg <- mean(musp_MCLUT_error)
# B_MCLUT_avg <- mean(B_MCLUT_error)
# Mel_MCLUT_avg <- mean(Mel_MCLUT_error)
# O2_MCLUT_avg <- mean(O2_MCLUT_error)
# 
# #  DL
# BVF_DL_error <- abs ((predictresults$BVF.DL - predictresults$BVF.true))
# musp_DL_error <- abs ((predictresults$musp.DL - predictresults$musp.true))
# B_DL_error <- abs ((predictresults$B.DL - predictresults$B.true)) 
# Mel_DL_error <- abs((predictresults$Mel.DL - predictresults$Mel.true))
# O2_DL_error <- abs((predictresults$O2.DL - predictresults$O2.true)) 
# 
# BVF_DL_avg <- mean(BVF_DL_error)
# musp_DL_avg <- mean(musp_DL_error)
# B_DL_avg <- mean(B_DL_error)
# Mel_DL_avg <- mean(Mel_DL_error)
# O2_DL_avg <- mean(O2_DL_error)
# 
# #  RF
# BVF_RF_error <- abs ((predictresults$BVF.RF - predictresults$BVF.true))
# musp_RF_error <- abs ((predictresults$musp.RF - predictresults$musp.true))
# B_RF_error <- abs ((predictresults$B.RF - predictresults$B.true)) 
# Mel_RF_error <- abs((predictresults$Mel.RF - predictresults$Mel.true))
# O2_RF_error <- abs((predictresults$O2.RF - predictresults$O2.true)) 
# 
# BVF_RF_avg <- mean(BVF_RF_error)
# musp_RF_avg <- mean(musp_RF_error)
# B_RF_avg <- mean(B_RF_error)
# Mel_RF_avg <- mean(Mel_RF_error)
# O2_RF_avg <- mean(O2_RF_error)
# 
# #  GLM
# BVF_GLM_error <- abs ((predictresults$BVF.GLM - predictresults$BVF.true))
# musp_GLM_error <- abs ((predictresults$musp.GLM - predictresults$musp.true))
# B_GLM_error <- abs ((predictresults$B.GLM - predictresults$B.true)) 
# Mel_GLM_error <- abs((predictresults$Mel.GLM - predictresults$Mel.true))
# O2_GLM_error <- abs((predictresults$O2.GLM - predictresults$O2.true)) 
# 
# BVF_GLM_avg <- mean(BVF_GLM_error)
# musp_GLM_avg <- mean(musp_GLM_error)
# B_GLM_avg <- mean(B_GLM_error)
# Mel_GLM_avg <- mean(Mel_GLM_error)
# O2_GLM_avg <- mean(O2_GLM_error)
# 
# #  GBM
# BVF_GBM_error <- abs ((predictresults$BVF.GBM - predictresults$BVF.true))
# musp_GBM_error <- abs ((predictresults$musp.GBM - predictresults$musp.true))
# B_GBM_error <- abs ((predictresults$B.GBM - predictresults$B.true)) 
# Mel_GBM_error <- abs((predictresults$Mel.GBM - predictresults$Mel.true))
# O2_GBM_error <- abs((predictresults$O2.GBM - predictresults$O2.true)) 
# 
# BVF_GBM_avg <- mean(BVF_GBM_error)
# musp_GBM_avg <- mean(musp_GBM_error)
# B_GBM_avg <- mean(B_GBM_error)
# Mel_GBM_avg <- mean(Mel_GBM_error)
# O2_GBM_avg <- mean(O2_GBM_error)

# df <- data.frame(
#                      musptruth = (predictresults$musp.true),
#                      Meltruth = (predictresults$Mel.true),
#                      musp_DL_error,
#                      musp_MCLUT_error,
#                      Mel_DL_error,
#                      Mel_MCLUT_error)
# df$musptruth<-format(round(df$musptruth, 1), nsmall = 1)
# df$Meltruth<-format(round(df$Meltruth, 2), nsmall = 2)

df2 <- data.frame(Btruth = (predictresults$B.true),
                 Meltruth = (predictresults$Mel.true),
                 Mel_DL = predictresults$Mel.DL,
                 B_DL = predictresults$B.DL)
df2$Btruth<-format(round(df2$Btruth, 2), nsmall = 2)
df2$Meltruth<-format(round(df2$Meltruth, 2), nsmall = 2)


#B truth vs Mel
errors_dotplot<-ggplot(data=df2) +
  geom_dotplot(mapping = aes(x=as.factor(Btruth), y=Mel_DL), binwidth=.005,binaxis='y') + scale_fill_brewer(palette="Paired") + theme_classic() + 
  labs(x="B Truth", y = "[Mel] (mg/mL) Deep Learning") +
  theme(text = element_text(size=20))  + scale_colour_manual(values = cols) + theme(legend.position = "none") +
  theme(axis.text.x = element_text(size=18), axis.text.y = element_text(size=18))
errors_dotplot 

#Mel truth
errors_dotplot<-ggplot(data=df2) +
  geom_dotplot(mapping = aes(x=as.factor(Meltruth), y=B_DL), binwidth=.0012,binaxis='y') + scale_fill_brewer(palette="Paired") + theme_classic() + 
  labs(x="[Mel] (mg/mL) Truth", y ="B Deep Learning") +
  theme(text = element_text(size=20))  + scale_colour_manual(values = cols) + theme(legend.position = "none") +
  theme(axis.text.x = element_text(size=18), axis.text.y = element_text(size=18))
errors_dotplot


# BVF
BVF_BVF <- cor.test(predictresults$BVF.true, predictresults$BVF.DL, 
                  method = "pearson")
BVF_B <- cor.test(predictresults$BVF.true, predictresults$B.DL, 
                method = "pearson")
BVF_musp <- cor.test(predictresults$BVF.true, predictresults$musp.DL, 
                method = "pearson")
BVF_Mel <- cor.test(predictresults$BVF.true, predictresults$Mel.DL, 
                method = "pearson")
BVF_O2 <- cor.test(predictresults$BVF.true, predictresults$O2.DL, 
                method = "pearson")

BVF_BVF$estimate
BVF_musp$estimate
BVF_B$estimate
BVF_Mel$estimate
BVF_O2$estimate


# musp
musp_BVF <- cor.test(predictresults$musp.true, predictresults$BVF.DL, 
                method = "pearson")
musp_musp <- cor.test(predictresults$musp.true, predictresults$musp.DL, 
                   method = "pearson")
musp_B <- cor.test(predictresults$musp.true, predictresults$B.DL, 
                method = "pearson")
musp_Mel <- cor.test(predictresults$musp.true, predictresults$Mel.DL, 
                method = "pearson")
musp_O2 <- cor.test(predictresults$musp.true, predictresults$O2.DL, 
                method = "pearson")

musp_BVF$estimate
musp_musp$estimate
musp_B$estimate
musp_Mel$estimate
musp_O2$estimate

# B
B_BVF <- cor.test(predictresults$B.true, predictresults$BVF.DL, 
                method = "pearson")

B_musp <- cor.test(predictresults$B.true, predictresults$musp.DL, 
                method = "pearson")

B_B <- cor.test(predictresults$B.true, predictresults$B.DL, 
                  method = "pearson")

B_Mel <- cor.test(predictresults$B.true, predictresults$Mel.DL, 
                method = "pearson")

B_O2 <- cor.test(predictresults$B.true, predictresults$O2.DL, 
                method = "pearson")

B_BVF$estimate
B_musp$estimate
B_B$estimate
B_Mel$estimate
B_O2$estimate

#Mel
Mel_BVF <- cor.test(predictresults$Mel.true, predictresults$BVF.DL, 
                method = "pearson")

Mel_musp <- cor.test(predictresults$Mel.true, predictresults$musp.DL, 
                method = "pearson")

Mel_B <- cor.test(predictresults$Mel.true, predictresults$B.DL, 
                method = "pearson")

Mel_Mel <- cor.test(predictresults$Mel.true, predictresults$Mel.DL, 
                method = "pearson")

Mel_O2 <- cor.test(predictresults$Mel.true, predictresults$O2.DL, 
                method = "pearson")


Mel_BVF$estimate
Mel_musp$estimate
Mel_B$estimate
Mel_Mel$estimate
Mel_O2$estimate
#O2
O2_BVF <- cor.test(predictresults$O2.true, predictresults$BVF.DL, 
                method = "pearson")

O2_musp <- cor.test(predictresults$O2.true, predictresults$musp.DL, 
                method = "pearson")

O2_B <- cor.test(predictresults$O2.true, predictresults$B.DL, 
                method = "pearson")

O2_Mel <- cor.test(predictresults$O2.true, predictresults$Mel.DL, 
                method = "pearson")

O2_O2 <- cor.test(predictresults$O2.true, predictresults$O2.DL, 
                method = "pearson")


O2_BVF$estimate
O2_musp$estimate
O2_B$estimate
O2_Mel$estimate
O2_O2$estimate


