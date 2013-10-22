#!/usr/bin/env ruby
Dir.chdir File.dirname(__FILE__)
require 'rubygems'
require 'browser_channel'
require 'browser_test_channel'
require File.expand_path("../demo_handler.rb", __FILE__)

unless String.respond_to? :bytesize
  # This only patches in on Ruby 1.8.6
  class String
    alias :bytesize :size
  end
end

stack = proc {
  # use Closure::Middleware, 'script/index'
  use Rack::CommonLogger
  use Rack::Reloader, 1
  map '/channel' do
    run BrowserChannel::Server.new({handler: DemoHandler})
  end
  map '/test' do
    run BrowserTestChannel::Server.new
  end
  map '/demo' do
    run Rack::File.new(File.expand_path("../public/demo.html", __FILE__))
  end
  map '/' do
    run Rack::File.new(File.expand_path("../public/", __FILE__))
  end
}

# Were we executed/loaded or used as a config.ru?
if Rack::Builder === self
  stack.call
else
  EventMachine.run do
    Rack::Handler::Thin.run(Rack::Builder.new(&stack), :Port => 3000) do |server|
      server.timeout = 35 # keep this timeout above keep_alive_interval
      server.maximum_connections = 20_000
      server.maximum_persistent_connections = 15_000
    end
  end
end
