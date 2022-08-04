class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]

  def index
    if user_signed_in?
      redirect_to which_post_path(p: 1)
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find_by id: params[:id]
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new post_params
    if @post.save
      flash[:notice] = "Post was created"
      redirect_to @post
    else
      flash.now[:alert] = "Post was not created"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find_by id: params[:id]
  end

  def update
    @post = Post.find_by id: params[:id]
    if @post.update post_params
      flash[:notice] = "Post was sucessfully updated"
      redirect_to @post
    else
      flash.now[:alert] = "Unable to update post"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find_by id: params[:id]
    if @post.destroy
      flash[:info] = "Post is successfully deleted"
      redirect_to posts_path, status: :see_other
    else
      flash.now[:alert] = "Unable to delete post"
      render :show, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit %i[title body]
  end
end
