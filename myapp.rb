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
  path="/var/vo"
  content=Hash.new
  dir=Dir.entries(path)
  files=[]
  # 切换到 /var/vo volume 目录
  Dir.chdir(path) do
    # 查找 /var/vo 下的文件
    dir.each do |f|
      if File.exist?(File.expand_path(f)) && File.directory?(f) != true
        files.push File.expand_path(f)
      end
    end
    # 把所有文件内容放入变量 content
    files.each do |f|
        item=Array('')
        IO.foreach f do |l|
          item.push l
        end
        content[f]=item
    end
  # write log
  log=Time.new().to_s+"   "+request.ip+"  :"+request.user_agent+"\n"
  f=File.new("ip.log","a")
  f.write(log)
  f.close
  end
  erb :index, :locals => {:content => content}
end
