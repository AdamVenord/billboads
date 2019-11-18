Rails.application.routes.draw do
  root 'artists#index'
  
  

  resources :artists do
    resources :songs
      resources :billboards
  end
end