class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user && @user.save
      log_in(@user)
      redirect_to '/'
    else
      render 'new'
    end
  end

# TODO: We want to do this the proper way later
  def update
    @user = current_user
    @user.admin = true
    @user.save
    redirect_to '/'
  end


  private
  def user_params
    params.require(:user).permit(:username, :password, :email, :password_confirmation)
  end
end
