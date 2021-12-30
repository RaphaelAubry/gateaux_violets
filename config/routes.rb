Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cakes#index', as: :home

  resources :cakes, except: [:index]
  resources :baskets

  resources :cakes do
    resources :lines, only: [:new, :create, :edit, :update]
  end

  resources :lines, except: [:new, :create]

end
