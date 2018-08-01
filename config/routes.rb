Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :users
  get 'admin_page/top'
  get 'admin_page/posts_index'
  get 'admin_page/users_index'
  get 'admin_page/tags_index'
  get 'searches/index'
  get 'likes/create'
  get 'likes/destroy'
  get 'post_comments/create'
  get 'post_comments/edit'
  get 'post_comments/destroy'
	root 'posts#index'
	resources :users
	resources :posts do
		resource :post_comments, only: [:create, :destroy]
		resource :likes, only: [:create, :destroy]
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
