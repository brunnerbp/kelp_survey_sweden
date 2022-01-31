###This file summarises and loads all the scripts

#0- apply folder structure
if(!dir.exists("raw_data")){
  dir.create("raw_data")
}
#Move the csv files to raw_data!

#1- Cleaning and merging the data
#This script creates "survey_merged.csv" in the folder analysis_data
source("1_cleaning_script.R")

#2- Homogenising species names (i.e. from algaebase or WORMs)

#3- Data analysis