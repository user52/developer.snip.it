---
title: Users
---

# Users API

## Get a single user

    [GET] /users/:user

### Response

<%= headers 200 %>
<%= json :user %>


## Get the authenticated user

	[GET] /users/me

### Response

<%= headers 200 %>
<%= json :user_me %>

