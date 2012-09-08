---
title: Folders
---

#  Folders

*Folders*, also known as *Collections*, are the most basic containers users snip in to. They can be aggregated into Groups 

## Get folders for a user

This retrieves the collections for a user

    [GET] /users/:user/folders

While the following retrieve the same for an authenticated user

    [GET] /users/my_folders


### Response

<%= headers 200 %>
<%= json :my_folders %>

## Retrieving a specific folder

