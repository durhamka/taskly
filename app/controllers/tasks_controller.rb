class TasksController < ApplicationController
  def new
    @task = Task.new
    @task_list = TaskList.find(params[:task_list_id])
  end

  def create
    @task = Task.new(task_params)
    @task.task_list = TaskList.find(params[:task_list_id])

    if @task.save
      flash[:notice] = "Task was created successfully!"
      redirect_to root_path
    else
      flash[:notice] = "Sorry something went wrong"
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :due_date)
  end
end