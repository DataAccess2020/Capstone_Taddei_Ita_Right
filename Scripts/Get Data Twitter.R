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

far_right_culture = lists_members(
  list_id = "1600967243881451521",
  slug = NULL,
  owner_user = NULL,
  n = 100,
  cursor = "-1",
  token = NULL,
  retryonratelimit = NULL,
  verbose = TRUE,
  parse = TRUE,
)

ids_far_right_culture = tibble(far_right_culture$user_id)

# Get the list of Right-wing Parties

right_wing_parties = lists_members(
  list_id = "1601142337874395136",
  slug = NULL,
  owner_user = NULL,
  n = 100,
  cursor = "-1",
  token = NULL,
  retryonratelimit = NULL,
  verbose = TRUE,
  parse = TRUE,
)


ids_right_wing_parties = tibble(right_wing_parties$user_id)

# Get the list of Right-wing Culture

right_wing_culture = lists_members(
  list_id = "1601188241394237442",
  slug = NULL,
  owner_user = NULL,
  n = 100,
  cursor = "-1",
  token = NULL,
  retryonratelimit = NULL,
  verbose = TRUE,
  parse = TRUE,
)

ids_right_wing_culture = tibble(right_wing_culture$user_id)

