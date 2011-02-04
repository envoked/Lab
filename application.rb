require 'rubygems'
require 'sinatra'
require File.join(File.dirname(__FILE__), 'environment')

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

error do
  e = request.env['sinatra.error']
  Kernel.puts e.backtrace.join("\n")
  'Application error'
end

helpers do
  # add your helpers here
end

# root page
get '/' do
  "WOOO"
end

# action needed to help generate file  to avoid coding in .NET
get '/story' do
   # haml :story don't need this right now
   "http://www.google.com/                            Google
    http://www.bing.com/                              Bing"
end