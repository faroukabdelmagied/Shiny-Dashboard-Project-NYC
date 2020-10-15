# Shiny-Dashboard-Project-NYC
This is the first project for the NYC Data Science Bootcamp - Creating a shiny dashboard


## Project Structure:
The main file includes two R files:
  1. Data Pre Processing Shiny Project
  2. Data visualisations
 
 These two files explore the areas of data preprocessing, specifically how the data cleaning and data visualisation process have been applied predeploying the shiny app.
 It is extremly important to know that in order for the code to run successfully, there are specific areas within the code in which the user has to change the working directory
 to match his/her own current working directory. This is becomes extremly relevant when the new dataframes formed within the code need to be saved within the same current wkdir.
 
 
 ## Within the main file there exists another file that is named Dashboard:
This file includes all the files required to deploy the shiny app. This file consists of the main three files neeeded:
1. global
2. server
3. ui

It is important to highlight that within the global file, there are alot of areas in which the user has to change the used wkdir to match his current wkdir. If the user fails to 
do that the code will not run successfully. So please do not fail to manually update your current wkdir within the code.
