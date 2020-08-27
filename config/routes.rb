Rails.application.routes.draw do
  
  get 'comments/create'
  get 'comments/destroy'
  get 'comments/edit'
  patch 'comments/update'
  devise_for :users, path: 'user', path_names:{sign_in: 'login', sign_out: 'logout'}
  root 'home#index'
  
  resources :posts, controller:"home" do
    resources :comments #only: [:edit,:create, :destroy,:update]
  end
  
  
  # get 'home/index'
  
  # get 'home/new'

  # post 'home/create', as: 'posts'
  
  # get 'home/destroy/:post_id' =>'home#destroy', as: 'post_destroy'

  # get 'home/edit/:post_id' => 'home#edit'

  # patch 'home/update/:post_id' => 'home#update', as: 'post'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
