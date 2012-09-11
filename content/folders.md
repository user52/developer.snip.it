---
title: Folders
---

#  Folders

*Folders*, also known as *Collections*, are the most basic containers users snip in to. They can be aggregated into Groups 

## Get folders for a user

This retrieves the collections for a user

    [GET] /users/:user/folders

While the following retrieves the same for an authenticated user

    [GET] /users/my_folders


### Response

<%= headers 200 %>
<%= json :my_folders %>

## Retrieving a specific folder

	[GET] /folders/:folder

### Response

<%= headers 200 %>
<%= json :folder %>

## Subscribing to a folder

	[POST] /folders/:folder/subscription

### Response

<%= headers 200 %>


## Unsubscribing from a folder

	[DELETE] /folders/:folder/subscription

### Response

<%= headers 200 %>

## Retrieving the subscribers to a folder

	[GET] /folders/:folder/subscribers

### Response

<%= headers 200 %>
<%= json :folder_subscribers %>

## Deleting a folder

	[DELETE] /folders/:folder

### Response

<%= headers 200 %>
<%= json :folder_delete %>

