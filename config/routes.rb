Rails.application.routes.draw do
  get 'manage_expendables', to: 'manage_expendables#index', as: :manage_expendables

  get 'manage_expendables/list/:house_id', to: 'manage_expendables#list', as: :manage_expendables_list

  get 'manage_expendables/new'

  get 'manage_expendables/edit'

  get 'houses', to: 'houses#index', as: :houses

  get 'houses/list'

  get 'houses/new'

  get 'houses/edit'

  get 'expendables', to: 'expendables#index', as: :expendables

  get 'expendables/list'

  get 'expendables/new'

  get 'expendables/edit'

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
