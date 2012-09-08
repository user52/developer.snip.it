require 'awesome_print'
require 'httparty'
require 'json'
require 'hashdiff'

namespace :api do
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
end
