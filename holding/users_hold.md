## Get the authenticated user

	[GET] /users/me

### Response

<%= headers 200 %>
<%= json :user_me %>

## Update user

	[PUT] /users/:user

### Response

<%= headers 200 %>
