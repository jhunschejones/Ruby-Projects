class ApplicationController < ActionController::Base
  def home
    render html:"Home page for the toy_app basic blog Rails app."
  end
end
