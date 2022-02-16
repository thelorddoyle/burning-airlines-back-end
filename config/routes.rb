Rails.application.routes.draw do

  get '/flights' => 'flights#index'
  get '/flights/:id' => 'flights#show'
  # post '/flights' => 'flights#create'

  post '/reservations' => "reservations#create"

  # get '/planes' => 'planes#index'
  # get '/planes/:id' => 'planes#show'
  # post '/planes/' => 'planes#create'
  
end
