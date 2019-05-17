Rails.application.routes.draw do
  # get 'subjects/show'
  # get 'subjects/index'
  # get 'subjects/new'
  # get 'subjects/edit'
  # get 'subjects/delete'
  resources :subjects do
    member do
      get :delete
    end
  end
end
