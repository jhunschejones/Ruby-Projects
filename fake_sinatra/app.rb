# App to test out fake sinatra implementation
require_relative 'fake_sinatra'

get '/frank-says' do
  'Put this in your pipe & smoke it!'
end

get '/time' do
  Time.now.to_s
end
