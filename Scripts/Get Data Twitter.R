# First try get Twitter info
auth_as('taddo')
library(tidyverse)
library(dplyr)
library(rtweet)
# Get the list of Far Right Parties

far_right_parties = lists_members(
  list_id = "1600600462612434969",
  slug = NULL,
  owner_user = NULL,
  n = 100,
  cursor = "-1",
  token = NULL,
  retryonratelimit = NULL,
  verbose = TRUE,
  parse = TRUE,
)


ids_far_right_parties = tibble(far_right_parties$user_id)


# Get the list of Far Right Culture

id_far_right_parties = lists_members(
  list_id = "",
  slug = NULL,
  owner_user = NULL,
  n = 100,
  cursor = "-1",
  token = NULL,
  retryonratelimit = NULL,
  verbose = TRUE,
  parse = TRUE,
)
