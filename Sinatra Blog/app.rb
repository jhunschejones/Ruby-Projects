require "sinatra"
require "sinatra/activerecord"
require "json"
require "./models.rb"
require "newrelic_rpm"

set :database, "sqlite3:blog_db.sqlite3"

# ====== routes for static files ======
get '/' do
  @posts = Post.all
  erb :index
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post_page
end 

# ====== API / database routes ======
get '/api/v1' do 
  content_type :json
  all_posts = Post.all
  all_posts.to_json
end

post '/api/v1' do 
  @post = Post.create(title: params[:title], author: params[:author], body: params[:body])
  redirect '/'
end

get '/api/v1/:id' do
  content_type :json
  this_post = Post.find(params[:id])
  this_post.to_json
end 

put '/api/v1/:id' do
  @post = Post.find(params[:id])
  @post.update(title: params[:title], author: params[:author], body: params[:body])
  @post.save
  redirect '/post/'+params[:id]
end

delete '/api/v1/:id' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/'
end