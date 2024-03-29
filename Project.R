library(ggplot2)
#install.packages("ggrepel")
#install.packages("ggplot2")
library(ggrepel)
library(jtools)
#install.packages("stargazer")
library(stargazer)
#install.packages("broom")
library(broom)

vaccineuptake_data <- read.csv(file = "vaccination uptake by state (Modified).csv", stringsAsFactors = FALSE)
vaccineuptake_data$Fully.vaccinated = as.numeric(gsub("[\\%,]", "", vaccineuptake_data$Fully.vaccinated))
#View(vaccineuptake_data)
age_data <- read.csv(file = "Median age of states (Modified).csv", stringsAsFactors = FALSE)
#View(age_data)
race_data <- read.csv(file = "Race Breakdown by States.csv", stringsAsFactors = FALSE)
race_data$White = as.numeric(gsub("[\\%,]", "", race_data$White))
race_data$Black = as.numeric(gsub("[\\%,]", "", race_data$Black))
race_data$Asian = as.numeric(gsub("[\\%,]", "", race_data$Asian))
race_data$Indian= as.numeric(gsub("[\\%,]", "", race_data$Indian))
race_data$Hawaiian = as.numeric(gsub("[\\%,]", "", race_data$Hawaiian))
race_data$Other = as.numeric(gsub("[\\%,]", "", race_data$Other))
#View(race_data)
edu_data <- read.csv(file = "Education by States.csv", stringsAsFactors = FALSE)
pol_data <- read.csv(file = "Political breakdown by State.csv", stringsAsFactors = FALSE)
health_data <- read.csv(file = "Healthcare Breakdown by State.csv", stringsAsFactors = FALSE)
pop_data <- read.csv(file = "Population by state.csv", stringsAsFactors = FALSE)
gdp_data <- read.csv(file = "GDP by State.csv", stringsAsFactors = FALSE)

Statenames<-vaccineuptake_data$�..Name
Vaccineuptakeformatted<-vaccineuptake_data$Fully.vaccinated
Agedata<-age_data$MedianAge
Racedata <-data.frame(race_data$White,race_data$Black,race_data$Asian,race_data$Indian,race_data$Hawaiian,race_data$Other)
Edudata<-data.frame(edu_data$PercentHighSchoolOrHigher,edu_data$PercentBachelorsOrHigher)
Poldata<-pol_data$Trifecta.status
Healthdata<-health_data$RANK
Popdata<-pop_data$POPESTIMATE2021
Gdpdata<-gdp_data$stateGDP

Main_Data <- data.frame(Statenames,Popdata,Gdpdata,Agedata,Vaccineuptakeformatted,Racedata,Edudata,Poldata,Healthdata)
colnames(Main_Data) <- c("States","EstPopulation_Control","StateGDP_Control","MedianAge","Percentage_FullyVaccinated","Percentage_ofWhites",
                         "Percentage_ofBlackCommunity","Percentage_ofAsians","Percentage_ofIndians",
                         "Percentage_ofHawaiians","Percentage_ofOthers","Percentage_HSEducated",
                         "Percentage_BachEducated","PoliticalAllegiance","HealthcareRanking")

View(Main_Data)
i=0

VacAgainstPop <- ggplot(Main_Data, aes(EstPopulation_Control, Percentage_FullyVaccinated)) + geom_point() +geom_smooth(method=lm, se=FALSE)+ geom_label_repel(aes(label = States), size = 3)
ggsave(VacAgainstPop, file=paste0("Plot_Vaccine_Against_Population.png"), width = 14, height = 10, units = "cm")
i=i+1
print(VacAgainstPop)

VacAgainstGDP <- ggplot(Main_Data, aes(StateGDP_Control, Percentage_FullyVaccinated)) + geom_point() +geom_smooth(method=lm, se=FALSE)+ geom_label_repel(aes(label = States), size = 3)
ggsave(VacAgainstGDP, file=paste0("Plot_Vaccine_Against_StateGDP.png"), width = 14, height = 10, units = "cm")
i=i+1
print(VacAgainstGDP)

VacAgainstAge <- ggplot(Main_Data, aes(MedianAge, Percentage_FullyVaccinated)) + geom_point() +geom_smooth(method=lm, se=FALSE)+ geom_label_repel(aes(label = States), size = 3)
ggsave(VacAgainstAge, file=paste0("Plot_Vaccine_Against_Age.png"), width = 14, height = 10, units = "cm")
i=i+1
print(VacAgainstAge)

VacAgainstHSEdu <- ggplot(Main_Data, aes(Percentage_HSEducated, Percentage_FullyVaccinated)) + geom_point() +geom_smooth(method=lm, se=FALSE)+ geom_label_repel(aes(label = States), size = 3)
ggsave(VacAgainstHSEdu, file=paste0("Plot_Vaccine_Against_HSEducated.png"), width = 14, height = 10, units = "cm")
i=i+1
print(VacAgainstHSEdu)

VacAgainstBachEdu <- ggplot(Main_Data, aes(Percentage_BachEducated, Percentage_FullyVaccinated)) + geom_point()+geom_smooth(method=lm, se=FALSE)+ geom_label_repel(aes(label = States), size = 3)
ggsave(VacAgainstBachEdu, file=paste0("Plot_Vaccine_Against_BachEducated.png"), width = 14, height = 10, units = "cm")
i=i+1
print(VacAgainstBachEdu)

VacAgainstWhite <- ggplot(Main_Data, aes(Percentage_ofWhites, Percentage_FullyVaccinated)) + geom_point()+geom_smooth(method=lm, se=FALSE)+ geom_label_repel(aes(label = States), size = 3)
ggsave(VacAgainstWhite, file=paste0("Plot_Vaccine_Against_WhiteCommunity.png"), width = 14, height = 10, units = "cm")
i=i+1
print(VacAgainstWhite)


VacAgainstBlackCommunity <- ggplot(Main_Data, aes(Percentage_ofBlackCommunity, Percentage_FullyVaccinated)) + geom_point()+geom_smooth(method=lm, se=FALSE)+ geom_label_repel(aes(label = States), size = 3)
ggsave(VacAgainstBlackCommunity, file=paste0("Plot_Vaccine_Against_BlackCommunity.png"), width = 14, height = 10, units = "cm")
i=i+1
print(VacAgainstBlackCommunity)

VacAgainstAsian <- ggplot(Main_Data, aes(Percentage_ofAsians, Percentage_FullyVaccinated)) + geom_point()+geom_smooth(method=lm, se=FALSE)+ geom_label_repel(aes(label = States), size = 3)
ggsave(VacAgainstAsian, file=paste0("Plot_Vaccine_Against_AsianCommunity.png"), width = 14, height = 10, units = "cm")
i=i+1
print(VacAgainstAsian)


VacAgainstPol <- ggplot(Main_Data, aes(PoliticalAllegiance, Percentage_FullyVaccinated,group =1)) + geom_point()+geom_smooth(method=lm, se=FALSE)+ geom_label_repel(aes(label = States), size = 3)
ggsave(VacAgainstPol, file=paste0("Plot_Vaccine_Against_PoliticalRelations.png"), width = 14, height = 10, units = "cm")
i=i+1
print(VacAgainstPol)

VacAgainstHealth <- ggplot(Main_Data, aes(HealthcareRanking, Percentage_FullyVaccinated)) + geom_point()+geom_smooth(method=lm, se=FALSE)+ geom_label_repel(aes(label = States), size = 3)
ggsave(VacAgainstHealth, file=paste0("Plot_Vaccine_Against_HealthCareRanking.png"), width = 14, height = 10, units = "cm")
i=i+1
print(VacAgainstHealth)



relation0 <- lm(Main_Data$Percentage_FullyVaccinated~Main_Data$MedianAge)
print(summary(relation0))

relation1 <-lm(Main_Data$Percentage_FullyVaccinated~Main_Data$Percentage_ofBlackCommunity+Main_Data$Percentage_ofWhites)
print(summary(relation1))

relation2 <- lm(Main_Data$Percentage_FullyVaccinated~Main_Data$HealthcareRanking)
print(summary(relation2))

relation3 <- lm(Main_Data$Percentage_FullyVaccinated~Main_Data$Percentage_BachEducated)
print(summary(relation3))

relation4 <- lm(Main_Data$Percentage_FullyVaccinated~Main_Data$PoliticalAllegiance)
#print(summary(relation4))

relation5 <- lm(Main_Data$Percentage_FullyVaccinated~Main_Data$EstPopulation_Control+Main_Data$MedianAge)
print(summary(relation5))

relation6 <-lm(Main_Data$Percentage_FullyVaccinated~Main_Data$EstPopulation_Control+Main_Data$Percentage_ofBlackCommunity+Main_Data$Percentage_ofWhites)
#print(summary(relation6))


relation7 <- lm(Main_Data$Percentage_FullyVaccinated~Main_Data$EstPopulation_Control+Main_Data$HealthcareRanking)
print(summary(relation7))

relation8 <- lm(Main_Data$Percentage_FullyVaccinated~Main_Data$EstPopulation_Control+Main_Data$Percentage_BachEducated)
#print(summary(relation8))

relation9 <- lm(Main_Data$Percentage_FullyVaccinated~Main_Data$EstPopulation_Control+Main_Data$PoliticalAllegiance)
#print(summary(relation9))

totalrelation <- lm(Main_Data$Percentage_FullyVaccinated~Main_Data$EstPopulation_Control+Main_Data$MedianAge+Main_Data$Percentage_ofBlackCommunity+Main_Data$Percentage_ofWhites+Main_Data$HealthcareRanking+Main_Data$Percentage_BachEducated+Main_Data$PoliticalAllegiance)

stargazer(relation0, relation5,  column.labels=c("default","Control"), align=TRUE,type = "text")
stargazer(relation1, relation6, column.labels=c("default","Control"), align=TRUE,type = "text")
stargazer(relation2, relation7, column.labels=c("default","Control"), align=TRUE,type = "text")
stargazer(relation3, relation8, column.labels=c("default","Control"), align=TRUE,type = "text")
stargazer(relation4, relation9, column.labels=c("default","Control"), align=TRUE,type = "text")
stargazer(totalrelation,align=TRUE,type = "text")

stargazer(relation0, relation5,  column.labels=c("default","With_Population_Control"), align=TRUE,type = "html", out = "fit_1.html")
stargazer(relation1, relation6, column.labels=c("default","With_Population_Control"), align=TRUE,type = "html", out = "fit_2.html")
stargazer(relation2, relation7, column.labels=c("default","With_Population_Control"), align=TRUE,type = "html", out = "fit_3.html")
stargazer(relation3, relation8, column.labels=c("default","With_Population_Control"), align=TRUE,type = "html", out = "fit_4.html")
stargazer(relation4, relation9, column.labels=c("default","With_Population_Control"), align=TRUE,type = "html", out = "fit_5.html")
stargazer(totalrelation,align=TRUE,type = "html", out = "fit_6.html")