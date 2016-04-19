Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :categories
  
  resources :users, except: [:destroy, :index]

  root 'categories#index'

  resources :films, except: [:index] do
    resources :reviews
    resources :comments, except: [:show]
  end
end
