---
title: Comments
---

#  Comments

## Get comments for a snip

    [GET] /snips/:snip/comments

### Response

Comments for a snip can be voted up by other users. These are indicated in the response as a tallied total as well as a list of the users that voted the comment up.

<%= headers 200 %>
<%= json :post_comments %>

