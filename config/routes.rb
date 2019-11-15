Rails.application.routes.draw do
  root 'artists#index'

  resources :artists do
    resources :songs
  end
end