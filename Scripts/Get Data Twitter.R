# First try get Twitter info
auth_as('taddo')

id_far_right_parties = lists_members(
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
