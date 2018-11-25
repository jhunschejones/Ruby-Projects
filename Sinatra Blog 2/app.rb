# dependencies
require "sinatra"
require "sinatra/activerecord"
require './config/environments'
require "sinatra/flash"
require "sinatra/redirect_with_flash"
require_relative "models/post"
require_relative "controllers/post_controllers"

after do
  ActiveRecord::Base.connection.close
end