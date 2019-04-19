class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by_email(params[:email].downcase)
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in!"
      redirect_to products_path
    else
      flash.now[:error] = "Email or passowrd is invalid"
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end

end
