module ApplicationHelper
  def navbar_session
    text = user_signed_in? ? 'Logout' : 'Login'
    link = user_signed_in? ?  destroy_user_session_path : new_user_session_path
    link_to text, link, class:'nav-link'
  end
end
