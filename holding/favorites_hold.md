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
