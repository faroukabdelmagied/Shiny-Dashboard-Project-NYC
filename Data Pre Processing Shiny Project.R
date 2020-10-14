#### Shiny Project --- This is the Data Preprocessing Stage:

#########################################################################################################################################################
                                                           ##### Work directory and Libraries #####
#########################################################################################################################################################

## Checking the Work Directory:
getwd()
## Loading the libraries
library(tidyverse)



#########################################################################################################################################################
                                                                ##### Uploading the Data #####
#########################################################################################################################################################

## First reading the data using the readr::read.csv function:
Recorded_Offences <- readr::read_csv('Recorded Offences.csv')
Recorded_Offences
tail(Recorded_Offences)



###################### Operating on the main Data Set as a whole ################################

## Let us Remove all the NA rows [-2, -36:-41]
Recorded_Offences <- Recorded_Offences[c(-1:-2,-38:-41),]
Recorded_Offences


### Data structure analysis

## Checking the coloumn names:
colnames(Recorded_Offences)


##### Dividing the data set into data structures based on the type of offences: 10 Types

### Selecting the different types of Offences from the data set:
All_offences <- Recorded_Offences %>% select(.,'X1':'X20' )
In_Person_Violence <- Recorded_Offences %>% select(.,'X1':'X2', "Violence Against the Person":'X38' )
Sexual_Offences <- Recorded_Offences %>% select(., 'X1':'X2', "Sexual Offences":'X56')
Robbery <- Recorded_Offences %>% select(., 'X1':'X2', "Robbery":'X74')
Burglary <- Recorded_Offences %>% select(., 'X1':'X2', "Burglary":"X92")
Theft <- Recorded_Offences %>% select(., 'X1':'X2',"Theft and Handling":"X110" )
Fruad_Forgery <- Recorded_Offences %>% select(.,'X1':'X2',"Fraud or Forgery":'X128' )
Criminal_Damage <- Recorded_Offences %>% select(., 'X1':'X2',"Criminal Damage":"X146")
Drugs <-Recorded_Offences %>% select(.,'X1':'X2', "Drugs":"X164")
Other_offences <- Recorded_Offences %>% select(., 'X1','X2',"Other Notifiable Offences":"X182")


## Resetting the names of the seperate data frame structures: i.e:: Removing the names of the coloumns of the data frame:: Renaming the colnames:

## Defining a new column name vector that can be generically applied to all the different data frames
header <- c('Code', 'Borough', '1999', '2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016')

## 1
names(All_offences) <- NULL
colnames(All_offences) <- header
## 2
names(In_Person_Violence) <- NULL
colnames(In_Person_Violence) <- header
## 3 
names(Sexual_Offences) <- NULL
colnames(Sexual_Offences) <- header
## 4 
names(Robbery) <- NULL
colnames(Robbery) <- header
## 5
names(Burglary) <- NULL
colnames(Burglary) <- header
## 6
names(Theft) <- NULL
colnames(Theft) <- header
## 7
names(Fruad_Forgery) <- NULL
colnames(Fruad_Forgery) <- header
## 8
names(Criminal_Damage) <- NULL
colnames(Criminal_Damage) <- header
## 9
names(Drugs) <- NULL
colnames(Drugs) <- header
## 10
names(Other_offences) <- NULL
colnames(Other_offences) <- header

############### Creating a series of factor vectors with the type of offence for each data frame ###############
Offence_Type1 <- rep('All Offences', length(All_offences$Code))
Offence_Type2 <- rep('In Person Violenece', length(In_Person_Violence$Code))
Offence_Type3 <- rep('Sexual Offence', length(Sexual_Offences$Code))
Offence_Type4 <- rep('Robbery', length(Robbery$Code))
Offence_Type5 <- rep('Burglary', length(Burglary$Code))
Offence_Type6 <- rep('Theft', length(Theft$Code))
Offence_Type7 <- rep("Fraud or Forgery" , length(Fruad_Forgery$Code))
Offence_Type8 <- rep('Criminal_Damage', length(Criminal_Damage$Code))
Offence_Type9 <- rep('Drugs', length(Drugs$Code))
Offence_Type10 <- rep('Other offence', length(Other_offences$Code))

## Adding the created factor vectors as coloumn in each matched data frame:
All_offences <- All_offences %>% mutate(., Offence_Type = as_factor(Offence_Type1))
In_Person_Violence <- In_Person_Violence %>% mutate(., Offence_Type = as_factor(Offence_Type2))
Sexual_Offences <- Sexual_Offences %>% mutate(., Offence_Type = as_factor(Offence_Type3))
Robbery <- Robbery %>% mutate(.,Offence_Type = as_factor(Offence_Type4) )
Burglary <- Burglary %>% mutate(., Offence_Type = as_factor(Offence_Type5))
Theft <- Theft %>% mutate(., Offence_Type = as_factor(Offence_Type6))
Fruad_Forgery <- Fruad_Forgery %>% mutate(., Offence_Type = as_factor(Offence_Type7))
Criminal_Damage <- Criminal_Damage %>% mutate(., Offence_Type = as_factor(Offence_Type8))
Drugs <- Drugs %>% mutate(., Offence_Type = as_factor(Offence_Type9))
Other_offences <- Other_offences %>% mutate(., Offence_Type = as_factor(Offence_Type10))



## Converting the wide format to long: The Years: 1999:2016
All_offences <- All_offences %>% gather(key = "Year", value = 'Offence Frequency', '1999':'2016', na.rm = TRUE)
In_Person_Violence <- In_Person_Violence %>% gather(key = "Year", value = 'Offence Frequency', '1999':'2016', na.rm = TRUE)
Sexual_Offences <- Sexual_Offences %>% gather(key = "Year", value = 'Offence Frequency', '1999':'2016', na.rm = TRUE)
Robbery <- Robbery %>% gather(key = "Year", value = 'Offence Frequency', '1999':'2016', na.rm = TRUE)
Burglary <- Burglary %>% gather(key = "Year", value = 'Offence Frequency', '1999':'2016', na.rm = TRUE)
Theft <- Theft %>% gather(key = "Year", value = 'Offence Frequency', '1999':'2016', na.rm = TRUE)
Fruad_Forgery <- Fruad_Forgery %>% gather(key = "Year", value = 'Offence Frequency', '1999':'2016', na.rm = TRUE)
Criminal_Damage <- Criminal_Damage %>% gather(key = "Year", value = 'Offence Frequency', '1999':'2016', na.rm = TRUE)
Drugs <- Drugs %>% gather(key = "Year", value = 'Offence Frequency', '1999':'2016', na.rm = TRUE)
Other_offences <- Other_offences %>% gather(key = "Year", value = 'Offence Frequency', '1999':'2016', na.rm = TRUE)


## Converting the Date from character to dbl:
All_offences$Year <- as.numeric(All_offences$Year)
In_Person_Violence$Year <- as.numeric(In_Person_Violence$Year)
Sexual_Offences$Year <- as.numeric(Sexual_Offences$Year)
Robbery$Year <- as.numeric(Robbery$Year)
Burglary$Year <- as.numeric(Burglary$Year)
Theft$Year <- as.numeric(Theft$Year)
Fruad_Forgery$Year <- as.numeric(Fruad_Forgery$Year)
Criminal_Damage$Year <- as.numeric(Criminal_Damage$Year)
Drugs$Year <- as.numeric(Drugs$Year)
Other_offences$Year <- as.numeric(Other_offences$Year)


## Checking the df Structures
All_offences
In_Person_Violence
Sexual_Offences
Robbery
Burglary
Theft
Fruad_Forgery
Criminal_Damage
Drugs
Other_offences

## Now we can bind the different sperated data sets inteo one main data set after they have been cleaned and processed - the data is going to 
## be binded into row form: using the rbind function
## The new cleaned data set is going to be called Offences:
Offences <-  rbind(In_Person_Violence,Sexual_Offences,Robbery,Burglary,Theft,Fruad_Forgery,Criminal_Damage,Drugs,Other_offences)

## Checking the structure of the newly formed data set:
levels(Offences$Offence_Type)
Offences


### Now Uploading the new data set: Boroughs divided intro East, West, North, South and Central
Borough_groups <- readr::read_csv('Borough subdivisions.csv')
Borough_groups

## Processing the uploaded data set:
Borough_groups <- Borough_groups %>% mutate(., `Borough Divisions` = as_factor(`Borough Divisions`))
Borough_groups
nrow(Borough_groups)


## Now we want to assign each borough in the offences data frame, to the matching district in the 
## Borough groups data frame
## This is going to be performed using the inner_join function to join both data frames based on the
## listed boroughs
## Performing the inner join:
New_Offences <- inner_join(Offences, Borough_groups, by = "Borough" )
## Checking the new data frame structure:
New_Offences



## It has been realized that the offence frequency is in character form: So we need to convert it to
## A numerical value - but before that, we need to remove any commas within the numbers to prevent
## the occurence of any NAs from occuring:
New_Offences <- New_Offences %>% mutate(., `Offence Frequency` = gsub(",","",`Offence Frequency`)) %>%
  mutate(., `Offence Frequency` = as.numeric(`Offence Frequency`))

## Checking the final form of the data frame 
New_Offences

write_csv(x = New_Offences, path = "~/Desktop/Shiny Project Final/New Offences.csv")


## Now we have everything we need, so we can move to the data visualisation process:



