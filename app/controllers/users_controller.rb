class UsersController < ApplicationController
  def index

  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(id: "DESC")
    a = @user.post_comments
    @comments = a.group(:post_id).order(id: "DESC")
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
  end

  def update
  end
end
