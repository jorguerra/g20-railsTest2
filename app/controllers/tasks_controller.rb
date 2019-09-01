class TasksController < ApplicationController
  def index
    @todos = Todo.limit(9)
  end

  def completed
    completed = Progress.new
    completed.user = current_user
    completed.todo_id = params[:todo]
    completed.save
    redirect_to root_path
  end

  def uncompleted
    progress = Progress.find_by( {todo: params[:todo], user: current_user })
    progress.destroy
    redirect_to root_path
  end
end
