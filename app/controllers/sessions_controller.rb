class SessionsController < ApplicationController
  def new
  end

  def create
    login_info = params[:session]
    user = User.find_by(email: login_info[:email].downcase)
    if user && user.authenticate(login_info[:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'  # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
