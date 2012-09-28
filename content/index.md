---
title: Snip.It API
---

# The Snip.It API

The Snip.It API offers up the resources that make up the Snip.It service.

Each API endpoint is documented relative to a base URL that is versioned.

	http://snip.it/api/<api-version>/

The current API version is **v2**. 

We strive to make the API fast, consistent and bug-free. If you find otherwise, please send us a support message and we'll do our best to fix it as fast as we can. 

The endpoints are documented *relative* to this base URL. For example:

	snips/:snip

documents the `snips` endpoint relative to the base URL

## Requests

Requests to APIs are made using `GET` for most endpoints, since most endpoints are read-only, and follow a straightforward REST style. 

The current **documented and supported** API only supports read-only endpoints. We're working on documenting and exposing the update and delete documentation.

Parameters are prefixed with `:` to indicate an argument to the request.

	[GET] snips/:snip

documents the `snip` endpoint with a required **id** to pass in to retrieve the details for a given snip. 



## Response

The repsonse to a request is always in *JSON* format and is documented with the HTTP response code.

<%= headers 200 %>
<%= json :post %>

A response may (and usually does) include more data than documented, the documentation indicates the **supported subset** of the attributes.

Error responses are indicated in a similar way. We don't document errors for each endpoint unless they are specific to that endpoint but they are all structured like the following example

<%= headers 404 %>
<%= json :error_sample %>

