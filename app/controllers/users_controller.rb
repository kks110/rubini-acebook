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

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      flash[:success] = "Your details have been updated"
      redirect_to profile_path
    else
      flash[:error] = "Please try again"
      render 'edit'
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    session[:user_id] = nil
    flash[:success] = "Your account has been deleted"
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
