class TasksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks
  end
  
  def show
  end

  def new
    @task = Task.new
    @user = User.find(params[:user_id])

  end
  
  def create
    @user = User.find(params[:user_id])
    @task = @user.tasks.build(task_params)
   
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end
  private

  def task_params
      params.require(:task).permit(:name, :description)
  end
  def set_user
      @user = User.find(params[:user_id])
  end
  
end
