Rails.application.routes.draw do
  root "posts#index"
  resources :posts do
    resources :comments, only: %i[create destroy]
    post :favourite, to: "favourite#create"
  end
  devise_for :users, controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations",
  }
  get "users/:id", to: "users#show", as: :user
  resources :contacts, only: %i[index new create destroy]
  get "which_post/:p", to: "which_post#show", as: :which_post
end
