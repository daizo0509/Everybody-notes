Rails.application.routes.draw do
  get 'post_comments/create'
  get 'post_comments/edit'
  get 'post_comments/destroy'
	devise_for :users
	root 'posts#index'
	resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
