Rails.application.routes.draw do
  namespace :api do
    get '/sports' => 'sports#index'
    post '/sports' => 'sports#create'
    get '/sports/:id' => 'sports#show'
    patch '/sports/:id' => 'sports#update'
    delete '/sports/:id' => 'sports#destroy'
  end
end 
