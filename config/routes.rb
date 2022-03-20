Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/challenges' => 'challenges#index'
  post '/create_challenge' => 'challenges#create'
  post '/level_start' => 'users#level_start'
  post '/new_admin' => 'admins#create'
  post '/admin' => 'admins#login'
end
