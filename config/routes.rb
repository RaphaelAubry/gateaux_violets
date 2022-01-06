Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cakes#index', as: :home

  devise_for :users


  resources :cakes, except: [:index]
  resources :baskets

  resources :cakes do
    resources :lines, only: [:new, :create, :edit, :update]
  end

  resources :lines, except: [:new, :create]

  resources :addresses, except: [:index]
end
