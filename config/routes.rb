Rails.application.routes.draw do
  root "task_lists#index"
  get "/task_lists" => "task_lists#index"
  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout
end
