# Get FOLLOWERS of every user of the lists

# First we transform the SCREEN_NAME in the dataframes in string characters

ch_fr_culture = unlist(c(name_far_right_culture))

# Now we get the follower throungh rtweet

auth_as('access')
auth_as('taddo')

prova = c("NeraRadio", "Zetazeroalfa451", "PP_Crotone")
prova[3]

prova_follow = get_followers(
  user = prova,
  n = 5000,
  cursor = "-1",
  retryonratelimit = NULL,
  parse = TRUE,
  verbose = TRUE,
  token = NULL,
  page = lifecycle::deprecated()
)
