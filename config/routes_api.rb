Rails.application.routes.draw do
  namespace :api do
    post 'manage_expendables/add', to: 'manage_expendables#add'
    
  end
  
end
