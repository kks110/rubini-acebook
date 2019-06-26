class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.username}"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  # def show
  #   render 'show'
  # end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
