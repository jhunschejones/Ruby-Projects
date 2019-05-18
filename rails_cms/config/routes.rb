Rails.application.routes.draw do

  root 'subjects#index'

  resources :subjects, :pages, :sections do
    # delete page is not automatically included
    member do
      get :delete
    end
  end
end
