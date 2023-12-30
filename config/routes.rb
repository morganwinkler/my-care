Rails.application.routes.draw do
  #user routes
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  #visit routes
  get "/visits" => "visits#index"
  get "/visits/:id" => "visits#show"
  post "/visits" => "visits#create"
  patch "/visits/:id" => "visits#update"
  delete "/visits/:id" => "visits#destroy"
end
