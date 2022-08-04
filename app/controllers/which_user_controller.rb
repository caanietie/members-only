class WhichUserController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by username: params[:u]
    if params[:p].eql? ?0
      @favourites = @user.favourites
    elsif params[:p].eql? ?1
    else
      @user = nil
    end
  end
end
