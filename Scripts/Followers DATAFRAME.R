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

