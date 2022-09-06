Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :users, only:[] do
    resources :meeting_points, only: [:new, :create]
  end
  resources :meeting_points, only: [:edit, :update, :index]

  resources :questions, only: [:create, :index, :show] do
    resources :answers, only: [:create]
  end

  resources :points_of_interests, only: [:index, :show]

  resources :chatrooms, only: %i[ index show create] do

    resources :messages, only: %i[ create ]
  end

  post :get_route_points, to: "route_points#get_points"
end
