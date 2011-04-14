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

get '/experiments/:title' do
  haml :"experiments/#{params[:title]}/index"
end

# action needed to help generate file  to avoid coding in .NET
get '/story' do
    content_type 'text/plain', :charset => 'utf-8'
    #return directories that aren't hidden
    @experiments = Dir.entries("views/experiments").select{|f| !(f =~ /^[.].*/)}
    haml :story
end