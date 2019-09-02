module TodosHelper

  def showTodoBoton(todo)
    progress = Progress.find_by({ :user => current_user, :todo => todo})
    no_listo = progress.nil? || progress.status != true
    time = ''
    time = time_ago_in_words(progress.updated_at) if progress
    if no_listo
     link_to 'No listo', completed_path(todo: todo), method: :post, class: 'btn btn-primary', 'data-time': time
    else
     link_to 'Listo', uncompleted_path(todo: todo), method: :delete, class: 'btn btn-danger', 'data-time': time
    end
  end

  def showCompletadas
    unless user_signed_in?
      return 'Completadas 0/9'
    end
    cantidad = Progress.where(:user => current_user, :status => true).count
    return "Completadas #{cantidad}/9"
  end
end
