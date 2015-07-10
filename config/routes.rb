Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
     get '/' => 'bands#index'
     get '/bands' => 'bands#index'
     get '/bands/:id' => 'bands#show'
     post '/bands' => 'bands#create'
     patch '/bands/:id' => 'bands#update'
     delete '/bands/:id' => 'bands#destroy'
   end
 end
end
