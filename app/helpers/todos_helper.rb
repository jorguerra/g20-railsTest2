module TodosHelper

  def showTodoBoton(todo)
    unless current_user.has_todo?(todo)
     link_to 'No listo', completed_path(todo: todo), method: :post, class: 'btn btn-primary'
    else
     link_to 'Listo', uncomplete_path(todo: todo), method: :delete, class: 'btn btn-danger'
    end
  end
end
