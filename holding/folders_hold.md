IN GET FOLDERS:

While the following retrieves the same for an authenticated user

    [GET] /users/my_folders

RESPONSE

<%= json :my_folders %>


## Updating a folder

	[PUT] /folders/:folder

### Response

<%= headers 200 %>


## Subscribing to a folder

	[POST] /folders/:folder/subscription

### Response

<%= headers 200 %>


## Unsubscribing from a folder

	[DELETE] /folders/:folder/subscription

### Response

<%= headers 200 %>

## Deleting a folder

	[DELETE] /folders/:folder

### Response

<%= headers 200 %>
<%= json :folder_delete %>

