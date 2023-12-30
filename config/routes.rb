Rails.application.routes.draw do
  #user routes
  post "/users" => "users#create"
end
