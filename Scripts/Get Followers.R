# Get FOLLOWERS of every user of the lists

# First we transform the SCREEN_NAME in the dataframes in string characters

list_fr_culture = c(far_right_culture$screen_name)

list_fr_culture[12] #now it gave use all the Screen Name of the pages, now we can iterate with a for loop

# Now we get the follower throungh rtweet

auth_as('taddo')

getAllFollowers <- function (name) { 
    user_follower <- get_followers(name, n=Inf, retryonratelimit = T)
    Sys.sleep(1)
    return(user_follower) }

follower_fr_culture <- lapply(X = list_fr_culture, FUN = getAllFollowers)
# It works pretty well! It creates a large list with n element = n pages we need to get the follower
# Inside of it there's every user id that follows the pages

