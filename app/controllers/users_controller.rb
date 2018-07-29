class UsersController < ApplicationController
  def index

  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts 
    @comments = @user.post_comments
   
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
  end

  def update
  end
end
