Rails.application.routes.draw do
  devise_for :users
  root to: "questions#index"

  resources :questions do
    resources :comments, except: ["index", "show"]
  end
  
  resources :candidates
  resources :users, only: ["show", "index"]

end
