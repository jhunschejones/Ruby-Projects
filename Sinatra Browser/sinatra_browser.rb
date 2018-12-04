require 'sinatra'
require 'newrelic_rpm'

# default paths
# set :root, File.dirname(__FILE__)
# set :public_folder, settings.root + "public"
# set :views, settings.root + "views"

get '/' do 
  filepath = File.join(settings.public_folder, 'index.html')
  # Ruby way to respond with data, sends as a string
  # File.read(filepath)
  # Sinatra way to respond with data, sends assets as correct file type
  # send_file(filepath)
  # Send erb view template
  erb :index
end

get '/test' do
  # Erb tags, equal sign says to evaluate the code
  template = "The current year is <%= Time.now.year %>."
  erb template
end
