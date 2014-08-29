class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.order(:name)
  end

  def new
    @task_list = TaskList.new
  end

  def create
    @task_list = TaskList.new(task_list_params)
    if @task_list.save
      flash[:notice] = "Task List was created successfully"
      redirect_to root_path
    else
      flash[:notice] = "Your task list could not be created"
      render :new
    end
  end

  private

  def task_list_params
    params.require(:task_list).permit(:name)
  end
end