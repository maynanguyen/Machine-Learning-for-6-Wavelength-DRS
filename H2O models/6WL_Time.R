
library(h2o)
library(tidyverse)

h2o.init()



#datapath <- "C:/Users/Mayna/Documents/Research/Phase 1 Simulate DRS data/Phase 1 Simulate DRS data/paramsHbMuspMelOxygen_test3/6WL_DRS_ChangeAll_10ValuesH2O.csv"

#6WL
# path to file
datapathTrain <- "C:/Users/Mayna/Documents/Research/Phase 1 Simulate DRS data/Phase 1 Simulate DRS data/paramsHbMuspMelOxygen_test3/6WL_DRS_ChangeAll_10Values Data Sets/6WL_DRS_ChangeAll_10ValuesTrain70H2O.csv"
datapathTest <- "C:/Users/Mayna/Documents/Research/Phase 1 Simulate DRS data/Phase 1 Simulate DRS data/paramsHbMuspMelOxygen_test3/6WL_DRS_ChangeAll_10Values Data Sets/6WL_DRS_ChangeAll_10ValuesTest30H2O.csv"


# Load data into H2O
train <-h2o.importFile(path = datapathTrain)
test <-h2o.importFile(path = datapathTest)
#subset
trainDataSubset = train[1:10000,]
#trainDataSubset = train


varNames <- names(train)
varNames <- varNames[!varNames %in% c("BVF", "musp", "B", "Mel", "O2")]

x <- varNames #wavelengths


#build models
BVF.deeplearning = h2o.deeplearning(y = "BVF", x = x, training_frame = trainDataSubset)
musp.deeplearning = h2o.deeplearning(y = "musp", x = x, training_frame = trainDataSubset)
B.deeplearning = h2o.deeplearning(y = "B", x = x, training_frame = trainDataSubset)
Mel.deeplearning = h2o.deeplearning(y = "Mel", x = x, training_frame = trainDataSubset)
O2.deeplearning = h2o.deeplearning(y = "O2", x = x, training_frame = trainDataSubset)

BVF.rf = h2o.randomForest(y = "BVF", x = x, training_frame = trainDataSubset)
musp.rf = h2o.randomForest(y = "musp", x = x, training_frame = trainDataSubset)
B.rf = h2o.randomForest(y = "B", x = x, training_frame = trainDataSubset)
Mel.rf = h2o.randomForest(y = "Mel", x = x, training_frame = trainDataSubset)
O2.rf = h2o.randomForest(y = "O2", x = x, training_frame = trainDataSubset)


BVF.gbm = h2o.gbm(y = "BVF", x = x, training_frame = trainDataSubset)
musp.gbm = h2o.gbm(y = "musp", x = x, training_frame = trainDataSubset)
B.gbm = h2o.gbm(y = "B", x = x, training_frame = trainDataSubset)
Mel.gbm = h2o.gbm(y = "Mel", x = x, training_frame = trainDataSubset)
O2.gbm = h2o.gbm(y = "O2", x = x, training_frame = trainDataSubset)

BVF.glm = h2o.glm(y = "BVF", x = x, training_frame = trainDataSubset)
musp.glm = h2o.glm(y = "musp", x = x, training_frame = trainDataSubset)
B.glm = h2o.glm(y = "B", x = x, training_frame = trainDataSubset)
Mel.glm = h2o.glm(y = "Mel", x = x, training_frame = trainDataSubset)
O2.glm = h2o.glm(y = "O2", x = x, training_frame = trainDataSubset)



#dataframenames = c("Run #", "DL Time", "RF Time", "GBM Time", "GLM Time")
#time = as.data.frame(matrix(numeric(),nrow = 0, ncol = length(dataframenames)))
#colnames(time) = dataframenames

dataframenames = c("DL Time")
DLtime = as.data.frame(matrix(numeric(),nrow = 0, ncol = length(dataframenames)))
colnames(DLtime) = dataframenames


testDataSubset <- as.data.frame(test)
testDataSubset<-testDataSubset[sample(nrow(testDataSubset), 100), ]

for (i in 1:50){
#DL
  
  testDataSubset <- as.data.frame(test)
  testDataSubset <-testDataSubset[sample(nrow(testDataSubset), 100), ] # change this for number of spectra 1, 10, 50, 100
  testDataSubset <-as.h2o(testDataSubset)
  

  startTime = Sys.time()
    BVFpredDL <- h2o.predict(BVF.deeplearning, testDataSubset)
    musppredDL <- h2o.predict(musp.deeplearning, testDataSubset)
    BpredDL <- h2o.predict(B.deeplearning, testDataSubset)
    MelpredDL <- h2o.predict(Mel.deeplearning, testDataSubset)
    O2predDL <- h2o.predict(O2.deeplearning, testDataSubset)
    DL_time <- Sys.time() - startTime
    
       timeAppend = data.frame("DL Time" = DL_time )
       DLtime = rbind(DLtime,timeAppend)
}

#RF

dataframenames = c("RF Time")
RFtime = as.data.frame(matrix(numeric(),nrow = 0, ncol = length(dataframenames)))
colnames(RFtime) = dataframenames

for (i in 1:50){
  
  testDataSubset <- as.data.frame(test)
  testDataSubset <-testDataSubset[sample(nrow(testDataSubset), 100), ]
  testDataSubset <-as.h2o(testDataSubset)


startTime = Sys.time()
BVFpredRF <- h2o.predict(BVF.rf, testDataSubset)
musppredRF <- h2o.predict(musp.rf, testDataSubset)
BpredRF <- h2o.predict(B.rf, testDataSubset)
MelpredRF <- h2o.predict(Mel.rf, testDataSubset)
O2predRF <- h2o.predict(O2.rf, testDataSubset)
RF_time <- Sys.time() - startTime

timeAppend = data.frame("RF Time" = RF_time )
RFtime = rbind(RFtime,timeAppend)
}

#GBM
dataframenames = c("RF Time")
RFtime = as.data.frame(matrix(numeric(),nrow = 0, ncol = length(dataframenames)))
colnames(RFtime) = dataframenames

for (i in 1:50){
  
  testDataSubset <- as.data.frame(test)
  testDataSubset <-testDataSubset[sample(nrow(testDataSubset), 100), ]
  testDataSubset <-as.h2o(testDataSubset)
  
startTime = Sys.time()
BVFpredGBM <- h2o.predict(BVF.gbm, testDataSubset)
musppredGBM <- h2o.predict(musp.gbm, testDataSubset)
BpredGBM <- h2o.predict(B.gbm, testDataSubset)
MelpredGBM <- h2o.predict(Mel.gbm, testDataSubset)
O2predGBM <- h2o.predict(O2.gbm, testDataSubset)
GBM_time <- Sys.time() - startTime

timeAppend = data.frame("RF Time" = GBM_time )
RFtime = rbind(RFtime,timeAppend)

}
#GLM
dataframenames = c("RF Time")
RFtime = as.data.frame(matrix(numeric(),nrow = 0, ncol = length(dataframenames)))
colnames(RFtime) = dataframenames

for (i in 1:50){
  
  testDataSubset <- as.data.frame(test)
  testDataSubset <-testDataSubset[sample(nrow(testDataSubset), 100), ]
  testDataSubset <-as.h2o(testDataSubset)
  
startTime = Sys.time()
BVFpredGLM <- h2o.predict(BVF.glm, testDataSubset)
musppredGLM <- h2o.predict(musp.glm, testDataSubset)
BpredGLM <- h2o.predict(B.glm, testDataSubset)
MelpredGLM <- h2o.predict(Mel.glm, testDataSubset)
O2predGLM <- h2o.predict(O2.glm, testDataSubset)
GLM_time <- Sys.time() - startTime

timeAppend = data.frame("RF Time" = GLM_time )
RFtime = rbind(RFtime,timeAppend)

}


