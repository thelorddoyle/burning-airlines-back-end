Rails.application.routes.draw do

  get '/flights' => 'flights#index'
  get '/flights/:id' => 'flights#show'
  get '/flights/search/:origin' => 'flights#search'
  # post '/flights' => 'flights#create'

  post '/reservations' => "reservations#create"

  # get '/planes' => 'planes#index'
  # get '/planes/:id' => 'planes#show'
  # post '/planes/' => 'planes#create'
  
end
