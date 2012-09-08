---
title: Favorites
---

#  Favorites

Snips can be flagged as a favorite by the user. The following calls can be made to perform various actions on favorites.

## List Favorites

This lists the favorites for a user

    [GET] /users/:user/favorites

### Response

<%= headers 200 %>


##  Favorite a Snip

This marks a specific snip as a favorite for the authenticated user.

    [PUT] /posts/:post/favorite

### Response

<%= headers 200 %>

##  Un-favorite a Snip

This removes the favorite flag for a snip for the authenticated user.

    [DELETE] /posts/:post/favorite

### Response

<%= headers 200 %>
