class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      log_in(@user)
      p @user
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
