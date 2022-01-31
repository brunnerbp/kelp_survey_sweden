

#Merge and clean#

files <- list.files(path="raw_data", pattern="*.csv", full.names=TRUE, recursive=FALSE)

#create dataframe
survey_long = data.frame(
  year=numeric(),
  site=character(),
  depth=numeric(),
  transect=character(),
  sample=numeric(),
  species=character(),
  cover=numeric()
)
if(length(survey_long$year)==0) {#only write in empty dataframe
  for(i in 1:length(files)){
    message(paste("file",i))
    temp = read.csv(files[i])
    temp_long=temp %>% gather(key = "species", value = "cover", -year,-site,-depth,-transect,-sample)
    survey_long=rbind(survey_long,temp_long)
    rm(temp,temp_long)
  }
}else{ message("dataframe survey_long was not empty!")}
rm(files,i)

if(!dir.exists("analysis_data")){
  dir.create("analysis_data")
}
write.csv(survey_long,file = "analysis_data/survey_merged.csv")
rm(survey_long)


