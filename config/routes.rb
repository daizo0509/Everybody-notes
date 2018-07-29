Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'post_comments/create'
  get 'post_comments/edit'
  get 'post_comments/destroy'
	devise_for :users
	resources :users
	root 'posts#index'
	resources :users
	resources :posts do
		resource :post_comments, only: [:create, :destroy]
		resource :likes, only: [:create, :destroy]
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
