require 'sinatra'
require 'erb'

module Sinatra
  class Base
    set :server, %w[thin mongrel webrick]
    set :bind, '0.0.0.0'
    set :port, 8080
    set :views, File.dirname('.') + '/views'
  end
end

get '/' do
  filepath="./myapp.rb"
  title=File.expand_path(filepath)
  file=File.new(File.expand_path(filepath))
  content=[]
  file.each_line do |l|
    content.push l
  end
  file.close
  erb :index, :locals => { :title => title, :content => content}
end
