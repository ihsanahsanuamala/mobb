Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # halaman utama
  root to: 'home#index', as: 'home_index'

  # register
  get '/daftar', to: 'auth#form_register', as: 'form_register'
  post '/daftar', to: 'auth#register', as: 'register_post'

  # login
  get '/login', to: 'auth#form_login', as: 'form_login'
  post '/login', to: 'auth#login', as: 'login_post'

  # logout
  delete 'logout/:id', to: 'auth#logout', as: 'user_logout'
end
