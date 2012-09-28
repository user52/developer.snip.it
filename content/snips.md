---
title: Snips
---

# Snips

## Retrieving the snips in a collection

	[GET] /folders/:folder/snips

### Response

<%= headers 200 %>
<%= json :folder_snips %>

## Retrieving a snip

	[GET] /snips/:snip

### Response

<%= headers 200 %>
<%= json :post %>

