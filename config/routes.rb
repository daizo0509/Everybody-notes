Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :users
  get 'admin_page/top'
  get 'admin_page/posts'
  get 'admin_page/users'
  get 'admin_page/tags'
  get 'searches/index'
  get 'likes/create'
  get 'likes/destroy'
	root 'posts#index'
  get 'user/:id/user_posts' => 'users#user_posts', as:"user_posts"
  get 'user/:id/user_likes' => 'users#user_likes',as:"user_likes"
  get 'user/:id/user_comments' => 'users#user_comments',as:"user_comments"
	resources :users

	resources :posts do
		resources :post_comments
		resource :likes, only: [:create, :destroy]
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
