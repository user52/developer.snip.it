---
title: Snips
---

# Snips

## Retrieving the snips in a folder

	[GET] /folders/:folder/snips

### Response

<%= headers 200 %>
<%= json :folder_snips %>

## Creating a snip

Creates a new snip for the authenticated user

	[POST] /snips

### Input

title
: _Required_ **string** – Title for new snip

caption
: _Optional_ **string** – Caption for the new snip

url
: _Required_ **string** – URL the snip refers to

img_url
: _Optional_ **string** – URL to the image representing the snip

folder_id
: _Optional_ **id** – id for the existing collection this snip will be assigned to. Presence of this parameter overrides the `folder` attribute

folder
: _Optional_ **string** – JSON representation of the new folder this snip will be asssigned to. Note that `folder_id` overrides this parameter

originated_by
: _Optional_ **string** – Representation of the application or tool that created this new snip. 

<%= json \
	:title => "Text-Driven Coffee Machine Gives New Meaning to 'Instant Coffee'", \
	:caption => "I wouldn't mind a \"textpresso\" machine hanging around the office ;)", \
	:url => "http://www.nbcbayarea.com/news/local/Text-Driven-Coffee-Machine-Gives-New-Meaning-to-Instant-Coffee-146440315.html", \
	:img_url => "http://media.nbcbayarea.com/images/654*417/textspresso-thumb-550xauto-88130.jpg", \
	:folder_id => 15738, \
	:folder => "{ title : \"Caffeine-Nation\"}", \
	:originated_by => "resnip" \
%>

### Response

<%= headers 200 %>


## Update a snip

Updates a snip for the authenticated user

	[PUT] /snips/:snip

### Input

title
: _Optional_ **string** – New title for snip

caption
: _Optional_ **string** – New caption for snip

img_url
: _Optional_ **string** – New image URL for snip

<%= json \
	:title => "Text-Driven Coffee Machine Gives New Meaning to 'Instant Coffee'", \
	:caption => "I wouldn't mind a \"textpresso\" machine hanging around the office ;)", \
	:img_url => "http://d2fkwnqkeasf43.cloudfront.net/77221e94ee907c9e447f248cce4b87964116b1403bc19a8a5e7b0d84af8c31d3-500x319.jpg"
%>

### Response

<%= headers 200 %>


## Favorite a snip

	[POST] /snips/:snip/favorite

### Response

<%= headers 200 %>

## Un-favorite a snip

	[DELETE] /snips/:snip/favorite

### Response

<%= headers 200 %>

## Resnipping

Resnips a given snip for the authenticated user

	[POST] /snips/:snip/resnip

### Input

folder_id
: _Required_ **id** – folder to resnip in to. The folder must be a folder that is owned by the authenticated user.

<%= json :folder_id => 54321 %>

### Response

<%= headers 200 %>

## Deleting a snip

	[DELETE] /snips/:snip

### Response

<%= headers 200 %>
