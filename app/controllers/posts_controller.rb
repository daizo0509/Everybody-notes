class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :set_search

  def index
    @posts = Post.all.order(id: "DESC").page(params[:page]).per(10)
    @search = Tag.ransack(params[:q])
    @user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @comments = PostComment.where(post_id: @post)
    @likes = Like.where(post: params[:id])
    user = @post.user_id
    @user = User.find(user)
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])

  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post.id)
    
    
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

  def set_post
      @post = Post.find(params[:id])
  end

  def post_params
      params.require(:post).permit(:title, :content,:user_id,:tag_list)
  end

  def set_search
      @search = Tagging.ransack(params[:q])
  end

end
