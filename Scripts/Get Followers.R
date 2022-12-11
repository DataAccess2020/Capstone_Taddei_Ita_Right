# Get FOLLOWERS of every user of the lists

# First we transform the SCREEN_NAME in the dataframes in string characters

auth_as('taddo')

# FAR RIGHT CULTURE

list_fr_culture = c(far_right_culture$screen_name)

list_fr_culture[12] #now it gave use all the Screen Name of the pages, now we can automatize the get_follower with a general function

# Now we get the follower throungh rtweet, creating a general function to use

getAllFollowers <- function (name) { 
    user_follower <- get_followers(name, n=Inf, retryonratelimit = T)
    Sys.sleep(1)
    return(user_follower) }

follower_fr_culture <- lapply(X = list_fr_culture, FUN = getAllFollowers)

# It works pretty well! It creates a large list with n element = n pages we need to get the follower
# Inside of it there's every user id that follows the pages

# FAR RIGHT PARTIES

list_fr_parties = c(far_right_parties$screen_name)

follower_fr_parties <- lapply(X = list_fr_parties, FUN = getAllFollowers)
