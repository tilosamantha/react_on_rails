Rails.application.routes.draw do

  #api call endpoints
  namespace :api do

    #resources :comments
    resources :todos
  end
end
