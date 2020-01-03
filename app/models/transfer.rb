class Transfer < ApplicationRecord
  belongs_to :user

  def self.add_balance(amount)
  	puts "#{current_user.present?}"
  end

  def build_transfer_url
  	Digest::SHA2.hexdigest "#{chk}"
  end
end
