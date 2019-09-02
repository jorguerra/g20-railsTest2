class TasksController < ApplicationController
  def index
    @todos = Todo.limit(9)
  end

  def completed
    updateProgress(true)
    redirect_to root_path
  end

  def uncompleted
    updateProgress(false)
    redirect_to root_path
  end

  def updateProgress (status)
    progress = Progress.find_by( {todo: params[:todo], user: current_user })
    return createProgress unless progress
    progress.update_attributes :status => status
  end

  def createProgress
    completed = Progress.new
    completed.user = current_user
    completed.todo_id = params[:todo]
    completed.status = true
    completed.save
  end

end
