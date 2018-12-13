Rails.application.routes.draw do
  get 'manage_expendables', to: 'manage_expendables#list', as: :manage_expendables

  get 'manage_expendables/:house_id', to: 'manage_expendables#category', as: :manage_expendables_category
  get 'manage_expendables/:house_id/:category_id', to: 'manage_expendables#category_w', as: :manage_expendables_category_w

  get 'manage_expendables_new/:house_id', to: 'manage_expendables#new', as: :manage_expendables_new
  get 'manage_expendables_post/:house_id', to: 'manage_expendables#post', as: :manage_expendables_post

  get 'manage_expendables/edit'

  get 'houses', to: 'houses#index', as: :houses

  get 'houses/list'

  get 'houses/new'

  get 'houses/edit'


  # 管理系
  # get 'expendables', to: 'expendables#index', as: :expendables
  # get 'expendables/:id', to: 'expendables#show', as: :expendables_edit
  post 'expendables/:id', to: 'expendables#update', as: :update_expendables
  post 'expendables', to: 'expendables#create', as: :create_expendables
  resources :expendables

  # get 'expendables/list'

  # get 'expendables/new'


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
