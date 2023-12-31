class SessionsController < ApplicationController

  def new
    
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user, notice: "Welcom back, #{user.name}"
    else
      flash.now[:alert] = "Invalid Email/Password Combination!"
      render :new, status: :unprocessable_entity

    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to movies_url, status: :see_other,
    notice: "You are now signed out!"
    
  end

end
