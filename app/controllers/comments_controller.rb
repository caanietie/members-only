class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find_by id: params[:post_id]
    comment = post.comments.new comment_params
    if comment.save
      flash[:notice] = "Comment created"
    else
      flash[:alert] = "Comment not created"
    end
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find_by id: params[:post_id]
    comment = post.comments.find_by id: params[:id]
    if comment.destroy
      flash[:notice] = "Comment was deleted."
    else
      flash[:alert] = "Comment was not deleted."
    end
    redirect_to post_path(post), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit %i[commenter body]
  end
end
