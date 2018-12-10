Rails.application.routes.draw do
  get 'users', to: 'users#index', as: :users
  
  # devise_for :users
  root 'home#index'
  get 'home/index'


  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  devise_scope :user do
    get 'logout' => 'devise/sessions#destroy'
    get 'users/:id/edit' => 'users/registrations#edit', as: :edit_other_user_registration
    match 'users/:id', to: 'users/registrations#update', via: [:patch, :put], as: :other_user_registration
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
