class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by username: params[:id]
    if params[:p].eql? ?0
      @posts = Post.where id: @user.favourites.pluck(:post_id)
    else # params[:p].eql? ?1
      @posts = @user.posts
    end
  end
end
