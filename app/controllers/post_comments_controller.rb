class PostCommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
	@comment = current_user.post_comments.new(post_comment_params)
	@comment.post_id = @post.id
	@comment.user_id  = current_user.id
	@comment.save
	redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = PostComment.find(params[:id])
    if @comment.user != current_user
      redirect_to post_path(@comment.post_id), notice:'＜error＞投稿者以外は編集することができません'      
    end
  end
  
  def update
    comment = PostComment.find(params[:id])
    comment.update(post_comment_params)
    redirect_to post_path(comment.post_id)
  end


  def destroy
    comment = PostComment.find(params[:id])
    comment.destroy
    redirect_to post_path(comment.post_id)
  end

  private

    def post_comment_params
      params.require(:post_comment).permit(:user_id,:post_id,:comment,)
    end
end
