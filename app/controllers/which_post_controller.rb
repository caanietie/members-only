class WhichPostController < ApplicationController
  before_action :authenticate_user!

  def show
    @posts = if params[:p].eql? ?1
               Post.where user_id: current_user.id
             else
               Post.where.not user_id: current_user.id
             end
  end
end
