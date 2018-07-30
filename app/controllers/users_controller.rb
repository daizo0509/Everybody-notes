class UsersController < ApplicationController
  def index

  end

  def show
    @user = User.find(params[:id]) 
    @posts = @user.posts.order(id: "DESC").page(params[:page]).per(10)
    a = @user.post_comments
    @comments = a.group(:post_id).order(id: "DESC").page(params[:page]).per(5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
  end

  def update
  end
end
