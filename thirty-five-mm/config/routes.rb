Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :categories
  
  resources :user, except: :destroy

  root 'categories#index'

  resources :films, except: [:index] do
    resources :reviews
    resources :comments, except: [:show]
  end
end
