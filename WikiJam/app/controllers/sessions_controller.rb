class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      log_in(user)
      redirect_to root_url
    else
      render :new
    end
  end

  # "Delete" a login, aka "log the user out"
  def destroy
    # Remove the user id from the session
    @current_user = session[:current_user_id] = nil
    redirect_to root_url
  end
end