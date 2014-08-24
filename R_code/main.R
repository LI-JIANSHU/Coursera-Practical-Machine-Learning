Training=read.csv("pml-training.csv",header=TRUE)
Testing=read.csv("pml-testing.csv",header=TRUE)

library(caret)
inTrain=createDataPartition(y=Training$classe, p=0.8, list=FALSE)
training=Training[inTrain,]
testing=Training[-inTrain,]

field_names=names(training);
valid_names=c();
for (i in 1:length(field_names)){
   if (!is.na(mean(training[,field_names[i]])))
        valid_names=c(valid_names,field_names[i]);
}

#valid_names contains the names of fields used as predictors

modFit=train(training$classe ~ roll_belt+pitch_belt+yaw_belt+total_accel_belt+gyros_belt_x+gyros_belt_y+gyros_belt_z+accel_belt_x+accel_belt_y+accel_belt_z+magnet_belt_x+magnet_belt_y+magnet_belt_z+roll_arm+pitch_arm+yaw_arm+total_accel_arm+gyros_arm_x+gyros_arm_y+gyros_arm_z+accel_arm_x+accel_arm_y+accel_arm_z+magnet_arm_x+magnet_arm_y+magnet_arm_z+roll_dumbbell+pitch_dumbbell+yaw_dumbbell+total_accel_dumbbell+gyros_dumbbell_x+gyros_dumbbell_y+gyros_dumbbell_z+accel_dumbbell_x+accel_dumbbell_y+accel_dumbbell_z+magnet_dumbbell_x+magnet_dumbbell_y+magnet_dumbbell_z+roll_forearm+pitch_forearm+yaw_forearm+total_accel_forearm+gyros_forearm_x+gyros_forearm_y+gyros_forearm_z+accel_forearm_x+accel_forearm_y+accel_forearm_z+magnet_forearm_x+magnet_forearm_y+magnet_forearm_z, preProcess="pca", data=training)

confusionMatrix(testing$classe, predict(modFit,testing))

predict(modFit,Testing)
