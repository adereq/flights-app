class User < ApplicationRecord
  has_many :ticket
  has_many :transfer
  belongs_to :airport, optional: true

  validates :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
