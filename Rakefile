require 'nanoc3/tasks'
require 'stringex'
require 'httparty'
require 'json'
require 'hashdiff'
require 'ap'

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
	open(filename, 'w') do end
end

desc "Pull an api method"
task :fetch do
	url = ARGV[1]
	token = ARGV[2]
	unauthed = HTTParty.get(url)
	p "URL Response: #{unauthed.code}"
	ap JSON.parse(unauthed.body), :indent => -2, :plain => true, :index => false, :sort_keys => true
	if token
	  authed = HTTParty.get(url, :headers => {"Authorization" => "OAuth #{token}"})
	  p "Authed URL Response: #{authed.code}"
	  ap JSON.parse(authed.body), :indent => -2, :plain => true, :index => false, :sort_keys => true
	  if unauthed.code == 200
	    p "Diffed:"
	    ap HashDiff.diff(unauthed, authed)
	  end
	end
end
