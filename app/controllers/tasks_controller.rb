class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    # raise
    @task = Task.new(params[:task_params])
    @task.save!
    redirect_to root_path
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    @task.update(params[:task_params])
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
  
end
