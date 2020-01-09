module ApplicationHelper
  def login_helper
    if !current_user.present?
      (link_to "Zarejestruj", new_user_registration_path, class: 'nav-item nav-link') +
      (link_to "Zaloguj", new_user_session_path, class: 'nav-item nav-link')
    else
      (link_to "Moje Bilety", tickets_path, class: 'nav-item nav-link') +
      (link_to "Stan konta (#{currency_formatter(current_user.balance)})", transfers_path, class: 'nav-item nav-link') +
      (link_to "Wyloguj się (#{current_user.email})", destroy_user_session_path, class: 'nav-item nav-link', method: :delete)
    end
  end

  def admin_login_helper
    if !current_user.present?
      (link_to "Zarejestruj", new_user_registration_path, class: 'nav-item nav-link') +
      (link_to "Zaloguj", new_user_session_path, class: 'nav-item nav-link')
    else
      (link_to "Wyloguj się (#{current_user.email})", destroy_user_session_path, class: 'text-dark ', method: :delete)
    end
  end

  def time_formatter(time)
  	time.strftime("%H:%M")
  end

  def currency_formatter(price)
    number_to_currency(price, unit: "zł", format: "%n %u", precision: 2)
  end
end

