module ApplicationHelper
  def login_helper
    if !current_user.present?
      (link_to "Zarejestruj", new_user_registration_path, class: 'nav-item nav-link') +
      (link_to "Zaloguj", new_user_session_path, class: 'nav-item nav-link')
    else
      (link_to "Wyloguj się (#{current_user.email})", destroy_user_session_path, class: 'text-dark dropdown-item', method: :delete)
    end
  end

  def admin_login_helper
    if !current_user.present?
      (link_to "Zarejestruj", new_user_registration_path, class: 'nav-item nav-link') +
      (link_to "Zaloguj", new_user_session_path, class: 'nav-item nav-link')
    else
      (link_to "Wyloguj się (#{current_user.email})", destroy_user_session_path, class: 'text-dark dropdown-item', method: :delete)
    end
  end

  def time_formatter(time)
    if time.present?
  	time.strftime("%H:%M")
  end
  end

  def date_formatter(date)
    date.strftime("%Y-%m-%d %H:%M")
  end

  def currency_formatter(price)
    number_to_currency(price, unit: "zł", format: "%n %u", precision: 2)
  end
end