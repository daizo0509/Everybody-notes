class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])

  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to("/")
    
  end

  def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private

  def set_post
      @post = Post.find(params[:id])
  end

  def post_params
      params.require(:post).permit(:title, :content )
  end

end