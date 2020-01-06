class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.add_balance(amount)
  	puts "#{User.current_user.present?}"
  end
end
