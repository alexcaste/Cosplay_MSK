Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations'
    }

  root to: "questions#index"


  resources :questions do
    resources :comments, except: ["index", "show"]
  end

  resources :candidates
  resources :users, only: ["show", "index"]

end
