class PostsController < ApplicationController

  before_action :require_user
  before_action :correct_user, only: [:edit, :update, :destroy]
  helper_method :time_calculation

  def index
    @posts = Post.all.order(created_at: :desc)
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
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = "Your post has been updated"
      redirect_to posts_path
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

  def time_calculation(created_at_time, time_now = Time.new)
    time_difference_in_sec = time_now - created_at_time
    if time_difference_in_sec < 60
      "#{time_difference_in_sec.to_i} seconds ago"
    elsif time_difference_in_sec < 3600
      "#{(time_difference_in_sec/60).to_i} minutes ago"
    elsif time_difference_in_sec < 86400
      "#{((time_difference_in_sec/60)/60).to_i} hours ago"
    elsif time_difference_in_sec < 31540000
      "#{(((time_difference_in_sec/60)/60)/24).to_i} days ago"
    else
      "Over 1 year old"
    end
  end

  def profile
        @posts = Post.all.order(created_at: :desc)
    render 'profile'
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
