class Airplane < ApplicationRecord
  validates :economy_seats, :business_seats, presence: true
  validates_presence_of :model, :message => 'Podaj model.'
  has_many :flights
end
