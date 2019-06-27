class LikesController < ApplicationController
  before_action :find_post

  def create
    @post.likes.create(user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(user_id: params[:user_id], post_id: params[:post_id])
    @like.destroy
  end


  private
  def find_post
    @post = Post.find(params[:post_id])
  end
end
