Rails.application.routes.draw do
  #user routes
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
end
