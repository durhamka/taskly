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

  def edit
    @task_list = TaskList.find(params[:id])
  end

  def update
    @task_list = TaskList.find(params[:id])
    if @task_list.update_attributes(task_list_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    TaskList.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def task_list_params
    params.require(:task_list).permit(:name)
  end
end