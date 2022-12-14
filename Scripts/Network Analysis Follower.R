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

colnames(tot_followers) = c("follower_id", "group")

# We export it:

write.csv2(tot_followers,"C:\\Users\\39333\\Desktop\\UNIVERSITA\\MAGISTRALE COM-DAPS&CO\\CORSI\\DATA ACCESS AND REGULATIONS\\CAPSTONE PROJECT\\Capstone_Taddei_Ita_Right\\Data\\Total Followers\\Total Followers.csv", row.names=FALSE)

# Now we see how many common followers the four groups have

unique_follower = tot_followers %>% distinct(follower_id, .keep_all = TRUE)

554393-447810 # [1] 106583 common followers between the four groups




# cercare di capire come fare la parte di collegamento grafico

# function to generate edgelist across all MPs
create_edgelist <- function(follower_df) {
  follower_df |> 
    dplyr::nest_by(from_id) %>% 
    # ignore interactions with self
    dplyr::filter(screen_name != interacted_with) |> 
    dplyr::rename(from = screen_name, to = interacted_with)
}



