class Airplane < ApplicationRecord
  validates :model, :economy_seats, :business_seats, presence: true

  has_many :flights
end
