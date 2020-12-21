# Mayna Nguyen
# 4/7/2020 6WL Machine Learning Models

library(h2o)
library(tidyverse)
h2o.init()
#h2o.no_progress()  # Turn off progress bars for notebook readability
# Use local data file or download from GitHub

#datapath <- "C:/Users/Mayna/Documents/Research/Phase 1 Simulate DRS data/Phase 1 Simulate DRS data/paramsHbMuspMelOxygen_test3/6WL_DRS_ChangeAll_10ValuesH2O.csv"

#6WL
datapathTrain <- "C:/Users/Mayna/Documents/Research/Phase 1 Simulate DRS data/Phase 1 Simulate DRS data/paramsHbMuspMelOxygen_test3/6WL_DRS_Noise Data Sets/6WL_DRS_Noise_Train_70.csv"
datapathTest <- "C:/Users/Mayna/Documents/Research/Phase 1 Simulate DRS data/Phase 1 Simulate DRS data/paramsHbMuspMelOxygen_test3/6WL_DRS_Noise Data Sets/6WL_DRS_Noise_Test_30.csv"

# 100 WL
#datapathTrain <- "C:/Users/Mayna/Documents/Research/Phase 1 Simulate DRS data/Phase 1 Simulate DRS data/paramsHbMuspMelOxygen_test3/100WL_DRS_ChangeAll_new Data Sets/100WL_DRS_70Train_H2O.csv"
#datapathTest <- "C:/Users/Mayna/Documents/Research/Phase 1 Simulate DRS data/Phase 1 Simulate DRS data/paramsHbMuspMelOxygen_test3/100WL_DRS_ChangeAll_new Data Sets/100WL_DRS_30Test_H2O.csv"
  

# Load data into H2O
train <-h2o.importFile(path = datapathTrain)
test <-h2o.importFile(path = datapathTest)
#subset
#trainDataSubset = train[1:10000,]
trainDataSubset = train
#all
#trainDataSubset = train
print(train)
print(test)

varNames <- names(train)
varNames <- varNames[!varNames %in% c("BVF", "musp", "B", "Mel", "O2")]

x <- varNames #wavelengths

meanPercentError = data.frame("RandomForest" = 0, "GBM" = 0, "GLM" = 0, "DL" = 0)



# BVF

BVF.rf = h2o.randomForest(y = "BVF", x = x, training_frame = trainDataSubset)
print(BVF.rf)
BVFpredRF <- h2o.predict(BVF.rf, test)
#print(BVFpredRF)
BVFerrorRF = (test$BVF - BVFpredRF)/test$BVF * 100
BVFmeanErrorRF <- mean(abs(BVFerrorRF))


BVF.gbm = h2o.gbm(y = "BVF", x = x, training_frame = trainDataSubset)
print(BVF.gbm)
BVFpredGBM <- h2o.predict(BVF.gbm, test)
BVFerrorGBM = (test$BVF - BVFpredGBM)/test$BVF * 100
BVFmeanErrorGBM <- mean(abs(BVFerrorGBM))

BVF.glm = h2o.glm(y = "BVF", x = x, training_frame = trainDataSubset)
print(BVF.glm)
BVFpredGLM <- h2o.predict(BVF.glm, test)
BVFerrorGLM = (test$BVF - BVFpredGLM)/test$BVF * 100
BVFmeanErrorGLM <- mean(abs(BVFerrorGLM))


BVF.deeplearning = h2o.deeplearning(y = "BVF", x = x, training_frame = trainDataSubset)
print(BVF.deeplearning)
BVFpredDL <- h2o.predict(BVF.deeplearning, test)
BVFerrorDL = (test$BVF - BVFpredDL)/test$BVF * 100
BVFmeanErrorDL <-mean(abs(BVFerrorDL))

# mean percent error for each model for BVF
meanPercentErrorAppend = data.frame("RandomForest" = BVFmeanErrorRF, "GBM" = BVFmeanErrorGBM, "GLM" = BVFmeanErrorGLM, "DL" = BVFmeanErrorDL)
meanPercentError = rbind(meanPercentError,meanPercentErrorAppend)


# musp

musp.rf = h2o.randomForest(y = "musp", x = x, training_frame = trainDataSubset)
print(musp.rf)
musppredRF <- h2o.predict(musp.rf, test)
musperrorRF = (test$musp - musppredRF)/test$musp * 100
muspmeanErrorRF <- mean(abs(musperrorRF))

musp.gbm = h2o.gbm(y = "musp", x = x, training_frame = trainDataSubset)
print(musp.gbm)
musppredGBM <- h2o.predict(musp.gbm, test)
musperrorGBM = (test$musp - musppredGBM)/test$musp * 100
muspmeanErrorGBM <- mean(abs(musperrorGBM))

musp.glm = h2o.glm(y = "musp", x = x, training_frame = trainDataSubset)
print(musp.glm)
musppredGLM <- h2o.predict(musp.glm, test)
musperrorGLM = (test$musp - musppredGLM)/test$musp * 100
muspmeanErrorGLM <- mean(abs(musperrorGLM))


musp.deeplearning = h2o.deeplearning(y = "musp", x = x, training_frame = trainDataSubset)
print(musp.deeplearning)
musppredDL <- h2o.predict(musp.deeplearning, test)
musperrorDL = (test$musp - musppredDL)/test$musp * 100
muspmeanErrorDL <-mean(abs(musperrorDL))

meanPercentErrorAppend = data.frame("RandomForest" = muspmeanErrorRF, "GBM" = muspmeanErrorGBM, "GLM" = muspmeanErrorGLM, "DL" = muspmeanErrorDL)
meanPercentError = rbind(meanPercentError,meanPercentErrorAppend)

# B

B.rf = h2o.randomForest(y = "B", x = x, training_frame = trainDataSubset)
print(B.rf)
BpredRF <- h2o.predict(B.rf, test)
BerrorRF = (test$B - BpredRF)/test$B * 100
BmeanErrorRF <- mean(abs(BerrorRF))

B.gbm = h2o.gbm(y = "B", x = x, training_frame = trainDataSubset)
print(B.gbm)
BpredGBM <- h2o.predict(B.gbm, test)
BerrorGBM = (test$B - BpredGBM)/test$B * 100
BmeanErrorGBM <- mean(abs(BerrorGBM))


B.glm = h2o.glm(y = "B", x = x, training_frame = trainDataSubset)
print(B.glm)
BpredGLM <- h2o.predict(B.glm, test)
BerrorGLM = (test$B - BpredGLM)/test$B * 100
BmeanErrorGLM <- mean(abs(BerrorGLM))


B.deeplearning = h2o.deeplearning(y = "B", x = x, training_frame = trainDataSubset)
print(B.deeplearning)
BpredDL <- h2o.predict(B.deeplearning, test)
BerrorDL = (test$B - BpredDL)/test$B * 100
BmeanErrorDL <-mean(abs(BerrorDL))

meanPercentErrorAppend = data.frame("RandomForest" = BmeanErrorRF, "GBM" = BmeanErrorGBM, "GLM" = BmeanErrorGLM, "DL" = BmeanErrorDL)
meanPercentError = rbind(meanPercentError,meanPercentErrorAppend)

# Mel
Mel.rf = h2o.randomForest(y = "Mel", x = x, training_frame = trainDataSubset)
print(Mel.rf)
MelpredRF <- h2o.predict(Mel.rf, test)
MelerrorRF = (test$Mel - MelpredRF)/test$Mel * 100
#MelerrorRF <- as.data.frame((MelerrorRF))
#MelerrorRF <- MelerrorRF[is.finite(rowSums(MelerrorRF)),] #don't count inf errors, this creates a separate Mel dataframe
#MelmeanErrorRF <- mean(abs(MelerrorRF))

Mel.gbm = h2o.gbm(y = "Mel", x = x, training_frame = trainDataSubset)
print(Mel.gbm)
MelpredGBM <- h2o.predict(Mel.gbm, test)
MelerrorGBM = (test$Mel - MelpredGBM)/test$Mel * 100
#MelerrorGBM <- as.data.frame((MelerrorGBM))
#MelerrorGBM <- MelerrorGBM[is.finite(rowSums(MelerrorGBM)),]
#MelmeanErrorGBM <- mean(abs(MelerrorGBM))


Mel.glm = h2o.glm(y = "Mel", x = x, training_frame = trainDataSubset)
print(Mel.glm)
MelpredGLM <- h2o.predict(Mel.glm, test)
MelerrorGLM = (test$Mel - MelpredGLM)/test$Mel * 100
#MelerrorGLM <- as.data.frame((MelerrorGLM))
#MelerrorGLM <- MelerrorGLM[is.finite(rowSums(MelerrorGLM)),]
#MelmeanErrorGLM <- mean(abs(MelerrorGLM))


Mel.deeplearning = h2o.deeplearning(y = "Mel", x = x, training_frame = trainDataSubset)
print(Mel.deeplearning)
MelpredDL <- h2o.predict(Mel.deeplearning, test)
MelerrorDL = (test$Mel - MelpredDL)/test$Mel * 100
#MelerrorDL <- as.data.frame((MelerrorDL))
#MelerrorDL <- MelerrorDL[is.finite(rowSums(MelerrorDL)),]
#MelmeanErrorDL <-mean(abs(MelerrorDL))

meanPercentErrorAppend = data.frame("RandomForest" = MelmeanErrorRF, "GBM" = MelmeanErrorGBM, "GLM" = MelmeanErrorGLM, "DL" = MelmeanErrorDL)
meanPercentError = rbind(meanPercentError,meanPercentErrorAppend)


# O2

O2.rf = h2o.randomForest(y = "O2", x = x, training_frame = trainDataSubset)
print(O2.rf)
O2predRF <- h2o.predict(O2.rf, test)
print(predRF)
O2errorRF = (test$O2 - O2predRF)/test$O2 * 100
O2meanErrorRF <- mean(abs(O2errorRF))

O2.gbm = h2o.gbm(y = "O2", x = x, training_frame = trainDataSubset)
print(O2.gbm)
O2predGBM <- h2o.predict(O2.gbm, test)
O2errorGBM = (test$O2 - O2predGBM)/test$O2 * 100
O2meanErrorGBM <- mean(abs(O2errorGBM))


O2.glm = h2o.glm(y = "O2", x = x, training_frame = trainDataSubset)
print(O2.glm)
O2predGLM <- h2o.predict(O2.glm, test)
O2errorGLM = (test$O2 - O2predGLM)/test$O2 * 100
O2meanErrorGLM <- mean(abs(O2errorGLM))


O2.deeplearning = h2o.deeplearning(y = "O2", x = x, training_frame = trainDataSubset)
print(O2.deeplearning)
O2predDL <- h2o.predict(O2.deeplearning, test)
O2errorDL = (test$O2 - O2predDL)/test$O2 * 100
O2meanErrorDL <-mean(abs(O2errorDL))

meanPercentErrorAppend = data.frame("RandomForest" = O2meanErrorRF, "GBM" = O2meanErrorGBM, "GLM" = O2meanErrorGLM, "DL" = O2meanErrorDL)
meanPercentError = rbind(meanPercentError,meanPercentErrorAppend)

write.csv(meanPercentError, "meanPercentErrorH2O_6WL_noise.csv", row.names = F)

# ALL errors dataframe/csv
BVFerrorRF_DF = as.data.frame(BVFerrorRF)
BVFerrorGBM_DF = as.data.frame(BVFerrorGBM)
BVFerrorGLM_DF = as.data.frame(BVFerrorGLM)
BVFerrorDL_DF = as.data.frame(BVFerrorDL)

musperrorRF_DF = as.data.frame(musperrorRF)
musperrorGBM_DF = as.data.frame(musperrorGBM)
musperrorGLM_DF = as.data.frame(musperrorGLM)
musperrorDL_DF = as.data.frame(musperrorDL)

BerrorRF_DF = as.data.frame(BerrorRF)
BerrorGBM_DF = as.data.frame(BerrorGBM)
BerrorGLM_DF = as.data.frame(BerrorGLM)
BerrorDL_DF = as.data.frame(BerrorDL)

MelerrorRF_DF = as.data.frame(MelerrorRF)
MelerrorGBM_DF = as.data.frame(MelerrorGBM)
MelerrorGLM_DF = as.data.frame(MelerrorGLM)
MelerrorDL_DF = as.data.frame(MelerrorDL)

O2errorRF_DF = as.data.frame(O2errorRF)
O2errorGBM_DF = as.data.frame(O2errorGBM)
O2errorGLM_DF = as.data.frame(O2errorGLM)
O2errorDL_DF = as.data.frame(O2errorDL)

errorsBVF <- cbind(BVFerrorRF_DF, BVFerrorGBM_DF, BVFerrorGLM_DF, BVFerrorDL_DF)
names(errorsBVF)<-c("BVF.RF", "BVF.GBM", "BVF.GLM", "BVF.DL")

errorsmusp <-cbind(musperrorRF_DF, musperrorGBM_DF, musperrorGLM_DF, musperrorDL_DF)
names(errorsmusp)<-c("musp.RF", "musp.GBM", "musp.GLM", "musp.DL")

errorsB <- cbind(BerrorRF_DF, BerrorGBM_DF, BerrorGLM_DF, BerrorDL_DF)
names(errorsB)<-c("B.RF", "B.GBM", "B.GLM", "B.DL")

errorsMel <-cbind(MelerrorRF_DF, MelerrorGBM_DF, MelerrorGLM_DF, MelerrorDL_DF)
names(errorsMel)<-c("Mel.RF", "Mel.GBM", "Mel.GLM", "Mel.DL")

errorsO2 <- cbind(O2errorRF_DF, O2errorGBM_DF, O2errorGLM_DF, O2errorDL_DF)
names(errorsO2)<-c("O2.RF", "O2.GBM", "O2.GLM", "O2.DL")

write.csv(errorsBVF, "BVFerrors.csv", row.names = F)
write.csv(errorsmusp, "musperrors.csv", row.names = F)
write.csv(errorsB, "Berrors.csv", row.names = F)
write.csv(errorsMel, "Melerrors.csv", row.names = F)
write.csv(errorsO2, "O2errors.csv", row.names = F)

# prediction results - save as dataframe


bvf_dataframe <-as.data.frame(test$BVF)
musp_dataframe <- as.data.frame(test$musp) 
B_dataframe <- as.data.frame(test$B)
O2_dataframe <- as.data.frame(test$O2)
Mel_dataframe <- as.data.frame(test$Mel)

bvf_predDL_dataframe <- as.data.frame(BVFpredDL)
musp_predDL_dataframe <-as.data.frame(musppredDL)
B_predDL_dataframe <- as.data.frame(BpredDL)
O2_predDL_dataframe <- as.data.frame(O2predDL)
Mel_predDL_dataframe <-as.data.frame(MelpredDL)

bvf_predRF_dataframe <-as.data.frame(BVFpredRF)
musp_predRF_dataframe <-as.data.frame(musppredRF)
B_predRF_dataframe <- as.data.frame(BpredRF)
O2_predRF_dataframe <- as.data.frame(O2predRF)
Mel_predRF_dataframe <-as.data.frame(MelpredRF)

bvf_predGBM_dataframe <-as.data.frame(BVFpredGBM)
musp_predGBM_dataframe <-as.data.frame(musppredGBM)
B_predGBM_dataframe <- as.data.frame(BpredGBM)
O2_predGBM_dataframe <- as.data.frame(O2predGBM)
Mel_predGBM_dataframe <-as.data.frame(MelpredGBM)

bvf_predGLM_dataframe <-as.data.frame(BVFpredGLM)
musp_predGLM_dataframe <-as.data.frame(musppredGLM)
B_predGLM_dataframe <- as.data.frame(BpredGLM)
O2_predGLM_dataframe <- as.data.frame(O2predGLM)
Mel_predGLM_dataframe <-as.data.frame(MelpredGLM)

#label columns in dataframe
BVFresults_df <- cbind(bvf_dataframe, bvf_predRF_dataframe, bvf_predGBM_dataframe, bvf_predGLM_dataframe, bvf_predDL_dataframe)
names(BVFresults_df)[2]<-"BVF.RF"
names(BVFresults_df)[3]<-"BVF.GBM"
names(BVFresults_df)[4]<-"BVF.GLM"
names(BVFresults_df)[5]<-"BVF.DL"

muspresults_df <- cbind(musp_dataframe, musp_predRF_dataframe, musp_predGBM_dataframe, musp_predGLM_dataframe, musp_predDL_dataframe)
names(muspresults_df)[2]<-"musp.RF"
names(muspresults_df)[3]<-"musp.GBM"
names(muspresults_df)[4]<-"musp.GLM"
names(muspresults_df)[5]<-"musp.DL"

Bresults_df <- cbind(B_dataframe, B_predRF_dataframe, B_predGBM_dataframe, B_predGLM_dataframe, B_predDL_dataframe)
names(Bresults_df)[2]<-"B.RF"
names(Bresults_df)[3]<-"B.GBM"
names(Bresults_df)[4]<-"B.GLM"
names(Bresults_df)[5]<-"B.DL"

O2results_df <- cbind(O2_dataframe, O2_predRF_dataframe, O2_predGBM_dataframe, O2_predGLM_dataframe, O2_predDL_dataframe)
names(O2results_df)[2]<-"O2.RF"
names(O2results_df)[3]<-"O2.GBM"
names(O2results_df)[4]<-"O2.GLM"
names(O2results_df)[5]<-"O2.DL"

Melresults_df <- cbind(Mel_dataframe, Mel_predRF_dataframe, Mel_predGBM_dataframe, Mel_predGLM_dataframe, Mel_predDL_dataframe)
names(Melresults_df)[2]<-"Mel.RF"
names(Melresults_df)[3]<-"Mel.GBM"
names(Melresults_df)[4]<-"Mel.GLM"
names(Melresults_df)[5]<-"Mel.DL"

# Prediction Results as .csv files
write.csv(BVFresults_df, "BVFresultsH2O_noise.csv", row.names = F)
write.csv(muspresults_df, "muspresultsH2O_noise.csv", row.names = F)
write.csv(Bresults_df, "BresultsH2O_noise.csv", row.names = F)
write.csv(O2results_df, "O2resultsH2O_noise.csv", row.names = F)
write.csv(Melresults_df, "MelresultsH2O_noise.csv", row.names = F)


#save.image()

#Visualize results
bvf <- ggplot(data = results_df)+
  geom_point(mapping = aes(x = BVF, y = BVF.Predict), position = position_jitter(width = .0015)) + ggtitle("Blood Volume Fraction Prediction VS. Ground Truth")
bvf

musp <- ggplot(data = results_df)+
  geom_point(mapping = aes(x = musp, y = musp.Predict), position = position_jitter(width = .0015)) + ggtitle("Reduced Scattering Coefficient Prediction VS. Ground Truth")
musp

B <- ggplot(data = results_df)+
  geom_point(mapping = aes(x = B, y = B.Predict), position = position_jitter(width = .0015)) + ggtitle("Reduced Scattering Exponent Prediction VS. Ground Truth")
B

O2 <- ggplot(data = results_df)+
  geom_point(mapping = aes(x = O2, y = O2.Predict), position = position_jitter(width = .0015)) + ggtitle("Oxygen Saturation Prediction VS. Ground Truth")
O2

Mel <- ggplot(data = results_df)+
  geom_point(mapping = aes(x = Mel, y = Mel.Predict), position = position_jitter(width = .0015)) + ggtitle("Melanin Prediction VS. Ground Truth")
Mel

# box plot

bvf <- ggplot(data = results_df)+
  geom_boxplot(mapping = aes(x = factor(BVF), y = BVF.Predict)) + ggtitle("Blood Volume Fraction Prediction VS. Ground Truth") + xlab("BVF Truth") + ylab("BVF Predict")
bvf

musp <- ggplot(data = results_df)+
  geom_boxplot(mapping = aes(x = factor(musp), y = musp.Predict)) + ggtitle("Reduced Scattering Coefficient Prediction VS. Ground Truth") + xlab("musp Truth") + ylab("musp Predict")
musp

B <- ggplot(data = results_df)+
  geom_boxplot(mapping = aes(x = factor(B), y = B.Predict)) + ggtitle("Reduced Scattering Exponent Prediction VS. Ground Truth") +  xlab("B Truth") + ylab("B Predict")
B

O2 <- ggplot(data = results_df)+
  geom_boxplot(mapping = aes(x = factor(O2), y = O2.Predict)) + ggtitle("Oxygen Saturation Prediction VS. Ground Truth") +  xlab("O2 Truth") + ylab("O2 Predict")
O2

# violin
bvf <- ggplot(data = results_df)+
  geom_violin( mapping = aes(x = factor(BVF), y = BVF.Predict)) + ggtitle("Blood Volume Fraction Prediction VS. Ground Truth") + xlab("BVF Truth") + ylab("BVF Predict") + theme_bw(base_size = 15) +
  theme(text = element_text(size=17))
bvf

musp <- ggplot(data = results_df)+
  geom_violin(mapping = aes(x = factor(musp), y = musp.Predict)) + ggtitle("Reduced Scattering Coefficient Prediction \nVS. Ground Truth") + xlab("musp Truth") + ylab("musp Predict") + theme_bw(base_size = 12) + theme(text = element_text(size=17))
musp

B <- ggplot(data = results_df)+
  geom_violin(mapping = aes(x = factor(B), y = B.Predict)) + ggtitle("Reduced Scattering Exponent Prediction \nVS. Ground Truth") +  xlab("B Truth") + ylab("B Predict") + theme_bw(base_size = 12) + theme(text = element_text(size=17))
B

O2 <- ggplot(data = results_df)+
  geom_violin(mapping = aes(x = factor(O2), y = O2.Predict)) + ggtitle("Oxygen Saturation Prediction VS. Ground Truth") +  xlab("O2 Truth") + ylab("O2 Predict") + theme_bw(base_size = 15) + theme(text = element_text(size=17))
O2

Mel <- ggplot(data = results_df)+
  geom_violin(mapping = aes(x = factor(Mel), y = Mel.Predict)) + ggtitle("Melanin Concentration VS. Ground Truth") +  xlab("Melanin Truth") + ylab("Melanin Predict") + theme_bw(base_size = 15) + theme(text = element_text(size=17))
Mel




