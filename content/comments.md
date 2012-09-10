---
title: Comments
---

#  Comments

## Get comments for a snip

    [GET] /snips/:snip/comments

### Response

<%= headers 200 %>
<%= json :post_comments %>

## Add a comment to a snip

Adds a comment to a given snip for the authenticated user

	[POST] /snips/:snip/comments

### Input

message
: _Required_ **string** – Comment to add to given snip

<%= json :message => "epic" %>

## Delete a comment

Deletes a comment owned by the authenticated user

	[DELETE] /comments/:comment

### Response

<%= headers 200 %>

