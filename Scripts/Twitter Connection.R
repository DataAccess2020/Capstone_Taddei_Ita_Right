# Start the connection with Twitter developer API

library(rtweet)

auth <- rtweet_app()
auth_save(auth, "taddo")

