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

  #doctor routes
  get "/doctors" => "doctors#index"
  get "/doctors/:id" => "doctors#show"
  post "/doctors" => "doctors#create"
  patch "/doctors/:id" => "doctors#update"
  delete "/doctors/:id" => "doctors#destroy"

  #nurse routes
  get "/nurses" => "nurses#index"
  get "/nurses/:id" => "nurses#show"
  post "/nurses" => "nurses#create"
  patch "/nurses/:id" => "nurses#update"
  delete "/nurses/:id" => "nurses#destroy"
end
