Rails.application.routes.draw do
  root "task_lists#index"
  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout

  get "about" => "sessions#about"

  resources :task_lists do
    resources :tasks do
      post :complete, :on => :member
    end
  end
end
