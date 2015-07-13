Rails.application.routes.draw do
  devise_for :users
  root to: "questions#index"

  resources :questions
  resources :candidates
  resources :users, only: ["show", "index"]

end
