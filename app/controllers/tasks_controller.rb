class TasksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks
  end
  
  def show
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end
end
