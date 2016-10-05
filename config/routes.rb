Rails.application.routes.draw do
  root 'paths#index'
  resources :paths do
    resources :courses do
      resources :missions
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
