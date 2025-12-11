
#call libraries
install.packages("Hmisc")
library(dplyr)
library(tidyr)
library(tidyverse)
library(lubridate)
library(ggplot2)
library(Hmisc)


#upload the data
rank<-read.csv("C:\\Users\\admin\\Desktop\\Data Analytics\\Projects For Portfolio\\MiniProjetR\\cwurData.csv")

#make a copy of data 
rank_clean<-rank

#check data
head(rank_clean)
summary(rank_clean)
describe(rank_clean)
str(rank_clean)
#check missing values 
colSums(is.na(rank_clean))

#check dublicates 
anyDuplicated(rank_clean)

#clean data
rank_clean$broad_impact[is.na(rank_clean$broad_impact)]<-mean(rank_clean$broad_impact,na.rm=TRUE)
rank_clean$broad_impact<-round(rank_clean$broad_impact,2)
rank_clean <- rank_clean %>%
  distinct(institution, .keep_all = TRUE)

#KPI 
library(dplyr)

#Average Score
avg_score <- rank_clean %>%
  summarise(Average_Score = mean(score, na.rm = TRUE))
avg_score

#Total Citations
total_citations <- rank_clean %>%
  summarise(Total_Citations = sum(citations, na.rm = TRUE))
total_citations

#Number of universities per country in Top 10
top10_countries <- rank_clean %>%
  arrange(desc(score)) %>%
  slice(1:10) %>%
  count(country, name = "Top10_Count")
top10_countries


#Distribution of the overall Score
ggplot(rank_clean,aes(score))+
geom_histogram(bins=15,fill="#0B735F",color="black")+
ggtitle("Distribution of the overall Score")+
theme_minimal()+
theme(plot.title =element_text(size=12,color ="#585858"))+
theme(
  plot.title = element_text(size=11, hjust=-0.1, color="#585858"),
  axis.title.x = element_text(size=9,hjust=0, color="#585858"),
  axis.title.y = element_text(size=9,hjust=1, color="#585858"),
  axis.text.x = element_text(size=7),
  axis.text.y = element_text(size=7)
)


#Top 10 universities worldwide

rank_clean%>%
  arrange(desc(score))%>%
  slice(1:10)%>%
  mutate(institution=factor(institution,levels = institution))%>%
  ggplot(aes(x=reorder(institution,score),y=score))+
  geom_col(fill="#05250B")+
  coord_flip()+
  geom_text(aes(label = score), 
            hjust = 1.3,  # moves text to the left of the bar
            color = "white",
            size = 2,
            fontface="bold") +
  theme_minimal()+
  labs(title="Top 10 universities worldwide",x="University",y="Score")+
  theme(
    plot.title = element_text(size = 11, hjust =-1,color="#585858"),
    axis.title.x = element_text(size = 9,hjust =0,color="#585858"),
    axis.title.y = element_text(size = 9,hjust =1,color="#585858"),
    axis.text.y = element_text(size = 7),
    legend.position = "bottom"
  )

#Top 15 Countries by Number of Ranked Universities
rank_clean %>%
  count(country, sort=TRUE) %>%
  slice(1:15) %>%
  mutate(country = factor(country, levels = country)) %>%
  ggplot(aes(x = reorder(country, n), y = n)) +
  geom_col(fill = "#046488") +
  geom_text(aes(label = n), hjust = 1.3, color = "white", size=2,fontface="bold") +
  coord_flip() +
  theme_minimal() +
  labs(title="Top 15 Countries by Number of Ranked Universities", x="Country", y="Count") +
  theme(
    plot.title = element_text(size=11, hjust=-0.7, color="#585858"),
    axis.title.x = element_text(size=9,hjust =0, color="#585858"),
    axis.title.y = element_text(size=9,hjust =1, color="#585858"),
    axis.text.x = element_text(size=7),
    axis.text.y = element_text(size=7)
  )
#Citations vs University Score
ggplot(rank_clean, aes(x = citations, y = score)) +
  geom_point(color="#6F2451", alpha=0.6, size=2.5) +
  geom_smooth(method = "lm", se = TRUE, color = "#0B0F08") +  # adds trendline
  theme_minimal() +
  labs(title="Citations vs University Score", x="Citations", y="Score") +
  theme(
    plot.title = element_text(size=11,hjust=0, color="#585858"),
    axis.title.x = element_text(size=9,hjust=0, color="#585858"),
    axis.title.y = element_text(size=9,hjust=1, color="#585858"),
    axis.text.x = element_text(size=7),
    axis.text.y = element_text(size=7)
  )
  
  #Publications vs World Rank
  ggplot(rank_clean, aes(x = publications, y = world_rank)) +
    geom_point(color="#5D3067", alpha=0.6, size=2) +
    geom_smooth(method = "lm", se = TRUE, color = "#0B0F08") +  # adds trendline
    scale_y_reverse() +  # Rank 1 is top
    theme_minimal() +
    labs(title="Publications vs World Rank", x="Publications", y="World Rank") +
    theme(
      plot.title = element_text(size=11,hjust=-0.1, color="#585858"),
      axis.title.x = element_text(size=9,hjust=0, color="#585858"),
      axis.title.y = element_text(size=9,hjust=1, color="#585858"),
      axis.text.x = element_text(size=7),
      axis.text.y = element_text(size=7)
    )

#download the dataset
write.csv(rank_clean,"\\Users\\admin\\Desktop\\Data Analytics\\Projects For Portfolio\\MiniProjetR\\rank_clean.csv"
,row.names = FALSE)











  
  
  
