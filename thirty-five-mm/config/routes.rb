Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :films, except: [:index, :show] do
    resources :reviews
    resources :comments, except: [:show]
  end
end
