class LikesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  def create
  	@post = Post.find(params[:post_id])
    @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
 
	    respond_to do |format|
	        format.js
    	end
    @post.reload
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id]).destroy
   		respond_to do |format|
           format.js
      	end
    @post.reload
  end

  private

	  def set_post
	    @tweet = Post.find(params[:post_id])
	  end
end
