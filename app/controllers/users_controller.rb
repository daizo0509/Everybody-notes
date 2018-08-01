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
    @user = User.find(params[:id])
    @user.destroy
    if admin_signed_in?
      redirect_to admin_page_top_path
    else
      redirect_to root_path
    end
  end

  def update
  end
end
