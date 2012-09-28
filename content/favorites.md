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
<%= json :favorites %>