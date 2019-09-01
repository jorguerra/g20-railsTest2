class TasksController < ApplicationController
  def index
    @todos = Todo.limit(9)
  end

  def completed
    completed = Progress.new
    completed.user = current_user
    completed.todo = todo
    completed.save
    redirect_to root_path
  end

  def uncompleted
    progress = Progress.find_by( {task: params[:task], user: current_user })
    progress.destroy
    redirect_to root_path
  end
end
