Rails.application.routes.draw do
  namespace :api do
    post 'manage_expendables/add', to: 'manage_expendables#add'
    put 'manage_expendables/plus', to: 'manage_expendables#plus'
    put 'manage_expendables/minus', to: 'manage_expendables#minus'
  end
  
end
