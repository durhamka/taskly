class TaskListsController < ApplicationController

  def index # /task_lists
    @task_lists = TaskList.order(:name)

    respond_to do |format|
      format.html
      format.json { render :json => @task_lists }
    end
  end

end