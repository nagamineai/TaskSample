class UsersController < ApplicationController
  before_action :set_user, only: %i(show edit update destroy)
  # before_action :logged_in_user, only: %i(index show edit update destroy)
  before_action :admin_user, only: %i(index destroy)
  # before_action :correct_user, only: %i(edit update)
  # before_action :admin_or_correct, only: %i(show)
  
  def show
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    def set_user
      @user = User.find(params[:id])
    end
  
end
