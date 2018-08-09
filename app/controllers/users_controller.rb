class UsersController < ApplicationController
  def index

  end

  def show
    @user = User.find(params[:id]) 
    @posts = @user.posts.order(id: "DESC").page(params[:page]).per(3)
    a = @user.post_comments
    @comments = a.group(:post_id).order(id: "DESC").page(params[:page]).per(3)
  end

  def edit
    if admin_signed_in?
        @user = User.find(params[:id])
    else
      if @user = User.exists?(params[:id])
         @user = User.find(params[:id])
        if @user != current_user
          redirect_to user_path(@user),alert:"他のユーザーを編集する事はできません"
        end
      else
          redirect_to user_path(current_user), alert:"存在しないユーザーです"
        end
      end
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
      @user = User.find(params[:id])
      if admin_signed_in? or @user == current_user
        if @user.update(user_params)
           redirect_to user_path(@user), notice:"ユーザー情報編集が完了しました"
        else
         redirect_to edit_user_path(@user), alert:"ユーザー情報編集に失敗しました"
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:name,:introduction,:profile_image,:email)
    end

end
