class SessionsController < ApplicationController
  def new
  end

  def create
    login_info = params[:session]
    @user = User.find_by(email: login_info[:email].downcase)
    if @user && @user.authenticate(login_info[:password])
      log_in @user
      login_info[:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_back_or @user
    else
      flash.now[:danger] = 'Invalid email/password combination'  # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
