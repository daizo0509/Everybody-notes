class AdminPageController < ApplicationController
  def top
  end

  def posts
  	@posts = Post.all.order(id: "DESC").page(params[:page]).per(10)
  end

  def users
  	@users = User.all.order(id: "DESC").page(params[:page]).per(10)
  end

  def tags
  	@tags = Tag.all
  end
end
