class PostsController < ApplicationController

  before_action :require_user
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "Your post has been added"
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = "Your post has been updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Your post has been deleted"
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end

  def correct_user
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      flash[:error] = "Hands off! This is not your post."
      redirect_to posts_path
    end
  end
end
