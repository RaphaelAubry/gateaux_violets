Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cakes#index', as: :home
  get 'baskets/:id/invoice', to: 'baskets#invoice', as: :invoice
  get 'pages/identification', to: 'pages#identification', as: :identification
  get 'pages/contact', to: 'pages#contact', as: :contact
  get 'pages/delivery', to: 'pages#delivery', as: :delivery
  get 'pages/sales_legal', to: 'pages#sales_legal', as: :sales_legal

  devise_for :users

  resources :cakes, except: [:index]
  resources :baskets

  resources :cakes do
    resources :lines, only: [:new, :create, :edit, :update]
  end

  resources :lines, except: [:new, :create]

  resources :addresses, except: [:index]

  resources :baskets do
    resources :transactions, only: [:new, :create]
  end

  resources :transactions, only: [:index, :show]

end
