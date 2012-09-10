---
title: Snip.It API
---

# The Snip.It API

The Snip.It API offers up the resources that make up the Snip.It service. 

Please see the API Changelog for the latest changes and updates to the API.

## Current Version

The current SnipI.It API version is **v2**. 

We strive to make the API fast, consistent and bug-free. If you find otherwise, please send us a support message and we'll do our best to fix it as fast as we can. 

## Authentication

Most of the resource in the API provide access to information that is non-private. If a resource is completely private a request will return a *Unauthorized* response

<%= headers 401 %>

If the user is authenticated then results may contain additional information specific to that user.
