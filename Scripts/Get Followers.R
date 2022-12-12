# Get FOLLOWERS of every user of the lists

# First we transform the SCREEN_NAME in the dataframes in string characters

auth_as('taddo')

# FAR RIGHT CULTURE

list_fr_culture = c(far_right_culture$screen_name)

list_fr_culture[7]
list_fr_culture[12] #now it gave use all the Screen Name of the pages, now we can automatize the get_follower with a general function

# Now we get the follower throungh rtweet, creating a general function to use

getAllFollowers <- function (name) { 
    user_follower <- get_followers(name, n=Inf, retryonratelimit = T)
    Sys.sleep(1) # we put a system sleep of 1 sec to not overstimulate the server
    return(user_follower) }

follower_fr_culture <- lapply(X = list_fr_culture, FUN = getAllFollowers) # We usa a lapply to repeat the same function on all the pages in the list

# It works pretty well! It creates a large list with n element = n pages we need to get the follower
# Inside of it there's every user id that follows the pages

# FAR RIGHT PARTIES

list_fr_parties = c(far_right_parties$screen_name)

follower_fr_parties <- lapply(X = list_fr_parties, FUN = getAllFollowers)

# RIGHT-WING CULTURES

list_rw_culture = c(right_wing_culture$screen_name)

follower_rw_culture <- lapply(X = list_rw_culture, FUN = getAllFollowers)

# RIGHT-WING PARTIES

list_rw_parties = c(right_wing_parties$screen_name)

follower_rw_parties <- lapply(X = list_rw_parties, FUN = getAllFollowers)





