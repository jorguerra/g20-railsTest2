module ApplicationHelper
  def navbar_session
    text = user_signed_in? ? 'Salir' : 'Entrar'
    link = user_signed_in? ?  destroy_user_session_path : new_user_session_path
    method = user_signed_in? ? 'DELETE' : 'GET'
    link_to text, link, id:'login-logout', method: method
  end
end
