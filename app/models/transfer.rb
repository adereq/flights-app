class Transfer < ApplicationRecord
  belongs_to :user

  def self.add_balance(amount)
  	puts "#{current_user.present?}"
  end

  def self.build_request_to_payment_provider(mail, amount, title)
    pin = "IjahGyvCJFbiSscKEj15oorIV39Wf1CN"
    client_id = 746643
    amount = ActionController::Base.helpers.number_to_currency(amount, format: '%n')
    chk = Digest::SHA256.hexdigest "#{pin}#{client_id}#{amount}PLN#{title}"
    return "https://ssl.dotpay.pl/test_payment/?id=#{client_id}&amount=#{amount}&currency=PLN&description=#{title}&chk=#{chk}"
  end

end
