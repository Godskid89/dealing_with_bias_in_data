## Developer - Joseph Oladokun
## Dealing with Bias Data before training a Machine learning model

#Import your Data
yourdata <- read.csv("yourdata.csv", header = TRUE, sep = ",")


#Create Training Data
input_yes <- yourdata[which(yourdata$AfterInvestigationTrueAFP == "Yes"),]
input_no <- yourdata[which(yourdata$AfterInvestigationTrueAFP == "No"),]

#"Yes" and "No" for training
input_yes_training <- sample(1:nrow(input_yes), 0.7*nrow(input_yes))
input_no_training <- sample(1:nrow(input_no), 0.7*nrow(input_no))
training_yes <- input_yes[input_yes_training, ]
training_no <- input_no[-input_no_training, ]

#Bind the Yes and No Rows created above
training_data <- rbind(training_yes, training_no)

#Create Test Data
test_yes <- input_yes[-input_yes_training, ]
test_no <- input_no[-input_no_training, ]

#Bind the Yes and No Rows created above
testing_data <- rbind(test_yes, test_no)


##This will aggregate ensure that both test and train data contains equal number "Yes" and "No"
##This will ensure the data is devoided of Bias.