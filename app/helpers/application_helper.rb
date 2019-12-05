module ApplicationHelper
  def login_helper
    if !current_user.present?
      (link_to "Zarejestruj", new_user_registration_path, class: 'nav-item nav-link') +
      (link_to "Zaloguj", new_user_session_path, class: 'nav-item nav-link')
    else
      (link_to "Moje Bilety", tickets_path, class: 'nav-item nav-link') +
      (link_to "Wyloguj się (#{current_user.email})", destroy_user_session_path, class: 'nav-item nav-link', method: :delete)
    end
  end

  def admin_login_helper
    if !current_user.present?
      (link_to "Zarejestruj", new_user_registration_path, class: 'nav-item nav-link') +
      (link_to "Zaloguj", new_user_session_path, class: 'nav-item nav-link')
    else
      (link_to "Wyloguj się (#{current_user.email})", destroy_user_session_path, class: 'nav-item nav-link', method: :delete)
    end
  end


  def time_formatter(time)
  	time.strftime("%H:%M")
  end
end

