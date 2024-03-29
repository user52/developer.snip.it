require 'nanoc3/tasks'
require 'stringex'
require 'httparty'
require 'json'
require 'hashdiff'
require 'ap'

content_dir			= "content"	# source directory
new_endpoint_ext	= "md" 		# default extension for new endpoint docs
deploy_dir			= "output" 	# directory to deploy from
deploy_branch		= "gh_pages" # target branch to deploy to (Github-Pages)

desc "Compile the site"
task :compile do
  `bundle exec nanoc compile`
end

desc "Auto compile the site"
task :autocompile do
  `bundle exec nanoc autocompile`
end

desc "Deploy the site to gh-pages"
task :deploy do
	cd "#{deploy_dir}" do
	  system "git add ."
	  system "git add -u"
	  puts "\n## Commiting: Site updated at #{Time.now.utc}"
	  message = "Site updated at #{Time.now.utc}"
	  system "git commit -m \"#{message}\""
	  puts "\n## Pushing generated #{deploy_dir} website"
	  system "git push origin --force"
	  puts "\n## Github Pages deploy complete"
	end
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
task :fetch, :url do |t, args|
	url = args.url
	token = ENV['SNIPIT_TOKEN']
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
