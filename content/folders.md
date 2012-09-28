---
title: Folders
---

#  Folders

*Folders*, also known as *Collections*, are the most basic containers users snip in to. They can be aggregated into Groups 

## Get folders for a user

This retrieves the collections for a user

    [GET] /users/:user/folders

### Response

<%= headers 200 %>


## Retrieving a specific folder

	[GET] /folders/:folder

### Response

<%= headers 200 %>
<%= json :folder %>


## Retrieving the subscribers to a folder

	[GET] /folders/:folder/subscribers

### Response

<%= headers 200 %>
<%= json :folder_subscribers %>
