Rails.application.routes.draw do
  root to: "application#index"
  resources :paths do
    resources :courses do
      resources :missions
    end
  end

  resources :posts

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
