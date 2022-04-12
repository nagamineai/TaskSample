class TaskController < ApplicationController
  before_action :set_user
  before_action :set_task, only: %i(show edit update destroy)
  before_action :logged_in_user
  before_action :correct_user
  
  def index
    @tasks = @user.tasks
  end
  
  private
  
  def set_user
      @user = User.find(params[:user_id])
  end
end
