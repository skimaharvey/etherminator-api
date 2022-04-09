Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/challenges' => 'challenges#index'
  post '/create_challenge' => 'challenges#create'
  post '/get_abi' => "challenges#abi"

  post '/level_start' => 'users#level_start'
  post '/level_end' => 'users#level_end'
  post '/login' => 'users#login'


  post '/new_admin' => 'admins#create'
  post '/admin' => 'admins#login'

  post '/find_instance' => 'instances#find_instance'

  get '/tags' => 'tags#index'
end
