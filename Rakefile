require 'nanoc3/tasks'
require 'stringex'

content_dir			= "content"	# source directory
new_endpoint_ext	= "md" 		# default extension for new endpoint docs

desc "Compile the site"
task :compile do
  `bundle exec nanoc compile`
end

desc "Auto compile the site"
task :autocompile do
  `bundle exec nanoc autocompile`
end

desc "Create new API endpoint"
task :create_endpoint, :title do |t, args|
	args.with_defaults(:title => 'new-endpoint')
	title = args.title
	filename = "#{content_dir}/#{title.to_url}.#{new_endpoint_ext}"
	if File.exist?(filename)
		abort("rake aborted!") if ask("#{filname} already exists. Do you want to override", ['y', 'n']) == 'n'
	end
	puts "Creating new endpoint document: #{filename}"
	open(filename, 'w') do | doc | 
		doc.puts <<-DOC_TEMPLATE
---
title: API title
---

# API title 

## API endpoint title

    [VERB] /path/to/endpoint.json

### Parameters

name
: description

### Input (request json body)

<%= json :field => "sample value" %>

### Response

<%= headers 200, :pagination => true, 'X-Custom-Header' => "value" %>
<%= json :resource_name %>
		DOC_TEMPLATE
	end
end
