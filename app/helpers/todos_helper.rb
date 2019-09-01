module TodosHelper

  def showTodoBoton(todo)
    unless current_user.has_todo?(todo)
     link_to 'No listo', completed_path(todo: todo), method: :post, class: 'btn btn-primary'
    else
     link_to 'Listo', uncompleted_path(todo: todo), method: :delete, class: 'btn btn-danger'
    end
  end

  def showCompletadas
    unless user_signed_in?
      return 'Completadas 0/9'
    end
    cantidad = current_user.todos.count
    return "Completadas #{cantidad}/9"
  end
end
