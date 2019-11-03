class Airplane < ApplicationRecord
  validates :model, presence: true
  has_many :flight
end
