class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy #注销destroy行为/action
    sign_out #帮助方法，注销
    redirect_to root_path 
  end


end
