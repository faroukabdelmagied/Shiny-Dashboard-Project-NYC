#### Data Visualisations Shiny Project:


## Loading the libraries:
library(ggplot2)
library(dplyr)

##  Loading the needed data:
New_Offences <- as.data.frame(readr::read_csv('New Offences.csv'))

## Chart 1:

## Applying group_by:
Zones.Type <- New_Offences %>% group_by(., `Borough Divisions`, Offence_Type) %>% summarise(., Offences = sum(`Offence Frequency`))
Zones.Type

## Plotting the data in the form of a bar chart:
ggplot(Zones.Type) +
  geom_bar(aes(x=`Borough Divisions`, y = Offences , fill=Offence_Type), position='dodge', stat = 'identity') +
  labs(title = 'Offence Frequency by District and Type', x = 'London Districts', y = 'Offence Frequency') + scale_colour_brewer(palette='Set1') +
  theme_bw() + guides(fill=guide_legend(title= ' Offence Type')) + 
  theme(plot.title = element_text(face = 'bold', hjust = 0.5, size = 17), axis.title = element_text(face = 'bold', size = 13))





## Chart Number 2

## Applying group_by:
Zones.time <- New_Offences  %>% group_by(.,`Borough Divisions`, Year) %>% summarise(., Total_Offences = sum(`Offence Frequency`))
Zones.time

## Data is divided into specific time zones for analysis purposes:
ggplot(Zones.time, aes(x = Year, y = Total_Offences)) + geom_line(aes(colour = `Borough Divisions`)) +
  labs(title = 'Number Of Offences per Year', x = 'Year', y = 'Number Of Offences') + scale_colour_brewer(palette='Set1') +
  theme_bw() + theme(legend.key=element_blank()) + geom_vline(xintercept = c(2005,2010), colour='grey') +
  annotate("text", x = c((1999+2000)/2,(2000 + 2005)/2 ,(2005 + 2010)/2 ,(2010 + 2015)/2, (2015 + 2016)/2), y = 350000, label = c('0','1','2','3','4'), size=6) +
  annotate("rect", xmin = 1999, xmax = 2000, ymin = 0, ymax = 380000, alpha = .2, fill = 'darkorange') +
  annotate("rect", xmin = 2000, xmax = 2005, ymin = 0, ymax = 380000, alpha = .2, fill='darkred') +
  annotate("rect", xmin = 2005, xmax = 2010, ymin = 0, ymax = 380000, alpha = .2, fill='darkblue') +
  annotate("rect", xmin = 2010, xmax = 2015, ymin = 0, ymax = 380000, alpha = .2, fill='darkgreen') +
  annotate("rect", xmin = 2015, xmax = 2016, ymin = 0, ymax = 380000, alpha = .2, fill='purple') + guides(fill=guide_legend(title= 'Districts')) + 
  theme(plot.title = element_text(face = 'bold', hjust = 0.5, size = 17), axis.title = element_text(face = 'bold', size = 13))



## Chart Number 3:

## Applying group_by:
Offence_Type_By_Year <- New_Offences %>% group_by(., Offence_Type, Year) %>% summarise(., Total_Offences= sum(`Offence Frequency`))
Offence_Type_By_Year

## Plotting Data through ggplot:
ggplot(Offence_Type_By_Year, aes(x = Year, y = Total_Offences)) + geom_line(aes(colour = Offence_Type)) + facet_wrap(.~Offence_Type) +
  labs(title = 'Offence Frequency by Year and Type', x = 'Year', y = 'Offence Frequency') + scale_colour_brewer(palette='Set1') +
  scale_colour_brewer(palette='Set1') + theme_bw() + guides(fill=guide_legend(title= 'Offence Type')) + 
  theme(plot.title = element_text(face = 'bold', hjust = 0.5, size = 17), axis.title = element_text(face = 'bold', size = 13))



## Chart Number 4:

## Applying group_by:
Ratio_Per_Total_time <- New_Offences %>% group_by(Offence_Type, Year) %>% summarise(., Total_Offences = sum(`Offence Frequency`)) %>% mutate(., ratio = Total_Offences / sum(Total_Offences))
Ratio_Per_Total_time

## Plotting Data through ggplot:
ggplot(Ratio_Per_Total_time, aes(x= Year, y = ratio)) + geom_bar(position = 'dodge', stat = 'identity', aes(fill = Offence_Type)) + 
  facet_wrap(~ Offence_Type) + scale_colour_brewer(palette='Set1') +
  theme_bw() + labs(title = 'Offence Frequency by Year and Type', x = 'Year', y = 'Offence Frequency') + guides(fill=guide_legend(title= 'Offence Type')) + 
  theme(plot.title = element_text(face = 'bold', hjust = 0.5, size = 17), axis.title = element_text(face = 'bold', size = 13))


## Chart Number 5:
Offence_Type_By_District <- New_Offences %>% group_by(., Offence_Type, Year, `Borough Divisions`) %>% summarise(., Offence_Frequency = sum(`Offence Frequency`))

## Plotting Data through ggplot:
ggplot(Offence_Type_By_District, aes(x = Year, y  = Offence_Frequency )) + geom_bar(position = 'dodge', stat = 'identity', aes(fill = Offence_Type)) + facet_wrap(~`Borough Divisions`)+ scale_colour_brewer(palette='Set1') +
  theme_bw()   + labs(title = 'Offence Frequency by Year and Type', x = 'Year', y = 'Offence Frequency') + theme(plot.title = element_text(face = 'bold', hjust = 0.5, size = 17), axis.title = element_text(face = 'bold', size = 13)) + 
  guides(fill=guide_legend(title= 'Offence Type'))
  
