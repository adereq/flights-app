module ApplicationHelper
  def login_helper
    if !current_user.present?
      (link_to "Register", new_user_registration_path, class: 'nav-item nav-link') +
      (link_to "Login", new_user_session_path, class: 'nav-item nav-link')
    else
      (link_to "Moje Bilety", tickets_path, class: 'nav-item nav-link') +
      (link_to "Wyloguj się (#{current_user.email})", destroy_user_session_path, class: 'nav-item nav-link', method: :delete)
    end
  end
end

