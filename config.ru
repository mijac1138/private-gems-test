require "rubygems"
require "geminabox"
require 'dotenv/load'

use Rack::Auth::Basic do |username, password|
  username == ENV['BASIC_USERNAME'] && password == ENV['BASIC_PASS']
end

run Geminabox::Server