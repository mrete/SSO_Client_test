Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  
  get '/auth/:provider/callback' => 'pages#authentication_callback'

  get '/get_user_information', to: 'application#get_user_information'
end
