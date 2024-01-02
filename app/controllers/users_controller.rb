class UsersController < ApplicationController

  before_action :require_signin, except: [:new, :create]

  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to (session[:intended_url] || user),                   notice: "Welcome back, #{user.name}!"
      session[:intended_url] = nil
    else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Successfully updated account!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to movies_url, status: :see_other,
    alert: "Account successfully deleted"
  end


  private

  def require_correct_user
    @user = User.find(params[:id])
    
      redirect_to root_url, status: :see_other unless current_user?(@user)
  end

  def user_params
    params.require(:user).
          permit(:name, :email, :password, :password_confirmation, :username)
  end
end
