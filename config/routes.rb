Rails.application.routes.draw do
  devise_for :users, path: 'user', path_names:{sign_in: 'login', sign_out: 'logout'}
  root 'home#index'
  
  resources :posts, controller:"home"
  
  
  # get 'home/index'
  
  # get 'home/new'

  # post 'home/create', as: 'posts'
  
  # get 'home/destroy/:post_id' =>'home#destroy', as: 'post_destroy'

  # get 'home/edit/:post_id' => 'home#edit'

  # patch 'home/update/:post_id' => 'home#update', as: 'post'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
