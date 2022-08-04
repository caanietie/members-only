class FavouriteController < ApplicationController
  before_action :authenticate_user!

  def create
    fav = Favourite.find_by post_id: params[:post_id], user_id: current_user.id
    if fav.nil? # fav does not exist; add to favourite
      fav = Favourite.new post_id: params[:post_id], user_id: current_user.id
      fav.save && (flash[:notice] = "You have added post to favourite")
    else # fav exist; remove from favourite 
      fav.destroy && (flash[:notice] = "You have remove post from favourite")
    end
    redirect_to post_path(params[:post_id])
  end
end
