#
library(dplyr)
library(ggplot2)

analysis_data=read.csv("analysis_data/survey_merged.csv")
analysis_data$depth=analysis_data$depth*(-1)
#see how often species were recorded
overview=as.data.frame(table(analysis_data$species))


fu_se=analysis_data %>% filter(species == "Fucus_serratus")
fu_se=fu_se %>% group_by(year,depth) %>% summarise(cover=mean(cover,na.omit=T))
ggplot(fu_se, aes(x=year, y=depth, alpha=cover)) + 
  geom_point(size=2)

sa_la=analysis_data %>% filter(species == "Saccharina_latissima"| species =="Saccharina_latissima_small" | species =="Saccharina_latissima_tot")
sa_la=sa_la %>% group_by(year,depth) %>% summarise(cover=mean(cover,na.omit=T))
ggplot(sa_la, aes(x=year, y=depth, alpha=cover)) + 
  geom_point(size=2)

sa_mu=analysis_data %>% filter(species == "Sargassum_muticum")
sa_mu=sa_mu %>% group_by(year,depth) %>% summarise(cover=mean(cover,na.omit=T))
ggplot(sa_mu, aes(x=year, y=depth, alpha=cover)) + 
  geom_point(size=2)
