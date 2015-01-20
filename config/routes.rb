Rails.application.routes.draw do
  resources :users do
    resources :ideas
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root to: 'sessions#new'
end
