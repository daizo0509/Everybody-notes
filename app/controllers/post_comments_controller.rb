class PostCommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
	@comment = current_user.post_comments.new(post_comment_params)
	@comment.post_id = @post.id
	@comment.user_id  = current_user.id
	@comment.save
  end

  def edit
  end

  def destroy
  end
end
