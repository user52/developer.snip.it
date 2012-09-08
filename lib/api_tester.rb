require 'awesome_print'
require 'httparty'
require 'json'

namespace :api do
  desc "Pull an api method"
  task :fetch do
    url = ARGV[1]
    token = ARGV[2]
    response = HTTParty.get(url)
    p "URL Response: #{response.code}"
    ap JSON.parse(response.body), :indent => -2, :plain => true, :index => false, :sort_keys => true
    if token
      response = HTTParty.get(url, :headers => {"Authorization" => "OAuth #{token}"})
      p "Authed URL Response: #{response.code}"
      ap JSON.parse(response.body), :indent => -2, :plain => true, :index => false, :sort_keys => true
    end
  end
end
