# run with `ruby -I lib app.rb`
require 'sinatra'
require 'movie'
require 'movie_store'

store = MovieStore.new('movies.yml')

get('/movies') do
  @movies = store.all
  erb :index
end

get('/movies/new') do
  erb :new
end

post('/movies/create') do
  @movie = Movie.new
  @movie.title = params["title"]
  @movie.genre = params["genre"]
  @movie.year = params["year"]
  store.save(@movie)
  redirect '/movies/new'
end

get('/movies/:id') do
  @movie = store.find(params["id"].to_i)
  erb :show
end
