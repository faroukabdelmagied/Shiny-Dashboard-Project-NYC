## Loading the libraries
library(tidyverse)
library(ggplot2)
library(dplyr)

##########################################################################  Charts By Location ##########################################################################

####################
## First Time Chart##
####################

## Now loading the data that we are going to work with

New_Offences <- as.data.frame(readr::read_csv('New Offences.csv'))
New_Offences

## Filtering the data based on the four main lodon districts:
London.Districts.time <- New_Offences  %>% group_by(.,`Borough Divisions`, Year) %>% summarise(., Total_Offences = sum(`Offence Frequency`))
London.Districts.time
write_csv(x = London.Districts.time, path = "~/Desktop/Shiny Project Final/Dashboard/Zones Time.csv")

## SAVING THE DATA SET -- Now dealing with the new data set
London.Districts.time.filetered <- as.data.frame(readr::read_csv('Zones Time.csv'))
District_choices <- unique(London.Districts.time.filetered$`Borough Divisions`)


## Filtering the data based on the many london boroughs:
Boroughs_Specific <- New_Offences %>% group_by(., Borough, Year) %>% summarise(., Total_Offences = sum(`Offence Frequency`))
write_csv(x = Boroughs_Specific, path = "~/Desktop/Shiny Project Final/Dashboard/Zones Specific.csv")
## Working with the new data set
Boroughs_Specific_vs_Time <- as.data.frame(readr::read_csv('Zones Specific.csv'))
## Assining the unique borough choices:
Borough_choices_specific <- unique(Boroughs_Specific_vs_Time$Borough)






##########################################################################  Charts By Offense Type ##########################################################################

####################
## First Bar Chart##
####################
## Loading the data from the New Offenses tab:
New_Offences <- as.data.frame(readr::read_csv('New Offences.csv'))
New_Offences


## Filtering the data based on the structure needed:
Offence_Typer_Year <- New_Offences %>% group_by(., Offence_Type, Year) %>% summarise(., Total_Offences= sum(`Offence Frequency`))
Offence_Typer_Year

## Now Saving the data into a csv as a seperate data frame
write_csv(x = Offence_Typer_Year, path = "~/Desktop/Shiny Project Final/Dashboard/Offence Type Over Year.csv")

## Now reloading the data again:

Offence.Type_vs_Year <- as.data.frame(readr::read_csv('Offence Type Over Year.csv'))
Offence.Type_vs_Year


## Now Creating  a new unique vector with the different Offence Types;
Offence_Type_Choices  <- unique(Offence.Type_vs_Year$Offence_Type)
Offence_Type_Choices


####################
## Second Bar Chart##
####################

## Loading the needed libraries
library(tidyverse)
library(shiny)
library(ggplot2)
library(dplyr)


## Loading the New Offences data
New_Offences5 <- as.data.frame(readr::read_csv('New Offences.csv'))
New_Offences5


## Now filtering the data:
District.Offence.Year <- New_Offences5 %>% group_by(., Offence_Type, Year, `Borough Divisions`) %>% summarise(., Total_Offence_Freq = sum(`Offence Frequency`))

## Saving the cool_100 data frame as a csv file
write_csv(x=District.Offence.Year, path = "~/Desktop/Shiny Project Final/Dashboard/Offence Frequency by Type and District.csv")

## Now loading the data
District.Offence.Year.f <- as.data.frame(readr::read_csv('Offence Frequency by Type and District.csv'))
District.Offence.Year.f


## Creating the unique vector:
Borough_District_divisions <- unique(District.Offence.Year.f$`Borough Divisions`)
Borough_District_divisions



####################
## Third Bar Chart##
####################

## Loading the libraries
library(tidyverse)
library(ggplot2)
library(shiny)
library(dplyr)


## Now loading the data of the new offences:
New_Offences3 <- as.data.frame(readr::read_csv('New Offences.csv'))
New_Offences3


## Now filtering the data of the New Offences to the fit the ratio form:
Ratio_Per_Total.time <- New_Offences3 %>% group_by(Offence_Type, Year) %>% summarise(., Total_Offences = sum(`Offence Frequency`)) %>% mutate(., ratio = Total_Offences / sum(Total_Offences))
Ratio_Per_Total.time


## Saving the data in the new data set
write_csv(x= Ratio_Per_Total.time, path = "~/Desktop/Shiny Project Final/Dashboard/ Offence Type Ratio Vs. Time.csv")

## Now Reloading the data again into a a data frame 
Offences_Ratio <- as.data.frame(readr::read_csv(' Offence Type Ratio Vs. Time.csv'))
Offences_Ratio


## Creating an Offence type ratio:
Offence_Type_Choices1 <- unique(Offences_Ratio$Offence_Type)
Offence_Type_Choices1



