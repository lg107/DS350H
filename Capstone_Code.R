---
#title: "Capstone_Code"
#author: "Lucia Gurrieri"
#date: "2024-03-13"
#output: R file
---
  
##### Install Packages ----
install.packages("dplyr")                           # Install dplyr package
library("dplyr")                                    # Load dplyr package

install.packages("MASS") 
library(MASS)

library(usdm)

install.packages("rjson")
library("rjson")

install.packages("stringr")
library("stringr")

install.packages("ggplot2")
library("ggplot2")


##### Upload files -----

## Upload Eni's data from CSV -----
eni_data <- data.frame(read.csv("C:/Users/Lucia/Desktop/Capstone/Data/all_posts_EM.csv", header=TRUE))

# Read Eni's JSON file
#eni_json <- fromJSON(file="C:/Users/Lucia/Desktop/Capstone/Data/videos-EM copy.json")

# Add timestamps and timedifference column to data frame
#eni_data$time_viewed <- rep(NA)

# for (ii in 1:nrow(eni_data)) {
#   current_id = eni_data[ii,1]
#   current_time = eni_data[ii,2]
#   
#   for (jj in 1:length(eni_json)) {
#     url = eni_json[[jj]]$Link
#     vid_id = str_sub(url, 37, 55)
#     vid_id = as.numeric(vid_id)
#     
#     if ((current_id==vid_id)==TRUE) {
#       time = eni_json[[jj]]$Date
#       eni_data[ii,21] <- time
#       
#       difftime_hr = abs(difftime(current_time, time, units="hours"))
#       eni_data[ii,22] <- difftime_hr
#       
#       eni_json <- eni_json[-jj]
#       cat("next",ii, jj, "\n")
#       break
#     }
#   }
# } #DO NOT USE

eni_data$time_collected <- rep(NA)
##FIND WHEN THIS HAPPENED
eni_data$time_collected <- rep("2024-03-07T12:00:00")

eni_data$time_diff <- rep(NA)
for (ii in 1:nrow(eni_data)) {
  current_time <- eni_data[ii,21]
  time_posted <- eni_data[ii,2]
  difftime_hr = abs(difftime(current_time, time_posted, units="hours"))
  eni_data[ii,22] <- difftime_hr
}

sum(is.na(eni_data$video_playcount))
eni_data <- eni_data[-which(is.na(eni_data$video_playcount)),]
#eni_data <- eni_data[-which(is.na(eni_data$time_viewed)),]

# Calculate Eni's viewrate
eni_data$viewrate <- rep(NA) # view rate in plays/hour

for (ii in 1:nrow(eni_data)) {
  currentplay <- eni_data[ii,9]
  currenttime <- eni_data[ii,22]
  current_viewrate <- currentplay / currenttime
  eni_data[ii,23] <- current_viewrate
}

## Upload LG's data from CSV -----
lg_data <- data.frame(read.csv("C:/Users/Lucia/Desktop/Capstone/Data/results_12345(19019 rows).csv", header=TRUE))

# Read LG's JSON file
#lg_json <- fromJSON(file="C:/Users/Lucia/Desktop/Capstone/Data/Sec1Gr1_12345 (1).json")
#lg_json <- lg_json[3]
#lg_json <- lg_json$data

# Add timestamps and timedifference column to data frame
#lg_data$time_viewed <- rep(NA)

# for (ii in 1:nrow(lg_data)) {
#   current_id = lg_data[ii,1]
#   current_time = lg_data[ii,2]
# 
#   for (jj in 1:length(lg_json)) {
#     current_json = lg_json[[jj]]
#     url = current_json[2]
#     vid_id = str_sub(url, 37, 55)
#     vid_id = as.numeric(vid_id)
#     
#     if ((current_id==vid_id)==TRUE) {
#       time = current_json[1]
#       lg_data[ii,21] <- time
#       
#       difftime_hr = abs(difftime(current_time, time, units="hours"))
#       lg_data[ii,22] <- difftime_hr
#       
#       lg_json <- lg_json[-jj]
#       cat("next",ii, jj, "\n")
#       break
#     }
#   }
# } #DO NOT RUN THIS

lg_data$time_collected <- rep(NA)
lg_data$time_collected <- rep("2024-03-11T12:00:00")

lg_data$time_diff <- rep(NA)
for (ii in 1:nrow(lg_data)) {
  current_time <- lg_data[ii,21]
  time_posted <- lg_data[ii,2]
  difftime_hr = abs(difftime(current_time, time_posted, units="hours"))
  lg_data[ii,22] <- difftime_hr
}

sum(is.na(lg_data$video_playcount))
lg_data <- lg_data[-which(is.na(lg_data$video_playcount)),]

sum(is.na(lg_data$time_collected))

# Calculate LG's viewrate
lg_data$viewrate <- rep(NA) # view rate in plays/hour

for (ii in 1:nrow(lg_data)) {
  currentplay <- lg_data[ii,9]
  currenttime <- lg_data[ii,22]
  current_viewrate <- currentplay / currenttime
  lg_data[ii,23] <- current_viewrate
}

## Upload T data from CSV -----
t_data <- data.frame(read.csv("C:/Users/Lucia/Desktop/Capstone/Data/results_10824.2 (1).csv", header=TRUE))

# Read T's JSON file
#t_json <- fromJSON(file="C:/Users/Lucia/Desktop/Capstone/Data/Sec1Gr1_10824 (1).json")
#t_json <- t_json[3]
#t_json <- t_json$data

# Add timestamps and timedifference column to data frame
#t_data$time_viewed <- rep(NA)
# for (ii in 1:nrow(t_data)) {
#   current_id = t_data[ii,1]
#   current_time = t_data[ii,2]
#   
#   for (jj in 1:length(t_json)) {
#     current_json = t_json[[jj]]
#     url = current_json[2]
#     vid_id = str_sub(url, 37, 55)
#     vid_id = as.numeric(vid_id)
#     
#     if ((current_id==vid_id)==TRUE) {
#       time = current_json[1]
#       t_data[ii,21] <- time
#       
#       difftime_hr = abs(difftime(current_time, time, units="hours"))
#       t_data[ii,22] <- difftime_hr
#       
#       t_json <- t_json[-jj]
#       cat("next",ii, jj, "\n")
#       break
#     }
#   }
# } #Do Not RUN THIS

t_data$time_collected <- rep(NA)
t_data$time_collected <- rep("2024-03-11T12:00:00")

t_data$time_diff <- rep(NA)
for (ii in 1:nrow(t_data)) {
  current_time <- t_data[ii,21]
  time_posted <- t_data[ii,2]
  difftime_hr = abs(difftime(current_time, time_posted, units="hours"))
  t_data[ii,22] <- difftime_hr
}

sum(is.na(t_data$video_playcount))
t_data <- t_data[-which(is.na(t_data$video_playcount)),]

sum(is.na(t_data$time_collected))
#t_data <- t_data[-which(is.na(t_data$time_viewed)),]

# Calculate T's viewrate
t_data$viewrate <- rep(NA) # view rate in plays/hour

for (ii in 1:nrow(t_data)) {
  currentplay <- t_data[ii,8]
  currenttime <- t_data[ii,22]
  current_viewrate <- currentplay / currenttime
  t_data[ii,23] <- current_viewrate
}

## Upload Q data from CSV -----
q_data <- data.frame(read.csv("C:/Users/Lucia/Desktop/Capstone/Data/results_50405.csv", header=TRUE))

# Read Q's JSON file
#q_json <- fromJSON(file="C:/Users/Lucia/Desktop/Capstone/Data/Sec1Gr1_50405.json")
#q_json <- q_json[3]
#q_json <- q_json$data

# Add timestamps and timedifference column to data frame
#q_data$time_viewed <- rep(NA)
#q_data$time_diff <- rep(NA)

# for (ii in 1:nrow(q_data)) {
#   current_id = q_data[ii,1]
#   current_time = q_data[ii,2]
#   
#   for (jj in 1:length(q_json)) {
#     current_json = q_json[[jj]]
#     url = current_json[2]
#     vid_id = str_sub(url, 37, 55)
#     vid_id = as.numeric(vid_id)
#     
#     if ((current_id==vid_id)==TRUE) {
#       time = current_json[1]
#       q_data[ii,21] <- time
#       
#       difftime_hr = abs(difftime(current_time, time, units="hours"))
#       q_data[ii,22] <- difftime_hr
#       
#       q_json <- q_json[-jj]
#       cat("next",ii, jj, "\n")
#       break
#     }
#   }
# } #DO NOT USE

q_data$time_collected <- rep(NA)
q_data$time_collected <- rep("2024-03-11T12:00:00")

q_data$time_diff <- rep(NA)
for (ii in 1:nrow(q_data)) {
  current_time <- q_data[ii,21]
  time_posted <- q_data[ii,2]
  difftime_hr = abs(difftime(current_time, time_posted, units="hours"))
  q_data[ii,22] <- difftime_hr
}

sum(is.na(q_data$video_playcount))
q_data <- q_data[-which(is.na(q_data$video_playcount)),]

sum(is.na(q_data$time_viewed))
#q_data <- q_data[-which(is.na(q_data$time_viewed)),]

# Calculate Q's viewrate
q_data$viewrate <- rep(NA) # view rate in plays/hour

for (ii in 1:nrow(q_data)) {
  currentplay <- q_data[ii,8]
  currenttime <- q_data[ii,22]
  current_viewrate <- currentplay / currenttime
  q_data[ii,23] <- current_viewrate
}

## Combine all data -----
master <- rbind(eni_data, lg_data)
master <- rbind(master, t_data)
master <- rbind(master, q_data)

# Check no. NA in column
for (ii in 1:ncol(master)) {
  print(sum(is.na(master[,ii])))
}

rownames(master) <- 1:nrow(master)

all_ids <- c()

for (ii in 1:nrow(master)) {
  current <- master[ii,1]
  if ((current %in% all_ids)==FALSE) {
    all_ids <- append(all_ids, current)
  }
  else if (current %in% all_ids) {
    master <- master[-ii,]
  }
}


#####
write.csv(master[1:23], "C:/Users/Lucia/Desktop/Capstone/master_tiktok.csv")
##### Clean hashtags -----

## Create Hashtag columns -----
master$hashtags = rep(NA)

for (jj in 1:nrow(master)) {          #Iterate through rows in dataframe
  x = master[jj,10]
  testlist = strsplit(x, split = " ")
  testlist = testlist[[1]]
  cat(jj, "test list created", "\n")
  hashtaglist = c()
  hashtags_clean = c()
  
  if (length(testlist)==0) {          #account for empty descriptions
    master[jj,24][[1]] = list(c("No video description"))
  }
  else {
    
    for (ii in 1:length(testlist)) {  #Iterate through testlist to find hashtags
      current = testlist[ii]
      current1 <- substr(current, 1,1)
      if (current1=="#") {            #find items where # is the first character
        hashtaglist = append(hashtaglist, current)     #Create list of hashtags in row description
      }
    }
    
    if (length(hashtaglist)==0) {     #Account for descriptions without hashtags
      master[jj,24][[1]] = list(c("No hashtags"))
    }
    else {                            #Add hashtagslist to row  
      cat(jj, "add hashtaglist", "\n")
      new_hashtaglist = hashtaglist
      
      for (kk in 1:length(new_hashtaglist)) { #separate hashtags without space separators
        currenthash <- new_hashtaglist[kk]
        newhash <- strsplit(currenthash, split = "#")
        newhash_list <- newhash[[1]]
        for (hh in 1:length(newhash_list)) { #create new list of separated hashtags
          if (newhash_list[hh] != "") {      #account for empty strings
            hashtags_clean <- append(hashtags_clean, newhash_list[hh])
          }
        }
      }
      #cat(jj, hashtags_clean, "\n")
      master[jj,24][[1]] = list(hashtags_clean)
    }
  }
}

## Create hashtag lists -----

allhashtags <- c()  #List of all hashtags
hashtag4 <- c()     #bottom quantile
hashtag3 <- c()     #3rd quantile
hashtag2 <- c()     #2nd quantile
hashtag1 <- c()     #top quantile

quantile(master$viewrate, na.rm=TRUE)

for (ii in 1:nrow(master)) {
  current <- master$hashtags[[ii]]
  print(ii)
  
  for (jj in 1:length(current)) {
    allhashtags <- append(allhashtags, current[jj])
  }
  
  if ((master[ii, 23] <= 22.85714)==TRUE) {
    for (aa in 1:length(current)) {
      hashtag4 <- append(hashtag4, current[aa])
    }
  }
  else if ((master[ii, 23] <= 437.81991)==TRUE) {
    for (bb in 1:length(current)) {
      hashtag3 <- append(hashtag3, current[bb])
    }
  }
  else if ((master[ii, 23] <= 2219.94536)==TRUE) {
    for (cc in 1:length(current)) {
      hashtag2 <- append(hashtag2, current[cc])
    }
  }
  else if ((master[ii, 23] <= 521073.55865)==TRUE) {
    for (dd in 1:length(current)) {
      hashtag1 <- append(hashtag1, current[dd])
    }
  }
}

#####

##### Model quantitative and categorical variables -----
## Create new dataset with quant var -----
quants <- master[c(3,6:8,11,20,23)]
rownames(quants) <- 1:nrow(quants)

for (ii in 1:ncol(quants)) {
  print(sum(is.na(quants[,ii])))
}
hist(quants$viewrate)

## Test for Multicollinearity -----
xmatreg <- cbind(quants[,c(1:4)])
cor(xmatreg)
vifstep(xmatreg) #No multicollinearity issue

## Regress playcount on all other quants variables -----
attach(quants)

regression = lm(viewrate~., data=quants)
summary(regression) #adjR2 = 0.3667

## Model using stepwise AIC -----
model.AIC = step(regression, .~.^2, direction="both", k = 2)
summary(model.AIC) #adjR2 = 0.3813 with 18 parameters

## Model using stepwise BIC -----
model.BIC = step(regression, .~.^2, direction="both", k = log(length(quants$viewrate)))
summary(model.BIC) #adjR2 = 0.3812 with 17 parameters

plot(x=model.BIC$fitted.values, y=quants$viewrate)
abline(lm(quants$viewrate~model.BIC$fitted.values))

#choose BIC
#do PRESS if have time later

## Remove outliers -----
summary(model.BIC)

#Check for outliers wrt y
qt(0.025, df=(41831-1))
sum(abs(rstudent(model.BIC))>1.960021, na.rm=TRUE) #911

#Check for outliers wrtx
cutoff <- 2 * (17/41831)
sum(hatvalues(model.BIC)>cutoff, na.rm=TRUE) #2039

#Identify influential observations
cooksD <- cooks.distance(model.BIC)

influential <- as.numeric(names(cooksD)[(cooksD > (4/41849))])
sum(is.na(influential))
influential <- influential[-which(is.na(influential))]

influential.obs <- quants[influential,]

no_outliers = quants[-influential,]
rownames(no_outliers) <- 1:nrow(no_outliers)

## take out values and refit the model -----
regression2 = lm(no_outliers$viewrate~., data=no_outliers)
summary(regression2) #radj2 = 0.4619

model.AIC2 = step(regression2, .~.^2, direction="both", k = 2)
summary(model.AIC2) #radj2 = 0.4672 on 19 parameters

model.BIC2 = step(regression2, .~.^2, direction="both", k = log(length(no_outliers$viewrate)))
summary(model.BIC2) #adjR2 = 0.4663 on 12 parameters

cor(y=no_outliers$viewrate, x=no_outliers$video_duration)   # = -0.02
cor(y=no_outliers$viewrate, x=no_outliers$video_diggcount)  # = 0.66
cor(y=no_outliers$viewrate, x=no_outliers$video_sharecount) # = 0.29
cor(y=no_outliers$viewrate, x=no_outliers$video_commentcount) # = 0.52

## Check model assumptions -----
plot(x=model.BIC2$fitted.values, y=no_outliers$viewrate,
     xlim = c(-6500,80000),
     ylim = c(0,65000),
     main = c("Regression Plot"),
     xlab = c("Fitted Values"),
     ylab = c("View Rate"),
     las=0.75)
abline(lm(no_outliers$viewrate~model.BIC2$fitted.values))

# Check linearity
plot(model.BIC2$residuals)
# different variation across X, does not pass constant variance
# no trend in residuals, so passes independence of errors
qqnorm(model.BIC2$residuals)
qqline(model.BIC2$residuals)
# does not pass normality of errors

#####

##### Analyze hashtags -----

## All hashtags -----
length(allhashtags)
table_allhashtags <- table(allhashtags)
allhash_common = sort(table_allhashtags,decreasing=TRUE)[1:5]
      
length(hashtag1)                                                   
table_hashtag1 <- table(hashtag1)
hashtag1_common <- sort(table_hashtag1,decreasing=TRUE)[1:20]

length(hashtag2)
table_hashtag2 <- table(hashtag2)
hashtag2_common <- sort(table_hashtag2,decreasing=TRUE)[1:20]

length(hashtag3)
table_hashtag3 <- table(hashtag3)
hashtag3_common <- sort(table_hashtag3,decreasing=TRUE)[1:20]

length(hashtag4)
table_hashtag4 <- table(hashtag4)
hashtag4_common <- sort(table_hashtag4,decreasing=TRUE)[1:20]

## Clean hashtags -----
sort(table_allhashtags,decreasing=TRUE)[1:50]

ultra_common <- c("fyp", "foryou", "viral", "fypシ", "foryoupage", "trending",
                  "fypシ゚viral", "stitch", "xyzbca", "viralvideo", "relatable",
                  "fy", "goviral", "tiktok", "trend", "fypage", "blowthisup", 
                  "foryourpage", "fyppppppppppppppppppppppp", "Capcut", "xybca", 
                  "No hashtags", "No video description")

allhashtags_clean <- c()

for (ii in 1:length(allhashtags)) {
  print(ii)
  current = allhashtags[ii]
  if ((current %in% ultra_common)==FALSE) {
    allhashtags_clean <- append(allhashtags_clean, current)
  }
}

hashtag1_clean <- c()

for (ii in 1:length(hashtag1)) {
  print(ii)
  current = hashtag1[ii]
  if ((current %in% ultra_common)==FALSE) {
    hashtag1_clean <- append(hashtag1_clean, current)
  }
}

hashtag2_clean <- c()

for (ii in 1:length(hashtag2)) {
  print(ii)
  current = hashtag2[ii]
  if ((current %in% ultra_common)==FALSE) {
    hashtag2_clean <- append(hashtag2_clean, current)
  }
}

hashtag3_clean <- c()

for (ii in 1:length(hashtag3)) {
  print(ii)
  current = hashtag3[ii]
  if ((current %in% ultra_common)==FALSE) {
    hashtag3_clean <- append(hashtag3_clean, current)
  }
}

hashtag4_clean <- c()

for (ii in 1:length(hashtag4)) {
  print(ii)
  current = hashtag4[ii]
  if ((current %in% ultra_common)==FALSE) {
    hashtag4_clean <- append(hashtag4_clean, current)
  }
}

length(allhashtags_clean)
table_allhashtags_clean <- table(allhashtags_clean)
allhash_common_clean = sort(table_allhashtags_clean,decreasing=TRUE)[1:20]

length(hashtag1_clean)
table_hashtag1_clean <- table(hashtag1_clean)
hashtag1_common_clean <- sort(table_hashtag1_clean,decreasing=TRUE)[1:20]

length(hashtag2_clean)
table_hashtag2_clean <- table(hashtag2_clean)
hashtag2_common_clean <- sort(table_hashtag2_clean,decreasing=TRUE)[1:20]

length(hashtag3_clean)
table_hashtag3_clean <- table(hashtag3_clean)
hashtag3_common_clean <- sort(table_hashtag3_clean,decreasing=TRUE)[1:20]

length(hashtag4_clean)
table_hashtag4_clean <- table(hashtag4_clean)
hashtag4_common_clean <- sort(table_hashtag4_clean,decreasing=TRUE)[1:20]

#####

##### Create Visualizations -----

 
