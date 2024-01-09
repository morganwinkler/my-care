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

  #medication routes
  get "/medications" => "medications#index"
  get "/medications/:id" => "medications#show"
  post "/medications" => "medications#create"
  patch "/medications/:id" => "medications#update"
  delete "/medications/:id" => "medications#destroy"

  #procedure routes
  get "/procedures" => "procedures#index"
  get "/procedures/:id" => "procedures#show"
  post "/procedures" => "procedures#create"
  patch "/procedures/:id" => "procedures#update"
  delete "/procedures/:id" => "procedures#destroy"

  #question routes
  get "/questions" => "questions#index"
  get "/questions/:id" => "questions#show"
  post "/questions" => "questions#create"
  patch "/questions/:id" => "questions#update"
  delete "/questions/:id" => "questions#destroy"

  #article routes
  get "/articles" => "articles#index"
  get "/articles/:id" => "articles#show"
  post "/articles" => "articles#create"
  patch "/articles/:id" => "articles#update"
  delete "/articles/:id" => "articles#destroy"
end
