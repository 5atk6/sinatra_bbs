require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require "sinatra/json"

require './image_uploader.rb'
require './models.rb'
require './models/bbs.rb'

get '/' do
    @contents = Contribution.order('id desc').all
    erb :index
end

post '/new' do
    Contribution.create({
        name: params[:user_name],
        body: params[:body]
    })
    
    redirect '/'
end

post '/delete/:id' do
    Contribution.find(params[:id]).destroy
    redirect '/'
end