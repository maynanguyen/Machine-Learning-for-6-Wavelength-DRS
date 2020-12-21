# train and test set creator
rm(list = ls())

# load file
filePath <- file.choose()
fileName = basename(filePath)
directory <- gsub("/", "\\\\", dirname(filePath))

# read data
inputData <- read.csv(filePath, check.names=FALSE)

# scramble the rows of the data frame
set.seed(10)
dfRandomized <- inputData [sample(nrow(inputData)),]

# split into test and train
train = 70
test = 100 - train


numOfRowsTrain = floor(train* nrow(dfRandomized) / 100)
numOfRowsTest = nrow(dfRandomized) - numOfRowsTrain

trainingSet = head(dfRandomized, numOfRowsTrain)
testingSet = tail(dfRandomized, numOfRowsTest)


# write out files
outputDirectory <- paste(directory, paste(substr(fileName,1,nchar(fileName)-4), ' Data Sets', sep = ""), sep = '\\')

if (dir.exists(outputDirectory) == FALSE){
  dir.create(outputDirectory)
} 

write.csv(trainingSet, file = paste(outputDirectory,'\\',substr(fileName,1,nchar(fileName)-4), ' Train Set ', toString(train), " Percent", '.csv', sep = ""), row.names = F)

write.csv(testingSet, file = paste(outputDirectory,'\\',substr(fileName,1,nchar(fileName)-4), ' Test Set ', toString(test), " Percent", '.csv', sep = ""), row.names = F)
  

