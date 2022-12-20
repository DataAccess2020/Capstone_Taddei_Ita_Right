# Analysis of the follower network
# First we see how many and which common followers the four main groups share

library(dplyr)

# We want to create a general dataframe with all the followers ditingued by the main group (mutate and rbind)

f_fr_c = clean_df_fr_c %>% 
  mutate(to_id = "frc")
f_fr_p = clean_df_fr_p %>% 
  mutate(to_id = "frp")
f_rw_c = clean_df_rw_c %>% 
  mutate(to_id = "rwc")
f_rw_p = clean_df_rw_p %>% 
  mutate(to_id = "rwp")

tot_followers = rbind(f_fr_c, f_fr_p, f_rw_c, f_rw_p)

# We change the coloumns' name to be more readble

colnames(tot_followers) = c("follower_id", "grp")

# We export it:

write.csv2(tot_followers,"C:\\Users\\39333\\Desktop\\UNIVERSITA\\MAGISTRALE COM-DAPS&CO\\CORSI\\DATA ACCESS AND REGULATIONS\\CAPSTONE PROJECT\\Capstone_Taddei_Ita_Right\\Data\\Total Followers\\Total Followers.csv", row.names=FALSE)

# We can see how many followers graphically the four groups have
library(ggplot2)

ggplot(tot_followers, aes(x = grp)) +
  geom_bar(stat="count",width=0.7, alpha = 1, fill = c("red", "black", "yellow", "darkblue"),  binwidth = 0.5) +
  geom_text(aes(label = after_stat(count)), stat = "count", vjust = -0.5, colour = "black") +
  xlab("Group") +
  ylab("Number of Total Followers") +
  scale_x_discrete(labels = c('Far-Right Culture','Far-Right Parties','Right-Wing Culture', 'Right-Wing Parties'))+
  scale_y_continuous(labels = scales::comma)+
  ggtitle("Total Followers by group")+
  theme(plot.title = element_text(family = "Helvetica", face = "bold", size = (15)))

# Now we see how many common followers the four groups have

unique_follower = tot_followers %>% distinct(follower_id, .keep_all = TRUE)
colnames(unique_follower) = c("follower_id", "grp")

554393-447810 # [1] 106583 common followers between the four groups

# So common followers are:

install.packages("data.table")
library(data.table)

# We transform tot_followers and unique_follower in data.tables

dftf=data.table(tot_followers)
dfuf=data.table(unique_follower)

common_follower = fsetdiff(dftf, dfuf, all = TRUE)

# We export the two dataframes of the common and the unique followers:

write.csv2(unique_follower,"C:\\Users\\39333\\Desktop\\UNIVERSITA\\MAGISTRALE COM-DAPS&CO\\CORSI\\DATA ACCESS AND REGULATIONS\\CAPSTONE PROJECT\\Capstone_Taddei_Ita_Right\\Data\\Total Followers\\Unique Followers.csv", row.names=FALSE)

write.csv2(common_follower,"C:\\Users\\39333\\Desktop\\UNIVERSITA\\MAGISTRALE COM-DAPS&CO\\CORSI\\DATA ACCESS AND REGULATIONS\\CAPSTONE PROJECT\\Capstone_Taddei_Ita_Right\\Data\\Total Followers\\Common Followers.csv", row.names=FALSE)

# Now we prepare the dataframes for the hystogram to see the diffrences in the groups
library(tidyverse)

cfdf <- common_follower %>%
  add_column(cmmn = 1)

ufdf <- unique_follower %>%
  add_column(cmmn = 0)

total_foll_com = rbind(cfdf, ufdf)

# Now we see with histograms the quotes of common and unique followers in every group

# Number of follower Comparison within groups

ggplot(total_foll_com, aes(factor(grp), fill = factor(cmmn))) +
  geom_bar(position = position_dodge2(preserve = "single"))+
  geom_text(aes(label = after_stat(count)), stat = "count", position=position_dodge(width=0.9), vjust=-0.5, colour = "black") +
  xlab("Group") +
  ylab("Number of Total Followers") +
  scale_x_discrete(labels = c('Far-Right Culture','Far-Right Parties','Right-Wing Culture', 'Right-Wing Parties'))+
  scale_y_continuous(labels = scales::comma)+
  labs(fill = "Follower")+
  scale_fill_hue(labels = c("Unique", "Common"))+
  ggtitle("Common and Unique Followers divided by groups", "Number of follower Comparison within groups")+
  theme(plot.title = element_text(family = "Helvetica", face = "bold", size = (15)))

# Proportion of follower Comparison within groups

ggplot(total_foll_com, aes(factor(grp), fill = factor(cmmn))) +
  geom_bar(position = "fill")+
  xlab("Group") +
  ylab("Number of Total Followers") +
  scale_x_discrete(labels = c('Far-Right Culture','Far-Right Parties','Right-Wing Culture', 'Right-Wing Parties'))+
  scale_y_continuous(labels = scales::comma)+
  labs(fill = "Follower")+
  scale_fill_hue(labels = c("Unique", "Common"))+
  ggtitle("Common and Unique Followers divided by groups", "Proportion of follower Comparison within groups")+
  theme(plot.title = element_text(family = "Helvetica", face = "bold", size = (15)))

# Number of follower comparison between groups

ggplot(total_foll_com, aes(factor(cmmn), fill = factor(grp))) +
  geom_bar(position = position_dodge2(preserve = "single"))+
  geom_text(aes(label = after_stat(count)), stat = "count", position=position_dodge(width=0.9), vjust=-0.5, colour = "black") +
  xlab("Follower Type") +
  ylab("Number of Total Followers") +
  scale_x_discrete(labels = c('Unique','Common'))+
  scale_y_continuous(labels = scales::comma)+
  labs(fill = "Group")+
  scale_fill_hue(labels = c('Far-Right Culture','Far-Right Parties','Right-Wing Culture', 'Right-Wing Parties'))+
  ggtitle("Common and Unique Followers divided by groups", "Number of follower comparison between groups")+
  theme(plot.title = element_text(family = "Helvetica", face = "bold", size = (15)))

















