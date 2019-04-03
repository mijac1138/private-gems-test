require "rubygems"
require "geminabox"
require 'one'

Geminabox.on_gem_received = Proc.new do |gem|
    One.test
end

run Geminabox::Server