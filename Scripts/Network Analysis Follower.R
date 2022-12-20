# Analysis of the follower network
# First we see how many and which common followers the four main groups share
install.packages("tidyverse")
library(tidyverse)

f_fr_c = clean_df_fr_c %>% 
  mutate(to_id = "frc") %>% 
  add_column(fllw1 = 1) %>% 
  add_column(fllw2 = NA) %>% 
  add_column(fllw3 = NA) %>% 
  add_column(fllw4 = NA)

f_fr_p = clean_df_fr_p %>% 
  mutate(to_id = "frp")%>% 
  add_column(fllw1 = NA) %>% 
  add_column(fllw2 = 1) %>% 
  add_column(fllw3 = NA) %>% 
  add_column(fllw4 = NA)

f_rw_c = clean_df_rw_c %>% 
  mutate(to_id = "rwc")%>% 
  add_column(fllw1 = NA) %>% 
  add_column(fllw2 = NA) %>% 
  add_column(fllw3 = 1) %>% 
  add_column(fllw4 = NA)

f_rw_p = clean_df_rw_p %>% 
  mutate(to_id = "rwp")%>% 
  add_column(fllw1= NA) %>% 
  add_column(fllw2 = NA) %>% 
  add_column(fllw3 = NA) %>% 
  add_column(fllw4 = 1)

tot_followers = rbind(f_fr_c, f_fr_p, f_rw_c, f_rw_p)

# We change the coloumns' name to be more readble

colnames(tot_followers) = c("follower_id", "grp", "fllw1", "fllw2", "fllw3", "fllw4")

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
id_follow_grp<- tot_followers %>%
  group_by(follower_id) %>%
  summarise(fllw1 = sum(fllw1, na.rm = T),
            fllw2 = sum(fllw2, na.rm = T),
            fllw3 = sum(fllw3, na.rm = T),
            fllw4 = sum(fllw4, na.rm = T))
colnames(id_follow_grp) = c("follower_id", "frc", "frp", "rwc", "rwp")

# Now we can see all the common and unique followers by analyzing if they follow only one group or more

write.csv2(id_follow_grp,"C:\\Users\\39333\\Desktop\\UNIVERSITA\\MAGISTRALE COM-DAPS&CO\\CORSI\\DATA ACCESS AND REGULATIONS\\CAPSTONE PROJECT\\Capstone_Taddei_Ita_Right\\Data\\Total Followers\\Followers properties groups.csv", row.names=FALSE)
