class TasksController < ApplicationController
  def new
    @task = Task.new
    @task_list = TaskList.find(params[:task_list_id])
  end

  def create
    @task = Task.new(task_params)
    @task_list = TaskList.find(params[:task_list_id])
    @task.task_list = @task_list

    if @task.save
      flash[:notice] = "Task was created successfully!"
      redirect_to root_path
    else
      flash[:notice] = "Your task could not be created"
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id]).destroy
    @task_list = TaskList.find(params[:task_list_id])
    flash[:notice] = "Task was deleted successfully"
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:description, :due_date)
  end
end