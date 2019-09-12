require 'sinatra'

# default paths
# set :root, File.dirname(__FILE__)
# set :public_folder, settings.root + "public"
# set :views, settings.root + "views"

get '/' do
  # Send erb view template
  erb :index
end

# serve the service-worker js at the root directory to allow global scope
get '/service-worker.js' do
  filepath = File.join(settings.public_folder, 'javascripts', 'service-worker.js')
  send_file(filepath)
end
