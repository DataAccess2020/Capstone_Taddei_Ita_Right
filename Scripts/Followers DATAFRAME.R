# CREATE DATASET OF THE FOLLOWERS

test_tibble = data_frame(follower_fr_culture[[1]])

# So in this way we can create a tibble from the large list, so the structrue it's like
# that, now we have to automatize it for the entire list, and then use it for the others

library(tibble)
library(purrr)
library(dplyr)

# By using map_dfr from purrr package we can create a single tibble out of the tibbles contained in the large list automatically
df_fr_c <- map_dfr(follower_fr_culture, bind_rows)
df_fr_p <- map_dfr(follower_fr_parties, bind_rows)
df_rw_c <- map_dfr(follower_rw_culture, bind_rows)
df_rw_p <- map_dfr(follower_rw_parties, bind_rows)

# Now we export our datasets in the folders of the project
# We use write.csv2 to have SEPARATE COLOUMNS FOR THE VALUES

# RAW DATASET
# Far right Cultures
write.csv2(df_fr_c,"C:\\Users\\39333\\Desktop\\UNIVERSITA\\MAGISTRALE COM-DAPS&CO\\CORSI\\DATA ACCESS AND REGULATIONS\\CAPSTONE PROJECT\\Capstone_Taddei_Ita_Right\\Data\\Raw Followers DF\\RAW follower fr culture.csv", row.names=FALSE)

# Far right Parties
write.csv2(df_fr_p,"C:\\Users\\39333\\Desktop\\UNIVERSITA\\MAGISTRALE COM-DAPS&CO\\CORSI\\DATA ACCESS AND REGULATIONS\\CAPSTONE PROJECT\\Capstone_Taddei_Ita_Right\\Data\\Raw Followers DF\\RAW follower fr parties.csv", row.names=FALSE)

# Right wing Cultures
write.csv2(df_rw_c,"C:\\Users\\39333\\Desktop\\UNIVERSITA\\MAGISTRALE COM-DAPS&CO\\CORSI\\DATA ACCESS AND REGULATIONS\\CAPSTONE PROJECT\\Capstone_Taddei_Ita_Right\\Data\\Raw Followers DF\\RAW follower rw culture.csv", row.names=FALSE)

# Right wing Parties
write.csv2(df_rw_p,"C:\\Users\\39333\\Desktop\\UNIVERSITA\\MAGISTRALE COM-DAPS&CO\\CORSI\\DATA ACCESS AND REGULATIONS\\CAPSTONE PROJECT\\Capstone_Taddei_Ita_Right\\Data\\Raw Followers DF\\RAW follower rw parties.csv", row.names=FALSE)


# CLEANING THE DATAFRAME

# Now we ignore the duplicates, in every dataframe. The idea is to see who are the followers of the 
# four main groups (as they were single users with all the followers) so: Far Right Cultures and Parties,
# Right-wing Cultures and Parties

library(dplyr)

# We spceify also the coloumn from_id (wich are the followers)

clean_df_fr_c = df_fr_c %>% distinct(from_id, .keep_all = TRUE)

clean_df_fr_p = df_fr_p %>% distinct(from_id, .keep_all = TRUE)

clean_df_rw_c = df_rw_c %>% distinct(from_id, .keep_all = TRUE)

clean_df_rw_p = df_rw_p %>% distinct(from_id, .keep_all = TRUE)

# Now we export our datasets in the folders of the project
# We use write.csv2 to have SEPARATE COLOUMNS FOR THE VALUES

# RAW DATASET
# Far right Cultures
write.csv2(clean_df_fr_c,"C:\\Users\\39333\\Desktop\\UNIVERSITA\\MAGISTRALE COM-DAPS&CO\\CORSI\\DATA ACCESS AND REGULATIONS\\CAPSTONE PROJECT\\Capstone_Taddei_Ita_Right\\Data\\Clean Followers DF\\Clean follower fr culture.csv", row.names=FALSE)

# Far right Parties
write.csv2(clean_df_fr_p,"C:\\Users\\39333\\Desktop\\UNIVERSITA\\MAGISTRALE COM-DAPS&CO\\CORSI\\DATA ACCESS AND REGULATIONS\\CAPSTONE PROJECT\\Capstone_Taddei_Ita_Right\\Data\\Clean Followers DF\\Clean follower fr parties.csv", row.names=FALSE)

# Right wing Cultures
write.csv2(clean_df_rw_c,"C:\\Users\\39333\\Desktop\\UNIVERSITA\\MAGISTRALE COM-DAPS&CO\\CORSI\\DATA ACCESS AND REGULATIONS\\CAPSTONE PROJECT\\Capstone_Taddei_Ita_Right\\Data\\Clean Followers DF\\Clean follower rw culture.csv", row.names=FALSE)

# Right wing Parties
write.csv2(clean_df_rw_p,"C:\\Users\\39333\\Desktop\\UNIVERSITA\\MAGISTRALE COM-DAPS&CO\\CORSI\\DATA ACCESS AND REGULATIONS\\CAPSTONE PROJECT\\Capstone_Taddei_Ita_Right\\Data\\Clean Followers DF\\Clean follower rw parties.csv", row.names=FALSE)











